package com.ensolution.manager.service.stack;

import com.ensolution.manager.domain.stack.StackDto;

import java.util.List;

public interface StackService {
  StackDto getStack(Integer stack_id);

  List<StackDto> getStackList();

  List<StackDto> getStackListOfWorkplace(Integer workplace_id);

  int updateStack(StackDto stackDto);

  int insertStack(StackDto stackDto);

  int removeStack(List<Integer> stack_ids);
}
