package kr.or.ddit.exception;

import java.io.IOException;
import java.sql.SQLException;

/**
 * 에러나 예외 (Throwable): 예상하지 못했던 비정상적인 처리 상황
 * 	- Error : 개발자가 직접 처리하지 않는 에러 계열(system default)
 * 	- Exception : 개발자가 직접 처리할 수 있는 예외 계열
 * 		- checked excpetion (Exception) : 반드시 처리해야만 하는 예외(안 그럼 컴파일 에러)
 * 			ex) IOException, SQLException
 * 		- unchecked exception (RuntimeException) : 처리하지 않더라도 메서드 호출 구조를 통해 JVM에게 제어권이 전달되는 예외(try-catch로 처리 가능하긴 함)
 * 			- 일단 돌려봐야 알 수 있는 예외
 * 			ex) NullPointerException, IndexOutOfBoundException
 *
 *	에러는 system이 처리하는 것
 *	
 *	** 예외 처리 방법
 *	직접처리(능동처리) : try(closable object) ~ catch ~ finally
 *	위임처리(수동처리) : 메서드의 호출자에게 throws로 예외 제어권 위임
 *
 *	** custom 예외 사용 방법
 *	1. Exception이나 RuntimeExpcetion의 자식 클래스 정의(예외 클래스)
 *	2. throw 예외 인스턴스 생성
 */
public class ExceptionDesc {
//	public static void main(String[] args) throws IOException { // 최종적으로 VM에 떠넘김
//	public static void main(String[] args) throws RuntimeException { // 최종적으로 VM에 떠넘김
	public static void main(String[] args) { // unchecked는 없어도 됨
//		try {
//			String data = getSampleData();
//			System.out.println(data);
//		} catch (IOException e) {
////			System.err.println(e.getMessage());
//			e.printStackTrace();
//		}
		
		try {
			System.out.println(getSampleDataWithRE());
		} catch (NullPointerException | UserNotFoundException e) {
			System.err.println(e.getMessage());
			System.out.println("정상 처리 위장 가능"); // RuntimeException의 특징, 꼭 직접 처리를 안 해도 되는?
//			e.printStackTrace();
		}
//		System.out.println(getSampleChangeException());
	}
							
	private static String getSampleData() throws IOException{ // main에 떠넘김
		String data = "SAMPLE";
		if (1==1)
			throw new IOException("강제 발생 예외");
		return data;
	}

//	private static String getSampleDataWithRE() throws RuntimeException {
	private static String getSampleDataWithRE() { // unchecked는 이런 식으로 throws를 안 써도 들어가 있음
		String data = "SAMPLERE";
		if (1==1)
			throw new UserNotFoundException("강제 발생 예외");
		return data;
	}
	
	private static String getSampleChangeException() {
		String data = "SAMPLEChangeExcpetion";
		try {
			if (1==1)
				throw new SQLException("강제 발생 예외");
			return data;
		} catch (SQLException e) {
			throw new RuntimeException(e); // 근본적인 예외가 아님. 원본 예외를 꼭 유지해야 함
		}
	}
}
