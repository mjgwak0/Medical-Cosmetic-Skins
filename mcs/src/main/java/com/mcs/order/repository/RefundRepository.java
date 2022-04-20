package com.mcs.order.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mcs.order.domain.Refund;

public interface RefundRepository extends JpaRepository<Refund, Integer> {

}
