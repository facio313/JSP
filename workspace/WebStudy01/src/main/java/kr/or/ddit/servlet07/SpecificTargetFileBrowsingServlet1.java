package kr.or.ddit.servlet07;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/browsing/getFileList1")
public class SpecificTargetFileBrowsingServlet1 extends HttpServlet{
	private ServletContext application;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		application = config.getServletContext();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		1. 요청 분석 
		String accept = req.getHeader("Accept");
		if (accept.contains("xml")) {
			resp.sendError(HttpServletResponse.SC_NOT_ACCEPTABLE);
			return;
		}
//		필수 파라미터 target parameter
		String target = req.getParameter("target");
		String dest = req.getParameter("dest");
		
//		2. 요청 검증
//		누락 시 존재 여부 검증 필요
//		상태코드
		if (target == null || dest == null) {
			resp.sendError(HttpServletResponse.SC_NOT_FOUND);
		}
		
//		3. 특정폴더 리스트 받아오기 ImageStreamingServlet에 있음
//		mime도 가져와야 함
		String path = req.getRealPath(target);
		File file = new File(path);
		File[] files = file.listFiles();
		
		Map<String, String> map = new HashMap();
		for (File f : files) {
			map.put(f.getName(), Files.probeContentType(Paths.get(f.getAbsolutePath())));
		}
		
		String path2 = req.getRealPath(dest);
		File file2 = new File(path2);
		File[] files2 = file2.listFiles();
		
		Map<String, String> map2 = new HashMap();
		for (File df : files2) {
			map2.put(df.getName(), Files.probeContentType(Paths.get(df.getAbsolutePath())));
		}
		
		req.setAttribute("files", map);
		req.setAttribute("destFiles", map2);
		
//		4. viewName = jsonView.do
		String viewName = "/jsonView.do";
		
//		5. 이동
		req.getRequestDispatcher(viewName).forward(req, resp);
		
	}
}
