package com.ensolution.manager.repository.company;

import com.ensolution.manager.domain.company.DepartmentDto;
import com.ensolution.manager.domain.company.SubFactoryDto;
import com.ensolution.manager.domain.company.WorkplaceDto;
import com.ensolution.manager.domain.statistics.StackCountDto;

import java.util.List;

public interface WorkplaceDao {
  int count();

  WorkplaceDto select(Integer company_id);

  WorkplaceDto search(WorkplaceDto workplace);

  List<WorkplaceDto> selectAll();

  List<SubFactoryDto> selectFactory(Integer workplaceId);

  List<DepartmentDto> selectDepartment(Integer workplaceId);

  int insert(WorkplaceDto workplace);

  int deleteItems(List<Integer> workplace_ids);

  int update(WorkplaceDto workplace);
}
