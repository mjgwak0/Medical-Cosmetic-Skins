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
<%-- 	<sec:authorize var="loggedIn" access="isAuthenticated()" />
	<c:choose>
		<c:when test="${loggedIn}">
			<sec:authorize access="isAuthenticated()"> --%>
				<font color="red"> ${mem.name} </font>님 코드 전송을 눌러 이메일 인증을 진행해주세요
				<form method="post" action="mail">
					<input type="hidden" name="email" value="${mem.email}">	
					<input type="submit" value="코드 전송">
				</form>
				
				이메일 인증을 진행해주세요.
				<form method="post" action="verifyCode">
					<input type="text" name="code">
					<input type="hidden" name="email" value="${member.email}">
					<input type="submit" name="confirm" value="인증확인">
				</form>
			<%-- </sec:authorize>
		</c:when> --%>
		
		
		
		
<%-- 		<c:otherwise>
			<sec:authorize access="isAnonymous()">
				<font color="red"> ${member.email} </font>으로 인증코드를 보냈습니다.
				<form method="post" action="mail">
					<input type="hidden" name="email" value="${member.email}">
					<input type="submit" value="코드 재전송">
					
				이메일 인증을 진행해주세요.
				<form method="post" action="verifyCode">
					<input type="text" name="code">
					<input type="submit" name="confirm" value="인증확인">
					
					<input type="hidden" name="deli_num" value="${member.userid}">
					<input type="hidden" name="deli_num" value="${member.password}">
					<input type="hidden" name="deli_num" value="${member.name}">
					<input type="hidden" name="deli_num" value="${mem.deli_num}">
					<input type="hidden" name="deli_num" value="${member.phone}">
					<input type="hidden" name="deli_num" value="${member.email}">
					<input type="hidden" name="gender" value="${mem.gender}">
					<input type="hidden" name="birth" value="${mem.birth}">
					<input type="hidden" name="pw_find" value="${mem.pw_find}">
					<input type="hidden" name="pw_answer" value="${mem.pw_answer}">
					<input type="hidden" name="role" value="${mem.role}">
				</form>
					
				</form>
			</sec:authorize>
		</c:otherwise> --%>
<%-- 	</c:choose> --%>
	
	
	
	
	
<!-- 	이메일 인증을 진행해주세요.
	<form method="post" action="verifyCode">
		<input type="text" name="code">
		<input type="submit" name="confirm" value="인증확인">
	</form> -->
</body>
</html>
