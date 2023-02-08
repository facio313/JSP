package kr.or.ddit.expert.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.expert.service.ExeventService;
import kr.or.ddit.expert.vo.ExeventVO;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.SearchVO;

@Controller
@RequestMapping("/expert/event")
public class ExpertEventController {
	
	@Inject
	private ExeventService service;
	
	@GetMapping
	public String expertEventList(
		@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage
		,@ModelAttribute("simpleCondition") SearchVO searchVO
		,Model model	
		) {
		PagingVO<ExeventVO> pagingVO = new PagingVO<ExeventVO>();
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleCondition(searchVO);
		service.retrieveExeventList(pagingVO);
		model.addAttribute("pagingVO", pagingVO);
		return "expert/expertEventList";
				
	}
	@GetMapping("/detail/{exeventId}")
	public String expertEventDetail(
		@PathVariable("exeventId") String exeventId
		,Model model
		) {
		ExeventVO exevent = service.retrieveExevent(exeventId);
		service.updateHits(exeventId);
		model.addAttribute("exevent", exevent);
		return "expert/expertEventDetail";
	}
	
	@GetMapping("/write")
	public String expertEventForm(
		@ModelAttribute("exevent") ExeventVO event
		) {
		return "expert/expertEventWrite";
	}
	@PostMapping("/write")
	public String expertEventWrite(
		@Validated(InsertGroup.class) @ModelAttribute("exevent") ExeventVO event
		, Errors errors
		, Model model
		) {
	      boolean valid = !errors.hasErrors();
	      String viewName = "";
	      if(valid) {
	         int result = service.createExevent(event);
	         if(result > 0) {
	            viewName = "redirect:/expert/event";
	         }
	         else {
	            model.addAttribute("message","서버 오류, 쫌다 다시");
	            viewName = "expert/write";
	         }
	      }
	      else {
	         viewName = "expert/write";
	      }
	      return viewName;
	}
	
	
}
