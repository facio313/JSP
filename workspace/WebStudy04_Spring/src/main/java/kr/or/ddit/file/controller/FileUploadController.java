package kr.or.ddit.file.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

@Slf4j
// @MultipartConfig는 서블릿에만 사용 가능하다. 그렇기 때문에 여기 말고 DispatcherServlet에 설정해야 하는데 그걸 web.xml에다 하면 된다.
@Controller
public class FileUploadController {
	@RequestMapping(value="/file/upload.do", method=RequestMethod.POST)
//	@PostMappiong("/file/upload.do")
	public String upload(HttpServletRequest req, HttpSession session) throws IOException, ServletException { // 5개의 파트를 가지고 있는 Body의 Request
		String textPart = req.getParameter("textPart");
		String numPart = req.getParameter("numPart");
		String datePart = req.getParameter("datePart");
		log.info("textPart : {}", textPart);
		log.info("numPart : {}", numPart);
		log.info("datePart : {}", datePart);
		session.setAttribute("textPart", textPart);
		session.setAttribute("numPart", numPart);
		session.setAttribute("datePart", datePart);
		
		// 일반 파트와 파일 파트를 구분시키는 기준이 필요함
		String saveFolderURL = "/resources/prodImages";
		// 물리 주소를 확인하려면 ServletContext가 필요함
		ServletContext application = req.getServletContext(); // 어플리케이션 기본 객체가 반화노딤
		String saveFolderPath = application.getRealPath(saveFolderURL);
		File saveFolder = new File(saveFolderPath);
		if (!saveFolder.exists()) {
			saveFolder.mkdirs(); // s를 사용해야 계층구조까지 쭉 만들어줌
		}
		
//		req.getPart(name); // 파라미터 이름 하나
		List<String> metadata = req.getParts().stream() // 전부다 가져오기, Colection이기 때문에 stream 사용 가능
						.filter((p) -> p.getContentType() != null && p.getContentType().startsWith("image/")) // getContentType이 null이라면 일반 파트
						.map((p) -> { // map을 사용하면 안의 것을 다른 타입으로 바꿀 수 ㅣㅇㅆ음
							String originalFilename = p.getSubmittedFileName();
							String saveFilename = UUID.randomUUID().toString();
							File saveFile = new File(saveFolder, saveFilename);
							try {
								p.write(saveFile.getCanonicalPath()); // saveFile은 문자열이 아니니 CanonicalPath
								String saveFileURL = saveFolderURL + "/" + saveFilename;
								return saveFileURL; // url로 바꿔서 내보내기(바로 사용하기 쉽도록)
							} catch (IOException e) {
								throw new RuntimeException(e);
							}
						}).collect(Collectors.toList());
		
		session.setAttribute("fileMetadata", metadata);
		
		return "redirect:/fileupload/uploadForm.jsp";
	}
}
