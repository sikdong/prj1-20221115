package com.study.controller.member;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.study.domain.member.MemberDto;
import com.study.service.member.MemberService;

@Controller
@RequestMapping("member")
public class MemberController {

	@Autowired
	private MemberService service;
	
	@PostMapping("existEmail")
	@ResponseBody
	public Map<String, Object> existEmail(@RequestBody Map<String, String> req ) {
		
		Map<String, Object> map = new HashMap<>();

		MemberDto member = service.getByEmail(req.get("presentEmail"));
		// jsp에서 넘어오는 body : ~() 가로 안에 변수명과 같아야함
		System.out.println(member);
		if (member == null) {
			map.put("status", "not exist");
			map.put("message", "사용가능한 이메일입니다.");
		} else {
			map.put("status", "exist");
			map.put("message", "이미 존재하는 이메일입니다.");
		}
		return map;
	}

	
	@GetMapping("existId/{id}")
	@ResponseBody
	public Map<String, Object> existId(@PathVariable String id){
		Map<String, Object> map = new HashMap<String, Object>();
		MemberDto member = service.showMemberInfo(id);
		if(member == null) {
			map.put("message", "회원가입 가능한 아이디 입니다");
		} else {
			map.put("message", "이미 존재하는 아이디 입니다");
		}
		return map;
	}
	
	@GetMapping("signup")
	public void signup() {
		
	}
	
	@PostMapping("signup")
	public String signup(MemberDto member, RedirectAttributes rttr) {
		System.out.println(member);
		
		int cnt = service.insert(member);
		if (cnt == 1) {
			// 가입 잘되면
			rttr.addFlashAttribute("message", "회원 가입이 되었습니다");
			return "redirect:/member/list";
		} else {
			rttr.addFlashAttribute("message", "회원 가입 실패하셨습니다");
			rttr.addFlashAttribute("member", member);
			return "redirect:/member/signup";
		}
	}
	
	@GetMapping("list")
	public void list(Model model) {
		model.addAttribute("memberList", service.list());
	}
	
	@GetMapping("info")
	public void info(Model model,String id){
	model.addAttribute("memberList", service.showMemberInfo(id));
	}
	
	@GetMapping("modify")
	public void modify(Model model, String id) {
		model.addAttribute("memberList", service.showMemberInfo(id));
	}
	
	@PostMapping("modify")
	public String modify(MemberDto member, RedirectAttributes rttr) {
		int cnt = service.modifyMemberInfo(member);
		if (cnt == 1) {
			// 가입 잘되면
			rttr.addFlashAttribute("message", "회원 정보가 수정되었습니다");
			return "redirect:/member/list";
		} else {
			rttr.addFlashAttribute("message", "회원 가입 실패하셨습니다");
			rttr.addFlashAttribute("member", member);
		}
		return "redirect:/member/list";
	}
	
	@PostMapping("remove")
	public String remove(String id, RedirectAttributes rttr) {
		 int cnt = service.remove(id);
		 if (cnt == 1) {
				rttr.addFlashAttribute("message", id+" 회원님이 탈퇴 되었습니다");
				return "redirect:/member/list";
			} else {
				rttr.addFlashAttribute("message", "회원 탈퇴 실패하셨습니다");
			}
		 return "redirect:/member/list";
	}
}
