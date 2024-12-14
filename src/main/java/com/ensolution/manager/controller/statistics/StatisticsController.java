package com.ensolution.manager.controller.statistics;

import com.ensolution.manager.service.company.WorkplaceService;
import com.ensolution.manager.service.statistics.StackCountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/statistics")
public class StatisticsController {
  WorkplaceService workplaceService;
  StackCountService stackCountService;

  @Autowired
  public StatisticsController(WorkplaceService workplaceService, StackCountService stackCountService) {
    this.workplaceService = workplaceService;
    this.stackCountService = stackCountService;
  }

  @GetMapping("/main")
  public String statisticsHome(Model m) {
    m.addAttribute("workplaces", workplaceService.getWorkplaceList());
    m.addAttribute("completeCnt", stackCountService.getCompleteStackCnt());
    m.addAttribute("nonCompleteCnt", stackCountService.getNonCompleteStackCnt());

    return "statistics/statisticsHome";
  }
}
