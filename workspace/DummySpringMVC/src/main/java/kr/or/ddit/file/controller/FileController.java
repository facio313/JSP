package kr.or.ddit.file.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.stream.Collectors;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.context.ApplicationContext;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.vo.FileTestVO;

@Controller
@RequestMapping("/fileUpload")
public class FileController {
	@Inject
//	private ApplicationContext context;
	private WebApplicationContext context;
	private Resource saveFolderRes;
	private File saveFolder;
	
	@PostConstruct
	public void init() throws IOException { // 모든 주입이 끝난 후 어쩌고?
		saveFolderRes = context.getResource("classpath:kr/or/ddit/file");
		saveFolder = saveFolderRes.getFile();
	}
	
	@GetMapping // @RequestMapping(method = RequestMethod.GET)
	public String fileForm() {
		return "file/uploadForm";
	}
	
//	@PostMapping
	public String fileProcessCase1(
		@RequestParam String textParam
		, @RequestParam String dateParam
		, @RequestPart MultipartFile file1
		, @RequestPart MultipartFile[] file2
//		, HttpSession session
		, RedirectAttributes redirectAttributes
	) throws IllegalStateException, IOException {
		
		Map<String, Object> result = new LinkedHashMap<>();
		result.put("textParam", textParam);
		result.put("dateParam", dateParam);
		
		if (!file1.isEmpty()) {
			File dest = new File(saveFolder, UUID.randomUUID().toString());
			file1.transferTo(dest);
			result.put("file1", Collections.singletonMap("savename", dest.getName()));
		}
		
		result.put("file2", Arrays.stream(file2).filter((f)->!f.isEmpty())
							.map((f)->{
								try {
									File dest = new File(saveFolder, UUID.randomUUID().toString());
									f.transferTo(dest);
									return Collections.singletonMap("savename", dest.getName());
								} catch (IllegalStateException | IOException e) {
									throw new RuntimeException(e);
								}
							}).collect(Collectors.toList())
				);
		
//		session.setAttribute("result", result);
		redirectAttributes.addFlashAttribute("result", result); // 꺼내는 순간 삭제함
		
		return "redirect:/fileUpload";
	}
	
	@PostMapping
	public String fileProcessCase2(
		@ModelAttribute("fileVO") FileTestVO commandObject
		, RedirectAttributes redirectAttributes
	) throws IllegalStateException, IOException { // 파트데이터도 들어있고 메타데이터도 들어있음
		
		commandObject.file1SaveTo(saveFolder);
		commandObject.file2SaveTo(saveFolder);
		
		redirectAttributes.addFlashAttribute("result", commandObject);
		
		return "redirect:/fileUpload";
	}
}
