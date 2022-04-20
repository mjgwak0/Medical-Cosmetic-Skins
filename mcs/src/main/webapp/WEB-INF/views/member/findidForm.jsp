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
		$("#findid").click(function() {    
			$.ajax({
				type:"post",  
				url:"findid",
				data: {email:$("#_email").val()},
				success:function (member){
					if(member!=null){
						alert("회원님의 아이디는 " + member.userid + "입니다.");						
					}else{
						alert("없는 이메일입니다.")
					}
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
    	<center>아이디찾기</center>
	</div>
    <hr>
		<input type="text" name="email" id="_email" placeholder="이메일을 입력해주세요" >이메일<br>
		<input type="button"  id="findid" value="OK"><br> 
	<hr>

</body>
</html>