package com.mcs.product.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mcs.product.domin.Files;

public interface FilesRepository extends JpaRepository<Files, Integer> {

	Files findByFilenum(int filenum);
}
