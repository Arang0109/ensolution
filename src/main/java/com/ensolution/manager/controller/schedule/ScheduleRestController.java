package com.ensolution.manager.controller.schedule;

import com.ensolution.manager.domain.company.WorkplaceDto;
import com.ensolution.manager.domain.stack.StackDto;
import com.ensolution.manager.domain.stack.StackMeasurementDto;
import com.ensolution.manager.service.company.WorkplaceService;
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

  @Autowired
  public ScheduleRestController(WorkplaceService workplaceService, StackService stackService,
                                StackMeasurementService stackMeasurementService) {
    this.workplaceService = workplaceService;
    this.stackService = stackService;
    this.stackMeasurementService = stackMeasurementService;
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
    List<StackMeasurementDto> stackMeasurements = stackMeasurementService.getStackMeasurementListOfStack(stack_id);

    Map<String, Object> response = new HashMap<>();
    response.put("measurements", stackMeasurements);

    return ResponseEntity.ok(response);
  }
}
