package com.ensolution.manager.repository.pollutant;

import com.ensolution.manager.domain.pollutant.PollutantDto;
import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PollutantDaoImpl implements PollutantDao {
  @Autowired
  private SqlSession session;
  private static String namespace = "com.ensolution.manager.repository.PollutantMapper.";

  @Override
  public List<PollutantDto> selectAll() {
    try {
      return session.selectList(namespace + "selectAll");
    } catch (PersistenceException e) {
      System.err.println("Persistence error occurred: " + e.getMessage());
    } catch (Exception e) {
      System.err.println("An unexpected error occurred: " + e.getMessage());
    }
    return null;
  }

  @Override
  public Integer searchId(String pollutant_name) {
    try {
      return session.selectOne(namespace + "searchId", pollutant_name);
    } catch (PersistenceException e) {
      System.err.println("Persistence error occurred: " + e.getMessage());
    } catch (Exception e) {
      System.out.println("An unexpected error occurred: " + e.getMessage());
    }
    return 0;
  }

  @Override
  public PollutantDto select(Integer pollutant_id) {
    try {
      return session.selectOne(namespace + "select", pollutant_id);
    } catch (PersistenceException e) {
      System.err.println("Persistence error occurred: " + e.getMessage());
    } catch (Exception e) {
      System.out.println("An unexpected error occurred: " + e.getMessage());
    }
    return null;
  }

  @Override
  public Integer count() {
    try {
      return session.selectOne(namespace + "count");
    } catch (PersistenceException e) {
      System.err.println("Persistence error occurred: " + e.getMessage());
    } catch (Exception e) {
      System.out.println("An unexpected error occurred: " + e.getMessage());
    }
    return 0;
  }
}
