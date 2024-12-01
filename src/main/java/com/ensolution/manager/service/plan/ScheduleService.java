package com.ensolution.manager.service.plan;

import com.ensolution.manager.domain.plan.HistoryDto;
import com.ensolution.manager.domain.plan.ScheduleDto;

import java.util.List;

public interface ScheduleService {
  List<HistoryDto> getHistory(Integer stack_id);

  void insertSchedule(ScheduleDto scheduleDto);
}
