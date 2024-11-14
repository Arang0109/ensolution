package com.ensolution.manager.service;

import com.ensolution.manager.domain.StackDto;

import java.util.List;

public interface StackService {
  StackDto getStack(Integer stack_id);

  List<StackDto> getStackList();

  int updateStack(StackDto stackDto);

  int insertStack(StackDto stackDto);

  int removeStack(List<Integer> stack_ids);
}
