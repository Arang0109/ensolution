package com.ensolution.manager.controller.schedule;

import com.ensolution.manager.domain.plan.ScheduleDto;
import com.ensolution.manager.service.company.WorkplaceService;
import com.ensolution.manager.service.plan.ScheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {
  WorkplaceService workplaceService;
  ScheduleService scheduleService;

  @Autowired
  public ScheduleController(WorkplaceService workplaceService, ScheduleService scheduleService) {
    this.workplaceService = workplaceService;
    this.scheduleService = scheduleService;
  }

  @GetMapping("/register")
  public String registerManager(Model m) {
    m.addAttribute("workplaces", workplaceService.getWorkplaceList());
    return "schedule/addPlanView";
  }

  @PostMapping("/add/plan")
  public String addPlan(ScheduleDto scheduleDto) {
    try {
      scheduleService.insertSchedule(scheduleDto);
      } catch (Exception e) {
      e.printStackTrace();
    }

    return "redirect:/schedule/register";
  }
}
