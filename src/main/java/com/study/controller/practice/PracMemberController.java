package com.study.controller.practice;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.study.domain.member.MemberDto;
import com.study.service.practice.member.PracMemberService;

@Controller
@RequestMapping("practice")
public class PracMemberController {

	@Autowired
	private PracMemberService service;
	
	@GetMapping("memberRegister")
	public void register() {
		
	}
	
	
	@PostMapping("memberRegister")
	public String register(MemberDto member, RedirectAttributes rttr) {
		int cnt = service.registerMember(member);
		
		if(cnt == 1) {
			rttr.addFlashAttribute("message", member.getId()+"님의 회원가입이 완료되었습니다");
		} else {
			rttr.addFlashAttribute("message", "회원가입이 완료되지 않았습니다");
		}
		
		return "redirect:/practice/list";
	}
	
	
}
