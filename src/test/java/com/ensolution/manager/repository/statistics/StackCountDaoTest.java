package com.ensolution.manager.repository.statistics;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class StackCountDaoTest {
  @Autowired
  StackCountDao stackCountDao;

  @Test
  public void count() {
    List<Integer> workplace_ids = new ArrayList<>();
    workplace_ids.add(10);
    workplace_ids.add(30);
    System.out.println(stackCountDao.stackCntNonCompleteOfWp(workplace_ids));
  }

  @Test
  public void count1() {
    System.out.println(stackCountDao.stackCntAll());
  }
}