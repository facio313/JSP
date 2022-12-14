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
import kr.or.ddit.vo.MemberVO;

@WebServlet("/member/memberInsert.do1")
public class MemberInsertControllerServlet1 extends HttpServlet{
	private MemberService service = new MemberServiceImpl();

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String viewName = "/WEB-INF/views/member/memberForm.jsp";
		if (viewName.startsWith("redirect:")) {
			viewName = viewName.substring("redirect:".length());
			resp.sendRedirect(req.getContextPath() + viewName);
		} else {
			req.getRequestDispatcher(viewName).forward(req, resp);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		MemberVO member = new MemberVO();
		req.setAttribute("member", member);
		
//		member.setMemId(req.getParameter("memId"));
//		member.setMemPass(req.getParameter("memPass"));
//		member.setMemName(req.getParameter("memName"));
//		member.setMemBir(req.getParameter("memBir"));
//		member.setMemZip(req.getParameter("memZip"));
//		member.setMemAdd1(req.getParameter("memAdd1"));
//		member.setMemAdd2(req.getParameter("memAdd2"));
		
		Map<String, String[]> parameterMap = req.getParameterMap();
//		parameterMap.entrySet().stream().forEach(entry->{
//			String paramName = entry.getKey();
////			MemberVO.class.getDeclaredField(paramName);
//			PropertyDescriptor pd = new PropertyDescriptor(paramName, MemberVO.class);
//			Method setter = pd.getWriteMethod();
//		});
		
//		BeanUtils.copyProperties(dest, orig);
//		BeanUtils.getArrayProperty(bean, name);
		try {
			BeanUtils.populate(member, parameterMap);
		} catch (IllegalAccessException | InvocationTargetException e) {
//			throw new RuntimeException(e);
			throw new ServletException(e);
		}
		
		String viewName = null;
		
		ServiceResult result = service.createMember(member);
		
		
//		if (result.equals(ServiceResult.OK)) {
//			session.setAttribute("authMember", member);
//			viewName = "redirect:/";
//		} else if (result.equals(ServiceResult.FAIL)) {
//			session.setAttribute("message", "??????????????? ?????????????????????.");
//			viewName = "redirect:/WEB-INF/views/member/memberForm.jsp";
//		} else if (result.equals(ServiceResult.PKDUPLICATED)) { //ajax??? ????????? ?????????
//			session.setAttribute("message", "???????????? ???????????????.");
//			viewName = "redirect/WEB-INF/views/member/memberForm.jsp";
//		}
		
		switch (result) {
			case PKDUPLICATED:
				req.setAttribute("message", "????????? ??????");
				viewName = "/WEB-INF/views/member/memberForm.jsp";
				break;
			case FAIL:
				req.setAttribute("message", "????????? ?????? ??????. ?????? ?????? ??????.");
				viewName = "/WEB-INF/views/member/memberForm.jsp";
				break;
			default:
				viewName = "redirect:/"; // ????????? ????????? ??????????????? ????????? ????????? ??????
				break;
		}
		
		if (viewName.startsWith("redirect:")) {
			viewName = viewName.substring("redirect:".length());
			resp.sendRedirect(req.getContextPath() + viewName);
		} else {
			req.getRequestDispatcher(viewName).forward(req, resp);
		}
	}
}
