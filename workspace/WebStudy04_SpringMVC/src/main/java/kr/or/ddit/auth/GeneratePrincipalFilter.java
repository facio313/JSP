package kr.or.ddit.auth;

import java.io.IOException;
import java.security.Principal;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.MemberVOWrapper;

public class GeneratePrincipalFilter implements Filter {

	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) // 요청은 변경될 수 없다. adapter를 통해 변경된 효과를 갖도록 하는 것일 뿐
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession(false);
		MemberVO authMember = null;
		if (session != null) {
			authMember = (MemberVO) session.getAttribute("authMember");
		}
		if (authMember != null) {
			HttpServletRequest modifiedReq = new HttpServletRequestWrapper(req) { // HSRW만 만들면 그냥 원본 요청이랑 차이가 없음. 익명객체로 만들어서 원하는 것만 하기
				@Override
				public Principal getUserPrincipal() {
					HttpServletRequest adaptee = (HttpServletRequest) getRequest();// 어댑터 안에서 어댑티를 꺼냄, 위 req와 같은 객체임
					HttpSession session = adaptee.getSession(false);
					if (session != null) {
						MemberVO realMember = (MemberVO) session.getAttribute("authMember");
						return new MemberVOWrapper(realMember);
					} else {
						return super.getUserPrincipal();
					}
				}
			};
			chain.doFilter(modifiedReq, response); // 체인의 request를 원본이 아닌 다른 걸로 바꿔치기 한다면
		} else {
			chain.doFilter(request, response); // 필터링이 전혀 안 됨
		}
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}

}
