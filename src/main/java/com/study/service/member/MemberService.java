package com.study.service.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.study.domain.member.MemberDto;
import com.study.mapper.member.MemberMapper;

@Service
public class MemberService {
	
	@Autowired
	private MemberMapper mapper;
	
	@Autowired
	private PasswordEncoder passwordEncoder;

	public int insert(MemberDto member) {
		
		String pw = member.getPassword();
		member.setPassword(passwordEncoder.encode(pw));
		// TODO Auto-generated method stub
		return mapper.insert(member);
	}

	public List<MemberDto> list() {
		// TODO Auto-generated method stub
		return mapper.selectAll();
	}

	public MemberDto showMemberInfo(String id) {
		// TODO Auto-generated method stub
		return mapper.showMemberInfo(id);
	}

	public int modifyMemberInfo(MemberDto member) {
		int cnt = 0;

		try {
			String encodedPw = passwordEncoder.encode(member.getPassword());
			member.setPassword(encodedPw);

			return mapper.updateMemberInfo(member);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt; 
	}
		

	public int remove(String id) {
		// TODO Auto-generated method stub
		return mapper.deleteMember(id);
	}


	public MemberDto getByEmail(String email) {
		// TODO Auto-generated method stub
		return mapper.selectByEmail(email);
	}

	public MemberDto getByNickname(String nickName) {
		// TODO Auto-generated method stub
		return mapper.selectByNickname(nickName);
	}
	
	
}
