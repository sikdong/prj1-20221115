package com.study.mapper.practice;

import java.util.List;

import com.study.domain.practice.CommentDto;

public interface CustomerCommentMapper {

	public int enrollComment(CommentDto comment);

	public List<CommentDto> showComment(int customerInfoId);

	public int removeComment(int id);

}
