package com.ensolution.manager.repository.stack;

import com.ensolution.manager.domain.stack.StackInfoDto;

import java.util.List;

public interface StackInfoDao {
  StackInfoDto select(Integer stack_info_id);

  List<StackInfoDto> selectAll();

  int update(StackInfoDto stackInfo);
}
