<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
</head>
<body>
<fieldset>
<legend>회원정보수정</legend>
	<form action="/update" method="post" name="fr">
		아이디 <input type="text" name="userid" value="${mem.userid}" readonly><br>
		비밀번호 <input type="password" name="password" placeholder="비밀번호를 입력하세요" required><br>
	    <!-- 새 비밀번호 <input type="password" name="password" placeholder="새 비밀번호를 입력하세요" required><br>
		새 비밀번호 확인<input type="password" name="password" placeholder="새 비밀번호를 입력하세요" required><br>  -->
		이름 <input type="text" name="name" value="${mem.name}"><br>
		전화번호 <input type="text" name="phone" value="${mem.phone}"><br>
		이메일 <input type="text" name="email" value="${mem.email}" readonly><br>
		우편번호 <input type="text" name="addr_num" value="${mem.addr_num}"><br>
		주소 <input type="text" name="addr" value="${mem.addr}"><br>
		상세주소 <input type="text" name="addr2" value="${mem.addr2}"><br>
		<input type="submit" class="btn" id="pwUpdate" name="pwUpdate" value="회원정보수정하기">
		<input type="button" class="btn" value="메인으로" onclick="location.href='/home'">
		

		<input type="hidden" name="gender" value="${mem.gender}">
		<input type="hidden" name="birth" value="${mem.birth}">
		<input type="hidden" name="pw_find" value="${mem.pw_find}">
		<input type="hidden" name="pw_answer" value="${mem.pw_answer}">
		<input type="hidden" name="role" value="${mem.role}">
	</form>
</fieldset>
</body>
</html>