package com.ensolution.manager.repository.stack;

import com.ensolution.manager.domain.stack.StackMeasurementDto;
import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class StackMeasurementDaoImpl implements StackMeasurementDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "com.ensolution.manager.repository.StackMeasurementMapper.";

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
    public StackMeasurementDto select(Integer stack_measurement_id) {
        try {
            return session.selectOne(namespace + "select", stack_measurement_id);
        } catch (PersistenceException e) {
            System.err.println("Persistence error occurred: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("An unexpected error occurred: " + e.getMessage());
        }
        return null;
    }

    @Override
    public List<StackMeasurementDto> selectStackMeasurementOfStack(Integer stack_id) {
        try {
            return session.selectList(namespace + "selectStackMeasurementOfStack", stack_id);
        } catch (PersistenceException e) {
            System.err.println("Persistence error occurred: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("An unexpected error occurred: " + e.getMessage());
        }
        return null;
    }

    @Override
    public List<StackMeasurementDto> selectAll() {
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
    public int insert(StackMeasurementDto stackMeasurement) {
        try {
            return session.insert(namespace + "insert", stackMeasurement);
        }  catch (PersistenceException e) {
            System.err.println("Persistence error occurred: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("An unexpected error occurred: " + e.getMessage());
        }
        return 0;
    }

    @Override
    public int deleteItems(List<Integer> stack_measurement_ids) {
        try {
            return session.delete(namespace + "deleteItems", stack_measurement_ids);
        } catch (PersistenceException e) {
            System.err.println("Persistence error occurred: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("An unexpected error occurred: " + e.getMessage());
        }
        return 0;
    }

    @Override
    public int update(StackMeasurementDto stackMeasurement) {
        try {
            return session.update(namespace + "update", stackMeasurement);
        } catch (PersistenceException e) {
            System.err.println("Persistence error occurred: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("An unexpected error occurred: " + e.getMessage());
        }
        return 0;
    }
}
