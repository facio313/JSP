package kr.or.ddit.mvc.annotation.sterotype;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import kr.or.ddit.mvc.annotation.RequestMethod;

/**
 * single value(GET handler), multi value
 * commnad handler 내의 핸들러 메서드에
 * 어떤 요청(주소, 메서드)에 대해 동작하는지를 표현 
 *
 */
//SOURCE : 소스(.java)까지만 남아있는다. -> 쓰는 개발자가 본다. 
// CLASS : 클래스 파일(.class = byte code)까지 남아있는다. -> 컴파일하는 컴파일러가 본다. 
// RUNTIME : 안 사라진다. -> JVM, WAS 등이 본다.
@Retention(RetentionPolicy.RUNTIME) // 언제까지 살아있을지 정의하는 것  
@Target(ElementType.METHOD)
public @interface RequestMapping {
	String value(); // 메서드 같아 보이지만 속성임 // 전부 기본값이 설정되어 있다면 마커 어노테이션으로 활용 가능 
	RequestMethod method() default RequestMethod.GET; // 속성이 늘어나면 싱글 벨류 어노테이션으로 활용 못하게 된다. 기본값을 만들어주면 쓸 수 있다.
}

/**
 * 얘는 핸들러 메서드가 무엇인지 알려준다.
 * 그 중에서도 method로 뭘 쓸지 적어서 알려준다.
 * 요청에 맞게 고를 수 있게 된다.
 */