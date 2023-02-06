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

import kr.or.ddit.resume.service.CareerService;
import kr.or.ddit.resume.vo.ActivityVO;
import kr.or.ddit.resume.vo.CareerVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/career")
public class CareerController {

	@Inject
	private CareerService service;
	
	@ModelAttribute("career")
	public CareerVO career() {
		return new CareerVO();
	}
	
	@GetMapping
	public String careerList() {
		return "resume/items/career";
	}
	
	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String listData(Model model) {
		String memId = "cks1111";
		List<CareerVO> careerList = service.retrieveCareerList(memId);
		model.addAttribute("careerList", careerList);
		return "jsonView";
	}
	
	@GetMapping("/{careerSn}")
	public String careerView(@PathVariable String careerSn, Model model) {
		CareerVO career = service.retrieveCareer(careerSn);
		model.addAttribute("career", career);
		log.info("career data : {}", career);
		return "resume/items/careerView";
	}
}
