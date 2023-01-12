package kr.or.ddit.prod.controller;

import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletException;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.prod.dao.OthersDAO;
import kr.or.ddit.prod.service.ProdService;
import kr.or.ddit.vo.BuyerVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.ProdVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping(value="/prod")
@Controller
public class ProdListController {
	@Inject
	private ProdService service;
	@Inject
	private OthersDAO othersDAO;
	//final 붙이고 requiredArgs어쩌고 써도 됨
	
	@ModelAttribute("lprodList")
	public List<Map<String, Object>> lprodList() {
		return othersDAO.selectLprodList();
	}
	
	@ModelAttribute("buyerList")
	public List<BuyerVO> buyerList() {
		return othersDAO.selectBuyerList(null);
	}
	
	@GetMapping
	public String listUI() {
		return "prod/prodList";
	}
	
	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String listData(
			@RequestParam(value="page", required=false, defaultValue="1")int currentPage // 앞에 @RequestParam이 생략되어 있는데 기본값을 못 만들어서 없으면 에러가 뜸
			, @ModelAttribute("detailcondition") ProdVO detailCondition
			, Model model
	) throws ServletException {
		model.addAttribute("detailCondition", detailCondition);
		try {
			BeanUtils.populate(detailCondition, model.asMap());
		} catch (IllegalAccessException | InvocationTargetException e) {
			throw new ServletException(e);
		}
		
		PagingVO<ProdVO> pagingVO = new PagingVO<>(5, 2);
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setDetailCondition(detailCondition);
		
		service.retrieveProdList(pagingVO);
		
		model.addAttribute("pagingVO", pagingVO);
		log.info("paging data : {}", pagingVO);
		
		return "jsonView";
	}
}
