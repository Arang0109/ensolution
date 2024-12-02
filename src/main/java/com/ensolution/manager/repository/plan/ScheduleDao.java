package com.ensolution.manager.repository.plan;

import com.ensolution.manager.domain.plan.HistoryDto;
import com.ensolution.manager.domain.plan.ScheduleDto;
import com.ensolution.manager.domain.plan.ScheduleTableDto;

import java.util.List;

public interface ScheduleDao {
  ScheduleDto select(Integer schedule_id);

  List<ScheduleTableDto> selectAll();

  List<HistoryDto> selectHistory(Integer stack_id);

  Integer insert(ScheduleDto schedule);

  Integer update(ScheduleDto schedule);

  Integer deleteItems(List<Integer> schedule_ids);
}
