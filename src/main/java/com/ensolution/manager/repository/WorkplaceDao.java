package com.ensolution.manager.repository;

import com.ensolution.manager.domain.WorkplaceDto;

import java.util.List;

public interface WorkplaceDao {
  int count();

  WorkplaceDto select(Integer company_id);

  List<WorkplaceDto> selectAll();

  int insert(WorkplaceDto workplace);

  int delete(Integer workplace_id);

  int deleteItems(List<Integer> workplace_ids);

  int update(WorkplaceDto workplace);
}
