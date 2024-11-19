package com.ensolution.manager.repository;

import com.ensolution.manager.domain.StackInfoDto;
import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class StackInfoDaoImpl implements StackInfoDao {
  @Autowired
  private SqlSession session;
  private static String namespace = "com.ensolution.manager.repository.StackInfoMapper.";

  @Override
  public StackInfoDto select(Integer stack_info_id) {
    try {
      return session.selectOne(namespace + "select", stack_info_id);
    } catch (PersistenceException e) {
      System.err.println("Persistence error occurred: " + e.getMessage());
    } catch (Exception e) {
      System.out.println("An unexpected error occurred: " + e.getMessage());
    }
    return null;
  }
  
  @Override
  public List<StackInfoDto> selectAll() {
    try {
      return session.selectList(namespace + "selectAll");
    } catch (PersistenceException e) {
      System.err.println("Persistence error occurred: " + e.getMessage());
    } catch (Exception e) {
      System.out.println("An unexpected error occurred: " + e.getMessage());
    }
    return null;
  }
  
  @Override
  public int update(StackInfoDto stackInfo) {
    try {
      return session.update(namespace + "update", stackInfo);
    } catch (PersistenceException e) {
      System.err.println("Persistence error occurred: " + e.getMessage());
    } catch (Exception e) {
      System.out.println("An unexpected error occurred: " + e.getMessage());
    }
    return 0;
  }
}