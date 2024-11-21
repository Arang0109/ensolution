package com.ensolution.manager.service.pollutant;

import com.ensolution.manager.domain.pollutant.PollutantDto;

import java.util.List;

public interface PollutantService {
  PollutantDto getPollutant(Integer pollutant_id);

  List<PollutantDto> getPollutantList();

  Integer getPollutantCount();
}
