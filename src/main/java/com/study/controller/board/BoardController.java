package com.study.controller.board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.study.domain.board.BoardDto;
import com.study.domain.board.PageInfo;
import com.study.service.board.BoardService;

@Controller
@RequestMapping("board")
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	
	@GetMapping("register")
	public void register() {
		// 게시물 작성 view 로 포워드
	}
	
	@PostMapping("register")
	public String register(
			BoardDto board,
			MultipartFile[] files,
			RedirectAttributes rttr){
		                // 디스패쳐 서블릿이 알아서 넣어주기때문에 인수로만 받으면 됨
		//request param 수집/ 가공 //
		
		//business 로직 
		int cnt = service.register(board, files);
		if(cnt == 1) {
			rttr.addFlashAttribute("message", "새 게시물이 등록되었습니다.");
			} else {
			rttr.addFlashAttribute("message", "새 게시물이 등록되지 않았습니다. ");
		}
		
		// /board/list 로 리다이렉트
		
		return "redirect:/board/list";
	}
	
	@GetMapping("list")
	public void list(@RequestParam(name= "page", defaultValue="1") int page, 
			PageInfo pageInfo, Model model,
			@RequestParam(name="t", defaultValue="all") String type,
			@RequestParam(name="q", defaultValue="") String keyword) {
		
		List<BoardDto>list = service.listBoard(page, type, keyword, pageInfo);
		model.addAttribute("boardList", list);
	}
	
	// 위 list 메소드 파라미터 PageInfo에 일어나는 일을 풀어서 작성
//	private void list2(
//			@RequestParam(name = "page", defaultValue = "1") int page,
//			HttpServletRequest request,
//			Model model) {
//		// request param
//		PageInfo pageInfo = new PageInfo();
//		pageInfo.setLastPageNumber(Integer.parseInt(request.getParameter("lastPageNumber")));
//		model.addAttribute("pageInfo", pageInfo);
//		
//		// business logic
//		List<BoardDto> list = service.listBoard(page, keyword, pageInfo);
//		
//		// add attribute
//		model.addAttribute("boardList", list);
//		// forward
//	}
	
	@GetMapping("get")
	public void get(Model model, int id, 
			Authentication authentication) {
		String username = null;
		if(authentication != null) {
			
		BoardDto board = service.get(id, username);
		model.addAttribute("board", board);
		}
	}
	
	@GetMapping("modify")
	@PreAuthorize("@boardSecurity.checkWriter(authentication.name, #id)")
	public void modify(int id, Model model) {
		BoardDto board = service.get(id);
		model.addAttribute("board", board);
	}
	
	@PostMapping("modify")
	@PreAuthorize("@boardSecurity.checkWriter(authentication.name, #board.id)")
	public String modify(
			BoardDto board,
			MultipartFile[] files,
			RedirectAttributes rttr,
			@RequestParam(name = "removeFiles", required=false) List<String> removeFiles) {
		
		int cnt = service.update(board, files, removeFiles);
		if(cnt == 1) {
			rttr.addFlashAttribute("message", board.getId() +"번 게시물이 수정되었습니다");
		} else {
			rttr.addFlashAttribute("message", board.getId() +"번 게시물이 수정되지 않았습니다");
		}
		return "redirect:/board/list";
	}
	
	@PostMapping("remove")
	@PreAuthorize("@boardSecurity.checkWriter(authentication.name, #id)")
	public String remove(Integer id, RedirectAttributes rttr) {
		int cnt = service.remove(id);
		if(cnt == 1) {
			rttr.addFlashAttribute("message", "게시물이 삭제되었습니다");
		} else {
			rttr.addFlashAttribute("message", "게시물이 삭제되지 못했습니다.");
		}
		return"redirect:/board/list";
	}
	
	@PutMapping("like")
	@ResponseBody
	@PreAuthorize("isAuthenticated()")
	public Map<String, Object> like(@RequestBody Map<String, String> req, 
			Authentication authentication) {
		System.out.println(req);
		
		Map<String, Object> result = service.updateLike(req.get("boardId"), authentication.getName());
		return result;
	}
}