package com.ensolution.manager.controller;

import com.ensolution.manager.domain.*;
import com.ensolution.manager.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/manager")
public class ManagerController {
  CompanyService companyService;
  WorkplaceService workplaceService;
  StackService stackService;
  StackInfoService stackInfoService;
  StackMeasurementService stackMeasurementService;
  PollutantService pollutantService;

  @Autowired
  public ManagerController(CompanyService companyService, WorkplaceService workplaceService,
                           StackService stackService, PollutantService pollutantService,
                           StackInfoService stackInfoService, StackMeasurementService stackMeasurementService) {
    this.companyService = companyService;
    this.workplaceService = workplaceService;
    this.stackService = stackService;
    this.stackInfoService = stackInfoService;
    this.stackMeasurementService = stackMeasurementService;
    this.pollutantService = pollutantService;
  }

  @GetMapping("/company")
  public String companyManager(Model m) {
    m.addAttribute("companies", companyService.getCompanyList());
    return "companyManager";
  }

  @GetMapping("/workplace")
  public String workplaceManager(Model m) {
    m.addAttribute("workplaces", workplaceService.getWorkplaceList());
    m.addAttribute("companies", companyService.getCompanyList());
    return "workplaceManager";
  }

  @GetMapping("/stack")
  public String stackManager(Model m) {
    m.addAttribute("stacks", stackService.getStackList());
    m.addAttribute("workplaces", workplaceService.getWorkplaceList());
    return "stackManager";
  }

  // RESTful API (POST => 업체 추가)
  @PostMapping("/company")
  public String addCompany(CompanyDto companyDto, RedirectAttributes rattr) {
    try {
      companyService.insertCompany(companyDto);
      rattr.addFlashAttribute("msg", "Success Add Company");
    } catch (Exception e) {
      e.printStackTrace();
    }
    return "redirect:/manager/company";
  }

  @PostMapping("/stack")
  public String addStack(StackDto stackDto, RedirectAttributes rattr) {
    try {
      stackService.insertStack(stackDto);
      rattr.addFlashAttribute("msg", "Success Add Stack");
    } catch (Exception e) {
      e.printStackTrace();
    }
    return "redirect:/manager/stack";
  }

  @GetMapping("/company/{company_id}")
  public String detailCompany(@PathVariable Integer company_id, Model m) {
    try {
      CompanyDto company = companyService.getCompany(company_id);
      List<WorkplaceDto> workplaces = companyService.getWorkplacesOfCompany(company_id);
      m.addAttribute("company", company);
      m.addAttribute("workplaces", workplaces);
      return "companyDetailView";
    } catch (Exception e) {
      e.printStackTrace();
      return "redirect:/manager/company";
    }
  }

  @PostMapping("/company/{companyId}")
  public String addWorkplace(@PathVariable Integer companyId, WorkplaceDto workplaceDto, RedirectAttributes rattr) {
    try {
      workplaceDto.setCompany_id(companyId);
      workplaceService.insertWorkplace(workplaceDto);
      rattr.addFlashAttribute("msg", "Success Add Workplace");
    } catch (Exception e) {
      e.printStackTrace();
    }
    return "redirect:/manager/company/" + companyId;
  }

  @PostMapping("/workplace/{workplaceId}")
  public String addStack(@PathVariable Integer workplaceId, StackDto stackDto, RedirectAttributes rattr) {
    try {
      stackDto.setWorkplace_id(workplaceId);
      stackService.insertStack(stackDto);
      rattr.addFlashAttribute("msg", "Success Add Stack");
    } catch (Exception e) {
      e.printStackTrace();
    }
    return "redirect:/manager/workplace/" + workplaceId;
  }

  @GetMapping("/workplace/{workplace_id}")
  public String detailWorkplace(@PathVariable Integer workplace_id, Model m) {
    try {
      WorkplaceDto workplace = workplaceService.getWorkplace(workplace_id);
      Integer company_id = workplace.getCompany_id();
      CompanyDto company = companyService.getCompany(company_id);
      m.addAttribute("stacks", stackService.getStackListOfWorkplace(workplace_id));
      m.addAttribute("workplace", workplace);
      m.addAttribute("company", company);
      return "workplaceDetailView";
    } catch (Exception e) {
      e.printStackTrace();
      return "redirect:/manager/workplace";
    }
  }

  @GetMapping("/stack/{stack_id}")
  public String detailStack(@PathVariable Integer stack_id, Model m) {
    try {
      m.addAttribute("stack_measurements", stackMeasurementService.getStackMeasurementListOfStack(stack_id));
      m.addAttribute("stack", stackService.getStack(stack_id));
      m.addAttribute("stack_info", stackInfoService.getStackInfo(stack_id));
      m.addAttribute("pollutants", pollutantService.getPollutantList());
      return "stackDetailView";
    } catch (Exception e) {
      e.printStackTrace();
      return "redirect:/manager/stack";
    }
  }
}
