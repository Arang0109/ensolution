package com.ensolution.manager.service;

import com.ensolution.manager.domain.StackMeasurementDto;

import java.util.List;

public interface StackMeasurementService {
  StackMeasurementDto getStackMeasurement(Integer stack_measurement_id);

  List<StackMeasurementDto> getStackMeasurementListOfStack(Integer stack_id);

  List<StackMeasurementDto> getStackMeasurementList();

  int updateStackMeasurement(StackMeasurementDto stackMeasurementDto);

  int insertStackMeasurement(StackMeasurementDto stackMeasurementDto);

  int removeStackMeasurement(List<Integer> stack_measurement_ids);
}
