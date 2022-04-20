package com.mcs.company.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mcs.company.domain.Company;

public interface CompanyRepository extends JpaRepository<Company, String> {

	Company findByCompany(String company);

}
