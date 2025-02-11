package com.ensolution.manager.repository.plan;

import com.ensolution.manager.domain.plan.ScheduleTableDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.sql.Date;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class ScheduleDaoTest {
  @Autowired
  private ScheduleDao scheduleDao;
  @Autowired
  private TeamDao teamDao;

  @Test
  public void selectTeam() {
    System.out.println(teamDao.select(1));
  }

  @Test
  public void selectSchedule() {
    System.out.println(scheduleDao.selectHistory(13));
  }

  @Test
  public void selectDetail() {
    ScheduleTableDto scheduleTableDto = new ScheduleTableDto();

    scheduleTableDto.setStack_id(196);
    scheduleTableDto.setMeasure_date(Date.valueOf("2024-12-03"));

    System.out.println(scheduleDao.selectDetail(scheduleTableDto));
  }
}