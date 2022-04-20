<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/confirmPwd" method="post">
	아이디<input type="text" name="userid" value="${member.userid}" readonly><br>
	비밀번호<input type="password" name="password" placeholder="비밀번호를 입력하세요" required><br>
	<input type="submit" id="#" name="#" value="비밀번호확인" />
</form>

</body>
</html>