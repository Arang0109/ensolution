package com.ensolution.manager.repository;

import com.ensolution.manager.domain.CompanyDto;

import java.util.List;

public interface CompanyDao {
    int count();

    CompanyDto select(Integer company_id);

    List<CompanyDto> selectAll();

    int insert(CompanyDto company);

    int delete(Integer company_id);

    int deleteItems(List<Integer> company_ids);

    int update(CompanyDto company);
}
