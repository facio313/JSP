package kr.or.ddit.member.controller;

import javax.inject.Inject;
import javax.servlet.ServletException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.security.AuthMember;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.MemberVOWrapper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MypageController {
	
	@Inject
	private MemberService service;
	
	@RequestMapping("/mypage.do")
	public String mypage(
		Model model
		, @AuthMember MemberVO member
	) throws ServletException {
		log.info("auth member : {}", member);
		model.addAttribute("member", member); // request.response.session과 같은 저수준의 api는 spring에서 잘 사용하지 않는다(HandlerAdapter가 Model을 request에 다 알아서 담아줌) => 사용할 수 없어는 아님
		return "member/memberView";
	}
}
