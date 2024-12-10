package com.ensolution.manager.controller.schedule;

import com.ensolution.manager.domain.plan.ScheduleTableDto;
import com.ensolution.manager.service.company.WorkplaceService;
import com.ensolution.manager.service.plan.ScheduleService;
import com.ensolution.manager.service.stack.StackMeasurementService;
import com.ensolution.manager.service.stack.StackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.sql.Date;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {
  WorkplaceService workplaceService;
  StackService stackService;
  ScheduleService scheduleService;
  StackMeasurementService stackMeasurementService;

  @Autowired
  public ScheduleController(WorkplaceService workplaceService, StackService stackService,
                            ScheduleService scheduleService, StackMeasurementService stackMeasurementService) {
    this.workplaceService = workplaceService;
    this.stackService = stackService;
    this.scheduleService = scheduleService;
    this.stackMeasurementService = stackMeasurementService;
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

  @GetMapping("/modify/{stackId}/{measureDate}")
  public String modifyView(@PathVariable Integer stackId, @PathVariable String measureDate, Model m) {
    ScheduleTableDto scheduleTableDto = new ScheduleTableDto();

    scheduleTableDto.setStack_id(stackId);
    scheduleTableDto.setMeasure_date(Date.valueOf(measureDate));

    m.addAttribute("stack", stackService.getStack(stackId));
    m.addAttribute("stack_measurements", stackMeasurementService.getStackMeasurementListOfStack(stackId));
    m.addAttribute("schedule", scheduleService.getScheduleDetail(scheduleTableDto));

    return "schedule/scheduleModifyView";
  }
}
