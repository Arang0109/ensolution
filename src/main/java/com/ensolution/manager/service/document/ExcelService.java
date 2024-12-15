package com.ensolution.manager.service.document;

import com.ensolution.manager.domain.stack.ExDataStackMeasurementDto;
import com.ensolution.manager.domain.stack.StackMeasurementDto;
import com.ensolution.manager.repository.pollutant.PollutantDao;
import com.ensolution.manager.repository.stack.StackDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Service
public class ExcelService {
    PollutantDao pollutantDao;
    StackDao stackDao;

    @Autowired
    public ExcelService(PollutantDao pollutantDao, StackDao stackDao) {
        this.pollutantDao = pollutantDao;
        this.stackDao = stackDao;
    }

    // [exDataStackMeasurementDto{stack_name='stack 170', pollutant_name='����', prevention='�����ü� ��ġ�ǹ� ����', allow_value=30, cycle_type='annual'}
    // pollutant_name 을 가지고 pollutant_id 를 찾쟈
    // (stack_id, pollutant_id, cycle_type, is_completed, is_measure, allow_value)
    public List<StackMeasurementDto> convertStackMeasurementDto(List<ExDataStackMeasurementDto> exDataDto) {
        List<StackMeasurementDto> stackMeasurementDtos = new ArrayList<>();

        for (ExDataStackMeasurementDto item : exDataDto) {
            StackMeasurementDto stackMeasurementDto = new StackMeasurementDto();

            Integer pollutant_id = pollutantDao.searchId(item.getPollutant_name());
            Integer stack_id = stackDao.searchId(item.getStack_name());
            stackMeasurementDto.setPollutant_id(pollutant_id);
            stackMeasurementDto.setStack_id(stack_id);
            stackMeasurementDto.setIs_completed(false);
            stackMeasurementDto.setAllow_value(item.getAllow_value());
            stackMeasurementDto.setCycle_type(item.getCycle_type());
            stackMeasurementDto.setIs_measure(!(Objects.equals(item.getCycle_type(), "nomeasure")));
            stackMeasurementDtos.add(stackMeasurementDto);
        }

        return stackMeasurementDtos;
    }
}
