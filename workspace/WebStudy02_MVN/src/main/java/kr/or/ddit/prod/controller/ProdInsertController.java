package kr.or.ddit.prod.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.mvc.view.AbstractController;

public class ProdInsertController implements AbstractController { // AbstractController 때문에 POJO가 되지 못함. 

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		return "prod/prodForm";
	}

}
