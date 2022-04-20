<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=3.0">
    <title>MCS</title>
    <link rel="stylesheet" href="/css/sang.css">
    <style type="text/css"></style>
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
    <script src='https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js'></script>
    <script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js'></script>

</head>

<body>
    <header>
        <div><img src="/image/MCS.png" onclick="location.href='/home'"></div>
        <nav role="navigation">
            <ul id="main-menu">
                <li><a href="#">유형별</a>
                    <ul id="sub-menu">
                        <li><a href="#" aria-label="subemnu">팩/마스크</a></li>
                        <li><a href="#" aria-label="subemnu">스킨케어</a></li>
                        <li><a href="#" aria-label="subemnu">클렌징</a></li>
                    </ul>
                </li>
                <li><a href="#">
                        라인별</a>

                </li>
                <li><a href="#">테마샵</a>

                </li>
                <li><a href="#">베스트</a>

                </li>
                <li><a href="#">핫딜</a>

                </li>
            </ul>
        </nav>
    </header>

    <section class="card">
        <main>
          

            <div class="top-section">
                <img id="image-container" src="/images/${product.files.file_name}" alt="">
            </div>
        </main>

        <container>
        <fmt:parseNumber var= "salePrice" integerOnly= "true" value= "${product.price-(product.price*product.sale/100)}"/>
            <h3>${product.pro_name}</h3>
            <h4>${product.sale}%<br><ins>${salePrice}원</ins> <- <del>${product.price}원</del></h4>
            
            <form action="/product/orderview" method="post" class="order_form">
                <select id="selectCount" onChange="countSelect();">
                    <option>[필수] 수량을 선택해주세요</option>
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                </select>
                <input type="hidden" name="productCount" id="count" >
                <input type="hidden" name="pronum" value="${product.pronum}">
            </form>
            <form action="/cart/" method="post" class="cart_form">
                <input type="hidden" name="count" id="count2">
                <input type="hidden" name="pronum" value="${product.pronum}">
            </form>
            
            <button class="btn_buy">결제하기</button>
<!--             <input type="button" class="btn_buy" value="결제하기">결제하기</button> -->
            <button class="btn_cart">장바구니</button>
            
            <div class="accordion-box">
                <ul class="list">
                    <li>
                        <p class="title">화장품 제품의 특징 및 주의사항</p>
                        <div class="con">
                            <p>· 먹지 마십시요.</p>
                            <p>· 너무 뜨거운데 근처에 두지 마십시오.</p>
                        </div>
                    </li>
                    <li>
                        <p class="title">각질 케어 사용 방법</p>
                        <div class="con">
                            <p>· 발 바닥 주변을 천천히 문지르듯 발라주세요.</p>


                        </div>
                    </li>

                    <li>
                        <p class="title">제품관리 TIP</p>
                        <div class="con">하루에 한번씩 만 사용하시는게 좋습니다.
                        </div>
                    </li>
                </ul>
            </div>
            <p><span class="bold">배송기간</span> 약 4일&nbsp;&nbsp;&nbsp; <span class="bold">배송비</span> 무료배송&nbsp;&nbsp;&nbsp; <span class="bold">배송방법</span>
        </container>

        <script>
            var container = document.getElementById("image-container");

            function change_img(image) {
                container.src = image.src;
            }

        </script>
    </section>
    <article class="two">
        <h3>함께 볼 제품 추천</h3>
       	<section>
			<div>
				<img src="image/product1.jpg">
				<h5>하이드라 아쿠아 캡슐 에센스 50ml</h5>
				<span class="red">43,000원</span>
			</div>
			<div>
				<img src="image/product2.jpg">
				<h5>하이드라 아쿠아 에센스 핏 마스크 10P</h5>
				<span class="red">40,000원</span>
			</div>
			<div>
				<img src="image/product3.jpg">
				<h5>하이드라 아쿠아 워터리 젤 크림 50ml</h5>
				<span class="red">35,000원</span>
			</div>
			<div>
				<img src="image/product4.jpg">
				<h5>하이드라 아쿠아 컴포팅 에멀전 150ml</h5>
				<span class="red">32,000원</span>
			</div>
		</section>
    </article>
    <article class="plus">
        <div>
            <div>
                <h5><span class="red plus_btn" id="red-1">상세정보</span></h5>
                <h5><span class="blue plus_btn" id="blue-1">원료정보</span></h5>
                <h5><span class="green plus_btn" id="green-1">구매정보</span></h5>
                <h5><span class="black plus_btn" id="black-1">문의</span></h5>
            </div>
        </div>
<!--         <div> -->
<!--         </div> -->
        <div class="red-1 plus_show">
            <h2>
                <h6><img src="images/${product.files.file_name}"></h6>
            </h2>


        </div>
        <div class="blue-1 plus_show">
            <h2>
                <h6>${product.ingredients}</h6>
            </h2>


        </div>
        <div class="green-1 plus_show">
            <h7>
                <table style="width:100%;">
                    <tr>
                        <th>용량 또는 중량</th>
                        <td>${product.pro_stock}</td>

                    </tr>
                    <tr>
                        <th>사용기한</th>
                        <td>${product.expiration}</td>

                    </tr>
                    <tr>
                        <th>사용방법</th>
                        <td>${product.skill}</td>

                    </tr>
                    <tr>
                        <th>화장품제조업자</th>
                        <td>${product.manufacturer}</td>
                    <tr>
                        <th>제조국</th>
                        <td>${product.made}</td>
                    <tr>
                        <th>사용할 때 주의사항</th>
                        <td>${product.spec}</td>
                    <tr>
                        <th>품질보증기준</th>
                        <td>본 상품에 이상이 있을 경우 공정거래 위원회 고시 "소비자 분쟁해결 기준"에 의해 보상해 드립니다.</td>
                    <tr>
                       <th>소비자 상담 관련 전화번호</th>
                        <td>1811-9415</td>
                    <tr>
                        <th>기능성 화장품의 경우 화장품법에 따른 식품의약품안전처 심사 필 유무</th>
                        <td>해당 없음</td>
                    <tr>
                        <th>제품 주요 사양</th>
                        <td>모든피부</td>
                    <tr>
                </table>
            </h7>
        </div>
         <!-- <div class="black-1 plus_show"> -->
        <div class="black-1 plus_show">
                    <h3><b>Q&ampA</b></h3>

                    <div class="in1">
                        <p>
                            구매하시려는 상품에 대해 궁금한 점이 있으신 경우 문의해주세요.<br>
                            작성한 문의는 [마이페이지] → 1:1 문의 에서도 확인 가능합니다.
                        </p>
                        <button type="button" onclick="location.href='/board/insertBoard?pronum=${product.pronum}'">글 작성하기</button>            
                               
                    </div>

                    <article class="faq">
                        <div>

                            <section class="aa">
                                <div>
                                </div>
                            </section>

                            <div class="tab_container">
                                <h3 class="d_active tab_drawer_heading" rel="tab1"></h3>
                                <div id="tab1" class="tab_content">
                                    <section class="ee">
										
                                        <div class="e1">
                                            <table class="list">
                                                <tr>
                                                <td>NO</td>
                                                <td>글유형</td>
                                                <th style="padding-right:45px;">제목</th>
                                                <td style="padding-right:45px;">답변상태</td>
                                                <td>작성일자</td>
                                                <td>작성자</td>
                                                </tr>
                                            </table>
                                        </div>     
                                    </section>

                                   <c:forEach var="board" items="${boardList}">	
                                    <section class="ff">

                                        <details>
                                            <summary>
                                                <a>${board.boardnum}</a>
                                                <a>${board.board_type}</a>
                                                <a>${board.board_title}</a>
                                                <a>${board.board_state}</a>
                                                <a>${board.logtime}</a>
                                                <a>${board.userid}</a>
                                                <input type="hidden" name="pronum" value="${board.pronum}"/>
<%--                                                <button onclick="location.href='/getBoard?boardnum=${board.boardnum}'">수정하기</button> --%>
                                            </summary>
                                            <p>${board.board_content}</p>
                                            <p>답변 :: </p>
                                            
                                           
                                        </details>
                                    </section>
                                    
                                                </c:forEach>
                                </div>

                                <!-- #tab1 -->

                            </div>
                            <!-- .tab_container -->
                        </div>
                    </article>
                </div>
    </article>

<!--     <article class="plus2"> -->
<!--         <div></div> -->
<!--     </article> -->

	<script>
		// 이메일 주소 선택 - 자동입력 기능
		function countSelect() {
			$('#count').val($('#selectCount').val())
			$('#count2').val($('#selectCount').val()) 
		}
		
		/* 바로구매 버튼 */
		$(".btn_buy").on("click", function(){
			alert("바로구매");
			$(".order_form").submit();
		});
		//장바구니 버튼
		$(".btn_cart").on("click", function(){
				
	    	$(".cart_form").submit();
		});
		
/* 		function moveOrder(){
			const count = $('#_count1').val();
			location.href="/productOrder?pronum=${product.pronum}&order_stack="+(count);
		} */
		
	</script>

    <script>
        $(function() {
            $(".red-1").css({
                display: "block"
            });
            $(".plus_btn").click(function() {
                var cname = $(this).attr("id");
                $(".plus_show").css({
                    display: "none"
                });
                $("." + cname).css({
                    display: "block"
                });
            })
        })

    </script>


    <footer>
        <div class="foo">
            <section>
                <div>
                    <p>(주)MCS</p>
                    <p>대표이사: 곽민지</p>
                    <p>대표전화: 1551-4490</p>
                    <p>저작권보호방침</p>
                </div>
                <div>
                    <p>SITEMAP</p>
                    <p>CONTACT</p>
                </div>
            </section>
            <section>
                © 2022 Medical Cosmetic Skin
            </section>
        </div>
    </footer>


</body>

</html>