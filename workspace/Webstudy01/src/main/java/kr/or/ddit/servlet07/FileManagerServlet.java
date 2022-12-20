package kr.or.ddit.servlet07;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/browsing/fileManager")
public class FileManagerServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int sc = validate(req); // 200이라면 req 안에 modelMap이 포함되어 있음
		Map<String, Object> modelMap = (Map<String, Object>) req.getAttribute("modelMap"); // => VO의 역할
		if (sc == 200) {
			// 파일 복사하는 과정
			// 소스파일, 데스티네이션, 커맨드 다 있어야 함
			boolean result = fileManage(modelMap);
			
			req.setAttribute("result", result);
			String viewName = "/jsonView.do";
			req.getRequestDispatcher(viewName).forward(req, resp);
		} else {
			resp.sendError(sc);
		}
//		단 하나라도 비어있더라면(파라미터가 비어있을 수 있음)
//		상태코드 몇 번~~이 있을 거야
		
//		다 존재 시 소스파일의 실존 이름(이름이 안 맞을 수도 있음)
//		상태코드 몇 번~~~
		
//		원래 destImgs 폴더 안에 파일이 없다가
//		복사된 결과물 존재가 갱신이 되어야 함 -> jsp에서 갱신을 해줘야 함
	}
	
	private boolean fileManage(Map<String, Object> modelMap) throws IOException {
		File sourceFile = (File) modelMap.get("sourceFile");
		File destinationFolder = (File) modelMap.get("destinationFolder");
//		File destFile = new File(destinationFolder, sourceFile.getName());
		Path destFilePath = Paths.get(destinationFolder.getCanonicalPath(), sourceFile.getName());
		String command = (String) modelMap.get("command");
		System.out.println(command);
		
		if (command.equals("COPY")) {
			Files.copy(sourceFile.toPath(), destFilePath, StandardCopyOption.REPLACE_EXISTING);
		} else if (command.equals("MOVE")) {
			Files.move(sourceFile.toPath(), destFilePath, StandardCopyOption.REPLACE_EXISTING);
		}
		// 복사, 이동, 삭제
		
		return true;
	}

	private int validate(HttpServletRequest req) {
//		1. 요청 분석
//		총 3개의 파라미터
		String srcFile = req.getParameter("srcFile");
		String destFolder = req.getParameter("destFolder");
		String command = req.getParameter("command");
		
		Map<String, Object> modelMap = new HashMap<>(); // => VO의 역할
		req.setAttribute("modelMap", modelMap);
		// 위 파라미터 request가 사라지기 전까지는 map이 존재하게 됨
		
		int sc = 200;
		
		if (srcFile == null || srcFile.isEmpty() ||
			destFolder == null || destFolder.isEmpty() ||
			command == null || command.isEmpty()) {
			sc = 400;
		} else {
			ServletContext application = req.getServletContext(); // 싱글톤이기 때문에 미리 init에다 빼놔도 상관 없다
			String srcPath = application.getRealPath(srcFile);
			File sourceFile = new File(srcPath);
			if (!sourceFile.exists()) {
				sc = 404;
			} else if (sourceFile.isDirectory()) {
				sc = 400;
			} else {
				modelMap.put("sourceFile", sourceFile);
			}
			
			String destPath = application.getRealPath(destFolder);
			File destinationFolder = new File(destPath);
			if (!destinationFolder.exists()) {
				sc = 404;
			} else if (destinationFolder.isFile()) {
				sc = 400;
			} else {
				modelMap.put("destinationFolder", destinationFolder);
			}
			
			if (!"COPY".equals(command) && !"MOVE".equals(command)) {
				sc = 404;
			} else {
				modelMap.put("command", command);
			}
		}
		
		return sc;
	}
}
