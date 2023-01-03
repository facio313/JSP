package kr.or.ddit.mvc.annotation;

import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.mvc.annotation.sterotype.Controller;
import kr.or.ddit.mvc.annotation.sterotype.RequestMapping;
import kr.or.ddit.mvc.utils.ReflectionUtils;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class RequestMappingHandlerMapping implements HandlerMapping {
	private Map<RequestMappingCondition, RequestMappingInfo> handlerMap;
	
	public RequestMappingHandlerMapping(String...basePackages) {
		handlerMap = new LinkedHashMap<>();
		scanBasePackages(basePackages);
	}

	// annotation tracing으로 이 클래스의 객체가 생성될 때 실행된다.
	// 밑의 메서드를 통해서 주어진 basePackages 안에 있는 특정@를 가진 클래스를 추적한다.
	// Reflection
	private void scanBasePackages(String[] basePackages) { 
		// controller annotation을 가진 클래스 필요
		// 특정 어노테이션의 클래스와 어디서 찾을 건지 basePackages를 통해 추적한다. 여기선 @Controller가 붙은 클래스들 찾기!
		// 이 메서드는 @Controller가 붙은 클래스들(key)과 그 @Controller의 객체(value)로 이루어진 Map을 반환한다.
		ReflectionUtils.getClassesWithAnnotationAtBasePackages(Controller.class, basePackages) // @Controller의 클래스와, 찾을 범위를 특정한다. // .class 사용 가능한 클래스의 인스턴스가 없을 때 사용된다.  
			.forEach((handlerClass, controller) -> { // map의 forEach메서드를 통해 map이 가지고 있는 handlerClass(@Contoller를 갖고 있는 클래스들)와 controller(그 어노테이션 클래스의 객체)를 사용한다. 람다식!
				// controller는 그 handlerClass의 객체인데,, 여기선 @Controller의 클래스의 경우 marker annotation이니 딱히 쓸 곳이 없다. 
				try { // 없거나 그럴 수 있어서 그런가?? 어떤 에러 발생하려나..
					Object commandHandler = handlerClass.newInstance(); // @Controller 클래스의 객체를 생성해주고 무슨 타입인지 모르니 Object 타입의 변수에 할당한다.(할당한 변수는 각각이 command Handler 즉 실질적으로 일하는 원래의 controller들이다.)
					ReflectionUtils.getMethodsWithAnnotationAtClass( // @Controller 클래스가 가지고 있는 메서드 중 특정 @를 가지고 잇는 메서드를 찾아낸다.
						// 어느 어노테이션 클래스에서 찾을 것인가, 메서드가 갖는 특정@는 무엇인가?, return타입은 무엇인가?, 파라미터 타입이 뭔가?
						handlerClass, RequestMapping.class, String.class // 여기서는 스캔 타겟 클래스(for문 돌 때 각 클래스), RequestMapping의 타입, String 리턴 타입
					).forEach((handlerMethod, requestMapping) -> { // map의 forEach메서드, handlerMethod : 현재 forEach문에서의 @RequestMapping이 붙은 메서드, requestMapping : 현재 forEach문에서의 handlerMethod의 메서드 객체(value-url와 method를 갖는다) 
						RequestMappingCondition mappingCondition = new RequestMappingCondition(requestMapping.value(), requestMapping.method()); // 어떤 조건들의 객체인지 적어준다. 이 메서드의 value(url)이 뭔지, method는 뭔지 => 나중에 request가 갖고 있는 RequestMappingCondition과 비교한다.
						RequestMappingInfo mappingInfo = new RequestMappingInfo(mappingCondition, commandHandler, handlerMethod); // RequestMappingInfo에 위 조건과, @Controller가 붙은 실 객체, @RequestMapping이 붙은 실 메서드를 넣어준다.
						handlerMap.put(mappingCondition, mappingInfo); // 그걸 key에 조건을 넣고, 그 내용들을 value에 넣는다 => basePackages에 있는 @Controller와 @RequestMapping를 가진 클래스와 메서드 목록(맵)이 만들어진다.
						log.info("수집된 핸들러 정보 : {}", mappingInfo);
						
						// 근데 왜 RequestMappingCondition(value와 method)를 RequestMappingInfo에 넣는 이유가 무엇인가? commandHandler와 handlerMethod에 이미 다 있지 않나?
					});
				} catch (Exception e) {
					log.error("핸들러 클래스 스캔 중 문제 발생", e);
				}
			});
		
	}
	// request -> RequestMappingConditio
	@Override
	public RequestMappingInfo findCommandHandler(HttpServletRequest request) { 
		String url = request.getServletPath(); // DispatcherServlet에서 if문 완성할 때 썼던 것 => 책임을 덜어내고 있음!
		RequestMethod method = RequestMethod.valueOf(request.getMethod().toUpperCase());
		RequestMappingCondition mappingCondition = new RequestMappingCondition(url, method);
		return handlerMap.get(mappingCondition); // 처리할 핸들러가 없다면 404를 보내야 함, 근데 response가 없어서 표현할 수 없음
		// request에 있는 url과 method를 통해 RequestMappingCondition을 만들어
		// 미리 만들어둔 특정@을 가진 클래스 목록인 handlerMap이 가진 것과 대조하여
		// 해당하는 RequestMappingInfo를 다시 DispatcherServlet 반환한다.
		// 이 RequestMappingInfo를 HandlerAdapter로 보내서 파라미터를 비교한 다음 어떤 HandlerMethod를 invoke(호출)할지 정하게 된다.
	}

}
