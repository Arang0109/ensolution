package com.ensolution.manager.service.plan;

import com.ensolution.manager.domain.plan.HistoryDto;
import com.ensolution.manager.domain.plan.ScheduleDto;
import com.ensolution.manager.domain.plan.ScheduleTableDto;

import java.util.List;

public interface ScheduleService {
  List<HistoryDto> getHistory(Integer stack_id);

  List<ScheduleTableDto> getScheduleList();

  void insertSchedule(ScheduleDto scheduleDto);

  void completeSchedule(List<Integer> schedule_ids);

  void deleteSchedule(List<Integer> schedule_ids);
}
