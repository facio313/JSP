package kr.or.ddit.resume.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.resume.service.EducationService;
import kr.or.ddit.resume.vo.ActivityVO;
import kr.or.ddit.resume.vo.EducationVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.MemberVOWrapper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/education")
public class EducationController {

	@Inject
	private EducationService service;
	
	@ModelAttribute("education")
	public EducationVO education() {
		return new EducationVO();
	}
	
	@GetMapping
	public String educationList() {
		return "resume/items/education";
	}
	
	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String listData(Model model) {
		String memId = "cks1111";
		List<EducationVO> educationList = service.retrieveEducationList(memId);
		model.addAttribute("educationList", educationList);
		return "jsonView";
	}
	
	@GetMapping("/{educationSn}")
	public String educationView(@PathVariable String educationSn, Model model) {
		EducationVO education = service.retrieveEducation(educationSn);
		model.addAttribute("education", education);
		return "resume/items/educationView";
	}
	
	@GetMapping("/insert")
	public String educationForm() {
		return "resume/items/educationForm";
	}
	
	@PostMapping("/insert")
	public String educationInsert(
		@ModelAttribute("education") EducationVO education
		, Model model
		, @AuthenticationPrincipal MemberVOWrapper principal
	) {
		MemberVO authMember = principal.getRealMember();
		education.setMemId(authMember.getMemId());
		service.createEducation(education);
		return "redirect:" + education.getEduSn();
	}
	
	@GetMapping("/update")
	public String educationUdateForm(@RequestParam("eduSn") String eduSn, Model model) {
		EducationVO education = service.retrieveEducation(eduSn);
		model.addAttribute("education", education);
		return "resume/items/educationForm";
	}
	
	@PostMapping("/update")
	public String educationUpdate(@ModelAttribute("education") EducationVO education, Model model) {
		service.modifyEducation(education);
		return "redirect:" + education.getEduSn();
	}
	
	@PostMapping("/delete")
	public String educationDelete(@RequestParam("eduSn") String eduSn, Model model) {
		service.removeEducation(eduSn);
		return "redirect:/education";
	}	
}
