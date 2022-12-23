<%@page import="java.sql.SQLException"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.ddit.vo.MemoVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.or.ddit.db.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4>성능 고려사항</h4>
<pre>
	응답 소요 시간 : latency time(99.999%) + processing time
	case 1 - 14ms
	case 2 - 877ms, DBCP case 4 - 27ms
	// connection을 생성하는 데에 제일 오래 걸림
	case 3 - 28ms
	
	
	connection을 한 번 하려면 네트워크를 타야 하기 때문에 오래 걸림
	그래서 pulling이 중요함!! 미리 준비해놓는 것.(미리 몇 인분의 칼국수를 뽑아낼 것인가 - 트래픽 계산 후 감당할 수 있을 만한 connection 수립)
	connection을 관리해줄 것이 필요함!(면을 담아놓을 그릇 -> pool)
	connection pooling!
	
	latency time : 네트워크 지연 시간
	<%
	long startTime = System.currentTimeMillis();
	StringBuffer sql = new StringBuffer();
	sql.append(" select code, writer, content, \"DATE\" ");
	sql.append(" from tbl_memo ");
	for (int i = 1; i <= 100; i++){
	try(
		Connection conn = ConnectionFactory.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
				ResultSet rs = pstmt.executeQuery();
				List<MemoVO> list = new ArrayList<>();
				while (rs.next()) {
					MemoVO vo = new MemoVO();	
					vo.setCode(rs.getInt("code"));
					vo.setWriter(rs.getString("writer"));
					vo.setContent(rs.getString("content"));
					vo.setDate(rs.getString("date"));
					list.add(vo);
				}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	long endTime = System.currentTimeMillis();
	%>
	소요 시간 : <%= endTime - startTime %>ms
</pre>
</body>
</html>