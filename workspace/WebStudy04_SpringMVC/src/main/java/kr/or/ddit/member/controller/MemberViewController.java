package kr.or.ddit.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.vo.MemberVO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class MemberViewController {
	private final MemberService service;

//	void 리턴 타입으로 LVN이 생략된 경우,
//	HandlerAdapter는 RequestToViewNameTranslator를 이용해 view를 검색함
	
	@RequestMapping("/member/memberView.do")
	public void memberView( // HandlerAdapter는 LVN값이 반환되지 않으면 강제로 찾아냄 -> 위에 어노테이션에서 짤라서 찾아냄
		@RequestParam(value="who", required=true) String memId
		, Model model
	) throws ServletException, IOException {
		
		MemberVO member = service.retrieveMember(memId);
		
		model.addAttribute("member", member);
	}
}
