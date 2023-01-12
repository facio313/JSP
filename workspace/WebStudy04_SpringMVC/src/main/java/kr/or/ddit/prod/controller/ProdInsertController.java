package kr.or.ddit.prod.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import javax.servlet.ServletException;

import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.WebApplicationContext;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.prod.dao.OthersDAO;
import kr.or.ddit.prod.service.ProdService;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.vo.BuyerVO;
import kr.or.ddit.vo.ProdVO;

@Controller
@RequestMapping("/prod/prodInsert.do")
public class ProdInsertController {
	
	@Inject
	private ProdService service;
	
	@Inject
	private OthersDAO othersDAO;
	
	@ModelAttribute("lprodList")
	public List<Map<String, Object>> lprodList() {
		return othersDAO.selectLprodList();
	}
	@ModelAttribute("buyerList")
	public List<BuyerVO> buyerList() {
		return othersDAO.selectBuyerList(null);
	}
	
	@ModelAttribute("prod")
	public ProdVO prod() {
		return new ProdVO();
	}
	
	@GetMapping
//	public String process(@ModelAttribute("prod") ProdVO prod) {
	public String process() {
		return "prod/prodForm";
	}
	
	@PostMapping
	public String insertProcess(
		@Validated(InsertGroup.class) @ModelAttribute("prod") ProdVO prod // command object(클라이언트가 보내는 객체를 이 하나로 받기 때문에) // 위에서 만들어진 걸 재활용함
		, Errors errors
		, Model model
	) throws IOException, ServletException {
		
	    String viewName = null;
	      
	    if (!errors.hasErrors()) {
	       ServiceResult result = service.createProd(prod);
	       switch (result) {
	       case FAIL:
	    	   model.addAttribute("message", "서버에 문제 있음. 쫌따 다시 하셈.");
	    	   viewName = "prod/prodForm";
	    	   break;
	       default:
	    	   viewName = "redirect:/prod/" + prod.getProdId();
	    	   break;
	       }
	    }else {
	    	viewName = "prod/prodForm";
	    }
	    return viewName;
	}

}
