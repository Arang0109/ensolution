package com.ensolution.manager.service.company;

import com.ensolution.manager.domain.company.CompanyDto;
import com.ensolution.manager.domain.company.WorkplaceDto;
import com.ensolution.manager.repository.company.CompanyDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CompanyServiceImpl implements CompanyService {
    CompanyDao companyDao;

    @Autowired
    public CompanyServiceImpl(CompanyDao companyDao) {
        this.companyDao = companyDao;
    }

    @Override
    public CompanyDto getCompany(Integer company_id) {
        return companyDao.select(company_id);
    }

    @Override
    public List<WorkplaceDto> getWorkplacesOfCompany(Integer company_id) {
        return companyDao.selectWorkplace(company_id);
    }

    @Override
    public List<CompanyDto> getCompanyList() {
      return companyDao.selectAll();
    }

    @Override
    public int updateCompany(CompanyDto companyDto) {
        return companyDao.update(companyDto);
    }

    @Override
    public int insertCompany(CompanyDto companyDto) {
        return companyDao.insert(companyDto);
    }

    @Override
    public int removeCompany(List<Integer> company_ids) {
        companyDao.deleteItems(company_ids);
        return company_ids.size();
    }
}
