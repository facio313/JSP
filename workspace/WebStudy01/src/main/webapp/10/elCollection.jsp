<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>10/elCollection.jsp</title>
</head>
<body>
<h4>EL에서 집합 객체 접근 방법</h4>
<%
	String[] array = new String[]{"value1", "value2"};
	List<String> list = Arrays.asList("value1", "value2");
	Set<String> set = list.stream().collect(Collectors.toSet());
	
	Map<String, Object> map = new HashMap<>();
// 	map.put("key1", "value1");
	map.put("key-1", "value1");
// 	map.put("key2", "value2");
	map.put("key 2", "value2");
	
	pageContext.setAttribute("array", array);
	pageContext.setAttribute("list", list);
	pageContext.setAttribute("set", set);
	pageContext.setAttribute("map", map);
	
	pageContext.setAttribute("memo", null);
%>
<pre>
	array : <%--= array[3] --%>, ${array[3]}
	=> 원래는 indexoutof어쩌고 에러 떠야 하는데 EL은 뜸
	=> EL은 제어 목적이 아니라 표현 목적임
	=> 그래서 어지간한 에러는 그냥 ""로 표현함 
	list : <%--= list.get(3) --%>, ${list[3]},
	ex) memo's writer : ${memo.writer} => 내부에서는 java bean규약을 반대로 활용해 getWriter()가 호출됨, ${memo['writer']}, \${memo.getWriter()} => nullpointer 발생시킬 가능성이 높다, EL에서는 메서드 호출 노노
	set : <%= set %> ${set} // set에서 몇 번째 element 꺼내고 싶다. 방법이 있냐? => 없다!!! 순서가 없좌놔
	map : <%= map.get("key-1") %>, ${map.get("key-1")}, ${map.key-1}, ${map['key-1']} 
		<%= map.get("key 2") %>, ${map.get("key 2")}, \${map.key 2}, ${map['key 2']} 
	ex) int i 2;
</pre>
</body>
</html>