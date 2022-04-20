package com.mcs.reivew.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mcs.reivew.domain.Review;

public interface ReivewRepository extends JpaRepository<Review, Integer> {


}
