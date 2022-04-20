<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=3.0">


    <meta name="viewport" content="width=device-width, initial-scale=1">


    <title>MCS</title>
    <link rel="stylesheet" href="/css/ods2.css">
    <style type="text/css"></style>
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript" src="script.js"></script>
    <script type="text/javascript"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <style src="https://googledrive.com/host/0B1RR6fhjI2QROGt0MTFoVkhMdUk/fonts.css"></style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://kenwheeler.github.io/slick/slick/slick.js"></script>

</head>

<body>


    <main>
        <header>

            <div onclick="window.location.href='#'">
                <h1 class="rowoo">MCS</h1>
            </div>

            <div id="ham-btn">
                <div class="ham-btn-line"></div>
                <div class="ham-btn-line"></div>
                <div class="ham-btn-line"></div>
            </div>

            <nav id="ham" class="ham">
                <ul>
                    <li><a href="#">MAIN</a></li>
                    <li><a href="#">피부유형테스트</a></li>
                    <li><a href="#">내 피부 타입은?</a></li>
                    <li><a href="#">MY SKIN HIS</a></li>

                </ul>

                <script>
                    $("#ham").hide();

                    $("#ham-btn").click(function() {
                        $("#ham").slideToggle();
                    });

                </script>
            </nav>

            <nav class="chan0">
                <ul>
                    <li><a href="#"><span>제품관리</span></a>

                    </li>
                    <li><a href="#"><span>주문관리</span></a>

                    </li>
                    <li><a href="#"><span>게시판</span></a>

                    </li>
                    <li><a href="#"><span>제품추천</span></a>

                    </li>


                </ul>
            </nav>
        </header>

		<c:forEach var="product" items="${product}">
        <div class="products-list con row">
            <h2>제품 등록</h2>
            <div class="content cell">

                <div class="img-box">

                    <img src="image/amal/${product.filenum}">
                </div>
                <div class="text-box">

                    <c:out value="가격 ${product.price}"/> <br>
                    <c:out value="가격 ${product.price}"/> <br>
                    <c:out value="가격 ${product.price}"/> 
                </div>
		</c:forEach>
		
		
            </div>
            <div class="content cell">

                <div class="img-box">

                    <img src="image/clean/main1.jpg" alt="">
                </div>
                <div class="text-box">
                    가격 <br>
                    성능 <br>
                    정보
                </div>

            </div>
            <div class="content cell">

                <div class="img-box">

                    <img src="image/cream/main1.jpg" alt="">
                </div>
                <div class="text-box">
                    가격<br>
                    성능<br>
                    정보
                </div>

            </div>
            <div class="content cell">

                <div class="img-box">

                    <img src="image/esseen/main1.jpg" alt="">
                </div>
                <div class="text-box">
                    가격<br>
                    성능<br>
                    정보
                </div>

            </div>

            <div class="content cell">

                <div class="img-box">

                    <img src="image/filling.script/main1.jpg" alt="">
                </div>
                <div class="text-box">
                    가격<br>
                    성능<br>
                    정보
                </div>

            </div>
            <div class="content cell">

                <div class="img-box">

                    <img src="image/sun/main1.jpg" alt="">
                </div>
                <div class="text-box">
                    가격<br>
                    성능<br>
                    정보
                </div>

            </div>
            <div class="content cell">

                <div class="img-box">

                    <img src="image/sun/main2.jpg" alt="">
                </div>
                <div class="text-box">
                    가격<br>
                    성능<br>
                    정보
                </div>

            </div>
            <div class="content cell">

                <div class="img-box">

                    <img src="image/tonor.mist/main1.jpg" alt="">
                </div>
                <div class="text-box">
                    가격<br>
                    성능<br>
                    정보
                </div>

            </div>

            <div class="content cell">

                <div class="img-box">

                    <img src="image/hand.jpg"
                         alt="">
                </div>
                <div class="text-box">
                    가격<br>
                    성능<br>
                    정보
                </div>

            </div>
            <div class="content cell">

                <div class="img-box">

                    <img src="image/jjon.jpg" alt="">
                </div>
                <div class="text-box">
                    가격<br>
                    성능<br>
                    정보
                </div>
            </div>
            <div class="content cell">

                <div class="img-box">

                    <img src="image/maskara.jpg" alt="">
                </div>
                <div class="text-box">
                    가격<br>
                    성능<br>
                    정보
                </div>

            </div>
            <div class="content cell">

                <div class="img-box">

                    <img src="image/real.jpg" alt="">
                </div>
                <div class="text-box">
                    가격<br>
                    성능<br>
                    정보
                </div>

            </div>
        </div>
        <div class="button_pro" id="button">
            <form action='login_page.php'>
                <li><a href="ordersang.html" input type='button' value='제품등록' onclick='alert("확인")'><span>제품등록</span></a></li>
                </form>
        </div>
                
        <div class="footer"></div>

    </main>



</body>

</html>