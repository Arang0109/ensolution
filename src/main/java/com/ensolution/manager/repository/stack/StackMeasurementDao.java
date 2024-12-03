package com.ensolution.manager.repository.stack;

import com.ensolution.manager.domain.stack.StackMeasurementDto;

import java.util.List;

public interface StackMeasurementDao {
  int count();

  StackMeasurementDto select(Integer stack_measurement_id);

  List<StackMeasurementDto> selectStackMeasurementOfStack(Integer stack_id);

  List<StackMeasurementDto> selectAll();

  Integer insert(StackMeasurementDto stackMeasurement);

  Integer deleteItems(List<Integer> stack_measurement_ids);

  Integer update(StackMeasurementDto stackMeasurement);

  void updateComplete(List<Integer> stack_measurement_ids);
}
