package kr.or.ddit.servlet05;

import java.io.IOException;
import java.util.Locale;
import java.util.MissingResourceException;
import java.util.ResourceBundle;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.servlet05.service.PropertiesService;
import kr.or.ddit.servlet05.service.PropertiesServiceImpl;

@WebServlet("/04/getGreetingMessage")
public class GetMessageControllerServlet extends HttpServlet {
	private PropertiesService service = new PropertiesServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		1. 요청 분석(line, header, body)
		String accept = req.getHeader("Accept");
		String locale = req.getParameter("locale");
		
		Locale clientLocale = null;
		if (locale!=null) {
//			ko, en : language tag, locale code
			clientLocale = Locale.forLanguageTag(locale);
		} else {
			clientLocale = req.getLocale(); // Accept-language header로 결정됨
			locale = "";
		}
		String name = req.getParameter("name");
		if (name == null || name.isEmpty()) {
			resp.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return;
		}
		System.out.println(locale);
//		2. 모델 확보
		Object target = service.retrieveData(locale);
		req.setAttribute("target", target);
		
		Object message = null;
		try {
			message = retrieveMessage(clientLocale, name);
		} catch (MissingResourceException e) {
			resp.sendError(HttpServletResponse.SC_NOT_FOUND);
			return;
		}
//		3. 모델 공유(setAttribute)
//		{"message" : "HELLO"}
		req.setAttribute("message", message);
//		4. 뷰 선택
		String viewName = null;
		int statusCode = HttpServletResponse.SC_OK;
		if (accept.contains("json")) {
			viewName = "/jsonView.do";
		} else if (accept.contains("xml")) {
			viewName = "/xmlView.do";
		} else if (accept.contains("plain")) {
			viewName = "/WEB-INF/views/04/plainView.jsp";
		} else {
			statusCode = HttpServletResponse.SC_NOT_ACCEPTABLE;
		}
		
		if (statusCode == HttpServletResponse.SC_OK) {
//		5. 뷰로 이동
			req.getRequestDispatcher(viewName).forward(req, resp);
		} else {
			resp.sendError(statusCode);
		}
	}
	
	private Object retrieveMessage(Locale clientLocale, String name) {
		String baseName = "kr.or.ddit.props.Message";
		ResourceBundle bundle = ResourceBundle.getBundle(baseName, clientLocale);
		System.out.println(bundle.toString());
		return bundle.getString(name);
	}
}
