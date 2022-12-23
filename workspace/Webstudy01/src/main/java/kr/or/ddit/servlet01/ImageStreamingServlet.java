package kr.or.ddit.servlet01;

import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;

import java.util.Date;

public class ImageStreamingServlet extends HttpServlet{
	private String imageFolder;
	private ServletContext application;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		application = getServletContext();
		imageFolder = application.getInitParameter("imageFolder");
		System.out.printf("받은 파라미터 : %s\n", imageFolder);
	}
	
	// req와 resp가 한 곳에서 일어난다 -> Model1 방식 - 단일책임원칙에서 벗어남
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		ServletContext application = getServletContext(); // 가장 먼저 생성되고, 가장 오래 살아남는! 거기다 범위가 가장 넓은 저장소
		
		String imageName = req.getParameter("image");
		if (imageName == null || imageName.isEmpty()) {
			resp.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return;
		}
		String mimeType = application.getMimeType(imageName);
		resp.setContentType(mimeType);
		
		File imageFile = new File(imageFolder, imageName);
		if(!imageFile.exists()) {
			resp.sendError(HttpServletResponse.SC_NOT_FOUND);
			return;
		}
		
		Cookie imageCookie = new Cookie("imageCookie", imageName);
		imageCookie.setPath(req.getContextPath());
		imageCookie.setMaxAge(60 * 60 * 24 * 3);
		resp.addCookie(imageCookie);
		
		// try catch가 없을 때, while문이 돌아가다 예외가 발생하면 close가 안 되고, 다른 사람이 자원을 쓸 수 없음
		FileInputStream fis = null;
		OutputStream os = null;
		try {
			fis = new FileInputStream(imageFile);
			os = resp.getOutputStream();
			int tmp = -1;
			while((tmp = fis.read()) != -1){
				os.write(tmp);
			}
		} finally {
			if (fis != null)
			fis.close();
			if (os != null)
			os.close();
		}
	}
}