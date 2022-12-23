package kr.or.ddit.servlet03;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

/**
 * 현재 컨트롤러가 받아야 하는 요청의 종류
 * 1. UI 제공 요청
 * 2. 데이터 제공 요청
 * 
 *
 */
@WebServlet("/03/imageForm3.do")
public class ImageStreamingFormServlet031 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String imageFolder = getServletContext().getInitParameter("imageFolder");
		
		File folder = new File(imageFolder);
		File[] imageFiles = folder.listFiles((dir, name)->{ // 람다를 못 쓰면 익명 객체로 구현해도 됨
			String mime = getServletContext().getMimeType(name);
			return mime != null && mime.startsWith("image/");
		});
		
		String image = req.getParameter("image");
		
		String accept = req.getHeader("Accept");
		if (accept.contains("json")) {
			// gson 사용해야 하는 상황
			// 2. 데이터 제공 요청
			// Marshalling
			String json = marshalling(imageFiles);
			resp.setContentType("application/json");
			try(
				PrintWriter out = resp.getWriter();
			){
				out.print(json);
			}
		} else {
			// html 보내면 되는 상황
			// 1. UI 제공 요청
			String viewName = "/WEB-INF/views/02/imageForm_ajax.jsp";
			req.getRequestDispatcher(viewName).forward(req, resp);
		}
	}

	private String marshalling(File[] imageFiles) {
		StringBuffer json = new StringBuffer();
		json.append("[");
		String ptrn = "\"%s\":\"%s\"";
		for (File tmp : imageFiles) {
			String name = tmp.getName();
			String mime = getServletContext().getMimeType(name);
			json.append("{");
			json.append(String.format(ptrn, "name", name));
			json.append(",");
			json.append(String.format(ptrn, "mime", mime));
			json.append("}");
			json.append(",");
		}
		json.append("]");
		int lastIndex = json.lastIndexOf(",");
		if (lastIndex != -1) {
			json.deleteCharAt(lastIndex);
		}
		return json.toString();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String image = req.getParameter("image");
		
		Cookie pic = new Cookie("pic", image);
		pic.setDomain("localhost");
		pic.setPath("req.getContextPath()");
		int maxAge = 0;
		// 쿠키에 사진을 저장하는데 그 쿠키가 있으면 그려져 있고 아니면 안 그려져 있고
		if (StringUtils.isNotBlank(image)) {
			maxAge = 60 * 60 * 24 * 3;
		}
		pic.setMaxAge(maxAge);
		resp.addCookie(pic);
		
		String viewName = ":redirect:/ImageStreaming.do";
		
		if (viewName.startsWith("redirect:")) {
			viewName = viewName.substring("redirect:".length());
			resp.sendRedirect(req.getContextPath() + viewName); 
		} else {
			req.getRequestDispatcher(viewName).forward(req, resp);
		}

	}
}
