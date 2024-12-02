package com.ensolution.manager.service.plan;

import com.ensolution.manager.domain.plan.HistoryDto;
import com.ensolution.manager.domain.plan.ScheduleTableDto;
import com.ensolution.manager.service.pollutant.PollutantService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class ScheduleServiceImplTest {
    @Autowired
    private ScheduleService scheduleService;
    @Autowired
    private PollutantService pollutantService;

    @Test
    public void getHistory() {
        System.out.println(scheduleService.getHistory(13));
    }

    @Test
    public void getScheduleList() {
        System.out.println(scheduleService.getScheduleList());
    }
}