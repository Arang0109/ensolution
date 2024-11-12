package com.ensolution.manager.repository;

import com.ensolution.manager.domain.StackDto;
import com.ensolution.manager.domain.WorkplaceDto;
import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class StackDaoImpl implements StackDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "com.ensolution.manager.repository.StackMapper.";

    @Override
    public int count() {
        try {
            return session.selectOne(namespace + "count");
        } catch (PersistenceException e) { // MyBatis 에서 SQL 문을 실행할 때, 연결 설정 오류나 매핑 오류와 같은 문제
            System.err.println("Persistence error occurred: " + e.getMessage());
        } catch (Exception e) {
            System.err.println("An unexpected error occurred: " + e.getMessage());
        }
        return 0; // 오류 발생 시 기본 값 반환
    }

    @Override
    public StackDto select(Integer stack_id) {
        try {
            return session.selectOne(namespace + "select", stack_id);
        } catch (PersistenceException e) {
            System.err.println("Persistence error occurred: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("An unexpected error occurred: " + e.getMessage());
        }
        return null;
    }

    @Override
    public List<StackDto> selectAll() {
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
    public int insert(StackDto stack) {
        try {
            return session.insert(namespace + "insert", stack);
        }  catch (PersistenceException e) {
            System.err.println("Persistence error occurred: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("An unexpected error occurred: " + e.getMessage());
        }
        return 0;
    }

    @Override
    public int delete(Integer stack_id) {
        try {
            return session.delete(namespace + "delete", stack_id);
        }  catch (PersistenceException e) {
            System.err.println("Persistence error occurred: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("An unexpected error occurred: " + e.getMessage());
        }
        return 0;
    }

    @Override
    public int deleteItems(List<Integer> stack_ids) {
        try {
            return session.delete(namespace + "deleteItems", stack_ids);
        } catch (PersistenceException e) {
            System.err.println("Persistence error occurred: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("An unexpected error occurred: " + e.getMessage());
        }
        return 0;
    }

    @Override
    public int update(StackDto stack) {
        try {
            return session.update(namespace + "update", stack);
        } catch (PersistenceException e) {
            System.err.println("Persistence error occurred: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("An unexpected error occurred: " + e.getMessage());
        }
        return 0;
    }
}
