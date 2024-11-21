package com.ensolution.manager.service;

import com.ensolution.manager.domain.company.CompanyDto;
import com.ensolution.manager.domain.company.WorkplaceDto;
import com.ensolution.manager.repository.company.CompanyDao;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class CompanyServiceImplTest {
  @Autowired
  CompanyDao companyDao;

  @Test
  public void getCompanyList() {
    List<CompanyDto> companyList = companyDao.selectAll();
    for (CompanyDto companyDto : companyList) {
      System.out.println(companyDto.getCompany_name());
    }
  }

  @Test
  public void getWorkplaceList() {
    List<WorkplaceDto> workplaceList = companyDao.selectWorkplace(4);
    for (WorkplaceDto workplaceDto : workplaceList) {
      System.out.println(workplaceDto.getWorkplace_name());
    }
  }
}