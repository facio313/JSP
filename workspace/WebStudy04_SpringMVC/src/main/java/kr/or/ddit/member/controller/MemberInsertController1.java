package kr.or.ddit.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.member.service.MemberService;
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
@RequestMapping("/member/memberInsert.do1")
public class MemberInsertController1 {
	private final MemberService service;

	@ModelAttribute // 여기 붙으면 반환값으로 나온 객체를 requestScope에 넣어줘~~라는 것, HandlerMethod 호출 전에 얘가 먼저 만들어짐, -> 아무 메서드 호출해도 무조건 갖게 됨
	public MemberVO member() {
		log.info("@ModelAttribute 메서드 실행 -> member 속성 생성");
		return new MemberVO();
	}
	
//	@RequestMapping("/member/memberInsert.do") -> 얘는 모든 메서드를 받는데, 밑에 post 빼고 받는 거임
	@GetMapping // 이렇게 하면 딱 get 메서드만 받는 것임
	public String memberForm(@ModelAttribute("member") MemberVO member) {
		return "member/memberForm";
	}
	
//	@RequestMapping(value="/member/memberInsert.do", method=RequestMethod.POST)
	@PostMapping
	public String memberInsert(
		HttpServletRequest req
		// @Valid는 그룹인트?를 쓸 수 없음 -> 그래서 대신 Validated를 씀
//		, @Valid MemberVO member // HandlerAdapter는 자기가 갖고 있는 객체의 모든 주소들을 자신이 종료될 때 request에 넣어주기 때문에, 얘도 request에 있음(이때는 COC로 memberVO라는 이름 가짐)
		, @Validated(InsertGroup.class) @ModelAttribute("member") MemberVO member // member라고 명시적으로 쓰기 위해서!, 이미 member라는 이름으로 scope에 들어있음( 객체를 requestScope에 넣어줘)
		// 위에 @ModelAttribute를 붙여놓은 메서드에 반환된 MemberVO객체를 재활용함
		, Errors errors
//		, @RequestPart(value="memImage", required=false) MultipartFile memImage // 이미 MemberVO에 있음, 바이트 배열로도 바뀜
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
