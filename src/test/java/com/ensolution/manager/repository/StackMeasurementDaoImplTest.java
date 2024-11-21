package com.ensolution.manager.repository;

import com.ensolution.manager.repository.stack.StackMeasurementDao;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class StackMeasurementDaoImplTest {
  @Autowired
  StackMeasurementDao stackMeasurementDao;

  @Test
  public void count() {
    System.out.println(stackMeasurementDao.count());
  }

  @Test
  public void select() {
    System.out.println(stackMeasurementDao.select(3));
  }

  @Test
  public void selectAll() {
    System.out.println(stackMeasurementDao.selectStackMeasurementOfStack(13));
  }

  @Test
  public void insert() {
  }

  @Test
  public void delete() {
  }

  @Test
  public void deleteItems() {
  }

  @Test
  public void update() {
  }
}