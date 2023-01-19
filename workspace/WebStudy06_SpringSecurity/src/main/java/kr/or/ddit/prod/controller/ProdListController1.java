package kr.or.ddit.prod.controller;

import java.lang.reflect.InvocationTargetException;

import javax.inject.Inject;
import javax.servlet.ServletException;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.prod.dao.OthersDAO;
import kr.or.ddit.prod.service.ProdService;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.ProdVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
//@Controller
public class ProdListController1 {
	@Inject
	private ProdService service;
	@Inject
	private OthersDAO othersDAO;
	//final 붙이고 requiredArgs어쩌고 써도 됨
	
	private void addAttribute(Model model) {
		model.addAttribute("lprodList", othersDAO.selectLprodList());
		model.addAttribute("buyerList", othersDAO.selectBuyerList(null));
	}
	
	private String listUI(Model model) {
		addAttribute(model);
		return "prod/prodList";
	}
	
	private String listData(
			int currentPage
			, ProdVO detailCondition
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
	
//	@RequestMapping("/prod/prodList.do")
	public String prodList(
		@RequestParam(value="page", required=false, defaultValue="1") int currentPage
		, @ModelAttribute("detailCondition") ProdVO detailCondition
		, Model model
		, @RequestHeader String accept // header는 대소문자를 식별하지 않음, 이름이 같으면 ("") 생략도 가능
	) throws ServletException {
		String viewName = null;
		
		if (accept.contains("json")) {
			viewName = listData(currentPage, detailCondition, model);
		} else {
			viewName = listUI(model);
		}
		
		return viewName;
	}
}
