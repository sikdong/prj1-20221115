package com.study.service.practice.member;

import java.util.List;

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

	public List<MemberDto> getMembers() {
		// TODO Auto-generated method stub
		return mapper.getMembers();
	}

	public int updateMembers(MemberDto member) {
		// TODO Auto-generated method stub
		return mapper.updateMembers(member);
	}

	public MemberDto getMember(String id) {
		// TODO Auto-generated method stub
		return mapper.getMember(id);
	}

	public int deleteMembers(String id) {
		// TODO Auto-generated method stub
		return mapper.deleteMembers(id);
	}

}
