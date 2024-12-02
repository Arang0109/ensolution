package com.ensolution.manager.controller.schedule;

import com.ensolution.manager.service.company.WorkplaceService;
import com.ensolution.manager.service.plan.ScheduleService;
import com.ensolution.manager.service.stack.StackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {
  WorkplaceService workplaceService;
  StackService stackService;
  ScheduleService scheduleService;

  @Autowired
  public ScheduleController(WorkplaceService workplaceService, StackService stackService,
                            ScheduleService scheduleService) {
    this.workplaceService = workplaceService;
    this.stackService = stackService;
    this.scheduleService = scheduleService;
  }

  @GetMapping("/main")
  public String scheduleMainView(Model m) {
    m.addAttribute("workplaces", workplaceService.getWorkplaceList());
    m.addAttribute("stacks", stackService.getStackList());
    m.addAttribute("schedules", scheduleService.getScheduleList());
    return "schedule/main";
  }

  @GetMapping("/register")
  public String registerManager(Model m) {
    m.addAttribute("workplaces", workplaceService.getWorkplaceList());
    return "schedule/addPlanView";
  }
}
