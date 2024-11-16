package com.ensolution.manager.service;

import com.ensolution.manager.domain.PollutantDto;

import java.util.List;

public interface PollutantService {
  PollutantDto getPollutant(Integer pollutant_id);

  List<PollutantDto> getPollutantList();

  Integer getPollutantCount();
}
