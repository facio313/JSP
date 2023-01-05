package kr.or.ddit.mvc.annotation;

import java.io.IOException;
import java.lang.reflect.Method;
import java.lang.reflect.Parameter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.mvc.annotation.resolvers.HandlerMethodArgumentResolver;
import kr.or.ddit.mvc.annotation.resolvers.ModelAttributeMethodProcessor;
import kr.or.ddit.mvc.annotation.resolvers.RequestParamMethodArgumentResolver;
import kr.or.ddit.mvc.annotation.resolvers.RequestParamMethodArgumentResolver.BadRequestException;
import kr.or.ddit.mvc.annotation.resolvers.RequestPartMethodArgumentResolver;
import lombok.extern.slf4j.Slf4j;
import kr.or.ddit.mvc.annotation.resolvers.ServletRequestMethodArgumentResolver;
import kr.or.ddit.mvc.annotation.resolvers.ServletResponseMethodArgumentResolver;

@Slf4j
public class RequestMappingHandlerAdapter implements HandlerAdapter {

	// HandlerAdapter가 핸들러 메서드를 호출할 때 쓰는 매개변수들을 담을 리스트 
	private List<HandlerMethodArgumentResolver> argumentResolvers; 
	{
		argumentResolvers = new ArrayList<>();
		argumentResolvers.add(new ServletRequestMethodArgumentResolver());
		argumentResolvers.add(new ServletResponseMethodArgumentResolver());
		argumentResolvers.add(new RequestParamMethodArgumentResolver());
		argumentResolvers.add(new ModelAttributeMethodProcessor());
		argumentResolvers.add(new RequestPartMethodArgumentResolver());
	}

	private HandlerMethodArgumentResolver findArgumentsResolver(Parameter param) {
		HandlerMethodArgumentResolver finded = null;
		for (HandlerMethodArgumentResolver resolver : argumentResolvers) {
			if (resolver.supportsParameter(param)) {
				finded = resolver;
				break;
			}
		}
		return finded;
	}

	// mappingInfo에 포함된 핸들러 객체와 메서드 정보를 기반으로 실제 핸들러를 호출한다.
	@Override
	public String invokeHandler(RequestMappingInfo mappingInfo, HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Object handlerObject = mappingInfo.getCommandHandler(); // mappingInfo의 핸들러 객체 정보를 가져와서 담는다.
		Method handlerMethod = mappingInfo.getHandlerMethod(); // mappingInfo의 핸들러 메서드 정보를 가져와서 담는다.
		int parameterCount = handlerMethod.getParameterCount(); // 핸들러 메서드가 가지는 파라미터 수를 센다.ex)member/memberList -> page, SearchVO, HttpServletRequest
		try {
			String viewName = null;
			if (parameterCount > 0) { // 파라미터의 개수가 0보다 크
				Parameter[] parameters = handlerMethod.getParameters(); // 핸들러 메서드의 파라미터들을 파라미터 타입의 배열에다가 넣어준다. ex) parameters = {currentPage, simpleCondition, req}
				Object[] arguments = new Object[parameterCount]; // 
				for (int i = 0; i < parameterCount; i++) {
					Parameter param = parameters[i];
					HandlerMethodArgumentResolver findedResolver = findArgumentsResolver(param);
					if (findedResolver == null) {
						throw new RuntimeException(
								String.format("%s 타입의 메서드 인자는 현재 처리 가능한 Resolver가 없음", param.getType()));
					} else {
						arguments[i] = findedResolver.resolveArgument(param, req, resp);
					}
				}
				viewName = (String) handlerMethod.invoke(handlerObject, arguments);
			} else {
				viewName = (String) handlerMethod.invoke(handlerObject);
			}
			return viewName;
		} catch (BadRequestException e) {
			log.error("handler adapter가 handler method argument resolver 사용 중 문제 발생", e);
			resp.sendError(400, e.getMessage());
			return null;
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}

}