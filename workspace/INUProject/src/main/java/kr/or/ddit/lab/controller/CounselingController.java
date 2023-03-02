package kr.or.ddit.lab.controller;

import javax.annotation.Resource;

import org.springframework.http.MediaType;
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

import kr.or.ddit.exception.NotExistBoardException;
import kr.or.ddit.lab.service.CounselingService;
import kr.or.ddit.lab.vo.CounselingVO;
import kr.or.ddit.security.AuthMember;
import kr.or.ddit.ui.PaginationRenderer;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.SearchVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @author 작성자명
 * @since 2023. 2. 1.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                 수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 2. 1.   양서연              최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */

@Controller
@RequestMapping("/lab/counseling")
@RequiredArgsConstructor
@Slf4j
public class CounselingController {

	private final CounselingService service;

	@Resource(name="bootstrapPaginationRender")
	private PaginationRenderer renderer;

	@ModelAttribute("coun")
	public CounselingVO counVO() {
		return new CounselingVO();
	}

	@GetMapping
	public String listUI() {
		return "lab/counList";
	}

	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String counList(
		Model model
		, @RequestParam(value="page",required=false, defaultValue="1") int currentPage
		, @ModelAttribute SearchVO searchVO
	) {
		PagingVO<CounselingVO> pagingVO = new PagingVO<>();
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleCondition(searchVO);
		
		log.info("왓나보기 ===> {}",pagingVO.getSimpleCondition());
		
		//type, word 꺼내서
		//type이 memId인 경우 => memId 조건 쿼리문으로 페이징
		
		//type이 isRefed인 경우 => refCoun이 없는 게시물들로 페이징
		//refCoun이 0이면서 본인을 refCoun으로 가진 게시물도 없는 게시물을 select
		
		
		service.retrieveCounList(pagingVO);
		model.addAttribute("pagingVO", pagingVO);
		
		if(!pagingVO.getDataList().isEmpty())
			model.addAttribute("pagingHTML", renderer.renderPagination(pagingVO));
		
		return "jsonView";
	}

	@GetMapping("view/{counNo}")
	public String counView(
		@PathVariable String counNo
		, Model model
	) {
		CounselingVO coun = service.retrieveCoun(counNo);
		if(!coun.getCounState().equals("B1")) {
			throw new NotExistBoardException(counNo);
		}
		model.addAttribute("coun",coun);
		return "lab/counView";
	}

	@GetMapping("insert")
	public String insertCoun(
		Model model
		, @RequestParam(required=false) String refCoun
	) {
		model.addAttribute("refCoun",refCoun);
		return "lab/counForm";
	}

	@PostMapping("insert")
	public String insertCounProcess(
		Model model
		, @Validated(InsertGroup.class) @ModelAttribute("coun") CounselingVO coun
		, Errors errors 
	) {
		log.info("들어간refCoun : {}",coun.getRefCoun());
		String viewName="";
		int cnt = service.createCoun(coun);
		if(!errors.hasErrors()) {
			if(cnt>0) {
				viewName = "redirect:/lab/counseling/view/"+coun.getCounNo();
			} else {
				viewName = "lab/counForm";
			}
		}
		return viewName;
	}

	@GetMapping("delete")
	public String deleteCounProcess(
		@RequestParam(required=false) String counNo
		, @AuthMember MemberVO authMember
	) {
		String result = "";
		CounselingVO coun = service.retrieveCoun(counNo);
		if(authMember.getMemId().equals(coun.getMemId())) {
			result = service.deleteCoun(counNo) > 0 ? "redirect:/lab/counseling" : "redirect:/lab/counseling/view/"+coun.getCounNo();
		} else {
			result = "redirect:/lab/counseling/view/"+coun.getCounNo();
		}
		return result;
	}
}
