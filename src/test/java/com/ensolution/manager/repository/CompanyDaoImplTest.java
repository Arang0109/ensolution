package com.ensolution.manager.repository;

import com.ensolution.manager.domain.CompanyDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class CompanyDaoImplTest {
    @Autowired
    CompanyDaoImpl companyDaoImpl;

    @Test
    public void count() {
        System.out.println(companyDaoImpl.count());
    }

    @Test
    public void selectWorkplace() throws Exception {
        System.out.println(companyDaoImpl.selectWorkplace(4));
    }

    @Test
    public void selectAll() throws Exception {
        System.out.println(companyDaoImpl.selectAll());
    }

    @Test
    public void insert() throws Exception {
        CompanyDto cd = new CompanyDto("다모야3", "부산", "강민수", "1221703521");
        System.out.println(cd);
        assertTrue(companyDaoImpl.insert(cd)==1);
    }

    @Test
    public void delete() throws Exception {
        List<Integer> a = new ArrayList<>();
        a.add(17);
        a.add(18);
        companyDaoImpl.deleteItems(a);
    }

    @Test
    public void update() {
        CompanyDto cd = companyDaoImpl.select(1);
        System.out.println(cd);
        cd.setCeo_name("유수진");
        System.out.println(cd);
        companyDaoImpl.update(cd);

    }
}