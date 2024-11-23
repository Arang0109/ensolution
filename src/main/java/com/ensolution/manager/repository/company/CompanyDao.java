package com.ensolution.manager.repository.company;

import com.ensolution.manager.domain.company.CompanyDto;
import com.ensolution.manager.domain.company.WorkplaceDto;

import java.util.List;

public interface CompanyDao {
    int count();

    List<WorkplaceDto> selectWorkplace(Integer company_id);

    CompanyDto select(Integer company_id);

    CompanyDto search(CompanyDto company);

    List<CompanyDto> selectAll();

    int insert(CompanyDto company);

    int deleteItems(List<Integer> company_ids);

    int update(CompanyDto company);
}
