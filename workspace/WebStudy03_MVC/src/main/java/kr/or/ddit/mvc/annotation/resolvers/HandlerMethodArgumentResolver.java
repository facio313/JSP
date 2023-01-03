package kr.or.ddit.mvc.annotation.resolvers;

import java.io.IOException;
import java.lang.reflect.Parameter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * HandlerAdapter가 핸들러 메서드를 호출할 때, 
 * 메서드 인자 하나하나를 별개로 처리하기 위한 전략 객체.
 */
public interface HandlerMethodArgumentResolver {
	
	/**
	 * 현재 파라미터가 resolver에 의해 처리가능한 경우인지 판단
	 * @param parameter
	 * @return true 감당 가능, false 감당 불가
	 */
	public boolean supportsParameter(Parameter parameter);
	
	/**
	 * 핸들러 메서드의 인자 하나를 처리(생성)하기 위한 메서드
	 * @param parameter
	 * @param request
	 * @param response
	 * @return
	 */
	public Object resolveArgument(Parameter parameter, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException; // 오브젝트 타입인 이유
}
