package kr.or.ddit.login.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.exception.UserNotFoundException;
import kr.or.ddit.login.service.AuthenticateService;
import kr.or.ddit.login.service.AuthenticateServiceImpl;
import kr.or.ddit.mvc.annotation.RequestMethod;
import kr.or.ddit.mvc.annotation.sterotype.Controller;
import kr.or.ddit.mvc.annotation.sterotype.RequestMapping;
import kr.or.ddit.vo.MemberVO;

/**
 * 1. 검증에 통과하지 못했을 경우, 다시 로그인 폼으로 이동함 2. 인증에 통과하지 못했을 경우, 다시 로그인 폼으로 이동함 - 비밀번호
 * 오류 상태를 가정하고, 메시지 전달 -> alert 함수로 메시지 출력 - 이전에 입력받은 아이디의 상태를 유지함 3. 인증 완료 시,
 * 웰컴 페이지로 이동함
 */
@Controller
public class LoginProcessController {
	private AuthenticateService service = new AuthenticateServiceImpl();

	@RequestMapping(value="/login/loginProcess.do", method=RequestMethod.POST)
	public String login(HttpSession session, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		1. 요청 분석(검증도 포함)
		if (session.isNew()) {
			resp.sendError(400, "로그인 폼이 없는데 어떻게 로그인을 하지???");
			return null;
		}

		String memId = req.getParameter("memId");
		String memPass = req.getParameter("memPass");
		String saveId = req.getParameter("saveId"); // 있거나 없거나

		MemberVO member = new MemberVO();
		member.setMemId(memId);
		member.setMemPass(memPass);

		boolean valid = validate(member);
		String viewName = null;

		if (valid) {
			try {
				ServiceResult result = service.authenticate(member);
				// 2.
				if (ServiceResult.OK.equals(result)) { // 검증 성공, 인증 성공
					Cookie saveIdCookie = new Cookie("saveId", member.getMemId());
					// ex www[blog].naver.com
					saveIdCookie.setDomain("localhost");
					saveIdCookie.setPath("req.getContextPath()");
					int maxAge = 0;
					if (StringUtils.isNotBlank(saveId)) {
						maxAge = 60 * 60 * 24 * 5;
					}
					saveIdCookie.setMaxAge(maxAge);
					resp.addCookie(saveIdCookie);

					session.setAttribute("authMember", member);
					viewName = "redirect:/";
				} else { // 검증 성공, 인증 실패
					session.setAttribute("validId", memId);
					session.setAttribute("message", "비밀번호 오류");
					viewName = "redirect:/login/loginForm";
				}
			} catch (UserNotFoundException e) {
				session.setAttribute("message", "존재하지 않는 회원입니다.");
				viewName = "redirect:/login/loginForm";
			}
		} else { // 검증 실패
			session.setAttribute("message", "아이디나 비밀번호 누락");
			viewName = "redirect:/login/loginForm";
		}
		
		return viewName;
	}

	private boolean validate(MemberVO member) {
		boolean valid = true;

		if (StringUtils.isBlank(member.getMemId())) {
			valid = false;
		}
		if (StringUtils.isBlank(member.getMemPass())) {
			valid = false;
		}

		return valid;
	}
}
