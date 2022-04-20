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

<script src='https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js'></script> 
<script>
	$(function() {
		$("#findpw").click(function() {    
			$.ajax({
				type:"post",  
				url:"findpw",
				data: {
					userid:$("#_userid").val(),
					email:$("#_email").val()
					},
				success:function (member){
						alert("입력한 이메일로 임시비밀번호를 전송했습니다.");
				},
				error : function() {
					alert("불일치");
				}
			});  //end ajax	 
		})
	});
</script>
<body>

	<div style="color: #ac2925">
    	<center>입력된 정보로 임시 비밀번호가 전송됩니다.</center>
	</div>
    <hr>
		<input type="text" name="userid"  id="_userid" placeholder="아이디를 입력해주세요" />아이디<br>
		<input type="text" name="email" id="_email" placeholder="이메일을 입력해주세요" >이메일<br>
		<input type="button"  id="findpw" value="OK"><br> 
	<hr>

</body>
</html>