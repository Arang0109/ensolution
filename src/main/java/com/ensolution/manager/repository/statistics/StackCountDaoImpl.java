package com.ensolution.manager.repository.statistics;

import com.ensolution.manager.domain.statistics.StackCountDto;
import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class StackCountDaoImpl implements StackCountDao {
  @Autowired
  private SqlSession session;
  private static String namespace = "com.ensolution.manager.repository.StatisticsMapper.";

  @Override
  public List<StackCountDto> stackCntAll() {
    try {
      return session.selectList(namespace + "stackCntAll");
    } catch (PersistenceException e) { // MyBatis 에서 SQL 문을 실행할 때, 연결 설정 오류나 매핑 오류와 같은 문제
      System.err.println("Persistence error occurred: " + e.getMessage());
    } catch (Exception e) {
      System.err.println("An unexpected error occurred: " + e.getMessage());
    }
    return null;
  }

  @Override
  public List<StackCountDto> stackCntNonComplete() {
    try {
      return session.selectList(namespace + "stackCntNonComplete");
    } catch (PersistenceException e) { // MyBatis 에서 SQL 문을 실행할 때, 연결 설정 오류나 매핑 오류와 같은 문제
      System.err.println("Persistence error occurred: " + e.getMessage());
    } catch (Exception e) {
      System.err.println("An unexpected error occurred: " + e.getMessage());
    }
    return null;
  }

  @Override
  public List<StackCountDto> stackCntAllOfWp(List<Integer> workplace_ids) {
    try {
      return session.selectList(namespace + "stackCntAllOfWp", workplace_ids);
    }  catch (PersistenceException e) {
      System.err.println("Persistence error occurred: " + e.getMessage());
    } catch (Exception e) {
      System.out.println("An unexpected error occurred: " + e.getMessage());
    }
    return null;
  }

  @Override
  public List<StackCountDto> stackCntNonCompleteOfWp(List<Integer> workplace_ids) {
    try {
      return session.selectList(namespace + "stackCntNonCompleteOfWp", workplace_ids);
    }  catch (PersistenceException e) {
      System.err.println("Persistence error occurred: " + e.getMessage());
    } catch (Exception e) {
      System.out.println("An unexpected error occurred: " + e.getMessage());
    }
    return null;
  }
}
