package com.ensolution.manager.service;

import com.ensolution.manager.domain.PollutantDto;
import com.ensolution.manager.repository.PollutantDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CalServiceImpl implements CalService {
  PollutantDao pollutantDao;

  @Autowired
  public CalServiceImpl(PollutantDao pollutantDao) {
    this.pollutantDao = pollutantDao;
  }

  @Override
  public Double abilityScoreCal(List<PollutantDto> pollutants) {
    double particle = 0.0;
    double liquid = 0.0;
    double G3 = 0.0;
    int liquidCnt = 0;
    double score = 0.0;

    List<String> method = new ArrayList<String>();
    for (PollutantDto p : pollutants) {
      method.add(p.getMethod());
    }

    // 흡수액 체크
    if (method.contains("흡수액")) {
      for (String m : method) {
        if (m.equals("흡수액")) { liquidCnt++; }
      }

      liquid = liquidCnt < 3 ? 0.5 : 1.0;
    }

    // 먼지, 중금속 체크
    if (method.contains("먼지")) {
      particle = 1.0;
      if (method.contains("중금속")) {
        particle = 1.9;
      }
    } else {
      if (method.contains("중금속")) {
        particle = 1.3;
      }
    }

    // 수은 체크
    if (method.contains("수은")) {
      if (particle == 0) {
        particle = 1.2;
      } else {
        particle += 1.0;
      }
    }

    if (particle != 0 && liquid == 0.5) { score = liquid + particle - 0.2; }
    if (particle != 0 && liquid == 1.0) { score = liquid + particle - 0.5; }
    if (liquid == 0) { score = particle; }

    // G3 체크
    if (score == 0.0 && method.contains("현장측정") || method.contains("카트리지") ||
        method.contains("흡착관(T)") || method.contains("흡착관(A)")) { G3 = 0.3; }

    score += G3;

    return score;
  }
}
