package com.ensolution.manager.service.stack;

import com.ensolution.manager.domain.stack.StackInfoDto;
import com.ensolution.manager.repository.stack.StackInfoDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StackInfoServiceImpl implements StackInfoService {
  StackInfoDao stackInfoDao;

  @Autowired
  public StackInfoServiceImpl(StackInfoDao stackInfoDao) {
    this.stackInfoDao = stackInfoDao;
  }

  @Override
  public StackInfoDto getStackInfo(Integer stack_info_id) {
    return stackInfoDao.select(stack_info_id);
  }

  @Override
  public int updateStackInfo(StackInfoDto stackInfoDto) {
    return stackInfoDao.update(stackInfoDto);
  }
}
