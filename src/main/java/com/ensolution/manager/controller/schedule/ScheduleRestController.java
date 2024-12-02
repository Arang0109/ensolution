package com.ensolution.manager.controller.schedule;

import com.ensolution.manager.domain.company.WorkplaceDto;
import com.ensolution.manager.domain.plan.HistoryDto;
import com.ensolution.manager.domain.plan.ScheduleDto;
import com.ensolution.manager.domain.stack.StackDto;
import com.ensolution.manager.domain.stack.StackMeasurementDto;
import com.ensolution.manager.service.company.WorkplaceService;
import com.ensolution.manager.service.plan.ScheduleService;
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
@RequestMapping("/schedule")
public class ScheduleRestController {
  WorkplaceService workplaceService;
  StackService stackService;
  StackMeasurementService stackMeasurementService;
  ScheduleService scheduleService;

  @Autowired
  public ScheduleRestController(WorkplaceService workplaceService, StackService stackService,
                                StackMeasurementService stackMeasurementService, ScheduleService scheduleService) {
    this.workplaceService = workplaceService;
    this.stackService = stackService;
    this.stackMeasurementService = stackMeasurementService;
    this.scheduleService = scheduleService;
  }

  @PostMapping("/add/plan")
  public void addPlan(@RequestBody List<ScheduleDto> scheduleDto) {
    // 1. datepicker 선택된 날짜 (measure_date)
    // 2. stack_measurement_id >> 여러개 >> schedule 여러개 >> ajax 로 처리
    for (ScheduleDto schedule : scheduleDto) {
      scheduleService.insertSchedule(schedule);
    }
  }

  @PostMapping("/select/stack")
  public ResponseEntity<Map<String, Object>> getStackName(@RequestBody WorkplaceDto workplaceDto) {
    Integer workplace_id = workplaceDto.getWorkplace_id();
    List<StackDto> stacks = stackService.getStackListOfWorkplace(workplace_id);

    Map<String, Object> response = new HashMap<>();
    response.put("stacks", stacks);

    return ResponseEntity.ok(response);
  }

  @PostMapping("/select/stack/measurement")
  public ResponseEntity<Map<String, Object>> getStackMeasurement(@RequestBody StackDto stackDto) {
    Integer stack_id = stackDto.getStack_id();
    String note = stackService.getStack(stack_id).getNote();
    List<StackMeasurementDto> stackMeasurements = stackMeasurementService.getStackMeasurementListOfStack(stack_id);
    List<HistoryDto> histories = scheduleService.getHistory(stack_id);

    Map<String, Object> response = new HashMap<>();
    response.put("measurements", stackMeasurements);
    response.put("histories", histories);
    response.put("note", note);

    return ResponseEntity.ok(response);
  }
}
