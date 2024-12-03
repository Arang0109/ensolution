package com.ensolution.manager.service.stack;

import com.ensolution.manager.domain.stack.StackMeasurementDto;
import com.ensolution.manager.repository.stack.StackMeasurementDao;
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
    public void insertStackMeasurement(StackMeasurementDto stackMeasurementDto) {
        stackMeasurementDao.insert(stackMeasurementDto);
    }

    @Override
    public void removeStackMeasurement(List<Integer> stack_measurement_ids) {
        stackMeasurementDao.deleteItems(stack_measurement_ids);
    }
}
