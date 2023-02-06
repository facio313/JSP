package kr.or.ddit.resume.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.resume.service.ResumeService;
import kr.or.ddit.resume.vo.ResumeVO;

/**
 * @author 최경수
 * @since 2023. 2. 5.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 	    수정일               수정자                                     수정내용
 * --------     --------    ----------------------
 * 2023. 2. 5.     최경수        최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/resume")
public class ResumeController {
//	@Inject
//	private ResumeService service;
	/*
	@ModelAttribute("resume")
	public ResumeVO resume() {
		String resumeSn = "RSM000001";
		ResumeVO ex = service.retrieveResume(resumeSn);
		ex.getSeeker().setMemProfile("/resources/images/Dementor.jpg");
		return ex;
	}
	*/
	
	@GetMapping
	public String resumeMain(@ModelAttribute("resume") ResumeVO resume) {
		return "resume/resumeMain";
	}
}
