<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="container">
    <div class="container-margin">
        <div class="find-result-wrap">
            <h4 class="find-title">아이디 찾기 결과입니다.</h4>
            <c:choose>
                <c:when test="${empty idList}">
	                    등록된 아이디가 없습니다. <br>
	                    입력한 정보를 다시 한 번 확인해주세요.
                </c:when>

                <c:otherwise>
                    <c:forEach var="idList" items="${idList}">
                        <div>
                            <b>
	                            ${fn:substring(idList.memId,0,2) }
	                            <c:forEach begin="3" end="${fn:length(idList.memId)}" step="1">
	                                *
	                            </c:forEach>
                            </b>
<%--                             (가입일 : <fmt:formatDate value="" pattern="yyyy-MM-dd"/>) --%>
                        </div>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
            <div class="find-result-btn-box">
                <button type="button" onclick="location.href='<c:url value="/"/>'">홈</button>
                <button type="button" class="find-result-btn-login" onclick="location.href='<c:url value="/login/loginForm"/>'">로그인</button>
            </div>
        </div>
    </div>
</div>