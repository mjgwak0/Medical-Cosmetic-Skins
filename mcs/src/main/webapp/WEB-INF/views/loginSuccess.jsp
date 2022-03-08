<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%
request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
</head>
<body>
	<br>
	<h3 align="center">메인 사이트</h3>
	<h3><font color="red">${member.name }</font>님 게시판 입장을 환영합니다.</h3>
	
	<p>principal : <sec:authentication property="principal"/></p>
	<p>사용자 아이디 : <sec:authentication property="principal.username"/></p>

	<form action="logout" method="get">
		<input type="submit" value="로그아웃"></input>
	</form>

</body>
</html>
