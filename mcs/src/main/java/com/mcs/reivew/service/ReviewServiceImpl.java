package com.mcs.reivew.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mcs.reivew.domain.Review;
import com.mcs.reivew.repository.ReivewRepository;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	private ReivewRepository reviewRepo;
	
	public void reviewSave(Review review) {
		reviewRepo.save(review);
	}

	
}
