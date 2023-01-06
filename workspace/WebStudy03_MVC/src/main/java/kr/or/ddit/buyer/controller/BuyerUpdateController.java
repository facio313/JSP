package kr.or.ddit.buyer.controller;

import kr.or.ddit.mvc.annotation.sterotype.Controller;
import kr.or.ddit.prod.dao.OthersDAO;
import kr.or.ddit.prod.dao.OthersDAOImpl;

@Controller
public class BuyerUpdateController {
	private OthersDAO othersDAO = new OthersDAOImpl(); // 분류만 가져오기

}
