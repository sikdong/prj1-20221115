package com.study.controller.practice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.service.practice.viewService;

@Controller
@RequestMapping("practice")
public class viewController {
	
	@Autowired
	private viewService service;
	
	@PostMapping("views")
	@ResponseBody
	public void updateView (int id) {
		service.updateView(id);
	}
}
