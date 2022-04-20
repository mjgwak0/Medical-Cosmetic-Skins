package com.mcs.total.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mcs.total.repository.SkinRepository;

@Service
public class SkinService {
	@Autowired
	private SkinRepository skinRepo;
	
	public List<Integer> skintest() {
		List<Integer> skin = skinRepo.findSkin();
		return skin;
	}
	public List<Integer> skinage() {
		List<Integer> skin = skinRepo.findAge();
		return skin;
	}
}
