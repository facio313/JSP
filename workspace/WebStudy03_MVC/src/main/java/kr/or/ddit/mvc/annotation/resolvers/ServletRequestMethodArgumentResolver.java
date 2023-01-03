package kr.or.ddit.mvc.annotation.resolvers;

import java.io.IOException;
import java.lang.reflect.Parameter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * {@link HttpServletRequest}, {@link HttpSession} 타입의 핸들러 메서드 인자 해결 => 둘은 request만 있으면 찾을 수 있는 애들임
 */
public class ServletRequestMethodArgumentResolver implements HandlerMethodArgumentResolver {

	@Override
	public boolean supportsParameter(Parameter parameter) {
		Class<?> parameterType = parameter.getType();
		boolean support = HttpServletRequest.class.equals(parameterType) || HttpSession.class.equals(parameterType); 
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
		} else {
			argumentObject = request.getSession();
		}
		return argumentObject;
	}

}
