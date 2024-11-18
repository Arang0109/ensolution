package com.ensolution.manager.repository;

import com.ensolution.manager.domain.StackInfoDto;

import java.util.List;

public interface StackInfoDao {
  StackInfoDto select(Integer stack_info_id);

  List<StackInfoDto> selectAll();

  int insert(StackInfoDto stackInfo);

  int update(StackInfoDto stackInfo);
}
