package com.ensolution.manager.repository.stack;

import com.ensolution.manager.domain.stack.StackMeasurementDto;

import java.util.List;

public interface StackMeasurementDao {
  int count();

  StackMeasurementDto select(Integer stack_measurement_id);

  List<StackMeasurementDto> selectStackMeasurementOfStack(Integer stack_id);

  List<StackMeasurementDto> selectAll();

  int insert(StackMeasurementDto stackMeasurement);

  int deleteItems(List<Integer> stack_measurement_ids);

  int update(StackMeasurementDto stackMeasurement);
}
