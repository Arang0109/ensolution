package com.ensolution.manager.domain;

import com.ensolution.manager.domain.company.CompanyDto;
import com.ensolution.manager.service.company.CompanyService;
import com.ensolution.manager.service.company.WorkplaceService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class WorkplaceDtoTest {
  @Autowired
  WorkplaceService workplaceService;
  @Autowired
  CompanyService companyService;

  @Test
  public void getCompanyName() {
    CompanyDto company = companyService.getCompany(1);
    System.out.println(company.getCompany_name());
  }
}