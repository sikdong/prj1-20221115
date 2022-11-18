package com.study.service.practice.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.domain.member.MemberDto;
import com.study.mapper.practice.member.PracMemberMapper;

@Service
public class PracMemberService {

	@Autowired
	private PracMemberMapper mapper;
	
	public int registerMember(MemberDto member) {
		// TODO Auto-generated method stub
		return mapper.insertMember(member);
	}

}
