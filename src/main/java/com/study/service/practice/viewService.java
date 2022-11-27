package com.study.service.practice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.mapper.practice.viewMapper;

@Service
public class viewService {

	@Autowired
	private viewMapper mapper;
	
	public int updateView(int id) {
		// TODO Auto-generated method stub
		return mapper.updateView(id);
	}

}
