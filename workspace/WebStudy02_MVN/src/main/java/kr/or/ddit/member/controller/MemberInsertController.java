package kr.or.ddit.member.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.mvc.annotation.RequestMethod;
import kr.or.ddit.mvc.view.AbstractController;
import kr.or.ddit.vo.MemberVO;

/**
 * Backend controller(command handler) --> Plain Old Java Object(POJO)
 *
 */
public class MemberInsertController implements AbstractController{
	private MemberService service = new MemberServiceImpl();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String method = req.getMethod();
		RequestMethod requestMethod = RequestMethod.valueOf(method.toUpperCase()); // enum은 자기 자신의 name 값을 갖고 있다.
		String viewName = null;
		if (requestMethod == requestMethod.GET) { // 타입 안정성을 위해서 쓴다.
			viewName = memberForm(req, resp);
		} else if (requestMethod == RequestMethod.POST) {
			viewName = memberInsert(req, resp);
		} else {
			resp.sendError(405, method + "는 지원하지 않음.");
		}
		return viewName;
	}
	
	public String memberForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		return "member/memberForm";
	}
	
	public String memberInsert(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		MemberVO member = new MemberVO();
		req.setAttribute("member", member);
		
		Map<String, String[]> parameterMap = req.getParameterMap();

		try {
			BeanUtils.populate(member, parameterMap);
		} catch (IllegalAccessException | InvocationTargetException e) {
			throw new ServletException(e);
		}
		
		String viewName = null;
		
		ServiceResult result = service.createMember(member);
		
		switch (result) {
			case PKDUPLICATED:
				req.setAttribute("message", "아이디 중복");
				viewName = "/WEB-INF/views/member/memberForm.jsp";
				break;
			case FAIL:
				req.setAttribute("message", "서버에 문제 있음. 쫌따 다시 하셈.");
				viewName = "/WEB-INF/views/member/memberForm.jsp";
				break;
			default:
				viewName = "redirect:/"; // 가입에 끝나면 요청정보를 남겨둘 필요가 없음
				break;
		}
		
		return viewName;
	}
}
