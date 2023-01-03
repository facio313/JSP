package kr.or.ddit.prod.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.mvc.annotation.sterotype.Controller;
import kr.or.ddit.mvc.annotation.sterotype.RequestMapping;

@Controller
public class ProdInsertController { // AbstractController 때문에 POJO가 되지 못함. 

	@RequestMapping("/prod/prodInsert.do")
	public String process(HttpServletRequest req, HttpServletResponse resp) throws ServletException {

		return "prod/prodForm";
	}

}
