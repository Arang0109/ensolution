package com.ensolution.manager.repository;

import com.ensolution.manager.domain.StackDto;
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

  @Test
  public void count() {
    System.out.println(stackDaoImpl.selectAll());
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