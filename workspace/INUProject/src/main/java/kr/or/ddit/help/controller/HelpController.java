package kr.or.ddit.help.controller;


import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.help.service.HelpService;
import kr.or.ddit.help.vo.HelpVO;
import kr.or.ddit.ui.PaginationRenderer;
import kr.or.ddit.vo.PagingVO;

/**
 * 
 * @author 박형준
 * @since 2023. 2. 10.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                  수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 2. 10.   박형준              최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/help")
public class HelpController {
	@Resource(name="bootstrapPaginationRender")
	private PaginationRenderer renderer;
	
	@Inject
	private HelpService service;
	
	@ModelAttribute("help")
	public HelpVO help() {
		return new HelpVO();
	}
	
	@GetMapping
	public String main(Model model) {
		return "help/helpList";
	}
	
	//개별 리스트
	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String helpList(
		@RequestParam(value="page", required=false, defaultValue="1") int currentPage
		, @ModelAttribute("detailCondition") HelpVO detailCondition
		, Model model
	) {
		PagingVO<HelpVO> pagingVO = new PagingVO<>(10, 5); //페이징 
		pagingVO.setCurrentPage(currentPage);	//
		pagingVO.setDetailCondition(detailCondition); //상세검색
		
		service.retrieveHelpList(pagingVO); //전체 목록
		model.addAttribute("pagingVO", pagingVO);
		if(!pagingVO.getDataList().isEmpty())	//데이터가 있으면
			model.addAttribute("pagingHTML", renderer.renderPagination(pagingVO));
		
		return "jsonView";
	}
	
}














