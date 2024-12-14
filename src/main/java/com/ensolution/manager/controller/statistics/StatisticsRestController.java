package com.ensolution.manager.controller.statistics;

import com.ensolution.manager.domain.statistics.ChartDataResponse;
import com.ensolution.manager.service.company.WorkplaceService;
import com.ensolution.manager.service.statistics.StackCountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/statistics")
public class StatisticsRestController {
  WorkplaceService workplaceService;
  StackCountService stackCountService;

  @Autowired
  public StatisticsRestController(WorkplaceService workplaceService, StackCountService stackCountService) {
    this.workplaceService = workplaceService;
    this.stackCountService = stackCountService;
  }

  @GetMapping("/chart/workplace")
  public ChartDataResponse getChartStats(@RequestParam List<Integer> workplaceIds) {
    ChartDataResponse response = new ChartDataResponse();
    response.setCompleteStats(stackCountService.getCompleteStackCntOfWorkplace(workplaceIds));
    response.setNonCompleteStats(stackCountService.getNonCompleteStackCntOfWorkplace(workplaceIds));
    return response;
  }

  @GetMapping("/chart/all")
  public ChartDataResponse getChartStatsAll() {
    ChartDataResponse response = new ChartDataResponse();
    response.setCompleteStats(stackCountService.getCompleteStackCnt());
    response.setNonCompleteStats(stackCountService.getNonCompleteStackCnt());
    return response;
  }
}