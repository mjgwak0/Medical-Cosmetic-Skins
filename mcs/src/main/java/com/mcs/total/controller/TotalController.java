package com.mcs.total.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.mcs.total.service.SkinService;


@Controller
public class TotalController {
	@Autowired
	private SkinService skinService;
	
	@GetMapping("/totalAccount")
	public String productlist(Model model) {
		List<Integer> skintest = skinService.skintest();
		model.addAttribute("skintest", skintest);
		return "/total/measurement";
	}
	@GetMapping("/totalAccount1")
	public String productlist1(Model model) {
		List<Integer> skinage = skinService.skintest();
		model.addAttribute("skinage", skinage);
		return "/total/measurement1";
	}
}
