package com.ensolution.manager.repository.company;

import com.ensolution.manager.domain.company.WorkplaceDto;
import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class WorkplaceDaoImpl implements WorkplaceDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "com.ensolution.manager.repository.WorkplaceMapper.";

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
    public WorkplaceDto select(Integer workplace_id) {
        try {
            return session.selectOne(namespace + "select", workplace_id);
        } catch (PersistenceException e) {
            System.err.println("Persistence error occurred: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("An unexpected error occurred: " + e.getMessage());
        }
        return null;
    }

    @Override
    public WorkplaceDto search(WorkplaceDto workplace) {
        try {
            return session.selectOne(namespace + "selectWorkplaceName", workplace);
        } catch (PersistenceException e) {
            System.err.println("Persistence error occurred: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("An unexpected error occurred: " + e.getMessage());
        }
        return null;
    }

    @Override
    public List<WorkplaceDto> selectAll() {
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
    public int insert(WorkplaceDto workplace) {
        try {
            return session.insert(namespace + "insert", workplace);
        }  catch (PersistenceException e) {
            System.err.println("Persistence error occurred: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("An unexpected error occurred: " + e.getMessage());
        }
        return 0;
    }

    @Override
    public int delete(Integer workplace_id) {
        try {
            return session.delete(namespace + "delete", workplace_id);
        }  catch (PersistenceException e) {
            System.err.println("Persistence error occurred: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("An unexpected error occurred: " + e.getMessage());
        }
        return 0;
    }

    @Override
    public int deleteItems(List<Integer> workplace_ids) {
        try {
            return session.delete(namespace + "deleteItems", workplace_ids);
        } catch (PersistenceException e) {
            System.err.println("Persistence error occurred: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("An unexpected error occurred: " + e.getMessage());
        }
        return 0;
    }

    @Override
    public int update(WorkplaceDto workplace) {
        try {
            return session.update(namespace + "update", workplace);
        } catch (PersistenceException e) {
            System.err.println("Persistence error occurred: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("An unexpected error occurred: " + e.getMessage());
        }
        return 0;
    }
}
