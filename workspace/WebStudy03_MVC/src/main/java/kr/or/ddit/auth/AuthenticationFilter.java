package kr.or.ddit.auth;

import java.io.IOException;
import java.io.InputStream;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Properties;
import java.util.stream.Collectors;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.mvc.view.DispatcherServlet;
import lombok.extern.slf4j.Slf4j;

/**
 * 보호자원에 대한 요청인 경우, 신원 확인(session authMember 속성)을 한 사용자인지 판단 보호자원인지 / 신원 확인을 했는지
 * 인증 시스템에서는 무조건 redirect를 쓴다. 우리의 사용자는 아직 role이 없어서 신원확인하면서 쓸 필요 없다.
 */
@Slf4j
public class AuthenticationFilter implements Filter {

	private Map<String, String[]> securedResources;
	public static final String SECUREDNAME = "securedResources";

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// properties파일에서 얻은 ROLE을 String[]에다가 넣는다.
		securedResources = new LinkedHashMap<>();
		filterConfig.getServletContext().setAttribute(SECUREDNAME, securedResources);
		String filePath = filterConfig.getInitParameter("filePath");
		try(
			InputStream is = this.getClass().getResourceAsStream(filePath);
		){
			Properties props = new Properties();
			props.load(is);
			props.keySet().stream()
							.map(Object::toString) // 엘리먼트 하나 하나에 대해 타입 변환할 때
//							.collect(Collectors.toList())
							.forEach(key -> { // 이때 key의 타입은 문자열이 됨
								String value = props.getProperty(key);
								securedResources.put(key, value.split(","));
								log.info("보호 자원 [{} : {}]", key, securedResources.get(key));
							});
		} catch (IOException e) {
			throw new ServletException(e); // wrapper
		}
//		프로퍼티스파일에서 role을 얻어와서 securedResources에다 넣는다.
//		securedResources = new LinkedHashMap<>();
//		Properties properties = new Properties();
//		InputStream is = DispatcherServlet.class.getResourceAsStream(filePath);
//		try {
//			properties.load(is);
//		} catch (IOException e) {
//			throw new RuntimeException(e);
//		}
//		for (Object key : properties.keySet()) {
//			if ()
//			System.out.println(properties.getProperty((String)key).split(", ")[0]);
//			System.out.println(properties.getProperty((String)key).split(", ")[1]);
//			securedResources.put((String) key, properties.getProperty((String)key).split(", "));
//		}
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
//		사용자가 로그인에 성공해서 session에 authMember 속성이 있다면 통과한다.
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		String uri = req.getServletPath();
		
		boolean pass = true;
		
		if (securedResources.containsKey(uri)) { // 보호자원 O
			Object authMember = req.getSession().getAttribute("authMember"); // 톰캣은 authMember 모름.. 로그인해도 톰캣은 인정 안 함..지금은 눈속임 구조
			if (authMember == null) {
				pass = false;
			}
			// 신원확인 O
		}
		// 보호자원 X
		
		if (pass) {
//			통과
			chain.doFilter(request, response);
		} else { // 보호자원O, 신원 확인X
//			통과X -> 로그인 화면으로 보내기(loginForm 이동, redirect)
			String viewName = req.getContextPath() + "/login/loginForm.jsp";
			resp.sendRedirect(viewName);
		}
	}

	@Override
	public void destroy() {

	}

}
