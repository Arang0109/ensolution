package com.ensolution.manager.repository.pollutant;

import com.ensolution.manager.domain.pollutant.PollutantDto;

import java.util.List;

public interface PollutantDao {
  List<PollutantDto> selectAll();

  PollutantDto select(Integer pollutant_id);

  Integer count();

  Integer searchId(String pollutant_name);
}
