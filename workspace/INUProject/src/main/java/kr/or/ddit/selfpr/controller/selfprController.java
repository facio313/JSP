package kr.or.ddit.selfpr.controller;

import java.awt.PageAttributes.MediaType;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.announcement.dao.AnnoSearchDAO;
import kr.or.ddit.selfpr.service.SelfprService;
import kr.or.ddit.selfpr.vo.SelfprVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.SearchVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @author 윤호연
 * @since 2023. 2. 4.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일               수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 2. 4.  윤호연                최초작성
 * 2023. 2.13.  윤호연	   1차수정
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */

@Slf4j
@RequiredArgsConstructor
@Controller
@RequestMapping("/selfpr")
public class selfprController {
	
	private final SelfprService service;
	private final AnnoSearchDAO annoSearchDAO;
	
	@GetMapping
	public String selfprMain() {
		return "selfpr/selfPrView";
	}
	
	@ResponseBody
	@GetMapping("list")
	public PagingVO selfprList(
		@RequestParam(value ="page", required=false, defaultValue="1") int currentPage
		, Model model
	) {
		PagingVO<SelfprVO> pagingVO = new PagingVO<>();
		pagingVO.setCurrentPage(currentPage);
		
		service.retrieveSelfprList(pagingVO);
		model.addAttribute("pagingVO", pagingVO);
		System.out.println(pagingVO);
		
		return pagingVO;
	}
	
	@PostMapping("search")
	public String selfprSearch(
		Model model
		, @RequestBody(required = false) List<Map<String, Object>> param
	) {
		List<Map<String, Object>> regionList = null;
		List<Map<String, Object>> industryList = null;
		
		for(Map<String, Object> list : param) {
			String type = (String)list.get("type");
			String code = (String)list.get("code");
			
			if(type.equals("region")) {
				regionList = annoSearchDAO.selectRegionList(code);
			}
			if(type.equals("industry")) {
				industryList = annoSearchDAO.selectIndustry(code);
			}
		}
		model.addAttribute("regionList", regionList);
		model.addAttribute("industryList", industryList);
		
		return "jsonView";
	}
	
	@GetMapping("Detail")
	public String selfprDetail(
		@RequestParam(value="who") int prNo
		, @ModelAttribute("simpleCondition") SearchVO searchVO
		, Model model
	) {
		PagingVO<SelfprVO> pagingVO = new PagingVO<>();
		pagingVO.setSimpleCondition(searchVO);
		
		SelfprVO selfpr = service.retrieveSelfpr(prNo);
		model.addAttribute("selfpr", selfpr);
		
		return "selfpr/selfPrDetail";
	}
	
	@GetMapping("/Insert")
	public String selfprForm() {
		return "selfpr/selfPrForm";
	}
	
	@GetMapping("/Interest")
	public String selfprInter() {
		return "selfpr/selfPrInter";
	}
	
	@GetMapping("/Today")
	public String selfprToday() {
		return "selfpr/selfPrToday";
	}
}
