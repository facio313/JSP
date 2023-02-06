package kr.or.ddit.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/interview")
public class InterviewController {

	@GetMapping("/interviewList")
	public String interviewList() {
		return "interview/interviewList";

	}

	@GetMapping("/detailInterview")
	public String detailInterview() {
		return "interview/detailInterview";

	}
}
