package com.ensolution.manager.service;

import com.ensolution.manager.domain.StackInfoDto;

import java.util.List;

public interface StackInfoService {
  StackInfoDto getStackInfo(Integer stack_info_id);

  int updateStackInfo(StackInfoDto stackInfoDto);
}
