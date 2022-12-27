package kr.or.ddit.login.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login/logout.do")
public class LogoutControllerServlet extends HttpServlet {
	// a태그를 이용해서 서블릿을 호출했기 때문에 get을 오버라이딩
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
//		session.removeAttribute("authMember");
		session.invalidate(); // 알아서 session 속성 지워주고, 현재 session 만료시켜줌(2단계 절약 개꿀)
		
		String viewName = "redirect:/";
		
		if (viewName.startsWith("redirect:")) {
			viewName = viewName.substring("redirect:".length());
			resp.sendRedirect(req.getContextPath() + viewName); 
		} else {
			req.getRequestDispatcher(viewName).forward(req, resp);
		}
	}
}
