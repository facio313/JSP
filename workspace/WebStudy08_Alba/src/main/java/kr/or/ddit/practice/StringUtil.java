package kr.or.ddit.practice;

public class StringUtil {

	/**
	 * 비교주체 또는 비교대상이 null인 경우에는 모두 false로 처리함
	 * @author 최경수(2023.02.18)
	 * @param value : 비교주체
	 * @param compares : 비교대상
	 * @return true or false
	 */
	public static boolean equalsOr(String value, String...compares) { // ...은 두 개 못 쓰고, 맨 마지막에 써줘야 함
		
		if (value == null || compares == null) { return false; }
		
		for  (String s : compares) {
			if (value.equals(s)) {
				return true;
			}
		}
		return false;
	}
}
