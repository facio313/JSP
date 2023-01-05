package kr.or.ddit.mvc.annotation.resolvers;

import java.io.IOException;
import java.lang.reflect.Parameter;
import java.security.Principal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * {@link HttpServletRequest}, {@link HttpSession} 타입의 핸들러 메서드 인자 해결 => 둘은 request만 있으면 찾을 수 있는 애들임
 * {@link Principal} 추가
 */
public class ServletRequestMethodArgumentResolver implements HandlerMethodArgumentResolver {

	@Override
	public boolean supportsParameter(Parameter parameter) {
		Class<?> parameterType = parameter.getType();
		boolean support = HttpServletRequest.class.equals(parameterType) 
							|| 
						  HttpSession.class.equals(parameterType)
						  	||
						  Principal.class.isAssignableFrom(parameterType); // Principal이 parameterType의 하위 타입인지! 왜냐면 Principal객체로 받지만 MemberVOWrapper로 실제로는 받기 때문에 equals를 못 씀
		return support;
	}

	// controller는 대부분 request를 다룸. 그래서 request를 주로 쓰게 됨
	@Override
	public Object resolveArgument(Parameter parameter, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Class<?> parameterType = parameter.getType();
		Object argumentObject = null;
		if (HttpServletRequest.class.equals(parameterType)) {
			argumentObject = request;
		} else if (HttpSession.class.equals(parameterType)){
			argumentObject = request.getSession();
		} else {
			argumentObject = request.getUserPrincipal();
		}
		return argumentObject;
	}

}
