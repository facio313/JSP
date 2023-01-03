package kr.or.ddit.commons;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.mvc.annotation.sterotype.Controller;
import kr.or.ddit.mvc.annotation.sterotype.RequestMapping;

@Controller
public class IndexController {
	
	@RequestMapping("/index.do")
	public String index(HttpServletRequest req) throws ServletException {
		req.setAttribute("contentPage", "/WEB-INF/views/index.jsp");
		return "layout";
	}
}
