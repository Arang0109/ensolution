package com.ensolution.manager.repository;

import com.ensolution.manager.domain.PollutantDto;

import java.util.List;

public interface PollutantDao {
  List<PollutantDto> selectAll();

  PollutantDto select(Integer pollutant_id);

  Integer count();
}
