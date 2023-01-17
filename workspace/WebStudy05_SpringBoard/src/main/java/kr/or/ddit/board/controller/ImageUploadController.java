package kr.or.ddit.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ImageUploadController {
	
	@Value("#{appInfo.imageFolder}")
	private File imageFolder;
	
	@Value("#{appInfo.imageFolder}")
	private String imageFolderURL;
	
	@PostConstruct
	public void init() throws IOException { // 싱글톤 구조니까 딱 한 번만 체킹하게 됨
		log.info("이미지 저장 경로 : {}", imageFolder.getCanonicalPath());
		if (!imageFolder.exists()) {
			imageFolder.mkdirs();
		}
	}
	
	@RequestMapping(value="/board/boardImage.do", produces=MediaType.APPLICATION_JSON_UTF8_VALUE) // 상품 목록 처리에서 데이터 비동기 시 사용했던 구조
	@ResponseBody // 반환 값을 그대로 ResponseBody로 만들어줌 => jsonView 역할
	public Map<String, Object> uploadImage(@RequestPart MultipartFile upload, HttpServletRequest req) throws IllegalStateException, IOException {
//		1. 업로드 : 2진 데이터 저장(url 만들어질 수 있는 형태 -> web resource)
		String saveName = UUID.randomUUID().toString();
		upload.transferTo(new File(imageFolder, saveName));
//		2. JSON 생성 (filename, uploaded, url)
		Map<String, Object> marshallingTarget = new HashMap<String, Object>();
		marshallingTarget.put("filename", upload.getOriginalFilename());
		marshallingTarget.put("uploaded", 1);
		String url = req.getContextPath() + imageFolderURL + "/" + saveName; // 클라이언트 사이드의 ck에디터에서 이미지 업로드를 하기 위해 컨텍스트패스가 필요함
		marshallingTarget.put("url", url);
		return marshallingTarget; // marshalling은 spring이 다 해줌
//		return "jsonView";
	}
}
