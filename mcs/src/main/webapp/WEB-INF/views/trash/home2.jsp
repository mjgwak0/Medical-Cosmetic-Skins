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

	<sec:authorize var="loggedIn" access="isAuthenticated()" />
<c:choose>
	<%-- <c:when test="${isLogOn == true  && member!= null}"> --%>
	<c:when test="${loggedIn}">
		<sec:authorize access="isAuthenticated()">
			<br>
			<h3><font color="red"> <sec:authentication property="principal.username"/> </font>님 게시판 입장을 환영합니다.</h3>		
			<sec:authorize access="hasRole('GUEST')">
				<a href="/emailConfirm" method="get"> <input type="submit" value="인증하러가기"></a>
			</sec:authorize>
			
			<sec:authorize access="hasRole('USER')">
				<a href="/mypage/orderList" method="get"> <input type="submit" value="마이페이지"></a>
				<a href="/productList" method="get"> <input type="submit" value="상품페이지"></a>
				<a href="/baumannTest" method="get"> <input type="submit" value="바우만테스트"></a>
			</sec:authorize>
			
			<sec:authorize access="hasRole('MANAGER')">
				<a href="/addproductForm" method="get"> <input type="submit" value="상품등록"></a>
				<a href="/compProductList" method="get"> <input type="submit" value="상품리스트"></a>
			</sec:authorize>
			
			<hr>
			
			<h2>로그인 회원 정보</h2>
        	member.memberid 아이디 : ${member.userid}<br>
        	member.memberpw 비밀번호 : ${member.password}<br>
        	member.name 이름 : ${member.name}<br>
        	member.phone 전화번호 : ${member.phone}<br>
        	member.email 이메일 : ${member.email}<br>
        	권한 : <sec:authentication property="principal.role"/>
        	<hr>
			<p align="center"><a href="#">글 목록 바로가기</a></p>
			<p align="center"><a href="/logout" method="get"> <input type="submit" value="로그아웃"></a>
							  <a href="/pwConfirm" method="get"> <input type="submit" value="정보수정"></p>
		</sec:authorize>
	</c:when>
	
	<c:otherwise>
		<sec:authorize access="isAnonymous()">
			<br>
			<h3><font color="red"></font>로그인하세요</h3>
			<hr>
			<p align="center"><a href="/loginForm">로그인</a></p>
			<p align="center"><a href="/findidForm">ID찾기</a></p>
			<p align="center"><a href="/findpwForm">PASSWORD찾기</a></p>
		 </sec:authorize>
	</c:otherwise>

</c:choose>
</body>
</html>
