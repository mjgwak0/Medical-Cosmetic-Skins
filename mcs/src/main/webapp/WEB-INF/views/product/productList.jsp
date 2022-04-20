<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/css/main.css">
    <!-- 제이쿼리 불러오기 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <!-- 폰트어썸 불러오기 -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

    <!-- owl 캐러셀 불러오기 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/owl.carousel.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.theme.default.min.css">

</head>
<body>
    <div class="top-bar con row">
        <div class="logo"><img src="/image/MCS.png" onclick="location.href='/home'"></div>
        <div class="search-box">
            <input type="text">
            <div class="btn_search"></div>
            <div class="sub">
                <div class="populer">
                    <div class="h1">인기검색어</div>
                    <ul class="row">
                        <li class="cell"><a href="#">#유병찬바보</a></li>
                        <li class="cell"><a href="#">#스킨</a></li>
                        <li class="cell"><a href="#">#로션</a></li>
                        <li class="cell"><a href="#">#썬크림</a></li>
                        <li class="cell"><a href="#">#미스트</a></li>
                        <li class="cell"><a href="#">#기타등등</a></li>
                    </ul>
                </div>
            </div>
        </div>
        
<!--         권한별 헤더 링크 begin -->
		<sec:authorize var="loggedIn" access="isAuthenticated()" />
		<ul class="menu cell-right row">
			<c:choose>
				<c:when test="${loggedIn}">
					<sec:authorize access="isAuthenticated()">
						<li class="cell"><font color="red"><sec:authentication property="principal.username"/></font>님</li>
		
							<sec:authorize access="hasRole('GUEST')">
								<li class="cell"><a href="/logout" method="get">로그아웃</a></li>
								<li class="cell"><a href="/emailConfirm" method="get">인증하기</a></li>
							</sec:authorize>
			
							<sec:authorize access="hasRole('USER')">
								<li class="cell"><a href="/logout" method="get">로그아웃</a></li>
            					<li class="cell"><a class="order" href="/mypage/orderList">주문/배송조회</a></li>
           						<li class="cell"><a class="bucket" href="/cart/cartList">장바구니</a></li>
							</sec:authorize>
			
							<sec:authorize access="hasRole('MANAGER')">
								<li class="cell"><a href="/logout" method="get">로그아웃</a></li>
								<li class="cell"><a href="/addproductForm" method="get">상품등록</a></li>
								<li class="cell"><a href="/company/ProductList" method="get">상품리스트</a></li>
							</sec:authorize>
			
					</sec:authorize>
				</c:when>
         
				<c:otherwise>
					<sec:authorize access="isAnonymous()">
            			<li class="cell"><a class="login" href="/loginForm">로그인</a></li>
            			<li class="cell"><a class="join" href="/signupForm">회원가입</a></li>
					</sec:authorize>
				</c:otherwise>
			</c:choose>
		</ul>
	<!-- 권한별 헤더 링크 end -->
    </div>

    <div class="top-menu-bar">
        <nav class="top-menu con row">
            <ul class="menu-1 cell row">
                <li class="cell sub-menu-height-389">
                    <button href="#" class="btn-category">카테고리</button>
                    <div class="sub-menu-part sub-menu-bg"></div>
                    <div class="sub-menu-part sub-menu-base sub-menu-base-width-100-percent">
                        <div class="con sub-menu-base-con relative">
                            <ul class="row menu-1-1">
                                <li class="cell row">
                                    <ul class="cell menu-1-1-1">
                                        <li class="on">
                                            <a class="on-1" href="#">유형별</a>
                                            <ul class="side-menu">
                                                <li class="on"><a href="#">아이</a></li>
                                                <li><a href="#">립</a></li>
                                                <li><a href="#">페이스</a></li>
                                                <li><a href="#">네일</a></li>
                                                <li><a href="#">스킨케어</a></li>
                                                <li><a href="#">팩/마스크</a></li>
                                                <li><a href="#">클렌징</a></li>
                                                <li><a href="#">바디/헤어</a></li>
                                                <li><a href="#">화장소품</a></li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a class="on-2" href="#">라인별</a>
                                            <ul class="side-menu">
                                                <li class="on"><a href="#">해피위드 피글렛</a></li>
                                                <li><a href="#">더 잠</a></li>
                                                <li><a href="#">플레이 컬러 아이즈</a></li>
                                                <li><a href="#">순정</a></li>
                                                <li><a href="#">수분가득콜라겐</a></li>
                                                <li><a href="#">원더포어</a></li>
                                                <li><a href="#">플레이101</a></li>
                                                <li><a href="#">AC클린업</a></li>
                                            </ul>
                                            <div class="banner">
                                                <a href="#">
                                                    <img src="https://images-kr.etudehouse.com/fileupload/display/EH01/prod_lines/ko/2018/12/31/카데고리 고정배너_310_390.png" alt="">
                                                </a>
                                            </div>
                                            <div class="banner-2">
                                                <a href="#">
                                                    <img src="https://images-kr.etudehouse.com/fileupload/display/EH01/prod_types/ko/2018/12/31/카데고리 롤링배너_425_390.png" alt="">
                                                </a>
                                            </div>
                                        </li>
                                        <li>
                                            <a class="on-3" href="#">테마샵</a>
                                            <ul class="side-menu">
                                                <li class="on"><a href="#">온라인전용</a></li>
                                                <li><a href="#">달달템샵</a></li>
                                                <li><a href="#">뷰티포인트샵</a></li>
                                                <li><a href="#">진주알스토어</a></li>
                                            </ul>
                                            <div class="banner-3">
                                                <a href="#">
                                                    <img src="https://images-kr.etudehouse.com/fileupload/display/EH01/prod_thema/ko/2018/11/30/카데고리 고정배너_310_390.png" alt="">
                                                </a>
                                            </div>
                                            <div class="banner-4 carousel-3">
                                                <ul class="owl-carousel owl-theme">
                                                    <li class="item">
                                                        <a href="#"><img src="https://images-kr.etudehouse.com/fileupload/display/EH01/prod_thema/ko/2018/11/30/카데고리 롤링배너_425_390.png" alt=""></a>
                                                    </li>
                                                    <li class="item">
                                                        <a href="#"><img src="https://images-kr.etudehouse.com/fileupload/display/EH01/prod_thema/ko/2018/10/30/테마샵_롤링배너2_1540885884937.jpg" alt=""></a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>
            </ul>
            <ul class="cell row" style="padding-left: 20px">
                <li class="cell"><a href="/product/productList">전체상품</a></li>
                <li class="cell"><a href="#">베스트</a></li>
                <li class="cell" id="baumann"><a href="/baumann/baumannTest">바우만 테스트</a></li>
            </ul>
            
        </nav>
    </div>
    <!-- 바디 시작 -->
    
    <!-- 바디 상단 베스트 상품 리스트 -->
	<div class="best con">
		<div class="title">베스트</div>
		<!-- <div class="more">더보기</div> -->
		<div class="recommend_items">
			<ul class="row my-1 owl-carousel owl-theme">
			<c:forEach var="bestItem" items="${bestProduct}">
				<li class="cell">
					<div class="item">
						<div class="image-box">
							<a href="/productInfo?pronum=${bestItem.pronum}"><img src="/images/${bestItem.files.file_name}"></a>
						</div>
						<div class="info-box">
							<div class="title-area">
								<div class="name">${bestItem.pro_name}</div>
							</div>
							<div class="price-area">
								<div class="discount">
									<strong class="to">${bestItem.sale}</strong>
								</div>
								<div class="price">
									<fmt:formatNumber value= "${bestItem.price-(bestItem.price*bestItem.sale/100)}" pattern="#,###" />원 
									<- <del><fmt:formatNumber value= "${bestItem.price}" pattern="#,###"/></del>
								</div>
							</div>
						</div>
					</div>
				</li>
			</c:forEach>
			</ul>
			
			<!-- 일반 제품 리스트 -->
			<ul class="row my-1">
			
				<c:forEach var="product" items="${product}">
				<li class="cell">
					<div class="item">
						<div class="image-box">
							<a href="/productInfo?pronum=${product.pronum}"><img src="/images/${product.files.file_name}"></a>
						</div>
						<div class="info-box">
							<div class="title-area">
								<div class="name">${product.pro_name}</div>
							</div>
							<div class="price-area">
								<div class="discount">
									<strong class="to">${product.sale}</strong>
								</div>
								<div class="price">
									<fmt:formatNumber value= "${product.price-(product.price*product.sale/100)}" pattern="#,###" />원 
									<- <del><fmt:formatNumber value= "${product.price}" pattern="#,###"/></del>
								</div>
							</div>
						</div>
					</div>
				</li>
				</c:forEach>
				<!-- 여기까지 제품 리스트 끝! -->
			</ul>
			
		</div>
	</div>

	<footer>
		<div>
			<section>
				<p class="a">
					<b>M</b>edical <b>C</b>osmetic <b>S</b>kin
				</p>
				<ul>
					<li><img src="image/building.png"> 서울시 송파구 오금로 311
						(오금동45-1)</li>
					<li><img src="image/tel.png"> <a href="#">1577-5670</a>
						/ 평일 09:30 ~ 17:30</li>
					<li><img src="image/operator.png">
						<button>카톡상담</button>
						<button>틱톡상담</button></li>
				</ul>

				<div class="icon">
					<img src="image/instagram.png" alt="인스타"> <img
						src="image/facebook.png" alt="페북"> <img src="image/blog.png"
						alt="블로그">
				</div>
			</section>

			<section>
				<h5>ABOUT</h5>
				<ul>
					<li>회사소개</li>
					<li>매장안내</li>
					<li>인재채용</li>
				</ul>
			</section>

			<section>
				<h5>SUPPORT</h5>
				<ul>
					<li>고객센터</li>
					<li>대리점 개설안내</li>
				</ul>
			</section>

			<section>
				<h5>INFO</h5>
				<ul>
					<li>이용약관</li>
					<li>개인정보 처리방침</li>
				</ul>
			</section>

			<section>
				<h5>MCS</h5>
				<ul>
					<li>개인정보보호 책임자 : 대표이사 곽민지</li>
					<li>사업자등록번호 : 123-45-67890</li>
					<li>통신판매업신고 : 2022-서울송파-0009호9</li>
					<li>부가통신사업신고필증 : 02550</li>
				</ul>
			</section>

		</div>
	</footer>
	<article class="foo2">
        <div>
            <p> webmaster@mcs.com·Copyright (c) 2022 mcs lnc. All rights reserved</p>
            <div class="icon2">
                <img src="image/mark1.png">
                <img src="image/mark2.png">
                <img src="image/mark3.png">
            </div>
        </div>
    </article>

    <script>
        $('.ix-list-viewport').mouseenter(function() {
            $(this).attr('data-now-work', 'Y');
        });
        $('.ix-list-viewport').mouseout(function() {
            $(this).attr('data-now-work', 'N');
        });

        function doroop() {
            var $box = $('.ix-list-viewport');

            if ($box.attr('data-now-work') != 'Y') {
                var $current = $box.find('li.active');
                var $post = $current.next();

                if ($post.length == 0) {
                    $post = $current.parent().find('>li:first-child');
                }
           
					$current.removeClass('active');
							$post.addClass('active');
						}
						setTimeout(doroop, 2000);
					}
					doroop();

					// $ => 포장하다.
					$('.sbs-slider > .side-bars > div').click(function() {
						// this 클릭 당사자
						var $clickedBtn = $(this);
						// closest => 조상중에서 가장 가까운 엘리먼트 하나 찾아주세요.
						var $slider = $clickedBtn.closest('.sbs-slider');
						//.index() => 형제번호
						var isLeft = $clickedBtn.index() == 0;
						// find => 지역탐색
						// $currnet => 현재 active 된 녀석
						var $currnet = $slider.find('.slides > .active');
						// next => 다음 형제 가져와
						var $post = null;
						if (isLeft) {$post = $currnet.prev();
							} else {$post = $currnet.next();
								}if ($post.length == 0) {
									if (isLeft) {$post = $slider.find('.slides > div:last-child');
										} else {$post = $slider.find('.slides > div:first-child');
											}
								}
							$currnet.removeClass('active');
							$post.addClass('active');
						});

					function applyOwlCustom1(className) {
						var owl = $(className + ' > .owl-carousel')
								.owlCarousel(
										{
											autoplay : true,
											autoplayTimeout : 5000,
											loop : true,
											margin : 0,
											nav : true,
											navText : [
													'<i class="fas fa-angle-left"></i>',
													'<i class="fas fa-angle-right"></i>' ],
											items : 1
										});

						$(className + ' .play').on('click', function() {
							owl.trigger('play.owl.autoplay', [ 2000 ])
						})

						$(className + ' .stop').on('click', function() {
							owl.trigger('stop.owl.autoplay');
						})

						owl.on('stop.owl.autoplay', function(event) {
							$(className + ' .control-box > ul > li.stop-or-play-btn').removeClass('now-playing');
							});

						owl.on('play.owl.autoplay', function(event) {
							$(className + ' .control-box > ul > li.stop-or-play-btn').addClass('now-playing');
							});

						owl.on('changed.owl.carousel', function(event) {
							owl.trigger('play.owl.autoplay', [ 2000 ]);
						});

						owl.on('translated.owl.carousel', function(e) {
							var index = null;
							if (e.item) {
								var index = e.item.index - 1;
								var count = e.item.count;
								if (index > count) {
									index -= count;
								}
								if (index <= 0) {
									index += count;
								}
							}
							$(className + ' .control-box > ul > li > .current-no').empty().append(index);
							});

						$(className + ' .control-box > ul > li > .total-no')
								.empty()
								.append(
										$(className + ' .owl-item:not(.cloned)').length);
						$('.prev').on('click', function() {
							owl.trigger('prev.owl.carousel')
						});
						$('.next').on('click', function() {
							owl.trigger('next.owl.carousel')
						});
					}

					applyOwlCustom1('.carousel-1');
					applyOwlCustom1('.carousel-2');
					applyOwlCustom1('.carousel-3');

					$('.best > .recommend_items .owl-carousel').owlCarousel({
						loop : true,
						margin : 10,
						nav : true,
						navText : [ '&nbsp;', '&nbsp;' ],
						responsive : {
							0 : {
								items : 1
							},
							600 : {
								items : 2
							},
							1000 : {
								items : 4
							}
						},
						autoplay : false, // 오토 플레이 켜기
						autoplayTimeout : 1000, // 오토 플레이 주기
						autoplayHoverPause : true
					// 마우스 올리면 멈추게하기
					})
					$('.today > .hot-deal .owl-carousel').owlCarousel({
						loop : true,
						margin : 10,
						nav : true,
						navText : [ '&nbsp', '&nbsp' ],
						responsive : {
							0 : {
								items : 1
							},
							500 : {
								items : 2
							},
							1000 : {
								items : 2
							}
						},
						autoplay : false, // 오토 플레이 켜기
						autoplayTimeout : 1000, // 오토 플레이 주기
						autoplayHoverPause : true
					// 마우스 올리면 멈추게하기
					})
					$('.family_site').click(function() {
						$(this).toggleClass('active');
					})
					$('.menu-1-1-1 > li').mouseenter(function() {
						$(this).siblings('.on').removeClass('on');
						$(this).addClass('on');
					});
					$('.menu-1-1-1 > li > ul >li').mouseenter(function() {
						$(this).siblings('.on').removeClass('on');
						$(this).addClass('on');
					});
					
					// 상단바
					$('.btn-category').click(function() {
						if ($('.sub-menu-part').hasClass('active')) {
							$('.sub-menu-part').removeClass('active');
						} else {
							$('.sub-menu-part').addClass('active');
						}
						return false;
					});

					$('.sub-menu-part').click(function() {
						return false;
					});

					$('body').click(function() {
						$('.sub-menu-part').removeClass('active');
					});

		</script>
</body>

</html>
