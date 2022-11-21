package com.study.mapper.practice.member;

import java.util.List;

import com.study.domain.member.MemberDto;

public interface PracMemberMapper {

	int insertMember(MemberDto member);

	List<MemberDto> getMembers();

	int updateMembers(MemberDto member);
	
}
