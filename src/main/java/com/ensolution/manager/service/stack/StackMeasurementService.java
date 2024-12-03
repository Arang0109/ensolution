package com.ensolution.manager.service.stack;

import com.ensolution.manager.domain.stack.StackMeasurementDto;

import java.util.List;

public interface StackMeasurementService {
  StackMeasurementDto getStackMeasurement(Integer stack_measurement_id);

  List<StackMeasurementDto> getStackMeasurementListOfStack(Integer stack_id);

  List<StackMeasurementDto> getStackMeasurementList();

  int updateStackMeasurement(StackMeasurementDto stackMeasurementDto);

  void insertStackMeasurement(StackMeasurementDto stackMeasurementDto);

  void removeStackMeasurement(List<Integer> stack_measurement_ids);
}
