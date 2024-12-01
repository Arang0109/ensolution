package com.ensolution.manager.repository.plan;

import com.ensolution.manager.domain.plan.HistoryDto;
import com.ensolution.manager.domain.plan.ScheduleDto;
import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ScheduleDaoImpl implements ScheduleDao {
  @Autowired
  private SqlSession session;
  private static String namespace = "com.ensolution.manager.repository.ScheduleMapper.";

  @Override
  public ScheduleDto select(Integer schedule_id) {
    try {
      return session.selectOne(namespace + "select", schedule_id);
    } catch (PersistenceException e) {
      System.err.println("Persistence error occurred: " + e.getMessage());
    } catch (Exception e) {
      System.out.println("An unexpected error occurred: " + e.getMessage());
    }
    return null;
  }

  @Override
  public List<HistoryDto> selectHistory(Integer stack_id) {
    try {
      return session.selectList(namespace + "selectStackHistory", stack_id);
    } catch (PersistenceException e) {
      System.err.println("Persistence error occurred: " + e.getMessage());
    } catch (Exception e) {
      System.out.println("An unexpected error occurred: " + e.getMessage());
    }
    return null;
  }

  @Override
  public Integer insert(ScheduleDto schedule) {
    try {
      return session.insert(namespace + "insert", schedule);
    }  catch (PersistenceException e) {
      System.err.println("Persistence error occurred: " + e.getMessage());
    } catch (Exception e) {
      System.out.println("An unexpected error occurred: " + e.getMessage());
    }
    return 0;
  }

  @Override
  public Integer update(ScheduleDto schedule) {
    try {
      return session.insert(namespace + "update", schedule);
    }  catch (PersistenceException e) {
      System.err.println("Persistence error occurred: " + e.getMessage());
    } catch (Exception e) {
      System.out.println("An unexpected error occurred: " + e.getMessage());
    }
    return 0;
  }

  @Override
  public Integer deleteItems(List<Integer> schedule_ids) {
    try {
      return session.delete(namespace + "deleteItems", schedule_ids);
    }  catch (PersistenceException e) {
      System.err.println("Persistence error occurred: " + e.getMessage());
    } catch (Exception e) {
      System.out.println("An unexpected error occurred: " + e.getMessage());
    }
    return 0;
  }
}