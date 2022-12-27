package kr.or.ddit.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.member.service.MemberServiceImpl1;
import kr.or.ddit.vo.DataBasePropertyVO;
import kr.or.ddit.vo.MemberVO;

@WebServlet("/member/memberList.do1")
public class MemberListControllerServlet1 extends HttpServlet {
	MemberService memberService = new MemberServiceImpl1();
	
	/**
	 * 회원 전체 목록을 가져오는 Get방식의 메서드
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		1. 요청 분석 및 검증
//		그냥 요청이 뭘로 어떻게 들어왔는지 확인하고 내가 서비스할 조건에 맞지 않으면 에러 보내기
		String accept = req.getHeader("Accept");
//		if (accept.contains("xml")) {
//			resp.sendError(HttpServletResponse.SC_NOT_ACCEPTABLE);
//			return;
//		}
		
//		2. 모델 확보
//		service에서 회원 전체 목록을 반환해주는 메서드 호출
		List<MemberVO> memberList = memberService.retrieveMemberList();
		
//		3. 모델 공유
//		jsp로 보낼 모델을 요청에 담기
		req.setAttribute("memberList", memberList);
		
//		4. 뷰 선택
		String viewName = "/WEB-INF/views/member/memberList1.jsp";
		
//		5.
		if (viewName.startsWith("redirect:")) {
			viewName = viewName.substring("redirect:".length());
			resp.sendRedirect(req.getContextPath() + viewName); 
		} else {
			req.getRequestDispatcher(viewName).forward(req, resp);
		}
	}
}
