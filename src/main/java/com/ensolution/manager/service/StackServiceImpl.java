package com.ensolution.manager.service;

import com.ensolution.manager.domain.StackDto;
import com.ensolution.manager.repository.StackDao;
import com.ensolution.manager.repository.StackInfoDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StackServiceImpl implements StackService {
  StackDao stackDao;

  @Autowired
  public StackServiceImpl(StackDao stackDao) {
    this.stackDao = stackDao;
  }

  @Override
  public StackDto getStack(Integer stack_id) {
    return stackDao.select(stack_id);
  }

  @Override
  public List<StackDto> getStackList() {
    return stackDao.selectAll();
  }

  @Override
  public int updateStack(StackDto stackDto) {
    return stackDao.update(stackDto);
  }

  @Override
  public int insertStack(StackDto stackDto) {
    return stackDao.insert(stackDto);
  }

  @Override
  public int removeStack(List<Integer> stack_ids) {
    for (Integer stack_id : stack_ids) {
      stackDao.delete(stack_id);
    }
    return stack_ids.size();
  }
}
