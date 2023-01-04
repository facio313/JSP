package kr.or.ddit.prod.controller;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.mvc.annotation.RequestMethod;
import kr.or.ddit.mvc.annotation.resolvers.ModelAttribute;
import kr.or.ddit.mvc.annotation.resolvers.RequestParam;
import kr.or.ddit.mvc.annotation.sterotype.Controller;
import kr.or.ddit.mvc.annotation.sterotype.RequestMapping;
import kr.or.ddit.prod.dao.OthersDAO;
import kr.or.ddit.prod.dao.OthersDAOImpl;
import kr.or.ddit.prod.service.ProdService;
import kr.or.ddit.prod.service.ProdServiceImpl;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.validate.ValidationUtils;
import kr.or.ddit.vo.ProdVO;

@Controller
public class ProdUpdateController {
	private ProdService service = new ProdServiceImpl();
	private OthersDAO othersDAO = new OthersDAOImpl();
	
	private void addAttribute(HttpServletRequest req) {
		req.setAttribute("lprodList", othersDAO.selectLprodList());
		req.setAttribute("buyerList", othersDAO.selectBuyerList(null));
	}
		
	@RequestMapping("/prod/prodUpdate.do")
	public String updateForm(
		@RequestParam(value="prodId", required=true) String prodId
		, HttpServletRequest req
	) {
		ProdVO prod = service.retrieveProd(prodId);
		req.setAttribute("prod", prod);
		addAttribute(req);

		return "prod/prodForm";
	}
	
	@RequestMapping(value="/prod/prodUpdate.do", method=RequestMethod.POST)
	public String updateProcess(@ModelAttribute("prod") ProdVO prod, HttpServletRequest req) {
		String viewName = null;
		
		Map<String, List<String>> errors = new LinkedHashMap<>();
		req.setAttribute("errors", errors);
		
		boolean valid = ValidationUtils.validate(prod, errors, UpdateGroup.class);
		
		if (valid) {
			ServiceResult result = service.modifyProd(prod);
			switch (result) {
				case FAIL:
					req.setAttribute("message", "서버 오류, 쫌따 다시.");
					viewName = "prod/prodForm";
					break;
					
				default:
					viewName = "redirect:/prod/prodView.do?what=" + prod.getProdId(); // 수정
					break;
			}
		}else {
			viewName = "prod/prodForm";
		}
		
		return viewName;
	}
}
