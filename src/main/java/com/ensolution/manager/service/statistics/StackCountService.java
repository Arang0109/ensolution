package com.ensolution.manager.service.statistics;

import com.ensolution.manager.domain.statistics.StackCountDto;
import com.ensolution.manager.repository.statistics.StackCountDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class StackCountService {
  StackCountDao stackCountDao;

  @Autowired
  public StackCountService(StackCountDao stackCountDao) {
    this.stackCountDao = stackCountDao;
  }

  public Map<String,Integer> getCompleteStackCnt() {
    List<StackCountDto> a = stackCountDao.stackCntAll();
    List<StackCountDto> b = stackCountDao.stackCntNonComplete();
    Map<String, Integer> result = new HashMap<>();

    for (int i = 0; i < a.size(); i++) {
      String cycle_type = a.get(i).getCycle_type();
      Integer cnt = a.get(i).getCnt() - b.get(i).getCnt();
      result.put(cycle_type,cnt);
    }

    return result;
  }

  public Map<String,Integer> getNonCompleteStackCnt() {
    List<StackCountDto> a = stackCountDao.stackCntNonComplete();
    Map<String, Integer> result = new HashMap<>();

    for (int i = 0; i < a.size(); i++) {
      String cycle_type = a.get(i).getCycle_type();
      Integer cnt = a.get(i).getCnt();
      result.put(cycle_type,cnt);
    }

    return result;
  }

  public Map<String,Integer> getCompleteStackCntOfWorkplace(List<Integer> workplace_ids) {
    List<StackCountDto> a = stackCountDao.stackCntAllOfWp(workplace_ids);
    List<StackCountDto> b = stackCountDao.stackCntNonCompleteOfWp(workplace_ids);
    Map<String, Integer> result = new HashMap<>();

    for (int i = 0; i < a.size(); i++) {
      String cycle_type = a.get(i).getCycle_type();
      Integer cnt = a.get(i).getCnt() - b.get(i).getCnt();
      result.put(cycle_type,cnt);
    }

    return result;
  }

  public Map<String,Integer> getNonCompleteStackCntOfWorkplace(List<Integer> workplace_ids) {
    List<StackCountDto> a = stackCountDao.stackCntNonCompleteOfWp(workplace_ids);
    Map<String, Integer> result = new HashMap<>();

    for (int i = 0; i < a.size(); i++) {
      String cycle_type = a.get(i).getCycle_type();
      Integer cnt = a.get(i).getCnt();
      result.put(cycle_type,cnt);
    }

    return result;
  }
}
