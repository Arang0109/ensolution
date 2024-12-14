package com.ensolution.manager.service.company;

import com.ensolution.manager.domain.company.DepartmentDto;
import com.ensolution.manager.domain.company.SubFactoryDto;
import com.ensolution.manager.domain.company.WorkplaceDto;

import java.util.List;

public interface WorkplaceService {
  WorkplaceDto getWorkplace(Integer workplace_id);

  List<WorkplaceDto> getWorkplaceList();

  List<SubFactoryDto> getSubFactoryList(Integer workplace_id);

  List<DepartmentDto> getDepartmentList(Integer workplace_id);

  int updateWorkplace(WorkplaceDto workplaceDto);

  int insertWorkplace(WorkplaceDto workplaceDto);

  int removeWorkplace(List<Integer> workplace_ids);
}
