package com.study.domain.member;

import java.time.LocalDateTime;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonFormat.Shape;

import lombok.Data;

@Data
public class MemberDto {
	private String id;
	private String nickName;
	private String email;
	private String password;
	@JsonFormat(shape = Shape.STRING)
	private LocalDateTime inserted;
	private List<String> auth;
}
