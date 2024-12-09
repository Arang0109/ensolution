package com.ensolution.manager.service.plan;

import com.ensolution.manager.domain.plan.HistoryDto;
import com.ensolution.manager.domain.plan.ScheduleTableDto;
import com.ensolution.manager.service.pollutant.PollutantService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
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
    public void getScheduleList() throws ParseException {
        String inputDate = "Tue Dec 03 00:00:00 KST 2024";

        // 입력 형식 지정
        DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("EEE MMM dd HH:mm:ss zzz yyyy", java.util.Locale.ENGLISH);

        // 출력 형식 지정
        DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        // 문자열을 ZonedDateTime으로 파싱
        ZonedDateTime zonedDateTime = ZonedDateTime.parse(inputDate, inputFormatter);

        // 원하는 형식으로 변환
        String formattedDate = outputFormatter.format(zonedDateTime.toLocalDate());
        System.out.println("Formatted Date: " + formattedDate);

    }
}