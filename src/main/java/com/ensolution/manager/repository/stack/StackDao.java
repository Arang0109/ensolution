package com.ensolution.manager.repository.stack;

import com.ensolution.manager.domain.stack.StackDto;

import java.util.List;

public interface StackDao {
  int count();

  StackDto select(Integer stack_id);

  StackDto search(StackDto stack);

  Integer searchId(String stack_name);

  List<StackDto> selectAll();

  List<StackDto> selectStackOfWorkplace(Integer workplace_id);

  int insert(StackDto stack);

  int deleteItems(List<Integer> stack_ids);

  int update(StackDto stack);
}
