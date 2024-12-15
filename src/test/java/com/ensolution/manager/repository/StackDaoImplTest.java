package com.ensolution.manager.repository;

import com.ensolution.manager.domain.stack.StackDto;
import com.ensolution.manager.repository.stack.StackDaoImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

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
    System.out.println(stackDaoImpl.searchId("stack 170"));
  }

  @Test
  public void selectAll() {

  }

  @Test
  public void insert() {
    StackDto stackDto = stackDaoImpl.select(2);
    stackDto.setPrevention("티비");
    System.out.println(stackDto);
    stackDaoImpl.update(stackDto);
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