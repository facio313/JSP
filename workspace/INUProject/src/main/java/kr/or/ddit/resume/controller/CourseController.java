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

import kr.or.ddit.resume.service.CourseService;
import kr.or.ddit.resume.vo.ActivityVO;
import kr.or.ddit.resume.vo.CourseVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/course")
public class CourseController {

	@Inject
	private CourseService service;
	
	@ModelAttribute("course")
	public CourseVO course() {
		return new CourseVO();
	}
	
	@GetMapping
	public String courseList() {
		return "resume/items/course";
	}
	
	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String listData(Model model) {
		String memId = "cks1111";
		List<CourseVO> courseList = service.retrieveCourseList(memId);
		model.addAttribute("courseList", courseList);
		return "jsonView";
	}
	
	@GetMapping("/{courseSn}")
	public String courseView(@PathVariable String courseSn, Model model) {
		CourseVO course = service.retrieveCourse(courseSn);
		model.addAttribute("course", course);
		log.info("course data : {}", course);
		return "resume/items/courseView";
	}
}
