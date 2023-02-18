package kr.or.ddit.practice;

import java.util.HashMap;
import java.util.Map;

public class ParamMap extends HashMap<String, Object> {
	
	public static ParamMap init() {
		
		return new ParamMap();
	}
	
	public String getString(String key) {
		
		return (String) get(key);
	}
	
	public String getString(String key, String defaultValue) {
		
		String val = (String) get(key);
		if (val == null) {
			return defaultValue;
		} else {
			return val;
		}
	}
	
	public Integer getInt(String key) { // Wrapper 클래스
//		int val = (int) get(key); // int는 원시타입이기 때문에 무조건 값이 있어야 함. null을 못 가짐
		Integer val = (Integer) get(key); // Integer는 클래스라 null을 가질 수 있음 -> 이게 더 안전함
		return val;
	}
	
	public <T> T get(String key, Class<T> clazz) { // <T>가 없으면 타입 정의가 안 됨, 특정 타입 T인데 정의한 게 없으니 <T>로 정의한다.
		return (T) get(key);
	}
	
	public static void main(String[] args) {
		ParamMap map = ParamMap.init();
		map.put("key1", 1);
		
		StringBuffer sb = new StringBuffer();
		sb.append("test");
		map.put("key2", sb);
		
		Object object = map.get("key2");
		StringBuffer sb2 = (StringBuffer) object;
		
		StringBuffer sb3 = map.get("key2", StringBuffer.class);
				
	}
}
