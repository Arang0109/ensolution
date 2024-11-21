package com.ensolution.manager.service.document;

import com.ensolution.manager.domain.pollutant.PollutantDto;

import java.util.List;
import java.util.Map;

public interface CalService {
  Map abilityScoreCal(List<PollutantDto> pollutants);
}
