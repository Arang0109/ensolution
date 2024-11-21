package com.ensolution.manager.service.company;

import com.ensolution.manager.domain.company.WorkplaceDto;

import java.util.List;

public interface WorkplaceService {
  WorkplaceDto getWorkplace(Integer workplace_id);

  List<WorkplaceDto> getWorkplaceList();

  int updateWorkplace(WorkplaceDto workplaceDto);

  int insertWorkplace(WorkplaceDto workplaceDto);

  int removeWorkplace(List<Integer> workplace_ids);
}
