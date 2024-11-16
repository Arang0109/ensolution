package com.ensolution.manager.service;

import com.ensolution.manager.domain.PollutantDto;
import com.ensolution.manager.repository.PollutantDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PollutantServiceImpl implements PollutantService {
  PollutantDao pollutantDao;

  @Autowired
  public PollutantServiceImpl(PollutantDao pollutantDao) {
    this.pollutantDao = pollutantDao;
  }

  @Override
  public PollutantDto getPollutant(Integer pollutant_id) {
    return pollutantDao.select(pollutant_id);
  }

  @Override
  public List<PollutantDto> getPollutantList() {
    return pollutantDao.selectAll();
  }

  @Override
  public Integer getPollutantCount() { return pollutantDao.count(); }
}
