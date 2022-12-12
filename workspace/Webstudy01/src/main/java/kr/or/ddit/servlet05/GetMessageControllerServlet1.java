package kr.or.ddit.servlet05;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.servlet05.service.PropertiesService;
import kr.or.ddit.servlet05.service.PropertiesServiceImpl;


@WebServlet("/04/getGreetingMessage1")
public class GetMessageControllerServlet1 extends HttpServlet {
	private PropertiesService service = new PropertiesServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String accept = req.getHeader("Accept");
		String locale = req.getParameter("locale");
		
		if (locale == null) {
			locale = "";
		}
		
		Object target = service.retrieveData(locale);
		req.setAttribute("target", target);
		
		String path = null;
		
		if (accept.startsWith("*/*") || accept.toLowerCase().contains("html")) {
			path = "/04/messageView1.jsp";
		} else if (accept.toLowerCase().contains("json")) {
			path = "/jsonView.do1";
		} else {
			path = "/xmlView.do1";
		}
		req.getRequestDispatcher(path).forward(req, resp);
		
	}
	
}
