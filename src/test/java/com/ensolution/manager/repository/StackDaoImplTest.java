package com.ensolution.manager.repository;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class StackDaoImplTest {
  @Autowired
  StackDaoImpl stackDaoImpl;
  @Autowired
  WorkplaceDaoImpl workplaceDaoImpl;

  @Test
  public void count() {
    Integer workplace_id = stackDaoImpl.select(13).getWorkplace_id();
    System.out.println(workplaceDaoImpl.select(workplace_id));
  }

  @Test
  public void select() {
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