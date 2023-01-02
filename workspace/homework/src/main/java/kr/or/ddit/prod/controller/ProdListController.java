package kr.or.ddit.prod.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.StringUtils;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.member.controller.MemberListController;
import kr.or.ddit.mvc.view.AbstractController;
import kr.or.ddit.mvc.view.InternalResourceViewResolver;
import kr.or.ddit.prod.dao.OthersDAO;
import kr.or.ddit.prod.dao.OthersDAOImpl;
import kr.or.ddit.prod.service.ProdService;
import kr.or.ddit.prod.service.ProdServiceImpl;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.MemoVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.ProdVO;
import kr.or.ddit.vo.SearchVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ProdListController implements AbstractController {
	private ProdService service = new ProdServiceImpl(); // 컨테이너를 통해 싱글톤 구현
	private OthersDAO othersDAO = new OthersDAOImpl();
	
	private void addAttribute(HttpServletRequest req) {
		req.setAttribute("lprodList", othersDAO.selectLprodList());
		req.setAttribute("buyerList", othersDAO.selectBuyerList(null));
	}
	
	private String listUI(HttpServletRequest req, HttpServletResponse resp) {
		addAttribute(req);
		return "prod/prodList";
	}
	
	private String listData(HttpServletRequest req, HttpServletResponse resp) throws ServletException {
		String pageParam = req.getParameter("page");
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
			
		int currentPage = 1;
		if (StringUtils.isNumeric(pageParam)) {
			currentPage = Integer.parseInt(pageParam);
		}
		
		PagingVO<ProdVO> pagingVO = new PagingVO<>(5, 2);
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setDetailCondition(detailCondition);
		
		service.retrieveProdList(pagingVO);
		
		req.setAttribute("pagingVO", pagingVO);
		log.info("paging data : {}", pagingVO);
		
		return "forward:/jsonView.do";
	}
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String accept = req.getHeader("Accept");
		String viewName = null;
		if (accept.contains("json")) {
			viewName = listData(req, resp);
		} else {
			viewName = listUI(req, resp);
		}
		
		return viewName;
	}
}
