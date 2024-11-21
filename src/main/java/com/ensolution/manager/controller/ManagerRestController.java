package com.ensolution.manager.controller;

import com.ensolution.manager.domain.*;
import com.ensolution.manager.service.*;
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
  StackMeasurementService stackMeasurementService;
  StackInfoService stackInfoService;

  @Autowired
  public ManagerRestController(CompanyService companyService, WorkplaceService workplaceService,
                               StackService stackService, StackMeasurementService stackMeasurementService,
                               StackInfoService stackInfoService) {
    this.companyService = companyService;
    this.workplaceService = workplaceService;
    this.stackService = stackService;
    this.stackMeasurementService = stackMeasurementService;
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

  @DeleteMapping("/company/delete/workplaces")
  public void deleteWorkplace(@RequestBody List<WorkplaceDto> workplace) {
    List<Integer> ids = new ArrayList<>();
    for (WorkplaceDto workplaceDto : workplace) {
      ids.add(workplaceDto.getWorkplace_id());
    }
    workplaceService.removeWorkplace(ids);
  }

  @DeleteMapping("/workplace/delete/stacks")
  public void deleteStack(@RequestBody List<StackDto> stack) {
    List<Integer> ids = new ArrayList<>();
    for (StackDto stackDto : stack) {
      ids.add(stackDto.getStack_id());
    }
    stackService.removeStack(ids);
  }

  @PatchMapping("/company/{companyId}")
  public void updateCompany(@RequestBody CompanyDto companyDto, @PathVariable Integer companyId) {
    companyDto.setCompany_id(companyId);
    companyService.updateCompany(companyDto);
  }

  @PatchMapping("/workplace/{workplaceId}")
  public void updateWorkplace(@RequestBody WorkplaceDto workplaceDto, @PathVariable Integer workplaceId) {
    workplaceDto.setWorkplace_id(workplaceId);
    workplaceService.updateWorkplace(workplaceDto);
  }

  @PatchMapping("/stack/{stackId}")
  public void updateStack(@RequestBody StackDto stackDto, @PathVariable Integer stackId) {
    stackDto.setStack_id(stackId);
    stackService.updateStack(stackDto);
  }

  @PostMapping("/stackMeasurement/{stackId}")
  public void addStackMeasurement(@RequestBody List<StackMeasurementDto> stackMeasurementList, @PathVariable Integer stackId) {
    for (StackMeasurementDto stackMeasurementDto : stackMeasurementList) {
      stackMeasurementDto.setStack_id(stackId);
      stackMeasurementService.insertStackMeasurement(stackMeasurementDto);
    }
  }

  @PatchMapping("/stackInfo/{stackId}")
  public void updateStackInfo(@RequestBody StackInfoDto stackInfoDto, @PathVariable Integer stackId) {
    stackInfoDto.setStack_info_id(stackId);
    stackInfoService.updateStackInfo(stackInfoDto);
  }
}