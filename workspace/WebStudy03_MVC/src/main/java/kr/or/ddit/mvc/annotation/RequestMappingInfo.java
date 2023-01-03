package kr.or.ddit.mvc.annotation;

import java.lang.reflect.Method;

import lombok.Getter;
import lombok.ToString;

@Getter // immutable 객체, 수정할 수 없음
@ToString
public class RequestMappingInfo {
	private RequestMappingCondition mappingCondition; // 어떤 요청?! url
	private Object commandHandler; // 핸들러 객체 정보 // Controller annotaion을 가진 클래스의 객체(핸들러 객체)
	private Method handlerMethod; // 핸들러 메서드 정보 // 핸들러 메서드 누구인가!
	
	public RequestMappingInfo(RequestMappingCondition mappingCondition, Object commandHandler, Method handlerMethod) {
		super();
		this.mappingCondition = mappingCondition;
		this.commandHandler = commandHandler;
		this.handlerMethod = handlerMethod;
	}
	
}
