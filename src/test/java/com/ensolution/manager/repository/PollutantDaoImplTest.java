package com.ensolution.manager.repository;

import com.ensolution.manager.repository.pollutant.PollutantDao;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class PollutantDaoImplTest {
  @Autowired
  PollutantDao pollutantDao;

  @Test
  public void selectAll() {
    System.out.println(pollutantDao.searchId("먼지"));
  }

  @Test
  public void test() {
    List<String> method = new ArrayList<>();
    method.add("add");
    method.add("update");
    method.add("delete");
    method.add("select");

    if (method.contains("add") || method.contains("update123")) {
      System.out.println("TRUE");
    }
  }
}