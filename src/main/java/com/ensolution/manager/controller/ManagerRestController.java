package com.ensolution.manager.controller;

import com.ensolution.manager.domain.CompanyDto;
import com.ensolution.manager.domain.StackDto;
import com.ensolution.manager.domain.StackInfoDto;
import com.ensolution.manager.domain.WorkplaceDto;
import com.ensolution.manager.service.CompanyService;
import com.ensolution.manager.service.StackInfoService;
import com.ensolution.manager.service.StackService;
import com.ensolution.manager.service.WorkplaceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/manager")
public class ManagerRestController {
  CompanyService companyService;
  WorkplaceService workplaceService;
  StackService stackService;
  StackInfoService stackInfoService;

  @Autowired
  public ManagerRestController(CompanyService companyService, WorkplaceService workplaceService,
                               StackService stackService, StackInfoService stackInfoService) {
    this.companyService = companyService;
    this.workplaceService = workplaceService;
    this.stackService = stackService;
    this.stackInfoService = stackInfoService;
  }

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

  @DeleteMapping("/stack")
  public void deleteStack(@RequestBody List<StackDto> stack) {
    List<Integer> ids = new ArrayList<>();
    for (StackDto stackDto : stack) {
      ids.add(stackDto.getStack_id());
    }
    stackService.removeStack(ids);
  }

  @PatchMapping("/company/{company_id}")
  public void updateCompany(@RequestBody CompanyDto companyDto, @PathVariable Integer company_id) {
    companyDto.setCompany_id(company_id);
    companyService.updateCompany(companyDto);
  }

  @PatchMapping("/workplace/{workplace_id}")
  public void updateWorkplace(@RequestBody WorkplaceDto workplaceDto, @PathVariable Integer workplace_id) {
    workplaceDto.setWorkplace_id(workplace_id);
    workplaceService.updateWorkplace(workplaceDto);
  }

  @PatchMapping("/stack/{stack_id}")
  public void updateStack(@RequestBody StackDto stackDto, @PathVariable Integer stack_id) {
    stackDto.setStack_id(stack_id);
    stackService.updateStack(stackDto);
  }

  @PatchMapping("/stackInfo/{stack_info_id}")
  public void updateStackInfo(@RequestBody StackInfoDto stackInfoDto, @PathVariable Integer stack_info_id) {
    stackInfoDto.setStack_info_id(stack_info_id);
    stackInfoService.updateStackInfo(stackInfoDto);
  }
}