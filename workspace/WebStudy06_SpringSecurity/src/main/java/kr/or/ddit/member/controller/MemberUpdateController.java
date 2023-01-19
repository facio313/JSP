package kr.or.ddit.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.MemberVO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("/member/memberUpdate.do")
public class MemberUpdateController {
	private final MemberService service;
	
	@GetMapping
	public String updateForm(
		@SessionAttribute("authMember") MemberVO authMember // 세션에서 찾는 것, 넘어오는 파라미터가 있더라도 저기 넣어주지 않음. 그러고 400에러
		, Model model
	) {
		
		MemberVO member = service.retrieveMember(authMember.getMemId());
		
		model.addAttribute("member", member);
		
		return "member/memberForm";
	}
	
	@PostMapping
	public String updateProcess(
		@Validated(UpdateGroup.class) @ModelAttribute("member") MemberVO member // 처음부터 만들어줌(비어있는 거에 넣어주고 req에 집어넣음) // 현재 공유되고 있는 속성 중 이 이름으로 돼있는 걸 가져오고, 없다면 새로 만들고 바인딩시켜줌
//		, Errors errors
		, BindingResult errors // Errors를 상속받는데, 의미가 명확해서 이걸 더 많이 씀 // 위치 중요 - 검증을 하고 검증 결과 데이터를 받아올 때는 검증 다음에 오는 것이 맞음. 그래야 한 쌍이 됨
		, Model model // HttpServletRequest를 이걸로 바꿈
		, HttpSession session // 세션에서 꺼낼 땐 필요 없는데 세션에 넣어야할 때는 필요함
	) throws ServletException, IOException {
		
		String viewName = null;
		
		if (!errors.hasErrors()) {
			ServiceResult result = service.modifyMember(member);
			switch (result) {
				case INVALIDPASSWORD:
					model.addAttribute("message", "비밀번호 오류");
					viewName = "member/memberForm";
					break;
				case FAIL:
					model.addAttribute("message", "서버 오류, 쫌따 다시.");
					viewName = "member/memberForm";
					break;
					
				default:
					MemberVO modifiedMember = service.retrieveMember(member.getMemId());
					session.setAttribute("authMember", modifiedMember);
					viewName = "redirect:/mypage.do";
					break;
			}
		}else {
			viewName = "member/memberForm";
		}
		
		return viewName;
	}
}
