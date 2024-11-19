package com.ensolution.manager.service;

import com.ensolution.manager.repository.StackMeasurementDao;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class StackMeasurementServiceImplTest {
  @Autowired
  StackMeasurementDao stackMeasurementDao;

  @Test
  public void getStackMeasurement() {
  }

  @Test
  public void getStackMeasurementListOfStack() {
    System.out.println(stackMeasurementDao.selectStackMeasurementOfStack(13));
  }

  @Test
  public void getStackMeasurementList() {
    System.out.println(stackMeasurementDao.selectAll());
  }

  @Test
  public void updateStackMeasurement() {
  }

  @Test
  public void insertStackMeasurement() {
  }

  @Test
  public void removeStackMeasurement() {
  }
}