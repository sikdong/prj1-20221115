package com.study.controller.practice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
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
	
	@GetMapping("getMembers")
	public void getMember(Model model){
		List<MemberDto> members = service.getMembers();
		model.addAttribute("Members", members);
	}
	
	@GetMapping("updateMembers")
	public void updateMembers(Model model, String id) {
		MemberDto member = service.getMember(id);
		model.addAttribute("member" , member);
	}
	
	@PostMapping("updateMembers")
	public Map<String, Object> updateMembers(MemberDto member){
		Map<String, Object> map = new HashMap<>();
		int cnt = service.updateMembers(member);
		
		if(cnt == 1) {
			map.put("message", member.getId()+"님의 회원 정보가 수정되었습니다");
		}
		return map;
			
	}
	
	@PostMapping("deleteMembers")
	public String deleteMembers(String id, RedirectAttributes rttr) {
		int cnt = service.deleteMembers(id);
		if(cnt == 1) {
			rttr.addFlashAttribute("message", id+"님이 탈퇴하셨습니다");
		}
		return"redirect:/practice/getMembers";
	}
	
	
	
	
	
	
}
