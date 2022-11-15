package com.study.domain.practice;

import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonFormat.Shape;

import lombok.Data;

@Data
public class CommentDto {
	private int id;
	private int customerInfoId;
	private String content;
	@JsonFormat(shape = Shape.STRING)
	private LocalDateTime inserted; 
}
