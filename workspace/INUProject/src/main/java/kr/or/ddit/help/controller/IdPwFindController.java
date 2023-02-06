package kr.or.ddit.help.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.vo.SeekerVO;

/**
 * 
 * @author 박형준
 * @since 2023. 2. 1.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일               수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 2. 1.     박형준            최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/help/find")
public class IdPwFindController {
	
	@Inject
	private MemberService service;
	
	
	//아이디/비번 찾기페이지 이동
	@GetMapping
	public String find(HttpServletRequest req) {
		return "help/find/idpwFind";
	}
	
	//일반회원 아이디 찾기페이지 이동
	@GetMapping("/seekerFindId")
	public String seekerId(HttpServletRequest req) {
		return "help/find/seekerFindId";
	}
	
	//일반회원 아이디 찾기
	@PostMapping("/seekerFindIdResult")
	public String seekerFindId(SeekerVO seeker, Model model) {
		List<SeekerVO> idList = service.searchSeekerId(seeker);
		model.addAttribute("idList", idList);
		return "/help/find/seekerFindIdResult";
	}
	
	//일반회원 비밀번호 찾기페이지 이동
	@GetMapping("/seekerFindPw")
	public String seekerPw(HttpServletRequest req) {
		return "help/find/seekerFindPw";
	}
	
	//기업회원 아이디 찾기페이지 이동
	@GetMapping("/incruiterFindId")
	public String incruiterId(HttpServletRequest req) {
		return "help/find/incruiterFindId";
	}
	
	//기업회원 비밀번호 찾기페이지 이동
	@GetMapping("/incruiterFindPw")
	public String incruiterPw(HttpServletRequest req) {
		return "help/find/incruiterFindPw";
	}
	
	
	
}
