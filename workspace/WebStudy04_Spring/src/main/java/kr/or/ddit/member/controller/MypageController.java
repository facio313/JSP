package kr.or.ddit.member.controller;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.mvc.annotation.sterotype.Controller;
import kr.or.ddit.mvc.annotation.sterotype.RequestMapping;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.MemberVOWrapper;

@Controller
public class MypageController {
	
	private MemberService service = new MemberServiceImpl();
	
	@RequestMapping("/mypage.do")
	public String mypage(
		HttpServletRequest req
		, MemberVOWrapper principal
	) throws ServletException {
//		HttpSession session = req.getSession();
//		MemberVO authMember = (MemberVO) session.getAttribute("authMember");
//		MemberVOWrapper principal = (MemberVOWrapper) req.getUserPrincipal();
		
		MemberVO authMember = principal.getRealMember(); // 필터 체인이 보장해줌
		
		MemberVO member = service.retrieveMember(authMember.getMemId());
		
		req.setAttribute("member", member);
		
		return "member/memberView";
	}
}
