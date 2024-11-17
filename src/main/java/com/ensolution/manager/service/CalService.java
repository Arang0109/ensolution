package com.ensolution.manager.service;

import com.ensolution.manager.domain.PollutantDto;

import java.util.List;
import java.util.Map;

public interface CalService {
  Map abilityScoreCal(List<PollutantDto> pollutants);
}
