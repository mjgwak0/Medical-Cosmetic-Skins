<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/css/productList.css">

    <!-- 제이쿼리 불러오기 
        -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <!-- 폰트어썸 불러오기 -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

    <!-- owl 캐러셀 불러오기 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/owl.carousel.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.theme.default.min.css">

</head>

<body>
    <!--
    
    <div class="top-banner">
        <span class="banner">
            <div class="txt">MY SHOP 등록하고 옴니클럽 혜택 받으세요</div>
            <a href="#">자세히보기</a>
        </span>
    </div>
-->

    <div class="top-bar con row">
        <div class="logo"><img src="" alt=""></div>
        <div class="search-box">
            <input type="text">
            <div class="btn_search"></div>
            <div class="sub">
                <div class="populer">
                    <div class="h1">인기검색어</div>
                    <ul class="row">
                        <li class="cell"><a href="#">#수분팩</a></li>
                        <li class="cell"><a href="#">#스킨</a></li>
                        <li class="cell"><a href="#">#로션</a></li>
                        <li class="cell"><a href="#">#썬크림</a></li>
                        <li class="cell"><a href="#">#미스트</a></li>
                        <li class="cell"><a href="#">#기타등등</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <ul class="menu cell-right row">
            <li class="cell"><a class="login" href="#">로그인</a></li>
            <li class="cell"><a class="join" href="#">회원가입</a></li>
            <li class="cell"><a class="order" href="#">주문/배송조회</a></li>
            <li class="cell"><a class="bucket" href="#">장바구니</a></li>
            <li class="cell"><a class="history" href="#">히스토리</a></li>
        </ul>
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
            <ul class="cell row">
                <li class="cell"><a href="#">신상품</a></li>
                <li class="cell"><a href="#">베스트</a></li>
                <li class="cell"><a href="#">핫딜</a></li>
                <!--                <li class="cell"><a href="#">이벤트</a></li>-->
                <li class="cell"><a href="#">마이샵</a></li>
                <!--
                <li class="cell"><a href="#">채널에뛰드</a></li>
                <li class="cell"><a href="#">LOOKS</a></li>
-->
                <li class="cell"><a href="#">브랜드</a></li>
            </ul>
            <div class="weekly-best cell-right">
                <div class="dt">주간베스트</div>
                <div class="dd">
                    <div class="slide ix-slide-max-apply">
                        <!-- handlebars:header/weekly-best-list.hbs -->
                        <div class="ix-list-viewport">
                            <ul class="ix-list-items">
                                <li class="ix-list-item active">
                                    <a href="#">
                                        <strong class="num">1</strong>
                                        <span class="title">
                                            더잠 컬렉션 SET2(수면안대&amp;필로우미스트)
                                        </span>
                                    </a>
                                </li>
                                <li class="ix-list-item">
                                    <a href="#">
                                        <strong class="num">2</strong>
                                        <span class="title">
                                            더잠 컬렉션 SET1(핏크림&amp;헤어클렌징워터)
                                        </span>
                                    </a>
                                </li>
                                <li class="ix-list-item">
                                    <a href="#">
                                        <strong class="num">3</strong>
                                        <span class="title">
                                            순정 토너(80ml) &amp; 휩클렌저(150ml) 세트
                                        </span>
                                    </a>
                                </li>
                                <li class="ix-list-item">
                                    <a href="#">
                                        <strong class="num">4</strong>
                                        <span class="title">
                                            [런칭기념 특가 세트] 시카 밸런스 폼 클렌저+립앤아이 리무버+화장솜
                                        </span>
                                    </a>
                                </li>
                                <li class="ix-list-item">
                                    <a href="#">
                                        <strong class="num">5</strong>
                                        <span class="title">
                                            심플 미스트
                                        </span>
                                    </a>
                                </li>
                                <li class="ix-list-item">
                                    <a href="#">
                                        <strong class="num">6</strong>
                                        <span class="title">
                                            모던 옴므 부스팅 토너
                                        </span>
                                    </a>
                                </li>
                                <li class="ix-list-item">
                                    <a href="#">
                                        <strong class="num">7</strong>
                                        <span class="title">
                                            마이뷰티툴 섀도우 공용기 너츠 앤 후르츠
                                        </span>
                                    </a>
                                </li>
                                <li class="ix-list-item">
                                    <a href="#">
                                        <strong class="num">8</strong>
                                        <span class="title">
                                            3분케어 인 모닝 마스크
                                        </span>
                                    </a>
                                </li>
                                <li class="ix-list-item">
                                    <a href="#">
                                        <strong class="num">9</strong>
                                        <span class="title">
                                            3분케어 마스크
                                        </span>
                                    </a>
                                </li>
                                <li class="ix-list-item">
                                    <a href="#">
                                        <strong class="num">10</strong>
                                        <span class="title">
                                            탄산 톡 틴트 자판기 4종 세트
                                        </span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <!-- //handlebars:header/weekly-best-list.hbs -->
                    </div>
                </div>
            </div>
        </nav>
    </div>

    <div class="slideshow-container">

        <div class="mySlides fade">
            <div class="numbertext">1 / 3</div>
            <img src="image/slid(1).jpg" style="width:1500px" height="500px">
            <div class="text">1</div>
        </div>

        <div class="mySlides fade">
            <div class="numbertext">2 / 3</div>
            <img src="image/slid(3).jpg" style="width:1500px" height="500px">
            <div class="text">2</div>
        </div>

        <div class="mySlides fade">
            <div class="numbertext">3 / 3</div>
            <img src="image/slid(2).jpg" style="width:1500px" height="500px">
            <div class="text">3</div>
        </div>

        <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
        <a class="next" onclick="plusSlides(1)">&#10095;</a>

    </div>
    <br>

    <div style="text-align:center">
        <span class="dot" onclick="currentSlide(1)"></span>
        <span class="dot" onclick="currentSlide(2)"></span>
        <span class="dot" onclick="currentSlide(3)"></span>
    </div>


    <div class="clear con row">
        <div class="section recommend_tag cell" style="background:url('image/tonor.mist/main1.jpg')">
            <h2 class="title">진정 강한 토너 세트</h2>
            <div class="tag">
                <a href="#">#강하다</a>
                <a href="#">#진정성 있다</a>
                <a href="#">#누구든 사용 가능한 토너</a>

            </div>
        </div>
        <div class="section">

        </div>
    </div>
    <div class="channel con">
        <a href="#" class="more">더보기</a>
        <div class="clear">
            <div class="happy cell-right">
                <dt class="font_xl">화장품 추천</dt>
                <dd>
                    <ul>
                    
                    <!-- 추천 상품 목록 -->
                    <c:forEach items="${product}" var="product">
                        <li><a href="/productInfo?pronum=${product.pronum}">
                                <span><img src="images/${product.files.file_name}" data-src="image/filling.script/main1.jpg"></span>
                                <span>
                                    <div class="name">${product.pro_name}</div>
                                    <div class="price">${product.price}</div>
                                </span>
                            </a></li>
                    </c:forEach>
                    
                    </ul>
                </dd>
            </div>

        </div>
    </div>
    <div class="look con">
        <div class="title">시선강탈! 요즘뜨고있는 화장품</div>
        <div class="recommend_items">
            <ul class="row">
                <li class="cell">
                    <div class="item">
                        <div class="image-box" style="background:url(https://images-kr.etudehouse.com/upload/sapimg/650001446_CT_01.jpg)"><a href="#"><img src="https://images-kr.etudehouse.com/unitproducts/650001446/650001446_IM_01_208_208.png" alt=""></a></div>
                    </div>
                    <div class="info-box">
                        <div class="title-area">
                            <div class="name">러블리 쿠키 블러셔 NEW
                            </div>
                        </div>
                        <div class="item-option">
                            <div class="option">PP501 라벤더 쉬폰 케이크
                            </div>
                        </div>
                        <div class="price-area">
                            <div class="price">6,000</div>
                        </div>
                    </div>
                </li>
                <li class="cell">
                    <div class="item">
                        <div class="image-box" style="background:url(https://images-kr.etudehouse.com/fileupload/unitproducts/650001828/colorchip/5c9b808b-08ad-11e9-88a5-0a7fa82be1de.jpg)"><a href="#"><img src="https://images-kr.etudehouse.com/unitproducts/650001828/650001828_1_208_208.png?1545978972780" alt=""></a></div>
                    </div>
                    <div class="info-box">
                        <div class="title-area">
                            <div class="name">해피 위드 피글렛 룩 앳 마이 아이즈
                            </div>
                        </div>
                        <div class="item-option">
                            <div class="option">[쥬얼]PP513 토닥토닥 힘내요르
                            </div>
                        </div>
                        <div class="price-area">
                            <div class="price">5,500</div>
                        </div>
                    </div>
                </li>
                <li class="cell">
                    <div class="item">
                        <div class="image-box" style="background:url(https://images-kr.etudehouse.com/fileupload/unitproducts/650001834/colorchip/35f38694-08ac-11e9-88a5-0a7fa82be1de.jpg)"><a href="#"><img src="https://images-kr.etudehouse.com/unitproducts/650001834/650001834_1_208_208.png?1545978972780" alt=""></a></div>
                    </div>
                    <div class="info-box">
                        <div class="title-area">
                            <div class="name">해피 위드 피글렛 젤리 무스 블러셔
                            </div>
                        </div>
                        <div class="item-option">
                            <div class="option">PK001 뚝!그만 울을렛
                            </div>
                        </div>
                        <div class="price-area">
                            <div class="price">9,800</div>
                        </div>
                    </div>
                </li>
                <li class="cell">
                    <div class="item">
                        <div class="image-box" style="background:url(https://images-kr.etudehouse.com/upload/sapimg/20180430014012559.jpg)"><a href="#"><img src="https://images-kr.etudehouse.com/unitproducts/650001519/20180430014020760_208_208.png" alt=""></a></div>
                    </div>
                    <div class="info-box">
                        <div class="title-area">
                            <div class="name">플레이 컬러 아이 팔레트


                            </div>
                        </div>
                        <div class="item-option">
                            <div class="option">란제리 백스테이지


                            </div>
                        </div>
                        <div class="price-area">
                            <div class="price">29,500</div>
                        </div>
                    </div>
                </li>
                <li class="cell">
                    <div class="item">
                        <div class="image-box" style="background:url(https://images-kr.etudehouse.com/upload/sapimg/20180309162709544.jpg)"><a href="#"><img src="https://images-kr.etudehouse.com/unitproducts/650001421/20180309162725559_208_208.png" alt=""></a></div>
                    </div>
                    <div class="info-box">
                        <div class="title-area">
                            <div class="name">미러 홀릭 리퀴드 아이즈

                            </div>
                        </div>
                        <div class="item-option">
                            <div class="option">PK001 핑크 오너먼트
                            </div>
                        </div>
                        <div class="price-area">
                            <div class="price">11,000</div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <div class="best con">
        <div class="title">베스트</div>
        <div class="more">더보기</div>
        <div class="recommend_items">
            <ul class="row my-1 owl-carousel owl-theme">
                <li class="cell">
                    <div class="item">
                        <div class="image-box"><a href="#"><img src="https://images-kr.etudehouse.com/products/105006268/20180425192703786_270_270.png" alt=""></a></div>
                        <div class="info-box">
                            <span class="num">1</span>
                            <div class="title-area">
                                <div class="name">0.2 테라피 에어 마스크

                                </div>
                            </div>
                            <div class="item-option">
                                <div class="option">21 options
                                </div>
                            </div>
                            <div class="price-area">
                                <div class="discount">
                                    <strong class="to">50</strong>
                                </div>
                                <div class="price">500</div>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="cell">
                    <div class="item">
                        <div class="image-box"><a href="#"><img src="image/mis.jpg" alt=""></a></div>
                        <div class="info-box">
                            <span class="num">2</span>
                            <div class="title-area">
                                <div class="name">프리미엄 바디 미스트
                                </div>
                            </div>
                            <div class="price-area">
                                <div class="discount">
                                    <strong class="to">20</strong>
                                </div>
                                <div class="price">13,500</div>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="cell">
                    <div class="item">
                        <div class="image-box"><a href="#"><img src="https://images-kr.etudehouse.com/products/105001149/105001149_01_270_270.png?1547424941057" alt=""></a></div>

                        <div class="info-box">
                            <span class="num">3</span>
                            <div class="title-area">
                                <div class="name">순정 약산성 5.5 진정 토너
                                </div>
                            </div>
                            <div class="item-option">
                                <div class="option">3 options
                                </div>
                            </div>
                            <div class="price-area">
                                <div class="price">8,000</div>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="cell">
                    <div class="item">
                        <div class="image-box"><a href="#"><img src="image/maskara.jpg" alt=""></a></div>
                        <div class="info-box">
                            <span class="num">4</span>
                            <div class="title-area">
                                <div class="name">닥터 마스카라 픽서

                                </div>
                            </div>
                            <div class="item-option">
                                <div class="option">
                                </div>
                            </div>
                            <div class="price-area">
                                <div class="price">6,000</div>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="cell">
                    <div class="item">
                        <div class="image-box"><a href="#"><img src="image/hand.jpg" alt=""></a></div>
                        <div class="info-box">
                            <span class="num">5</span>
                            <div class="title-area">
                                <div class="name">In's mill

                                </div>
                            </div>
                            <div class="item-option">
                                <div class="option">3 options
                                </div>
                            </div>
                            <div class="price-area">
                                <div class="discount">
                                    <strong class="to">50</strong>
                                </div>
                                <div class="price">7,500</div>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="cell">
                    <div class="item">
                        <div class="image-box"><a href="#"><img src="image/real.jpg" alt=""></a></div>
                        <div class="info-box">
                            <span class="num">6</span>
                            <div class="title-area">
                                <div class="name">리얼아트 클렌징 오일 모이스처 NEW
                                </div>
                            </div>
                            <div class="item-option">
                                <div class="option">2 options
                                </div>
                            </div>
                            <div class="price-area">
                                <div class="price">10,800</div>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="cell">
                    <div class="item">
                        <div class="image-box"><a href="#"><img src="https://images-kr.etudehouse.com/products/650000000976/650000000976_01_270_270.png?1556151751898" alt=""></a></div>
                        <div class="info-box">
                            <span class="num">7</span>
                            <div class="title-area">
                                <div class="name">순정 수분 베리어 크림 기획세트
                                </div>
                            </div>
                            <div class="item-option">
                                <div class="option">
                                </div>
                            </div>
                            <div class="price-area">
                                <div class="price">20,000</div>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="cell">
                    <div class="item">
                        <div class="image-box"><a href="#"><img src="image/color.jpg" alt=""></a></div>
                        <div class="info-box">
                            <span class="num">8</span>
                            <div class="title-area">
                                <div class="name">플레이 컬러 아이즈 카페인 홀릭
                                </div>
                            </div>
                            <div class="item-option">
                                <div class="option">
                                </div>
                            </div>
                            <div class="price-area">
                                <div class="price">22,000</div>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="cell">
                    <div class="item">
                        <div class="image-box"><a href="#"><img src="image/sonjeong.jpg" alt=""></a></div>
                        <div class="info-box">
                            <span class="num">9</span>
                            <div class="title-area">
                                <div class="name">순정 10무 수분 에멀전
                                </div>
                            </div>
                            <div class="item-option">
                                <div class="option">2 options
                                </div>
                            </div>
                            <div class="price-area">
                                <div class="price">8,000</div>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="cell">
                    <div class="item">
                        <div class="image-box"><a href="#"><img src="image/ti.jpg" alt=""></a></div>
                        <div class="info-box">
                            <span class="num">10</span>
                            <div class="title-area">
                                <div class="name">티트리 컨트롤 2종 세트 </div>
                            </div>
                            <div class="item-option">
                                <div class="option">6 colors
                                </div>
                            </div>
                            <div class="price-area">
                                <div class="price">25,600</div>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>


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

            if (isLeft) {
                $post = $currnet.prev();
            } else {
                $post = $currnet.next();
            }

            if ($post.length == 0) {
                if (isLeft) {
                    $post = $slider.find('.slides > div:last-child');
                } else {
                    $post = $slider.find('.slides > div:first-child');
                }
            }

            $currnet.removeClass('active');
            $post.addClass('active');
        });

        function applyOwlCustom1(className) {
            var owl = $(className + ' > .owl-carousel').owlCarousel({
                autoplay: true,
                autoplayTimeout: 5000,
                loop: true,
                margin: 0,
                nav: true,
                navText: ['<i class="fas fa-angle-left"></i>', '<i class="fas fa-angle-right"></i>'],
                items: 1
            });

            $(className + ' .play').on('click', function() {
                owl.trigger('play.owl.autoplay', [2000])
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
                owl.trigger('play.owl.autoplay', [2000]);
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

            $(className + ' .control-box > ul > li > .total-no').empty().append($(className + ' .owl-item:not(.cloned)').length);
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
            loop: true,
            margin: 10,
            nav: true,
            navText: ['&nbsp;', '&nbsp;'],
            responsive: {
                0: {
                    items: 1
                },
                600: {
                    items: 2
                },
                1000: {
                    items: 4
                }
            },
            autoplay: false, // 오토 플레이 켜기
            autoplayTimeout: 1000, // 오토 플레이 주기
            autoplayHoverPause: true // 마우스 올리면 멈추게하기
        })
        $('.today > .hot-deal .owl-carousel').owlCarousel({
            loop: true,
            margin: 10,
            nav: true,
            navText: ['&nbsp', '&nbsp'],
            responsive: {
                0: {
                    items: 1
                },
                500: {
                    items: 2
                },
                1000: {
                    items: 2
                }
            },
            autoplay: false, // 오토 플레이 켜기
            autoplayTimeout: 1000, // 오토 플레이 주기
            autoplayHoverPause: true // 마우스 올리면 멈추게하기
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


        var slideIndex = 1;
        showSlides(slideIndex);

        function plusSlides(n) {
            showSlides(slideIndex += n);
        }

        function currentSlide(n) {
            showSlides(slideIndex = n);
        }

        function showSlides(n) {
            var i;
            var slides = document.getElementsByClassName("mySlides");
            console.log(slides);
            var dots = document.getElementsByClassName("dot");

            //슬라이드 갯수보다 크면 1번으로 초기화
            if (n > slides.length) {
                slideIndex = 1
            }
            //1보다 작으면 슬라이드 마지막으로
            if (n < 1) {
                slideIndex = slides.length;
            }

            //이미지슬라이드 초기화
            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            for (i = 0; i < dots.length; i++) {
                dots[i].className = dots[i].className.replace(" active", "");
            }

            //배열은 0부터 시작하기 떄문에 slideIndex-1
            slides[slideIndex - 1].style.display = "block";
            dots[slideIndex - 1].className += " active";
        }


        var slideIndex = 1;
        showSlides(slideIndex);

        function plusSlides(n) {
            showSlides(slideIndex += n);
        }

        function currentSlide(n) {
            showSlides(slideIndex = n);
        }

        function showSlides(n) {
            var i;
            var slides = document.getElementsByClassName("mySlides");
            console.log(slides);
            var dots = document.getElementsByClassName("dot");

            //슬라이드 갯수보다 크면 1번으로 초기화
            if (n > slides.length) {
                slideIndex = 1
            }
            //1보다 작으면 슬라이드 마지막으로
            if (n < 1) {
                slideIndex = slides.length;
            }

            //이미지슬라이드 초기화
            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            for (i = 0; i < dots.length; i++) {
                dots[i].className = dots[i].className.replace(" active", "");
            }

            //배열은 0부터 시작하기 떄문에 slideIndex-1
            slides[slideIndex - 1].style.display = "block";
            dots[slideIndex - 1].className += " active";
        }

    </script>
</body>

</html>
