package com.study.controller.practice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.study.domain.practice.CustomerDto;
import com.study.domain.practice.PageButtonInfo;
import com.study.service.practice.CustomerService;

@Controller
@RequestMapping("practice")
public class CustomerController {
	@Autowired
	private CustomerService service;
	
	
	@GetMapping("list")
	public void showBoard(Model model, 
			@RequestParam(name="page", defaultValue="1") int page, 
			PageButtonInfo pageButtonInfo,
			@RequestParam(name="column", defaultValue="all") String column,
			@RequestParam(name="keyword", defaultValue="") String keyword
			){
		List<CustomerDto> list = service.showList(page, pageButtonInfo, column, keyword);
		model.addAttribute("showList", list);
	}
	
	//고객 정보 등록
	@GetMapping("register")
	public void register() {
		
	}
	
	@PostMapping("register")
	public String register(CustomerDto customer, RedirectAttributes rttr) {
		int cnt = service.register(customer);
		if(cnt == 1) {
			
			rttr.addFlashAttribute("message", customer.getId() + "번 고객 정보가 신규 등록 되었습니다");
			}
			return "redirect:/practice/list";
	}
	//고객 정보 보여주기
	@GetMapping({"show", "update"})
	// 이렇게 하면 같이 실행 가능
	public void showCustomer(int id, Model model) {
		CustomerDto customer = service.showCustomer(id);
		model.addAttribute("customerList", customer);
	}
	
	//고객 정보 삭제
	@PostMapping("delete")
	public String deleteCustomer(int id, RedirectAttributes rttr) {
		int cnt = service.deleteCustomer(id);
		if(cnt == 1) {
			
		rttr.addFlashAttribute("message", id + "번 고객 정보가 삭제 되었습니다");
		}
		return "redirect:/practice/list";
	}
	
	// 고객 정보 갱신
	@PostMapping("update")
	public String updateCustomer(CustomerDto customer, RedirectAttributes rttr) {
		int cnt = service.updateCustomer(customer);
		if(cnt == 1) {
			rttr.addFlashAttribute("message", customer.getId()+"번 고객 정보가 수정되었습니다");
		} else {
			rttr.addFlashAttribute("message", "실패");
		}
		return "redirect:/practice/list";
	}
}
