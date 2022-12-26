package kr.or.ddit.reflection;

import java.beans.IntrospectionException;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Arrays;

import kr.or.ddit.reflect.ReflectionTest;
import kr.or.ddit.vo.MemberVO;

/**
 * 객체를 사용하는 역발상(붕어빵으로 붕어빵 틀을 유추해내는 작업)
 * Reflection (java.lang.reflect)
 * 	: 객체의 타입, 객체의 속성(상태, 행동)들을 역으로 추적하는 작업
 *
 */
public class ReflectionDesc {
	public static void main(String[] args) {
		Object dataObj = ReflectionTest.getObject();
		System.out.println(dataObj);
		Class<?> objType = dataObj.getClass(); // 객체의 구체적인 타입을 모른다. 
		System.out.println(objType.getName());
		
		Field[] fields = objType.getDeclaredFields();
//		Arrays.stream(fields).forEach(System.out::println);
		
		Method[] methods = objType.getDeclaredMethods();
//		Arrays.stream(methods).forEach(System.out::println);
		
		try {
			Object newObj = objType.newInstance(); // 내부적으로 기본 생성자를 사용하는 것과 같음 -> 하지만 생성자라 private이라면?! => IllegalAccessException
			Arrays.stream(fields).forEach(fld -> {
//				fld.setAccessible(true); // 캡슐화는 그만한 이유가 있는데 캡슐을 부쉈는데 별로 좋은 방법은 아님
				String fldName = fld.getName(); // mem_id, getMeme_id stream_id
			
				try {
					PropertyDescriptor pd = new PropertyDescriptor(fldName, objType);
					Method getter = pd.getReadMethod(); // getter
					Method setter = pd.getWriteMethod(); // setter
					
					// getter
//					Object fldValue = fld.get(dataObj);
					Object fldValue = getter.invoke(dataObj);
					
					//setter
//					fld.set(newObj,fldValue);
					setter.invoke(newObj, fldValue);
					
					
				} catch (IllegalArgumentException | IllegalAccessException e) {
					e.printStackTrace();
				} catch (IntrospectionException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (InvocationTargetException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			});
			System.out.println(newObj);
		} catch (InstantiationException | IllegalAccessException e) {
			e.printStackTrace();
		}
	}
}
