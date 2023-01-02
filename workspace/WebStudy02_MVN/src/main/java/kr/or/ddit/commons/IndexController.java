package kr.or.ddit.commons;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.mvc.view.AbstractController;

public class IndexController implements AbstractController {
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("contentPage", "/WEB-INF/views/index.jsp");
		return "layout";
	}
}
