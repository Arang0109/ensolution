package com.ensolution.manager.service.statistics;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class StackCountServiceTest {
  @Autowired
  private StackCountService stackCountService;

  @Test
  public void getCompleteStackCnt() {
    System.out.println(stackCountService.getCompleteStackCnt());
  }

  @Test
  public void getNonCompleteStackCnt() {
  }
}