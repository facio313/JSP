package kr.or.ddit.login.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

import kr.or.ddit.mvc.annotation.RequestMethod;
import kr.or.ddit.mvc.annotation.sterotype.Controller;
import kr.or.ddit.mvc.annotation.sterotype.RequestMapping;

@Controller
public class LogoutController {
	@RequestMapping(value="/login/logout.do", method=RequestMethod.POST)
	public String logout(HttpSession session) throws ServletException {
//		session.removeAttribute("authMember");
		session.invalidate(); // 알아서 session 속성 지워주고, 현재 session 만료시켜줌(2단계 절약 개꿀)
		
		return "redirect:/";
	}
}
