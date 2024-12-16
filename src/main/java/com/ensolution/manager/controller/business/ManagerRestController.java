package com.ensolution.manager.controller.business;

import com.ensolution.manager.domain.company.CompanyDto;
import com.ensolution.manager.domain.company.WorkplaceDto;
import com.ensolution.manager.domain.stack.ExDataStackMeasurementDto;
import com.ensolution.manager.domain.stack.StackDto;
import com.ensolution.manager.domain.stack.StackInfoDto;
import com.ensolution.manager.domain.stack.StackMeasurementDto;
import com.ensolution.manager.service.company.CompanyService;
import com.ensolution.manager.service.company.WorkplaceService;
import com.ensolution.manager.service.document.ExcelService;
import com.ensolution.manager.service.stack.StackInfoService;
import com.ensolution.manager.service.stack.StackMeasurementService;
import com.ensolution.manager.service.stack.StackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/manager")
public class ManagerRestController {
  CompanyService companyService;
  WorkplaceService workplaceService;
  StackService stackService;
  StackMeasurementService stackMeasurementService;
  StackInfoService stackInfoService;
  ExcelService excelService;

  @Autowired
  public ManagerRestController(CompanyService companyService, WorkplaceService workplaceService,
                               StackService stackService, StackMeasurementService stackMeasurementService,
                               StackInfoService stackInfoService, ExcelService excelService) {
    this.companyService = companyService;
    this.workplaceService = workplaceService;
    this.stackService = stackService;
    this.stackMeasurementService = stackMeasurementService;
    this.stackInfoService = stackInfoService;
    this.excelService = excelService;
  }

  @GetMapping("/stack/{stackId}/getStackMeasurement")
  public ResponseEntity<Map<String, Object>> getStackMeasurement(@PathVariable Integer stackId) {
    List<StackMeasurementDto> stackMeasurements = stackMeasurementService.getStackMeasurementListOfStack(stackId);

    Map<String, Object> response = new HashMap<>();
    response.put("stackMeasurements", stackMeasurements);

    return ResponseEntity.ok(response);
  }

  @DeleteMapping("/delete/company")
  public void deleteCompany(@RequestBody List<CompanyDto> company) {
    List<Integer> ids = new ArrayList<>();
    for (CompanyDto companyDto : company) {
      ids.add(companyDto.getCompany_id());
    }
    companyService.removeCompany(ids);
  }

  @DeleteMapping("/delete/workplace")
  public void deleteWorkplace(@RequestBody List<WorkplaceDto> workplace) {
    List<Integer> ids = new ArrayList<>();
    for (WorkplaceDto workplaceDto : workplace) {
      ids.add(workplaceDto.getWorkplace_id());
    }
    workplaceService.removeWorkplace(ids);
  }

  @DeleteMapping("/delete/stack")
  public void deleteStack(@RequestBody List<StackDto> stack) {
    List<Integer> ids = new ArrayList<>();
    for (StackDto stackDto : stack) {
      ids.add(stackDto.getStack_id());
    }
    stackService.removeStack(ids);
  }

  @DeleteMapping("/delete/stack/measurement")
  public void deleteStackMeasurement(@RequestBody List<StackMeasurementDto> stackMeasurement) {
    List<Integer> ids = new ArrayList<>();
    for (StackMeasurementDto stackMeasurementDto : stackMeasurement) {
      ids.add(stackMeasurementDto.getStack_measurement_id());
    }
    stackMeasurementService.removeStackMeasurement(ids);
  }

  @PatchMapping("/modify/company")
  public void updateCompany(@RequestBody CompanyDto companyDto) {
    companyService.updateCompany(companyDto);
  }

  @PatchMapping("/modify/workplace")
  public void updateWorkplace(@RequestBody WorkplaceDto workplaceDto) {
    workplaceService.updateWorkplace(workplaceDto);
  }

  @PatchMapping("/modify/stack")
  public void updateStack(@RequestBody StackDto stackDto) {
    stackService.updateStack(stackDto);
  }

  @PatchMapping("/modify/stack/specification")
  public void updateStackInfo(@RequestBody StackInfoDto stackInfoDto) {
    stackInfoService.updateStackInfo(stackInfoDto);
  }

  @PostMapping("/add/stack/measurement")
  public void addStackMeasurement(@RequestBody List<StackMeasurementDto> stackMeasurementList) {
    for (StackMeasurementDto stackMeasurementDto : stackMeasurementList) {
      stackMeasurementService.insertStackMeasurement(stackMeasurementDto);
    }
  }

  @PostMapping("/add/excel_data/measurement")
  public void addExcelDataMeasurement(@RequestBody List<ExDataStackMeasurementDto> exDataDto) {
    List<StackMeasurementDto> stackMeasurementList = excelService.convertStackMeasurementDto(exDataDto);
    for (StackMeasurementDto stackMeasurementDto : stackMeasurementList) {
      stackMeasurementService.insertStackMeasurement(stackMeasurementDto);
    }
  }
}