package kr.or.ddit.servlet04;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.servlet04.service.PropertiesService;
import kr.or.ddit.servlet04.service.PropertiesServiceImpl;

@WebServlet("/04/calculate1")
public class CalculateServlet1 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String accept = req.getHeader("Accept");
		
		String path = null;
		
		if (accept.startsWith("*/*") || accept.toLowerCase().contains("html")) {
			path = "/WEB-INF/views/03/calculateForm1.jsp";
		} else if (accept.toLowerCase().contains("json")) {
			path = "/jsonView.do";
		} else {
			path = "/xmlView.do";
		}
		req.getRequestDispatcher(path).forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	
	}
}
