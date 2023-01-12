package kr.or.ddit.login.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class LogoutController {
	@PostMapping("/login/logout.do")
	public String logout(HttpSession session) throws ServletException {
//		session.removeAttribute("authMember");
		session.invalidate(); // 알아서 session 속성 지워주고, 현재 session 만료시켜줌(2단계 절약 개꿀)
		
		return "redirect:/";
	}
}
