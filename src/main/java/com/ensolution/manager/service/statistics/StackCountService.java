package com.ensolution.manager.service.statistics;

import com.ensolution.manager.domain.statistics.StackCountDto;
import com.ensolution.manager.repository.statistics.StackCountDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class StackCountService {
  StackCountDao stackCountDao;

  @Autowired
  public StackCountService(StackCountDao stackCountDao) {
    this.stackCountDao = stackCountDao;
  }

  public List<StackCountDto> getCompleteStackCnt() {
    List<StackCountDto> a = stackCountDao.stackCntAll();
    List<StackCountDto> b = stackCountDao.stackCntNonComplete();
    List<StackCountDto> result = new ArrayList<>();

    for (int i = 0; i < a.size(); i++) {
      StackCountDto scd = new StackCountDto();
      scd.setCycle_type(a.get(i).getCycle_type());
      scd.setCnt(a.get(i).getCnt() - b.get(i).getCnt());
      result.add(scd);
    }

    return result;
  }

  public List<StackCountDto> getNonCompleteStackCnt() {
    return stackCountDao.stackCntNonComplete();
  }


}
