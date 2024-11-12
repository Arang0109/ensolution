package com.ensolution.manager.repository;

import com.ensolution.manager.domain.StackDto;

import java.util.List;

public interface StackDao {
  int count();

  StackDto select(Integer stack_id);

  List<StackDto> selectAll();

  int insert(StackDto stack);

  int delete(Integer stack_id);

  int deleteItems(List<Integer> stack_ids);

  int update(StackDto stack);
}
