package com.ensolution.manager.repository.company;

import com.ensolution.manager.domain.company.WorkplaceDto;

import java.util.List;

public interface WorkplaceDao {
  int count();

  WorkplaceDto select(Integer company_id);

  WorkplaceDto search(WorkplaceDto workplace);

  List<WorkplaceDto> selectAll();

  int insert(WorkplaceDto workplace);

  int delete(Integer workplace_id);

  int deleteItems(List<Integer> workplace_ids);

  int update(WorkplaceDto workplace);
}
