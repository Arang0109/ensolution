package com.ensolution.manager.service.stack;

import com.ensolution.manager.domain.stack.StackInfoDto;

public interface StackInfoService {
  StackInfoDto getStackInfo(Integer stack_info_id);

  int updateStackInfo(StackInfoDto stackInfoDto);
}
