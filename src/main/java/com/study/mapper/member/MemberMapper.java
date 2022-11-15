package com.study.mapper.member;

import java.util.List;

import com.study.domain.member.MemberDto;

public interface MemberMapper {

	int insert(MemberDto member);

	List<MemberDto> selectAll();

	MemberDto showMemberInfo(String id);

	int updateMemberInfo(MemberDto member);

	int deleteMember(String id);

	MemberDto selectByEmail(String email);

	MemberDto selectByNickname(String nickName);

}
