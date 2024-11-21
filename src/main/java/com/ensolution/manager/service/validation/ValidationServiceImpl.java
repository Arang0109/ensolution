package com.ensolution.manager.service.validation;

import com.ensolution.manager.domain.company.CompanyDto;
import com.ensolution.manager.domain.company.WorkplaceDto;
import com.ensolution.manager.domain.stack.StackDto;
import com.ensolution.manager.repository.company.CompanyDao;
import com.ensolution.manager.repository.company.WorkplaceDao;
import com.ensolution.manager.repository.stack.StackDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ValidationServiceImpl implements ValidationService {
  CompanyDao companyDao;
  WorkplaceDao workplaceDao;
  StackDao stackDao;

  @Autowired
  public ValidationServiceImpl(CompanyDao companyDao, WorkplaceDao workplaceDao, StackDao stackDao) {
    this.companyDao = companyDao;
    this.workplaceDao = workplaceDao;
    this.stackDao = stackDao;
  }

  @Override
  public boolean isExistCompany(CompanyDto companyDto) {
    return companyDao.search(companyDto) != null;
  }

  @Override
  public boolean isExistWorkplace(WorkplaceDto workplaceDto) {
    return workplaceDao.search(workplaceDto) != null;
  }

  @Override
  public boolean isExistStack(StackDto stackDto) {
    return stackDao.search(stackDto) != null;
  }
}
