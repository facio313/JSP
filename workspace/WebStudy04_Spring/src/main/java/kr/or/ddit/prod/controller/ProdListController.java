package kr.or.ddit.prod.controller;

import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.StringUtils;

import kr.or.ddit.mvc.annotation.resolvers.RequestParam;
import kr.or.ddit.mvc.annotation.sterotype.Controller;
import kr.or.ddit.mvc.annotation.sterotype.RequestMapping;
import kr.or.ddit.prod.dao.OthersDAO;
import kr.or.ddit.prod.dao.OthersDAOImpl;
import kr.or.ddit.prod.service.ProdService;
import kr.or.ddit.prod.service.ProdServiceImpl;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.ProdVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ProdListController {
	private ProdService service = new ProdServiceImpl(); // 컨테이너를 통해 싱글톤 구현
	private OthersDAO othersDAO = new OthersDAOImpl();
	
	private void addAttribute(HttpServletRequest req) {
		req.setAttribute("lprodList", othersDAO.selectLprodList());
		req.setAttribute("buyerList", othersDAO.selectBuyerList(null));
	}
	
	private String listUI(HttpServletRequest req) {
		addAttribute(req);
		return "prod/prodList";
	}
	
	private String listData(
			int currentPage
			, HttpServletRequest req
	) throws ServletException {
//		String pageParam = req.getParameter("page");
		ProdVO detailCondition = new ProdVO();
		req.setAttribute("detailCondition", detailCondition);
//		detailCondition.setProdLgu(req.getParameter("prodLgu"));
//		detailCondition.setProdBuyer(req.getParameter("prodBuyer"));
//		detailCondition.setProdName(req.getParameter("prodName"));
		try {
			BeanUtils.populate(detailCondition, req.getParameterMap()); // 어차피 ProdVO에서 놀 거니까 이렇게 받으면 훨씬 편함
		} catch (IllegalAccessException | InvocationTargetException e) {
			throw new ServletException(e);
		}
			
//		int currentPage = 1;
//		if (StringUtils.isNumeric(pageParam)) {
//			currentPage = Integer.parseInt(pageParam);
//		}
		
		PagingVO<ProdVO> pagingVO = new PagingVO<>(5, 2);
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setDetailCondition(detailCondition);
		
		service.retrieveProdList(pagingVO);
		
		req.setAttribute("pagingVO", pagingVO);
		log.info("paging data : {}", pagingVO);
		
		return "forward:/jsonView.do";
	}
	
	@RequestMapping("/prod/prodList.do")
	public String prodList(@RequestParam(value="page", required=false, defaultValue="1") int currentPage, HttpServletRequest req) throws ServletException { // 상위가 없어져서 예외에 대한 제약이 좀 사라짐
		String accept = req.getHeader("Accept");
		String viewName = null;
		if (accept.contains("json")) {
			viewName = listData(currentPage, req);
		} else {
			viewName = listUI(req);
		}
		
		return viewName;
	}
}
