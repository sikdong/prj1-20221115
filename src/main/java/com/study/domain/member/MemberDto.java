package com.study.domain.member;

import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonFormat.Shape;

import lombok.Data;

@Data
public class MemberDto {
	private String id;
	private String email;
	private String password;
	@JsonFormat(shape = Shape.STRING)
	private LocalDateTime inserted;
}
