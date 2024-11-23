package com.ensolution.manager.service.company;

import com.ensolution.manager.domain.company.WorkplaceDto;
import com.ensolution.manager.repository.company.WorkplaceDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WorkplaceServiceImpl implements WorkplaceService {
    WorkplaceDao workplaceDao;

    @Autowired
    public WorkplaceServiceImpl(WorkplaceDao workplaceDao) {
        this.workplaceDao = workplaceDao;
    }

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
        workplaceDao.deleteItems(workplace_ids);
        return workplace_ids.size();
    }
}
