package com.ensolution.manager.service;

import com.ensolution.manager.domain.WorkplaceDto;
import com.ensolution.manager.repository.WorkplaceDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WorkplaceServiceImpl implements WorkplaceService {
    @Autowired
    WorkplaceDao workplaceDao;

    @Override
    public WorkplaceDto getWorkplace(Integer workplace_id) {
        return workplaceDao.select(workplace_id);
    }

    @Override
    public List<WorkplaceDto> getWorkplaceList() {
      return workplaceDao.selectAll();
    }

    @Override
    public int updateWorkplace(WorkplaceDto workplaceDto) {
        return workplaceDao.update(workplaceDto);
    }

    @Override
    public int insertWorkplace(WorkplaceDto workplaceDto) {
        return workplaceDao.insert(workplaceDto);
    }

    @Override
    public int removeWorkplace(List<Integer> workplace_ids) {
        for (Integer workplace_id : workplace_ids) {
            workplaceDao.delete(workplace_id);
        }
        return workplace_ids.size();
    }
}
