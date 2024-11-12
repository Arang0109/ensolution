package com.ensolution.manager.repository;

import com.ensolution.manager.domain.CompanyDto;
import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CompanyDaoImpl implements CompanyDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "com.ensolution.manager.repository.CompanyMapper.";

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
    public CompanyDto select(Integer company_id) {
        try {
            return session.selectOne(namespace + "select", company_id);
        } catch (PersistenceException e) {
            System.err.println("Persistence error occurred: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("An unexpected error occurred: " + e.getMessage());
        }
        return null;
    }

    @Override
    public List<CompanyDto> selectAll() {
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
    public int insert(CompanyDto company) {
        try {
            return session.insert(namespace + "insert", company);
        }  catch (PersistenceException e) {
            System.err.println("Persistence error occurred: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("An unexpected error occurred: " + e.getMessage());
        }
        return 0;
    }

    @Override
    public int delete(Integer company_id) {
        try {
            return session.delete(namespace + "delete", company_id);
        }  catch (PersistenceException e) {
            System.err.println("Persistence error occurred: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("An unexpected error occurred: " + e.getMessage());
        }
        return 0;
    }

    @Override
    public int deleteItems(List<Integer> company_ids) {
        try {
            return session.delete(namespace + "deleteItems", company_ids);
        } catch (PersistenceException e) {
            System.err.println("Persistence error occurred: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("An unexpected error occurred: " + e.getMessage());
        }
        return 0;
    }

    @Override
    public int update(CompanyDto company) {
        try {
            return session.update(namespace + "update", company);
        } catch (PersistenceException e) {
            System.err.println("Persistence error occurred: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("An unexpected error occurred: " + e.getMessage());
        }
        return 0;
    }
}
