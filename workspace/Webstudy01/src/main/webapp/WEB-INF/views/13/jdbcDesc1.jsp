<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>13/jdbcDesc.jsp</title>
</head>
<body>
<h4>JDBC(Java DataBase Connectivity)</h4>
<pre>
	jdbc 드라이버란? java.sql 패키지의 인터페이스들에 대한 구현 객체 모음
	
	JDBC 단계
	1. 벤더 제공 드라이버 확보
	2. 드라이버를 빌드 패스에 추가
	3. 드라이버 로딩
	4. Connection 수립
	5. 쿼리 객체 생성
		- Statement
		- PreparedStatement
		- CallableStatement
	6. 쿼리 실행
		- ResultSet executeQuery() : SELECT
		- int executeUpdate() : INSERT, UPDATE, DELETE
	7. ResultSet 핸들링
	8. close (자원반납) : 세션 종료
	<%
		// driver class loading : oracle.jdbc.driver.OracleDriver
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "in91";
		String password = "java";
		StringBuffer trTags = new StringBuffer();
		try(
			Connection conn = DriverManager.getConnection(url, user, password);
			Statement stmt = conn.createStatement();
		){
			StringBuffer sql = new StringBuffer();
			sql.append(" SELECT PROPERTY_NAME, PROPERTY_VALUE, DESCRIPTION ");
			sql.append(" FROM DATABASE_PROPERTIES ");
			ResultSet rs = stmt.executeQuery(sql.toString());
			while (rs.next()) {
				String propertyName = rs.getString("PROPERTY_NAME");
				String propertyValue = rs.getString("PROPERTY_VALUE");
				String description = rs.getString("DESCRIPTION");
				trTags.append(String.format("<tr><td>%s</td><td>%s</td><td>%s</td></tr>", propertyName, propertyValue, description));
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		pageContext.setAttribute("trTags", trTags.toString());
	%>
</pre>
<table border="1px">
	<thead>
		<tr>
			<th>PROPERTY_NAME</th>
			<th>PROPERTY_VALUE</th>
			<th>DESCRIPTION</th>
		</tr>
	</thead>
	<tbody>
		${trTags}
	</tbody>
</table>
</body>
</html>