package kr.or.ddit.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.util.Collections;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.exc.StreamWriteException;
import com.fasterxml.jackson.databind.DatabindException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class CalculatorController {
	
	@RequestMapping(method=RequestMethod.GET, value="/calculate")
	public String calForm() {
		return "cal/form";
	}
	
//	@RequestMapping(method=RequestMethod.POST, value="/calculate")
//	public String calProcess(
	public void calProcessCase1( // 이미 밑에서 resp.getOutputStream()을 썼으면 응답이 나간 것. Logical View Name을 반환할 필요가 없음
		@RequestParam int left
		, @RequestParam int right
		, HttpSession session
		, HttpServletResponse resp
	) throws StreamWriteException, DatabindException, IOException { // controller에서 발생한 건 적극적으로 처리하지 않음
		
		int result = left + right;
		
		Map<String, Object> target = Collections.singletonMap("result", result);
		
//		1. marshalling
//		2. serialization
		ObjectMapper mapper = new ObjectMapper();
//		mapper.writer(); // marshalling
		mapper.writeValue(resp.getOutputStream(), target); // marshalling, serialization
//		mapper.read(); // unmarshalling
		
//		return "redirect:/calculate";
	}

//	@RequestMapping(method=RequestMethod.POST, value="/calculate")
	public void calProcessCase2( // 이미 밑에서 os를 썼으면 응답이 나간 것. Logical View Name을 반환할 필요가 없음
			@RequestParam int left
			, @RequestParam int right
			, OutputStream os
			) throws StreamWriteException, DatabindException, IOException { // controller에서 발생한 건 적극적으로 처리하지 않음
		
		int result = left + right;
		
		Map<String, Object> target = Collections.singletonMap("result", result);
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(os, target);
	}
	
//	@RequestMapping(method=RequestMethod.POST, value="/calculate")
//	@ResponseBody
	public Map<String, Object> calProcessCase3(
			@RequestParam int left
			, @RequestParam int right
			) { 
		
		int result = left + right;
		Map<String, Object> target = Collections.singletonMap("result", result);
		
		return target;
		// view에 대한 정보가 없음.. => 어노테이션으로~~
	}
	
	@RequestMapping(method=RequestMethod.POST, value="/calculate")
	public String calProcessCase4(
			@RequestParam int left
			, @RequestParam int right
			, Model model
			) { 
		
		int result = left + right;
		
		model.addAttribute("result", result); // req.setAttribute()와 같음
		
		return "jsonView";
	}
}
