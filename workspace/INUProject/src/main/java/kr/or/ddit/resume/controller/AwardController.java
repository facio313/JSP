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

import kr.or.ddit.resume.service.AwardService;
import kr.or.ddit.resume.vo.ActivityVO;
import kr.or.ddit.resume.vo.AwardVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/award")
public class AwardController {

	@Inject
	private AwardService service;
	
	@ModelAttribute("award")
	public AwardVO award() {
		return new AwardVO();
	}
	
	@GetMapping
	public String awardList() {
		return "resume/items/award";
	}
	
	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String listData(Model model) {
		String memId = "cks1111";
		List<AwardVO> awardList = service.retrieveAwardList(memId);
		model.addAttribute("awardList", awardList);
		return "jsonView";
	}
	
	@GetMapping("/{awardSn}")
	public String awardView(@PathVariable String awardSn, Model model) {
		AwardVO award = service.retrieveAward(awardSn);
		model.addAttribute("award", award);
		log.info("award data : {}", award);
		return "resume/items/awardView";
	}
}
