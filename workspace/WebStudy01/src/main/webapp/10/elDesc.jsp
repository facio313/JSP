<%@page import="kr.or.ddit.vo.MemoVO"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>10/ELDesc.jsp</title>
</head>
<body>
<h4>EL(Expression Language)</h4>
<pre>
	: 표현(속성 데이터 출력)을 목적으로 하는 스크립트 형태의 언어
	일반적인 데이터는 안 되고 scope를 통한 속성 데이터만 표현 가능
	제어문, 조건문을 만들 수 없음(if, for 등) -> 그래서 jstl이라는 custom tag를 함께 사용
	한 화면에서만 쓴다면 EL을 쓸 필요가 없음 => model2에서 많이 사용됨
	<%
		String data = "데이터";
		pageContext.setAttribute("attrData", data); // 속성화
		pageContext.setAttribute("attr-Data", data); // 속성화
	%>
	* '모두 속성으로 공유되는 데이터에 대한'이 앞에 붙는다.
	1. 속성(EL 변수 = scope 안 저장된 데이터) 접근
		<%= data %>, ${data}, ${attrData}, ${attr-Data}
		- 스크립틀릿 data만 나옴
		- data는 속성으로 공유되는 데이터가 아니여서 안 뜸
		- attrData는 속성화되었기 때문에 잘 뜸
	pageScope, requestScope, sessionScope, applicationScope
		-어느 scope에 접근할 것인지 정하기 위해 위 4개의 EL 기본 객체를 사용함
		${pageScope.attrData}, ${pageScope.attr-Data} // map을 사용하는데 key에 접근할 때 접근연산자(dot annotation)를 사용함 // 다 안 뒤져서 빠름
			=> 연상배열도 사용 가능하다는 얘기 ${pageScope['attrData']}, ${pageScope['attr-Data']} // 가장 정확함
	2. 연산자 종류
		할당연산자 : = -> EL은 표현하는 것이 목적이기에 할당연산자가 지원되지 않음(EL3.2에서는 지원됨..)
		산술연산자 : +-*/% -> 오직 산술연산자로 동작한다. concat연산자로 동작 안 함 => 연산의 중심이 연산자이다
			${3 + 4}, ${"3" + 4}, ${"3" + "4"}, ${attr + 4}, \${"a" + 4} => 모두 자바코드이고 이걸 번역해주는 API가 있다.(D:\B_Util\5_5.Tomcat\apache-tomcat-8.5.84\lib\el-api.jar) => EL은 자바 하위 단위의 언어
			${4 / 3} -> 1이 아님... 자바처럼 숫자의 타입을 따라가는 것이 아니라 연산자를 따라감(자바스크립트와 같음, 데이터가 사용될 때 타입이 결정됨), ${attr*data}
		논리연산자 : "&&"(and, short-curkit), "||"(or, short-curkit), "!"(not)
			${ture and true}, ${"true" and true}, ${true or "false"}, ${false or attr}, ${not attr}
		비교연산자 &gt;(gt), &lt;(lt), &gt;=(ge), &lt;=(le), ==(eq), !=(ne)
			${3 lt 4}, ${4 ge 3}, ${4 eq 3},<!-- ${4 ne 3}  --> 
		단항연산자 : empty 단계 1) exist 2) null 3) length, size check // ++(+=), --(-=) -> 할당연산자가 지원되지 않기 때문에 증감연산자가 지원되지 않음(EL3.2에서는 지원됨..)
<%-- 			<% pageContext.setAttribute("attr", null); %> --%>
<%-- 			<% pageContext.setAttribute("attr", ""); %> --%>
<%-- 			<% pageContext.setAttribute("attr", "   "); %> --%>
			<%
				pageContext.setAttribute("attr", "   ");
				pageContext.setAttribute("listAttr", Arrays.asList("a", "b")); // list의 size는 0
			%>
<!-- 			확인하기 위해 사용됨 -->
<!-- 			조건문과 많이 활용됨 -->
			<!-- ${empty attr}  -->
			list attr : ${not empty listAttr}
		삼항연산자 : 조건식 ? 참표현 : 거짓표현
			${not empty attr ? "attr 비어있음" : attr }
			${listAttr}, ${not empty listAttr ? listAttr : "기본값"}
	3. (속성)객체에 대한 접근법
		<% 
			MemoVO memo = new MemoVO();
			pageContext.setAttribute("memoAttr", memo);
			memo.setWriter("작성자");
		%>
		${memoAttr}, ${memoAttr.writer}, ${memoAttr['writer']}
	4. (속성)집합 객체에 대한 접근법(collection) <a href="elCollection.jsp">elCollection.jsp</a>
	5. EL 기본객체 : <a href="elObject.jsp">elObject.jsp</a>
</pre>
</body>
</html>