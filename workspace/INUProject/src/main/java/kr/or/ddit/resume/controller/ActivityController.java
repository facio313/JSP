package kr.or.ddit.resume.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.resume.service.ActivityService;
import kr.or.ddit.resume.vo.ActivityVO;
import kr.or.ddit.vo.SeekerVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/activity")
public class ActivityController {

	@Inject
	private ActivityService service;
	
	@ModelAttribute("activity")
	public ActivityVO activity() {
		return new ActivityVO();
	}
	
	@GetMapping
	public String activityList() {
		return "resume/items/activity";
	}
	
	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String listData(Model model) {
		String memId = "cks1111";
		List<ActivityVO> activityList = service.retrieveActivityList(memId);
		model.addAttribute("activityList", activityList);
		return "jsonView";
	}
	
	@GetMapping("/{actSn}")
	public String activityView(@PathVariable String actSn, Model model) {
		ActivityVO activity = service.retrieveActivity(actSn);
		model.addAttribute("activity", activity);
		log.info("activity data : {}", activity);
		return "resume/items/activityView";
	}
	
	@GetMapping("/insertForm")
	public String activityForm() {
		return "resume/items/activityForm";
	}
	
	@PostMapping("/insert")
	public String activityInsert(@ModelAttribute("activity") ActivityVO activity, Model model) {
		service.createActivity(activity);
		return "redirect:" + activity.getActSn();
	}
	
	@GetMapping("/updateForm")
	public String activityUdateForm(@RequestParam("actSn") String actSn, Model model) {
		ActivityVO activity = service.retrieveActivity(actSn);
		model.addAttribute("activity", activity);
		return "resume/items/activityForm";
	}
	
	@PostMapping("/update")
	public String activityUpdate(@ModelAttribute("activity") ActivityVO activity, Model model) {
		service.modifyActivity(activity);
		return "redirect:" + activity.getActSn();
	}
}
