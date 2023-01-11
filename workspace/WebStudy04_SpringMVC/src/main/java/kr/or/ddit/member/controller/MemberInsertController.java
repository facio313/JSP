package kr.or.ddit.member.controller;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.vo.MemberVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/**
 * Backend controller(command handler) --> Plain Old Java Object(POJO)
 *
 */
@Slf4j
@RequiredArgsConstructor
@Controller
@RequestMapping("/member/memberInsert.do")
public class MemberInsertController {
	private final MemberService service;

	@ModelAttribute // 여기 붙으면 반환값으로 나온 객체를 requestScope에 넣어줘~~라는 것, HandlerMethod 호출 전에 얘가 먼저 만들어짐, -> 아무 메서드 호출해도 무조건 갖게 됨 // 모든 핸들러보다 먼저 생성됨
	public MemberVO member() { 
		log.info("@ModelAttribute 메서드 실행 -> member 속성 생성");
		return new MemberVO();
	}
	
	@GetMapping // 이렇게 하면 딱 get 메서드만 받는 것임
	public String memberForm(@ModelAttribute("member") MemberVO member) {
		return "member/memberForm";
	}
	
	@PostMapping
	public String memberInsert(
		HttpServletRequest req
		, @Validated(InsertGroup.class) @ModelAttribute("member") MemberVO member // member라고 명시적으로 쓰기 위해서!, 이미 member라는 이름으로 scope에 들어있음( 객체를 requestScope에 넣어줘)
		, Errors errors
	) throws ServletException, IOException {
		
	    boolean valid = !errors.hasErrors();
	    
	    String viewName = null;
	      
	    if(valid) {
	       ServiceResult result = service.createMember(member);
	       switch (result) {
	       case PKDUPLICATED:
	    	   req.setAttribute("message", "아이디 중복");
	    	   viewName = "member/memberForm";
	    	   break;
	       case FAIL: 
	    	   req.setAttribute("message", "서버에 문제 있음. 쫌따 다시 하셈.");
	    	   viewName = "member/memberForm";
	    	   break;
	       default:
	    	   viewName = "redirect:/";
	    	   break;
	       }
	    }else {
	    	viewName = "member/memberForm";
	    }
	    return viewName;
	}
}
