package com.ensolution.manager.repository;

import com.ensolution.manager.domain.CompanyDto;
import com.ensolution.manager.domain.WorkplaceDto;

import java.util.List;

public interface CompanyDao {
    int count();

    List<WorkplaceDto> selectWorkplace(Integer company_id);

    CompanyDto select(Integer company_id);

    List<CompanyDto> selectAll();

    int insert(CompanyDto company);

    int delete(Integer company_id);

    int deleteItems(List<Integer> company_ids);

    int update(CompanyDto company);
}
