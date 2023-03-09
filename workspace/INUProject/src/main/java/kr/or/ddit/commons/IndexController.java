package kr.or.ddit.commons;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.vo.SeekerVO;

@Controller
public class IndexController{
	
	@Inject
	private MemberService memService;
	
	@RequestMapping("/index.do")
	public String index(Model model, Authentication auth) {
		try {
			String memId = auth.getName();
			SeekerVO seeker = memService.retrieveSeeker(memId);
			model.addAttribute("seeker", seeker);
		} catch (NullPointerException e) {
			return "index";
		}
		
		return "index";
	}
}
