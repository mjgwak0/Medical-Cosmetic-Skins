package com.mcs.order.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mcs.order.domain.Deli;

public interface DeliRepository extends JpaRepository<Deli, Integer>{

}
