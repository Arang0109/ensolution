package com.ensolution.manager.service.plan;

import com.ensolution.manager.domain.plan.ScheduleDto;
import com.ensolution.manager.domain.pollutant.PollutantDto;
import com.ensolution.manager.domain.stack.StackDto;
import com.ensolution.manager.repository.plan.ScheduleDao;
import com.ensolution.manager.repository.pollutant.PollutantDao;
import com.ensolution.manager.service.pollutant.PollutantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ScheduleServiceImpl implements ScheduleService {
  ScheduleDao scheduleDao;

  @Autowired
  public ScheduleServiceImpl(ScheduleDao scheduleDao) {
    this.scheduleDao = scheduleDao;
  }

  @Override
  public int insertSchedule(ScheduleDto scheduleDto) {
    scheduleDto.setTeam_id(1);
    scheduleDto.setIs_completed(false);
    return scheduleDao.insert(scheduleDto);
  }
}