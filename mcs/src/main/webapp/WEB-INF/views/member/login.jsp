<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="result" value="${param.result }" />
<%
	request.setCharacterEncoding("UTF-8");
%>
<!doctype html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<title>MCS 로그인</title>

<link rel="stylesheet" type="text/css" href="/css/login.css">


</head>
<body>

	<section class="container">
		<article class="half">
			<h1>MCS</h1>
			<div class="tabs">
				<span class="tab signin active"><a href="#signin">일반 로그인</a></span>
				<span class="tab signup"><a href="#signup">기업 로그인</a></span>
			</div>
			<div class="content">
                <div class="signin-cont cont">
                    <form action="login" method="post" enctype="multipart/form-data">
                        <input type="ID" name="username" class="inpt" required="required" placeholder="Id">
                        <input type="password" name="password" id="password" class="inpt" required="required" placeholder="password">

                        <input type="checkbox" id="remember" class="checkbox" checked>
                        <label for="remember">Remember me</label>
                        <div class="submit-wrap">
                            <input type="submit" value="로그인" class="submit">
                            <a href="/memberForm" class="more">회원가입</a>
                        </div>
                    </form>
                </div>
                <div class="signup-cont cont">
                    <form action="#" method="post" enctype="multipart/form-data">
                        <input type="ID" name="id" id="id" class="inpt" required="required" placeholder="ID">

                        <input type="password" name="password" id="password" class="inpt" required="required" placeholder="password">


                        <div class="submit-wrap">
                            <input type="submit" value="로그인" class="submit">
                            <a href="#" class="more">Terms and conditions</a>
                        </div>
                    </form>
                </div>
            </div>
		</article>
		<div class="half bg"></div>
	</section>



	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script type="text/javascript">
		$('.tabs .tab').click(function() {
			if ($(this).hasClass('signin')) {
				$('.tabs .tab').removeClass('active');
				$(this).addClass('active');
				$('.cont').hide();
				$('.signin-cont').show();
			}
			if ($(this).hasClass('signup')) {
				$('.tabs .tab').removeClass('active');
				$(this).addClass('active');
				$('.cont').hide();
				$('.signup-cont').show();
			}
		});
		$('.container .bg').mousemove(
				function(e) {
					var amountMovedX = (e.pageX * -1 / 30);
					var amountMovedY = (e.pageY * -1 / 9);
					$(this).css('background-position',
							amountMovedX + 'px ' + amountMovedY + 'px');
				});
	</script>
</body>
</html>
