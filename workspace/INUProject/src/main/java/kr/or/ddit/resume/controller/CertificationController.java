package kr.or.ddit.resume.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.resume.service.CertificationService;
import kr.or.ddit.resume.vo.ActivityVO;
import kr.or.ddit.resume.vo.CertificationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/certification")
public class CertificationController {

	@Inject
	private CertificationService service;
	
	@ModelAttribute("certification")
	public CertificationVO certification() {
		return new CertificationVO();
	}
	
	@GetMapping
	public String certificationList() {
		return "resume/items/certification";
	}
	
	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String listData(Model model) {
		String memId = "cks1111";
		List<CertificationVO> certificationList = service.retrieveCertificationList(memId);
		model.addAttribute("certificationList", certificationList);
		return "jsonView";
	}
	
	@GetMapping("/{certificationSn}")
	public String certificationView(@PathVariable String certificationSn, Model model) {
		CertificationVO certification = service.retrieveCertification(certificationSn);
		model.addAttribute("certification", certification);
		log.info("certification data : {}", certification);
		return "resume/items/certificationView";
	}
}
