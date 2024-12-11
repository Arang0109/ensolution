package com.ensolution.manager.controller.statistics;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/statistics")
public class StatisticsController {
  @GetMapping("/main")
  public String statisticsHome() {
    return "statistics/statisticsHome";
  }
}
