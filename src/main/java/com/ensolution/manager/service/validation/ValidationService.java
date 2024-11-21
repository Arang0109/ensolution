package com.ensolution.manager.service.validation;

import com.ensolution.manager.domain.company.CompanyDto;
import com.ensolution.manager.domain.company.WorkplaceDto;
import com.ensolution.manager.domain.stack.StackDto;

public interface ValidationService {
  boolean isExistCompany(CompanyDto companyDto);

  boolean isExistWorkplace(WorkplaceDto workplaceDto);

  boolean isExistStack(StackDto stackDto);
}
