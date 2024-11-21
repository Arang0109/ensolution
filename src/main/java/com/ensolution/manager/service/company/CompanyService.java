package com.ensolution.manager.service.company;

import com.ensolution.manager.domain.company.CompanyDto;
import com.ensolution.manager.domain.company.WorkplaceDto;

import java.util.List;

public interface CompanyService {
  CompanyDto getCompany(Integer company_id);

  List<WorkplaceDto> getWorkplacesOfCompany(Integer company_id);

  List<CompanyDto> getCompanyList();

  int updateCompany(CompanyDto companyDto);

  int insertCompany(CompanyDto companyDto);

  int removeCompany(List<Integer> company_ids);
}
