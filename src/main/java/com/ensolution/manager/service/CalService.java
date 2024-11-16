package com.ensolution.manager.service;

import com.ensolution.manager.domain.PollutantDto;

import java.util.List;

public interface CalService {
  Double abilityScoreCal(List<PollutantDto> pollutants);
}
