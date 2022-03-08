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
<title>Insert title here</title>
</head>
<body>

	<table border="1" align="center" width="80%">
		<tr align="center" bgcolor="lightgreen">
			<td><b>아이디</b></td>
			<td><b>비밀번호</b></td>
			<td><b>배송지번호</b></td>
			<td><b>성별</b></td>
			<td><b>연락처</b></td>
			<td><b>이메일</b></td>
			<td><b>승인여부</b></td>
			<td><b>이름</b></td>
			<td><b>생년월일</b></td>
			<td><b>비밀찾기 질문</b></td>
			<td><b>비번찾기 답</b></td>
			<td><b>마일리지</b></td>
			<td><b>어드민여부</b></td>
		</tr>

		<c:forEach var="member" items="${memberList}">
			<tr align="center">
				<td>${member.member_id}</td>
				<td>${member.member_pw}</td>
				<td>${member.deli_num}</td>
				<td>${member.gender}</td>
				<td>${member.phone}</td>
				<td>${member.email}</td>
				<td>${member.confirm}</td>
				<td>${member.name}</td>
				<td>${member.birth}</td>
				<td>${member.pw_find}</td>
				<td>${member.pw_answer}</td>
				<td>${member.mileage}</td>
				<td>${member.roll}</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>