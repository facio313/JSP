package kr.or.ddit.mvc.annotation.sterotype;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * Marker annotation 형태로
 * Front controller 다음에서 동작한 command handler 객체 표현
 *
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.TYPE)
public @interface Controller {

}

/**
 * 얘가 쓰이는 이유는 FC와 C 간의 결합력을 낮추기 위해서 사용된다.
 * 원래는 Dispatcher에서 if문을 통해 명시적으로 일일이 분기했지만
 * 이 어노테이션을 HandlerMapping에서 찾을 수 있도록 설정해놔서 결합력을 낮췄다.
 */