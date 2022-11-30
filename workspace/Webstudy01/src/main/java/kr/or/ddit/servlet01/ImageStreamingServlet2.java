package kr.or.ddit.servlet01;

import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;

import java.util.Date;

public class ImageStreamingServlet2 extends HttpServlet{
	private String imageFolder;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		imageFolder = config.getInitParameter("imageFolder");
		System.out.printf("받은 파라미터 : %s\n", imageFolder);
	}
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		// 목록 보여주기
		StringBuffer content = new StringBuffer();
		
		File file = new File("D:/contents/images");
		File[] files = file.listFiles();

		content.append("<html>\n");
		content.append("<body>\n");
		content.append("<form action='ImageStreaming.do' method='post'>");
		for (File f : files) {
			if (f.isFile()) {
				content.append(String.format("<button type='submit' name='image' value='%s'>%s</button><br>",f.getName(), f.getName()));
			} else {
				content.append("파일이 없습니다.");
			}
		}
		content.append("</form>");
		content.append("</body>\n");
		content.append("</html>\n");
		
		PrintWriter out = resp.getWriter();
		out.println(content);
		out.close();

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 사진 보여주기	
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