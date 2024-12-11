package com.ensolution.manager.service.plan;

import com.ensolution.manager.domain.plan.HistoryDto;
import com.ensolution.manager.domain.plan.ScheduleDto;
import com.ensolution.manager.domain.plan.ScheduleTableDto;
import com.ensolution.manager.domain.stack.StackMeasurementDto;
import com.ensolution.manager.repository.plan.ScheduleDao;
import com.ensolution.manager.repository.pollutant.PollutantDao;
import com.ensolution.manager.repository.stack.StackMeasurementDao;
import com.ensolution.manager.service.stack.StackMeasurementService;
import com.ensolution.manager.service.stack.StackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@Service
public class ScheduleServiceImpl implements ScheduleService {
  StackMeasurementDao stackMeasurementDao;
  ScheduleDao scheduleDao;
  PollutantDao pollutantDao;

  @Autowired
  public ScheduleServiceImpl(ScheduleDao scheduleDao, PollutantDao pollutantDao,
                             StackMeasurementDao stackMeasurementDao) {
    this.scheduleDao = scheduleDao;
    this.pollutantDao = pollutantDao;
    this.stackMeasurementDao = stackMeasurementDao;
  }

  @Override
  public List<ScheduleTableDto> getScheduleList() {
    return scheduleDao.selectAll();
  }

  @Override
  public ScheduleTableDto getScheduleDetail(ScheduleTableDto scheduleTableDto) {
    return scheduleDao.selectDetail(scheduleTableDto);
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

  @Override
  public void completeSchedule(List<Integer> schedule_ids) {
    List<Integer> stack_measurement_ids = new ArrayList<>();
    for (Integer schedule_id : schedule_ids) {
      ScheduleDto scheduleDto = scheduleDao.select(schedule_id);
      stack_measurement_ids.add(scheduleDto.getStack_measurement_id());
    }
    stackMeasurementDao.updateComplete(stack_measurement_ids);
    scheduleDao.updateComplete(schedule_ids);
  }

  @Override
  public void deleteSchedule(List<Integer> schedule_ids) {
    List<Integer> stack_measurement_ids = new ArrayList<>();
    for (Integer schedule_id : schedule_ids) {
      ScheduleDto scheduleDto = scheduleDao.select(schedule_id);
      stack_measurement_ids.add(scheduleDto.getStack_measurement_id());
    }
    stackMeasurementDao.updateNonComplete(stack_measurement_ids);
    scheduleDao.deleteItems(schedule_ids);
  }
}