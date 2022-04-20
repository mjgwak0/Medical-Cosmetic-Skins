<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%
request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>문의글등록</title>
</head>
<body>
<div class="container" style="width:1250px; align= center;">
<h3 style="text-align: center;">문의글 등록하기</h3>
<form id="frm" name="frm" method="post" action="/productInfo" >
<table border="1" cellpadding="1" cellspacing="0" style="margin-left:450px; position:relative width:1250px; align= center;">
			

	<tr>
		<td bgcolor="orange">글유형</td><td align="left">
		<select name="board_type">
			<option value="전체">전체</option>
			<option value="제품문의">제품문의</option>
			<option value="주문/결제">주문/결제</option>
			<option value="배송안내">배송안내</option>
			<option value="교환/환불">교환/환불</option>
			<option value="회원정보">회원정보</option>
			<option value="피부테스트">피부테스트</option>
			<option value="기타">기타</option>
			</select>
	</tr>
	
	<tr>
		<td bgcolor="orange" width="70">제목</td><td align="left">
		<input type="text" name="board_title"/></td>
	</tr>
	<tr>
		<td bgcolor="orange">내용</td><td align="left">
		<textarea type="text" name="board_content" size="10"/></textarea></td>
	</tr>
	<tr>
		<td bgcolor="orange">답변상태</td><td align="left">
		<input type="text" name="board_state" disabled /></td>
	</tr>
	<tr>
		<td bgcolor="orange" width="70">회원아이디</td><td align="left">
		<input type="text" name="userid" value="${member.userid}" readonly/></td>
	</tr>
	
	<tr>
		<td colspan="2" align="center">
		<input type="submit" id="btn_save" value="등록하기 " onclick="next()"/></td>
	</tr>
	
	<input type="hidden" name="board_name" value="${member.board_name}"/>
	<input type="hidden" name="pronum" value="${member.pronum}"/>
</table>
</form>
</div>
<script type='text/javascript'>

function next() {
    alert("등록되었습니다.")
 }

</script>
</body>
</html>
