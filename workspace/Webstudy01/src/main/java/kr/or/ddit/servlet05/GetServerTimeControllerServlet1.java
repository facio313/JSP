package kr.or.ddit.servlet05;

import java.io.IOException;
import java.util.Date;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/05/getServerTime1")
public class GetServerTimeControllerServlet1 extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 1. 요청 분석
		String accept = req.getHeader("Accept");
		String locale = req.getParameter("locale");
		
		// 2. 모델 확보
		Date now = new Date();
		
		// 3. 모델 공유
		String nowStr = "";
		if (locale.equals("ko")) {
			nowStr = String.format(Locale.KOREA, "now : %tc", now);
		} else if (locale.equals("en")) {
			nowStr = String.format(Locale.ENGLISH, "now : %tc", now);
		} else if (locale.equals("jp")) {
			nowStr = String.format(Locale.JAPAN, "now : %tc", now);
		}
		req.setAttribute("now", nowStr);
		
		resp.setHeader("Refresh", "1");
		// 4. 뷰 선택
		String viewName = null;
		int statusCode = HttpServletResponse.SC_OK;
		if (accept.contains("json")) {
			viewName = "/jsonView.do";
		} else if (accept.contains("plain")) {
			viewName = "/05/autoReqeust.jsp";
		} else {
			statusCode = HttpServletResponse.SC_NOT_ACCEPTABLE;
		}
		
		// 5. 뷰로 이동
		req.getRequestDispatcher(viewName).forward(req, resp);
	}
}
