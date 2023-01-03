package kr.or.ddit.mvc.annotation.resolvers;

import java.io.IOException;
import java.lang.reflect.Parameter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.text.CaseUtils;

/**
 * @ModelAttribute 어노테이션을 가진 command object(not primitive) 인자 하나를 해결하는 객체
 *  ex) @ModelAttribute MemberVO member (O)
 *  	@ModelAttribute int cp (X)
 *
 */
public class ModelAttributeMethodProcessor implements HandlerMethodArgumentResolver {

	@Override
	public boolean supportsParameter(Parameter parameter) {
		Class<?> parameterType = parameter.getType();
		ModelAttribute modelAttribute = parameter.getAnnotation(ModelAttribute.class);
		boolean support = modelAttribute != null
				&&
				!(
						parameterType.isPrimitive()
						||
						String.class.equals(parameterType)
						||
						(
							parameterType.isArray() 
							&&
							(
								parameterType.getComponentType().isPrimitive()
								|| 
								parameterType.getComponentType().equals(String.class)
							)
						)
					);
		return support; // annotation이 있으면
	}

	@Override
	public Object resolveArgument(Parameter parameter, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Class<?> parameterType = parameter.getType();
		ModelAttribute modelAttribute = parameter.getAnnotation(ModelAttribute.class);
		try {
			//		MemberVO member = new MemberVO();
			Object commandObject = parameterType.newInstance();
			
			//		req.setAttribute("member", member);
			String attrName = modelAttribute.value(); // 명시적인 설정이 있으면 그걸로 쓴다.
//			CoC(Convention over Configuration) 패러다임
			if (StringUtils.isBlank(attrName)) { // 근데 명시적인 설정이 없으면 관행을 쓴다.
				attrName = CaseUtils.toCamelCase(parameterType.getSimpleName(), false, ' ');
			}
			request.setAttribute(attrName, commandObject);
			
			BeanUtils.populate(commandObject, request.getParameterMap());
	//		Map<String, String[]> parameterMap = req.getParameterMap();
	//
	//		try {
	//			BeanUtils.populate(member, parameterMap);
	//		} catch (IllegalAccessException | InvocationTargetException e) {
	//			throw new ServletException(e);
	//		}
			return commandObject;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}
