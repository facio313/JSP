package kr.or.ddit.member.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.security.AuthMember;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.SeekerVO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("/update")
public class MemberUpdateController{
	private final MemberService service;
	
	@Resource(name="authenticationManager")
	private AuthenticationManager authenticationManager;
	
	@GetMapping
	public String updateForm(
		@AuthenticationPrincipal(expression="realMember") MemberVO authMember
		, Model model
	) {
		
		MemberVO member = service.retrieveSeeker(authMember.getMemId());
		
		model.addAttribute("member", member);
		
		return "join/seekerUpdateForm";
		
	}
	
	
	@PostMapping
	public String updateProcess(
		@Validated(UpdateGroup.class) @ModelAttribute("member") SeekerVO member
		, @AuthenticationPrincipal(expression="realMember") MemberVO authMember
		, BindingResult errors
		, Model model
		, HttpSession session
	) throws IOException{
		String viewName = null;
		member.setMemPass(authMember.getMemPass());
		if(!errors.hasErrors()) {
			ServiceResult result = service.modifySeeker(member);
			switch (result) {
			case INVALIDPASSWORD:
				model.addAttribute("message", "비밀번호 오류");
				viewName = "join/seekerUpdateForm";
				break;
			case FAIL:
				model.addAttribute("message", "서버 오류, 쫌따 다시.");
				viewName = "join/seekerUpdateForm";
				break;
				
			default:
				
//				MemberVO modifiedMember = service.retrieveMember(member.getMemId());
//				session.setAttribute("authMember", modifiedMember);
				
//				Authentication inputData = new UsernamePasswordAuthenticationToken(member.getMemId(), member.getMemPass());
//				Authentication modifiedAuthentication = authenticationManager.authenticate(inputData);
//				SecurityContextHolder.getContext().setAuthentication(modifiedAuthentication);
				
				viewName = "redirect:/logout";
				break;
			}
		}else {
			viewName = "join/seekerUpdateForm";
		}
		
		return viewName;
	}
}























