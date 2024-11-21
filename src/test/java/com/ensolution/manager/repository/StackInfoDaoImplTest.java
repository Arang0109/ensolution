package com.ensolution.manager.repository;

import com.ensolution.manager.repository.stack.StackInfoDaoImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class StackInfoDaoImplTest {
  @Autowired
  StackInfoDaoImpl stackInfoDao;

  @Test
  public void select() {
    System.out.println(stackInfoDao.selectAll());
  }

  @Test
  public void selectAll() {
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