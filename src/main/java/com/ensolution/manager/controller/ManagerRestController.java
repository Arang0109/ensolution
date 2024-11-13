package com.ensolution.manager.controller;

import com.ensolution.manager.domain.CompanyDto;
import com.ensolution.manager.domain.WorkplaceDto;
import com.ensolution.manager.service.CompanyService;
import com.ensolution.manager.service.WorkplaceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/manager")
public class ManagerRestController {
  @Autowired
  CompanyService companyService;
  @Autowired
  WorkplaceService workplaceService;

  @DeleteMapping("/company")
  public void deleteCompany(@RequestBody List<CompanyDto> company) {
    List<Integer> ids = new ArrayList<>();
    for (CompanyDto companyDto : company) {
      ids.add(companyDto.getCompany_id());
    }
    companyService.removeCompany(ids);
  }

  @DeleteMapping("/workplace")
  public void deleteWorkplace(@RequestBody List<WorkplaceDto> workplace) {
    List<Integer> ids = new ArrayList<>();
    for (WorkplaceDto workplaceDto : workplace) {
      ids.add(workplaceDto.getWorkplace_id());
    }
    workplaceService.removeWorkplace(ids);
  }

  @PatchMapping("/company/{company_id}")
  public void updateCompany(@RequestBody CompanyDto companyDto, @PathVariable Integer company_id) {
    companyDto.setCompany_id(company_id);
    companyService.updateCompany(companyDto);
  }

  @PatchMapping("/workplace/{workplace_id}")
  public void updateCompany(@RequestBody WorkplaceDto workplaceDto, @PathVariable Integer workplace_id) {
    workplaceDto.setWorkplace_id(workplace_id);
    workplaceService.updateWorkplace(workplaceDto);
  }
}