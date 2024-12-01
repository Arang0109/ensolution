package com.ensolution.manager.service.plan;

import com.ensolution.manager.domain.plan.HistoryDto;
import com.ensolution.manager.domain.plan.ScheduleDto;
import com.ensolution.manager.repository.plan.ScheduleDao;
import com.ensolution.manager.repository.pollutant.PollutantDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ScheduleServiceImpl implements ScheduleService {
  ScheduleDao scheduleDao;
  PollutantDao pollutantDao;

  @Autowired
  public ScheduleServiceImpl(ScheduleDao scheduleDao, PollutantDao pollutantDao) {
    this.scheduleDao = scheduleDao;
    this.pollutantDao = pollutantDao;
  }

  @Override
  public List<HistoryDto> getHistory(Integer stack_id) {
    List<HistoryDto> histories = new ArrayList<>();
    for (HistoryDto historyDto : scheduleDao.selectHistory(stack_id)) {
      String[] stringList = historyDto.getPollutant_ids().split(",");
      List<String> pollutants = new ArrayList<>();
      for (String string : stringList) {
        pollutants.add(pollutantDao.select(Integer.parseInt(string)).getPollutant_name());
      }
      historyDto.setPollutant_ids(String.join(",", pollutants));
      histories.add(historyDto);
    }
    return histories;
  }

  @Override
  public void insertSchedule(ScheduleDto scheduleDto) {
    scheduleDto.setIs_completed(false);
    scheduleDao.insert(scheduleDto);
  }
}