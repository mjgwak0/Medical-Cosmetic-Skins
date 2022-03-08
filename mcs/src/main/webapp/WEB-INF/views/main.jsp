<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
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

	<c:if test="${! empty member}">
		<h3>
			<font color="red">${session['member'].name} </font>님 게시판 입장을 환영합니다.
		</h3>
		<a href="@{/logout}">LOG_OUT</a>
		<hr>
		<p align="center">
			<a href="#">글 목록 바로가기</a>
		</p>
		<p align="center">
			<a href="/logout">로그아웃</a>
		</p>
	</c:if>

	<c:if test="${empty member}">
		<h3>
			<font color="red">${member.name }</font>님 게시판 입장을 환영합니다.
		</h3>
		<a href="@{/logout}">LOG_OUT</a>
		<hr>
		<p align="center">
			<a href="#">글 목록 바로가기</a>
		</p>
		<p align="center">
			<a href="/member/login">로그인</a>
		</p>
	</c:if>
	<br>
	<hr>
</body>
</html>