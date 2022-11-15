package com.study.service.practice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.domain.practice.CommentDto;
import com.study.mapper.practice.CustomerCommentMapper;

@Service
public class CustomerCommentService {

	@Autowired
	private CustomerCommentMapper mapper;
	
	public int enrollComment(CommentDto comment) {
		// TODO Auto-generated method stub
		return mapper.enrollComment(comment);
	}

	public List<CommentDto> showComment(int customerInfoId) {
		// TODO Auto-generated method stub
		return mapper.showComment(customerInfoId);
	}

	public int removeComment(int id) {
		// TODO Auto-generated method stub
		return mapper.removeComment(id);
	}

}
