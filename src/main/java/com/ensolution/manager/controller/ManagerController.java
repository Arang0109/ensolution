package com.ensolution.manager.controller;

import com.ensolution.manager.domain.CompanyDto;
import com.ensolution.manager.domain.WorkplaceDto;
import com.ensolution.manager.service.CompanyService;
import com.ensolution.manager.service.CompanyServiceImpl;
import com.ensolution.manager.service.WorkplaceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/manager")
public class ManagerController {
    @Autowired
    CompanyService companyService;
    @Autowired
    WorkplaceService workplaceService;

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

    @PostMapping("/workplace")
    public String addWorkplace(WorkplaceDto workplaceDto, RedirectAttributes rattr) {
      try {
        workplaceService.insertWorkplace(workplaceDto);
        rattr.addFlashAttribute("msg", "Success Add Workplace");
      } catch (Exception e) {
        e.printStackTrace();
      }
      return "redirect:/manager/workplace";
    }

    @GetMapping("/company/{company_id}")
    public String detailCompany(@PathVariable Integer company_id, Model m) {
      try {
        CompanyDto company = companyService.getCompany(company_id);
        m.addAttribute("company", company);
        return "companyDetailView";
      } catch (Exception e) {
        e.printStackTrace();
        return "redirect:/manager/company";
      }
    }

    @GetMapping("/workplace/{workplace_id}")
    public String detailWorkplace(@PathVariable Integer workplace_id, Model m) {
      try {
        WorkplaceDto workplace = workplaceService.getWorkplace(workplace_id);
        System.out.println(workplace);
        m.addAttribute("workplace", workplace);
        return "workplaceDetailView";
      } catch (Exception e) {
        e.printStackTrace();
        return "redirect:/manager/workplace";
      }
    }
}
