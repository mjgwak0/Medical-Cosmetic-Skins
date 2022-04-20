<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h3>${principal.userid}님 회원가입을 축하드립니다</h3>
		<p>모든 서비스를 이용하기 위해 이메일 인증을 완료하여 주세요</p>
		<button onclick="sendEmail(event)">이메일 인증하기</button>
		
		<form id="email_form">
        	<input type="hidden" name="userid" value="${principal.userid}">
       	 	<input type="hidden" name="email" value="${principal.email}">
       		<input type="hidden" name="role" value="${principal.role}">												
    	</form>

		<script>
		function sendEmail(event, userid, email, role) {
			$.ajax({
				url : "/emailSend",
				type : "GET",
				data : $("#email_form").serialize(),
				success : function(data) {
					alert("이메일이 전송되었습니다.")
				},
				error : function(e) {
					console.log(e);
				}
			});
		}
		</script>

		
		
	</body>
</html>