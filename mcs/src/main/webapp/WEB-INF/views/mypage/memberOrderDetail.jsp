<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=3.0">
<title>Member OrderDetailList</title>
<link rel="stylesheet" href="/css/mypage.css">
<style type="text/css"></style>
<script type="text/javascript" src="iloom_faq.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />

<style>
table {
	width: 100%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

td {
	border-bottom: 1px solid #bbb;
	padding: 15px 0 15px 0;
}

th {
	border-bottom: 1px solid #bbb;
	padding: 20px 0 20px 0;
	font-size: 16px;
	font-weight: bold;
}


#tot {
	border: 0.5px solid #bbb;
	margin-top: 20px;
	text-align: right;
	height: 30px;
	font-size: 16px;
}

</style>


<script>
        //SCROLL

        var prevScrollpos = window.pageYOffset;

        window.onscroll = function() {


            var currentScrollpos = window.pageYOffset;


            if (prevScrollpos > currentScrollpos) {

                document.getElementById("navbar").style.top = "0";
                document.getElementById("slidebtn").style.top = "0";

            } else {
                document.getElementById("navbar").style.top = "-150px";
                document.getElementById("slidebtn").style.top = "-150px";
            }
            prevScrollpos = currentScrollpos;
        }

        $(document).ready(function() {
            $(window).scroll(function() {
                var scroll = $(window).scrollTop();
                if (scroll > 1) {
                    $(".navbar").css("background", "#fff");
                } else {
                    $(".navbar").css("background", "none");
                }
            })
        })


        //HAMBERGER MENU

        function closeNav() {
            document.getElementById("sidenav").style.width = "0%";
            document.getElementById("slidebtn").style.display = "block";
        }


        $(document).ready(function() {
            $(".slideBtn").click(function() {
                if ($("#sidenav").width() == 0) {
                    document.getElementById("sidenav").style.width = "300px";

                    document.getElementById("main").style.paddingRight = "300px";

                    document.getElementById("slidebtn").style.paddingRight = "0px";
                    document.getElementById("slidebtn").style.display = "none";
                } else {
                    document.getElementById("sidenav").style.width = "0";
                    document.getElementById("main").style.paddingRight = "0";
                    document.getElementById("slidebtn").style.paddingRight = "0";
                }
            });
        });



        //slider

        $(document).ready(function() {

            var $slider = $(".slider"),
                $slideBGs = $(".slide__bg"),
                diff = 0,
                curSlide = 0,
                numOfSlides = $(".slide").length - 1,
                animating = false,
                animTime = 500,
                autoSlideTimeout,
                autoSlideDelay = 6000,
                $pagination = $(".slider-pagi");

            function createBullets() {
                for (var i = 0; i < numOfSlides + 1; i++) {
                    var $li = $("<li class='slider-pagi__elem'></li>");
                    $li.addClass("slider-pagi__elem-" + i).data("page", i);
                    if (!i) $li.addClass("active");
                    $pagination.append($li);
                }
            };

            createBullets();

            function manageControls() {
                $(".slider-control").removeClass("inactive");
                if (!curSlide) $(".slider-control.left").addClass("inactive");
                if (curSlide === numOfSlides) $(".slider-control.right").addClass("inactive");
            };

            function autoSlide() {
                autoSlideTimeout = setTimeout(function() {
                    curSlide++;
                    if (curSlide > numOfSlides) curSlide = 0;
                    changeSlides();
                }, autoSlideDelay);
            };

            autoSlide();

            function changeSlides(instant) {
                if (!instant) {
                    animating = true;
                    manageControls();
                    $slider.addClass("animating");
                    $slider.css("top");
                    $(".slide").removeClass("active");
                    $(".slide-" + curSlide).addClass("active");
                    setTimeout(function() {
                        $slider.removeClass("animating");
                        animating = false;
                    }, animTime);
                }
                window.clearTimeout(autoSlideTimeout);
                $(".slider-pagi__elem").removeClass("active");
                $(".slider-pagi__elem-" + curSlide).addClass("active");
                $slider.css("transform", "translate3d(" + -curSlide * 100 + "%,0,0)");
                $slideBGs.css("transform", "translate3d(" + curSlide * 50 + "%,0,0)");
                diff = 0;
                autoSlide();
            }

            function navigateLeft() {
                if (animating) return;
                if (curSlide > 0) curSlide--;
                changeSlides();
            }

            function navigateRight() {
                if (animating) return;
                if (curSlide < numOfSlides) curSlide++;
                changeSlides();
            }

            $(document).on("mousedown touchstart", ".slider", function(e) {
                if (animating) return;
                window.clearTimeout(autoSlideTimeout);
                var startX = e.pageX || e.originalEvent.touches[0].pageX,
                    winW = $(window).width();
                diff = 0;

                $(document).on("mousemove touchmove", function(e) {
                    var x = e.pageX || e.originalEvent.touches[0].pageX;
                    diff = (startX - x) / winW * 70;
                    if ((!curSlide && diff < 0) || (curSlide === numOfSlides && diff > 0)) diff /= 2;
                    $slider.css("transform", "translate3d(" + (-curSlide * 100 - diff) + "%,0,0)");
                    $slideBGs.css("transform", "translate3d(" + (curSlide * 50 + diff / 2) + "%,0,0)");
                });
            });

            $(document).on("mouseup touchend", function(e) {
                $(document).off("mousemove touchmove");
                if (animating) return;
                if (!diff) {
                    changeSlides(true);
                    return;
                }
                if (diff > -8 && diff < 8) {
                    changeSlides();
                    return;
                }
                if (diff <= -8) {
                    navigateLeft();
                }
                if (diff >= 8) {
                    navigateRight();
                }
            });

            $(document).on("click", ".slider-control", function() {
                if ($(this).hasClass("left")) {
                    navigateLeft();
                } else {
                    navigateRight();
                }
            });

            $(document).on("click", ".slider-pagi__elem", function() {
                curSlide = $(this).data("page");
                changeSlides();
            });

        });



        //fade in

        let ticking = false;

        function isElementUnderBottom(elem, triggerDiff) {
            const {
                top
            } = elem.getBoundingClientRect();
            const {
                innerHeight
            } = window;
            return top > innerHeight + (triggerDiff || 0);
        }

        function handleScroll() {
            ticking = false;

            const upOnScrollElems = document.querySelectorAll('.up-on-scroll');
            upOnScrollElems.forEach(elem => {
                if (isElementUnderBottom(elem)) {
                    elem.style.opacity = "0";
                    elem.style.transform = 'translateY(70px)';
                } else {
                    elem.style.opacity = "1";
                    elem.style.transform = 'translateY(0px)';
                }
            });

            const productImg = document.querySelector('.diff-desc-image-wrap .image-wrap');
            const productImgRect = productImg.getBoundingClientRect();
            if (productImgRect.top < 0) {
                productImg.style.transform = `translateY(${-1 * productImgRect.top * 0.8 }px)`
            } else {
                productImg.style.transform = 'none';
            }

            const changeBgSection = document.querySelector('.background-change-wrap');
            const changeBgImg = document.querySelector('.background-change-wrap > div');
            const {
                top: bgTop,
                height: bgHeight
            } = changeBgSection.getBoundingClientRect();
            if (bgTop < 0) {
                const rate = (-1) * bgTop / 4;
                changeBgImg.style.filter = `grayscale(${rate}%)`;
                changeBgImg.style.opacity = `${(100-rate/5) / 100}`;
            } else {
                changeBgImg.style.filter = 'none';
                changeBgImg.style.opacity = `1`;
            }
        }

        function requestTick() {
            if (!ticking) {
                requestAnimationFrame(handleScroll);
            }
            ticking = true;
        }

        window.addEventListener('scroll', requestTick);
        
        /* 별점 */
        const drawStar = (target) => {
        document.querySelector(`.star span`).style.width = `\${target.value * 10}%`;
        }
    </script>

</head>

<body style="background-color: #fff">
	<header> </header>
	<main>
		<article class="join">
			<div>
			
				<div class="iinn1">
					<h3>마이페이지</h3>
					<div class="">
						<h5>쇼핑정보</h5>
                        	<p><b>- 주문목록/배송조회</b></p>
                        	<p><a href="/mypage/memberOrderCancelList">- 취소/반품/교환 내역</a></p>
                        	<!-- <p><a href="#">- 환불 내역</a></p> -->
                        <h5>고객센터</h5>
                        	<p><a href="/mypage/memberFAQ">- FAQ</a></p>
                        	<p><a href="/mypage/memberBoard">- 1:1 문의</a></p>
                        <h5>회원정보</h5>
                        	<p><a href="/mypage/memberModifyPwCheck">- 회원정보 변경</a></p>
                        	<p><a href="/mypage/memberDeletePwCheck">- 회원탈퇴</a></p>
					</div>
				</div>

				<div class="iinn2">
					<h3>주문상세조회</h3>
					<div style="align-content: space-between">
						<p>주문번호 : ${order.ordernum}</p>
					</div>
					<article class="faq">
						<div>

							<div class="tab_container">
								<h3 class="d_active tab_drawer_heading" rel="tab1">Tab 1</h3>
								<div id="tab1" class="tab_content">
									<table border="1" class="list" align="center" width="800px">
										<%-- <section class="ee">
										<div class="e1">
											<a>주문상세번호</a>
											<a>제품명</a>
											<a>수량</a>
											<a>결제금액</a>
											<a>배송상태</a>
											<a>취소/환불/리뷰</a>
										</div>
									</section> --%>
										<div class="e1">
											<thead>
												<tr align="center">
													<th>주문상세번호</th>
													<th>제품명</th>
													<th>수량</th>
													<th>결제금액</th>
													<th>배송상태</th>
													<th>취소/환불/리뷰</th>
												</tr>
											</thead>
										</div>

										<c:set var="totalprice" value="0" />
										<c:forEach var="orderDetail" items="${orderDetailList}">
											<c:set var="totalprice"
												value="${totalprice + orderDetail.price}" />
											<%-- <section class="ff"> --%>
											<tbody>
												<tr align="center">
													<td>${orderDetail.detailnum}</td>
													<td id="cen"><img src="/images/${orderDetail.product.files.file_name}" style="vertical-align: middle;">${orderDetail.product.pro_name}</td>
													<td>${orderDetail.order_count}</td>
													<td><fmt:formatNumber type="number"
															value="${orderDetail.price}" /></td>
													<td>${orderDetail.state}</td>
													<td>
													<c:choose>
														<c:when test="${orderDetail.state eq '결제완료'}">
															<button
																onclick="location.href='/product/orderCancel?ordernum=${orderDetail.order.ordernum}&detailnum=${orderDetail.detailnum}&result=1'">취소하기</button>
														</c:when>
														<c:when test="${orderDetail.state eq '배송준비중'}">
															<button
																onclick="location.href='/product/orderCancel?ordernum=${orderDetail.order.ordernum}&detailnum=${orderDetail.detailnum}&result=0'">환불하기</button>
														</c:when>
														<c:when test="${orderDetail.state eq '배송완료'}">
															<button
																onclick="location.href='/product/orderCancel?ordernum=${orderDetail.order.ordernum}&detailnum=${orderDetail.detailnum}&result=0'">환불하기</button>
															<!-- <input type="checkbox" id="layerPopup">
															<label for="layerPopup"> Review </label> -->
															<button>리뷰작성</button>

														</c:when>
													</c:choose>
													</td>
												</tr>
											</tbody>
											<%-- </section> --%>
										</c:forEach>
									</table>
								</div>
								<div id="tot">
									<p>
										제품 합계 :
										<fmt:formatNumber type="number" value="${totalprice}" />
										원&emsp;
									</p>
								</div>
							</div>
							<!-- .tab_container -->
                        </div>
                    </article>
                </div>
            </div>
        </article>

    </main>

    <script>    
    
        // tabbed content
        // http://www.entheosweb.com/tutorials/css/tabs.asp
        $(".tab_content").hide();
        $(".tab_content:first").show();

        /* if in tab mode */
        $("ul.tabs li").click(function() {

            $(".tab_content").hide();
            var activeTab = $(this).attr("rel");
            $("#" + activeTab).fadeIn();

            $("ul.tabs li").removeClass("active");
            $(this).addClass("active");

            $(".tab_drawer_heading").removeClass("d_active");
            $(".tab_drawer_heading[rel^='" + activeTab + "']").addClass("d_active");

        });
        /* if in drawer mode */
        $(".tab_drawer_heading").click(function() {

            $(".tab_content").hide();
            var d_activeTab = $(this).attr("rel");
            $("#" + d_activeTab).fadeIn();

            $(".tab_drawer_heading").removeClass("d_active");
            $(this).addClass("d_active");

            $("ul.tabs li").removeClass("active");
            $("ul.tabs li[rel^='" + d_activeTab + "']").addClass("active");
        });


        /* Extra class "tab_last"
          to add border to right side
          of last tab */
        $('ul.tabs li').last().addClass("tab_last");


        /* 전체선택 */
        function selectAll(selectAll) {
            const checkboxes = document.querySelectorAll('input[type="checkbox"]');

            checkboxes.forEach((checkbox) => {
                checkbox.checked = selectAll.checked
            })
        }
        /* 리뷰 등록 */
		$(".save").on("click", function(){
			$(".review_save").submit();
		});
    </script>

    <footer>
        <div>
            <section>
                <p class="a"><b>M</b>edical <b>C</b>osmetic <b>S</b>kin</p>
                <ul>
                    <li><img src="https:/image.flaticon.com/icons/png/512/106/106121.png" alt="">
                        서울시 송파구 오금로 311 (오금동45-1)</li>
                    <li><img src="https:/kr.seaicons.com/wp-content/uploads/2015/06/Mobile-Phone-1-icon.png" alt="">
                        <a href="#">1577-5670</a> / 평일 09:30 ~ 17:30
                    </li>
                    <li><img src="https://image.flaticon.com/icons/png/512/54/54761.png" alt="">
                        <button>카톡상담</button> <button>틱톡상담</button>
                    </li>
                </ul>

                <div class="icon">
                    <img src="https:/www.iloom.com/img/front/footer/footer_i.png" alt="인스타">
                    <img src="https:/www.iloom.com/img/front/footer/footer_f.png" alt="페북">
                    <img src="https:/www.iloom.com/img/front/footer/footer_b.png" alt="블로그">
                </div>
            </section>

            <section>
                <h5>ABOUT</h5> <br>
                <ul>
                    <li><a href="#">회사소개</a></li>
                    <li><a href="#">매장안내</a></li>
                    <li><a href="#">인재채용</a></li>
                </ul>
            </section>

            <section>
                <h5>SUPPORT</h5> <br>
                <ul>
                    <li><a href="#">고객센터</a></li>
                    <li><a href="#">대리점 개설안내</a></li>
                </ul>
            </section>

            <section>
                <h5>INFO</h5> <br>
                <ul>
                    <li><a href="#">이용약관</li>
                    <li><a href="#">개인정보 처리방침</li>
                </ul>
            </section>

            <section>
                <h5>MCS</h5> <br>
                <ul>
                    <li>개인정보보호 책임자 : 대표이사 곽민지</li>
                    <li>사업자등록번호 : 123-45-67890 </li>
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
                <img src="https:/www.iloom.com/img/front/footer/mark_1.png" alt="">
                <img src="https:/www.iloom.com/img/front/footer/mark_2.png" alt="">
                <img src="https:/www.iloom.com/img/front/footer/mark_4.png" alt="">
            </div>
        </div>
    </article>

</body>

</html>
