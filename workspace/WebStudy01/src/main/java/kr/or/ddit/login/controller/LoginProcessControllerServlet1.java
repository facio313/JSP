package kr.or.ddit.login.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *	1. 검증에 통과하지 못했을 경우, 다시 로그인 폼으로 이동함
 *	2. 인증에 통과하지 못했을 경우, 다시 로그인 폼으로 이동함
 *		- 비밀번호 오류 상태를 가정하고, 메시지 전달 -> alert 함수로 메시지 출력
 *		- 이전에 입력받은 아이디의 상태를 유지함 
 *	3. 인증 완료 시, 웰컴 페이지로 이동함
 */
@WebServlet("/login/loginProcess1.do")
public class LoginProcessControllerServlet1 extends HttpServlet {
	private boolean authenticate(String memId, String memPass) { // 인증 성공과 실패 여부를 여기서 판단할 것
		return memId.equals(memPass);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		1. 요청 분석
//		할 거 잇나?
		
//		2. 모델 확보
//		파라미터로 memId와 memPass를 받는다
//		이때, 둘 다 값이 null이나 ""이 아닌지 확인한다.
		String memId = req.getParameter("memId");
		String memPass = req.getParameter("memPass");
		
//		3. 모델 공유
//		인증 성공과 실패 여부를 판단한다.
//		authenicate로 boolean을 통해 뷰 선택까지 한다.
//		4. 뷰 선택
//		판단한 인증 여부를 통해 위 조건에 맞는 뷰를 선택한다.
		String viewName = "";
		if (memId == null || memId.equals("") && memPass == null || memPass.equals("")) {
			viewName = "/login/loginForm.jsp";
		} else if (!authenticate(memId, memPass)) {
			viewName = "/login/loginForm.jsp?memId=" + memId;
			req.setAttribute("no", "no");
			req.setAttribute("memId", memId);
		} else {
			viewName = "/WEB-INF/views/index.jsp";
		}
//		5. 이동
//		선택한 뷰로 이동한다.
		req.getRequestDispatcher(viewName).forward(req, resp);

		
	}
}
