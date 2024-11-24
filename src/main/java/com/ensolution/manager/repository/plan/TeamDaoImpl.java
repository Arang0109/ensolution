package com.ensolution.manager.repository.plan;

import com.ensolution.manager.domain.plan.TeamDto;
import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class TeamDaoImpl implements TeamDao {
  @Autowired
  private SqlSession session;
  private static String namespace = "com.ensolution.manager.repository.TeamMapper.";

  @Override
  public TeamDto select(Integer team_id) {
    try {
      return session.selectOne(namespace + "select", team_id);
    } catch (PersistenceException e) {
      System.err.println("Persistence error occurred: " + e.getMessage());
    } catch (Exception e) {
      System.out.println("An unexpected error occurred: " + e.getMessage());
    }
    return null;
  }

  @Override
  public List<TeamDto> selectAll() {
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
  public int insert(TeamDto team) {
    try {
      return session.insert(namespace + "insert", team);
    }  catch (PersistenceException e) {
      System.err.println("Persistence error occurred: " + e.getMessage());
    } catch (Exception e) {
      System.out.println("An unexpected error occurred: " + e.getMessage());
    }
    return 0;
  }

  @Override
  public int update(TeamDto team) {
    try {
      return session.update(namespace + "update", team);
    }  catch (PersistenceException e) {
      System.err.println("Persistence error occurred: " + e.getMessage());
    } catch (Exception e) {
      System.out.println("An unexpected error occurred: " + e.getMessage());
    }
    return 0;
  }

  @Override
  public int deleteItems(List<Integer> team_ids) {
    try {
      return session.delete(namespace + "deleteItems", team_ids);
    }  catch (PersistenceException e) {
      System.err.println("Persistence error occurred: " + e.getMessage());
    } catch (Exception e) {
      System.out.println("An unexpected error occurred: " + e.getMessage());
    }
    return 0;
  }
}