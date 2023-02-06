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

import kr.or.ddit.resume.service.FacilityService;
import kr.or.ddit.resume.vo.ActivityVO;
import kr.or.ddit.resume.vo.FacilityVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/facility")
public class FacilityController {

	@Inject
	private FacilityService service;
	
	@ModelAttribute("facility")
	public FacilityVO facility() {
		return new FacilityVO();
	}
	
	@GetMapping
	public String facilityList() {
		return "resume/items/facility";
	}
	
	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String listData(Model model) {
		String memId = "cks1111";
		List<FacilityVO> facilityList = service.retrieveFacilityList(memId);
		model.addAttribute("facilityList", facilityList);
		return "jsonView";
	}
	
	@GetMapping("/{facilitySn}")
	public String facilityView(@PathVariable String facilitySn, Model model) {
		FacilityVO facility = service.retrieveFacility(facilitySn);
		model.addAttribute("facility", facility);
		log.info("facility data : {}", facility);
		return "resume/items/facilityView";
	}
}
