package kr.or.ddit.servlet06;

import java.io.IOException;
import java.util.Map;
import java.util.Optional;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(value = "/bts/*", loadOnStartup = 2)
public class BTSMemberServlet extends HttpServlet{
	private ServletContext application; // 톰캣 서버에서 단 하나여야 함!! 
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		application = config.getServletContext(); // 서블릿은 여러 개라도 톰캣(WAS, Servlet Container)는 하나! 즉 싱글톤
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 1. 요청정보, 코드값
		String requestURI = req.getRequestURI();
		String code = Optional.of(requestURI)
				.map(uri -> uri.substring(req.getContextPath().length()))
				.map(uri -> uri.substring("/bts/".length()))
				.get();
		
		Map<String, String[]> members = (Map) application.getAttribute("btsMembers");
		String[] contents = members.get(code);
		if (contents == null) { // 그런 멤버는 존재하지 않는다. 404
			resp.sendError(HttpServletResponse.SC_NOT_FOUND);
			return;
		}
		String contentPage = contents[1];
		req.setAttribute("contentPage", contentPage);
		req.getRequestDispatcher("/WEB-INF/views/bts/btsLayout.jsp").forward(req, resp); // 공통모듈을 위해 모듈화가 필요함
	}
}
