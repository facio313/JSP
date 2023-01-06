package kr.or.ddit.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.mvc.annotation.resolvers.RequestParam;
import kr.or.ddit.mvc.annotation.sterotype.Controller;
import kr.or.ddit.mvc.annotation.sterotype.RequestMapping;
import kr.or.ddit.vo.MemberVO;

@Controller
public class MemberViewController {
	private MemberService service = new MemberServiceImpl();

	@RequestMapping("/member/memberView.do")
	public String memberView(
		@RequestParam(value="who", required=true) String memId
		, HttpServletRequest req
	) throws ServletException, IOException {
//		1.
//		String memId = req.getParameter("who");
//		if (StringUtils.isBlank(memId)) {
//			resp.sendError(HttpServletResponse.SC_BAD_REQUEST);
//			return null;
//		}
//		2.
		MemberVO member = service.retrieveMember(memId);
//		3.
		req.setAttribute("member", member);
//		4.
		String viewName = "member/memberView";
		
		return viewName;
	}
}
