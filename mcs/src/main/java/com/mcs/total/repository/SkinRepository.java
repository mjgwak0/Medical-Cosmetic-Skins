package com.mcs.total.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.mcs.baumann.domain.Skintest;

public interface SkinRepository extends JpaRepository<Skintest, Integer>{
	
	@Query(value = "select count(baumann) cnt from skintest group by baumann", nativeQuery = true)
	List<Integer> findSkin();
	
	
	@Query(value = "SELECT (CASE "
	       +" when age < 10 then '0~9세' "
	       +" when age < 20 then '10대'"
	       + "WHEN age < 30 THEN '20대' "
	       + "WHEN age < 40 THEN '30대' "
	       +" WHEN age < 50 THEN '40대' "
	       +" WHEN age < 60 THEN '50대' "
	       +" WHEN age < 70 THEN '60대' "
	       +" WHEN age < 80 THEN '70대' "
	       +" END) AS age_group, count(*)"  
	+"FROM (SELECT TRUNC(MONTHS_BETWEEN(sysdate, BIRTH)/12) AS AGE FROM member) "
	+"GROUP BY (CASE "
	 		+"when age < 10 then '0~9세'"
	 		+"when age < 20 then '10대'"
	 		+"WHEN age < 30 THEN '20대' "
	 		+"WHEN age < 40 THEN '30대' "
	 		+"WHEN age < 50 THEN '40대' "
	 		+"WHEN age < 60 THEN '50대' "
	        +"WHEN age < 70 THEN '60대'"
	        +"WHEN age < 80 THEN '70대' "
	        +"END)"
	        +"order by AGE_group;" , nativeQuery = true)
	List<Integer> findAge();

}
