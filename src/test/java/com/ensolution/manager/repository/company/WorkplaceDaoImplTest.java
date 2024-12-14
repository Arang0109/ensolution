package com.ensolution.manager.repository.company;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class WorkplaceDaoImplTest {
  @Autowired
  WorkplaceDaoImpl workplaceDao;

  @Test
  public void selectFactory() {
    System.out.println(workplaceDao.selectFactory(10));
  }

  @Test
  public void selectDepartment() {
    System.out.println(workplaceDao.selectDepartment(10));
  }
}