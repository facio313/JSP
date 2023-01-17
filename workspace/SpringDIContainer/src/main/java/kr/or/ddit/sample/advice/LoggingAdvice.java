package kr.or.ddit.sample.advice;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

/*
모든 서비스를 대상으로 전달되는 파라미터와 반환값을 시스템 로그로 기록하가.
거기에, 서비스(로직)이 실행되는 데 소요되는 시간도 로그로 기록하라
Core Concern : 모든 서비스(Service 객체) - 출금, 입금, 이체 / 서비스 실행
Cross Cutting Concern : 시스템 로그로 기록하라 / 소요 시간 로그
*/

// 구체적인 타겟 언급은 안 됨!!!
// joinpoint 결합시점, 결합지점에 대한 정보를 갖고 있는 객체
@Slf4j
// Aop-Context.xml에서 쓰는 거를 @Aspect, @Before, @AfterReturning 등으로 사용할 수 있다.
@Aspect // Advice + pointcut
//@Component
public class LoggingAdvice { // bean을 등록할 때 별도의 scope를 설정하지 않았으니 싱글톤
	// 여기 전역변수가 있으면? 어느 한 사용자에 대한 전역변수가 다음 사용자에게 영향을 미칠 수 있음.
	// 싱글톤에서 전역변수 쓰는 것은 위험함
	// 전역변수를 이용한 객체의 상태값 유지는 잘 안 씀
	
	// 시작 시간, 종료 시간을 전역변수로 사용하면 안 된다. 그럼 어떻게? => around 써라
	
	@Pointcut("execution(* kr.or.ddit.sample.service.*.*(..))")
	public void dummy() {
		
	}
	
//	@Before("execution(* kr.or.ddit.sample.service.*.*(..))") // advice("pointcut")
	@Before("dummy()")
	public void before(JoinPoint joinPoint) {
		Object target = joinPoint.getTarget(); // 어떤 코드에 종속되지 않기 때문에 어떤 타겟이든 받을 수 있어야 함. 그래서 Object타입
		String targetName = target.getClass().getSimpleName();
		Signature signature = joinPoint.getSignature();
		String targetMethodName = signature.getName();
		Object[] args = joinPoint.getArgs(); // 어떤 파라미터의 어떤 타입인지 모르기 때문에 Object[]타입
		log.info("{}.{}({} 호출됨)", targetName, targetMethodName, args);
		
	}
	
//	@AfterReturning(pointcut="execution(* kr.or.ddit.sample.service.*.*(..))", returning="retValue")
	@AfterReturning(pointcut="dummy()", returning="retValue")
	public void afterReturning(JoinPoint joinPoint, Object retValue) { // 반환 값은 실행된 후에 해야 함
		Object target = joinPoint.getTarget();
		String targetName = target.getClass().getSimpleName();
		Signature signature = joinPoint.getSignature();
		String targetMethodName = signature.getName();
		
		log.info("{}.{} 실행 결과 --> {} 호출됨)", targetName, targetMethodName, retValue);		
	}
	
	// around = before + after -> AOP 2세대에서는 없었음. around가 거의 대부분 사용됨. before와 after는 많이는 사용 안 함
	// around에서 반환값을 consumer에게 다시 돌려줘야 하기 때문에 반환타입으로 Object가 꼭 있어야 함
//	@Around("execution(* kr.or.ddit.sample.service.*.*(..))")
	@Around("dummy()")
	public Object around(ProceedingJoinPoint joinPoint) throws Throwable { // Weaver가 throws하는 걸 가져감
		Object target = joinPoint.getTarget();
		String targetName = target.getClass().getSimpleName();
		Signature signature = joinPoint.getSignature();
		String targetMethodName = signature.getName();
		
		Object[] args = joinPoint.getArgs();
		long start = System.currentTimeMillis();
		// 이 중간에서 타겟이 실행되어야 함, 직접적으로 호출할 수 잇는 joinpoint가 필요함(ProceedingJoinPoint)
		try {
			log.info("{}.{}({} 호출됨)", targetName, targetMethodName, args);
			Object retValue = joinPoint.proceed(args);
			log.info("{}.{} 실행 결과 --> {} 호출됨)", targetName, targetMethodName, retValue);		
			long end = System.currentTimeMillis();
			log.info("{}.{} 실행 소요 시간 {}ms", targetName, targetMethodName, (end - start));
			return retValue;
		} catch (Throwable e) {
			log.error("", e); // 로그만 찍고 마치 에러 없이 지나가는 것처럼 보일 수 있음
			throw e; // 로그만 출력하고 다시 던지겠다.
		}
		
		
	}
}
