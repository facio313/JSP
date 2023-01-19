package kr.or.ddit.prod.controller.advice;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import kr.or.ddit.prod.dao.OthersDAO;
import kr.or.ddit.vo.BuyerVO;

// 주 관심사에서 분리된 부가 관심사
@ControllerAdvice("kr.or.ddit.prod.controller") // 1)bean으로 등록 2)Target과 Weaving할 수 있는 advice // (pointcut) -> 그 안에 있는 것들에만 Weaving하겠다.
public class ProdControllerAdvice {
	
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
	
}
