package kr.or.ddit.member.controller;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.vo.MemberVO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class MemberDeleteController {
	@Inject
	private MemberService service;
	
	@RequestMapping(value="/member/memberDelete.do", method=RequestMethod.POST)
	public String memberDelete(
		@RequestParam(value="memPass", required=true) String memPass // required 생략해도 됨
		, @SessionAttribute(value="authMember", required=true) MemberVO authMember
		, HttpSession session // 세션에서 꺼내기만 할 거면 없어도 된다. 그런데 넣거나 뭔가 작업하려면 필요하다. 여기선 session.invalidate();
		, RedirectAttributes redirectAttributes
	) throws ServletException {
//		이미 어댑터가 다 검증하고 보여주는 거라 밑에꺼 다 필요 없음, 잘못되면 들어오지도 못하고 400에러
		String memId = authMember.getMemId();
		
		MemberVO inputData = new MemberVO();
		inputData.setMemId(memId);
		inputData.setMemPass(memPass);
		
		String viewName = null;
		
		// 검즈잉 끝난 상태로 들어오기 때무넹 검증을 할 필요가 없음
		
		ServiceResult result = service.removeMember(inputData);
		switch (result) {
			case INVALIDPASSWORD:
//				session.setAttribute("message", "비번 오류");
				redirectAttributes.addFlashAttribute("message", "비번 오류");
				viewName = "redirect:/mypage.do";
				break;
			case FAIL:
//				session.setAttribute("message", "서버 오류");
				redirectAttributes.addFlashAttribute("message", "서버 오류");
				viewName = "redirect:/mypage.do";
				break;
			default:
				session.invalidate();
				viewName = "redirect:/";
				break;
		}

		return viewName;
	}
}

































