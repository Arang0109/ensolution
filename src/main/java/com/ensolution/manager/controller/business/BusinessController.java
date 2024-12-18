// BusinessController.java
//
package com.ensolution.manager.controller.business;

import com.ensolution.manager.domain.company.CompanyDto;
import com.ensolution.manager.domain.company.DepartmentDto;
import com.ensolution.manager.domain.company.SubFactoryDto;
import com.ensolution.manager.domain.company.WorkplaceDto;
import com.ensolution.manager.domain.stack.StackDto;
import com.ensolution.manager.service.company.CompanyService;
import com.ensolution.manager.service.company.WorkplaceService;
import com.ensolution.manager.service.pollutant.PollutantService;
import com.ensolution.manager.service.stack.StackInfoService;
import com.ensolution.manager.service.stack.StackMeasurementService;
import com.ensolution.manager.service.stack.StackService;
import com.ensolution.manager.service.validation.ValidationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/management")
public class BusinessController {
  CompanyService companyService;
  WorkplaceService workplaceService;
  StackService stackService;
  StackInfoService stackInfoService;
  StackMeasurementService stackMeasurementService;
  PollutantService pollutantService;
  ValidationService validationService;

  @Autowired
  public BusinessController(CompanyService companyService, WorkplaceService workplaceService,
                            StackService stackService, PollutantService pollutantService,
                            StackInfoService stackInfoService, StackMeasurementService stackMeasurementService,
                            ValidationService validationService) {
    this.companyService = companyService;
    this.workplaceService = workplaceService;
    this.stackService = stackService;
    this.stackInfoService = stackInfoService;
    this.stackMeasurementService = stackMeasurementService;
    this.pollutantService = pollutantService;
    this.validationService = validationService;
  }

  @GetMapping("/company")
  public String companyListView(Model m) {
    m.addAttribute("companies", companyService.getCompanyList());
    return "companyListView";
  }

  @GetMapping("/company/{companyId}")
  public String detailCompany(@PathVariable Integer companyId, Model m) {
    try {
      CompanyDto company = companyService.getCompany(companyId);
      List<WorkplaceDto> workplaces = companyService.getWorkplacesOfCompany(companyId);
      m.addAttribute("company", company);
      m.addAttribute("workplaces", workplaces);
      return "companyDetailView";
    } catch (Exception e) {
      e.printStackTrace();
      return "redirect:/management/company";
    }
  }

  @GetMapping("/workplace")
  public String workplaceManager(Model m) {
    m.addAttribute("workplaces", workplaceService.getWorkplaceList());
    m.addAttribute("companies", companyService.getCompanyList());
    return "workplaceListView";
  }

  @GetMapping("/workplace/{workplaceId}")
  public String detailWorkplace(@PathVariable Integer workplaceId, Model m) {
    try {
      WorkplaceDto workplace = workplaceService.getWorkplace(workplaceId);
      Integer company_id = workplace.getCompany_id();
      CompanyDto company = companyService.getCompany(company_id);
      List<SubFactoryDto> subFactoryDtos = workplaceService.getSubFactoryList(workplaceId);
      List<DepartmentDto> departmentDtos = workplaceService.getDepartmentList(workplaceId);
      m.addAttribute("stacks", stackService.getStackListOfWorkplace(workplaceId));
      m.addAttribute("workplace", workplace);
      m.addAttribute("company", company);
      m.addAttribute("sub_factories", subFactoryDtos);
      m.addAttribute("departments", departmentDtos);
      return "workplaceDetailView";
    } catch (Exception e) {
      e.printStackTrace();
      return "redirect:/management/workplace";
    }
  }

  @GetMapping("/stack")
  public String stackManager(Model m) {
    m.addAttribute("stacks", stackService.getStackList());
    m.addAttribute("workplaces", workplaceService.getWorkplaceList());
    return "stackListView";
  }

  @GetMapping("/stack/{stackId}")
  public String detailStack(@PathVariable Integer stackId, Model m) {
    try {
      m.addAttribute("stack_measurements", stackMeasurementService.getStackMeasurementListOfStack(stackId));
      m.addAttribute("stack", stackService.getStack(stackId));
      m.addAttribute("stack_info", stackInfoService.getStackInfo(stackId));
      m.addAttribute("pollutants", pollutantService.getPollutantList());
      return "stackDetailView";
    } catch (Exception e) {
      e.printStackTrace();
      return "redirect:/management/stack";
    }
  }

  @PostMapping("/company/add")
  public String addCompany(CompanyDto companyDto, RedirectAttributes rattr) {
    try {
      if (validationService.isExistCompany(companyDto)) {
        rattr.addFlashAttribute("companyAddResult", "fail");
        rattr.addFlashAttribute("companyName", companyDto.getCompany_name());
        return "redirect:/management/company";
      }
      companyService.insertCompany(companyDto);
      rattr.addFlashAttribute("companyAddResult", "success");
      rattr.addFlashAttribute("companyName", companyDto.getCompany_name());
    } catch (Exception e) {
      e.printStackTrace();
    }
    return "redirect:/management/company";
  }

  @PostMapping("/workplace/add")
  public String addWorkplace(WorkplaceDto workplaceDto, RedirectAttributes rattr) {
    try {
      if (validationService.isExistWorkplace(workplaceDto)) {
        rattr.addFlashAttribute("workplaceAddResult", "fail");
        rattr.addFlashAttribute("workplaceName", workplaceDto.getWorkplace_name());
        return "redirect:/management/company/" + workplaceDto.getCompany_id();
      }
      workplaceService.insertWorkplace(workplaceDto);
      rattr.addFlashAttribute("workplaceAddResult", "success");
      rattr.addFlashAttribute("workplaceName", workplaceDto.getWorkplace_name());
    } catch (Exception e) {
      e.printStackTrace();
    }
    return "redirect:/management/company/" + workplaceDto.getCompany_id();
  }

  @PostMapping("/stack/add")
  public String addStack(StackDto stackDto, RedirectAttributes rattr) {
    try {
      if (validationService.isExistStack(stackDto)) {
        rattr.addFlashAttribute("msg", "Already exist stack");
        return "redirect:/manager/workplace/" + stackDto.getWorkplace_id();
      }
      stackService.insertStack(stackDto);
      rattr.addFlashAttribute("msg", "Success Add Stack");
    } catch (Exception e) {
      e.printStackTrace();
    }
    return "redirect:/management/workplace/" + stackDto.getWorkplace_id();
  }
}
