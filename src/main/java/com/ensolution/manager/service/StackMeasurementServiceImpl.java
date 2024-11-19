package com.ensolution.manager.service;

import com.ensolution.manager.domain.StackMeasurementDto;
import com.ensolution.manager.repository.StackMeasurementDao;
import com.fasterxml.jackson.databind.annotation.JsonAppend;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StackMeasurementServiceImpl implements StackMeasurementService {
    StackMeasurementDao stackMeasurementDao;

    @Autowired
    public StackMeasurementServiceImpl(StackMeasurementDao stackMeasurementDao) {
        this.stackMeasurementDao = stackMeasurementDao;
    }

    @Override
    public StackMeasurementDto getStackMeasurement(Integer stack_measurement_id) {
        return stackMeasurementDao.select(stack_measurement_id);
    }

    @Override
    public List<StackMeasurementDto> getStackMeasurementListOfStack(Integer stack_id) {
        return stackMeasurementDao.selectStackMeasurementOfStack(stack_id);
    }

    @Override
    public List<StackMeasurementDto> getStackMeasurementList() {
      return stackMeasurementDao.selectAll();
    }

    @Override
    public int updateStackMeasurement(StackMeasurementDto stackMeasurementDto) {
        return stackMeasurementDao.update(stackMeasurementDto);
    }

    @Override
    public int insertStackMeasurement(StackMeasurementDto stackMeasurementDto) {
        return stackMeasurementDao.insert(stackMeasurementDto);
    }

    @Override
    public int removeStackMeasurement(List<Integer> stack_measurement_ids) {
        for (Integer stack_measurement_id : stack_measurement_ids) {
            stackMeasurementDao.delete(stack_measurement_id);
        }
        return stack_measurement_ids.size();
    }
}
