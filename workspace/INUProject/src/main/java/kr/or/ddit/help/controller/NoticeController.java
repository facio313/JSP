package kr.or.ddit.help.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.help.service.NoticeService;

/**
 * 
 * @author 작성자명
 * @since 2023. 2. 1.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                  수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 2. 1.      박형준       최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/help/notice")
public class NoticeController {
	private NoticeService service;
	
	
	//공지사항 목록
	@GetMapping("/noticeList")
	public String notice(HttpServletRequest req) {
		return "help/notice/noticeList";
	}
	
	
	@GetMapping("/noticeInsert")
	public String noticeForm() {
		return "";
	}
	
	
	//공지사항 생성
	@PostMapping("/noticeInsert")
	public String noticeInsert() {
		return "";
	}
	
}
