<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=3.0">
    <title>Delete Member
    </title>
    <link rel="stylesheet" href="/css/mypage.css">
    <link rel="stylesheet" href="/css/product.css">
    <style type="text/css"></style>
    <script type="text/javascript" src="iloom_faq.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>


<script>
	$(function(){

		$("#delete").on("click", function() {
 			if (pwCheck.value == "" ) {
 				alert("비밀번호 값을 입력해 주세요.");
 				pwCheck.focus();
				return false
			}

			$.ajax({
				url : "/mypage/pwCheck",
				type : "POST",
				data : {'password': $("#pwCheck").val()},
				async : false,
				success : function(data) {

					if (data == 0) {
						alert("비밀번호가 틀렸습니다.");
						return;
					} else {
						if (confirm("회원탈퇴를 진행하시겠습니까?")) {
							$("#deleteForm").submit();
							
						}

					}
				}
			})

		});

	});
</script>



</head>
    <style>
        .del { 
            width: 100%;
            margin: 0 auto;
            padding: 1rem;
            background-color: #fff;
            border: 0.5px solid #557daa;
/*            display: flex;*/
        }
        
        .del p {
            text-align: center;
            font-size: 16px;
            
        }
        
        .b {
            background-color: dodgerblue;
            border-radius: 15px;
            color: white;
            padding: 15px 30px;
            text-align: center;
            text-decoration: none;
            display: block;
            font-size: 15px;
            margin: auto;
            
        }
        
    </style>



<body>
  <header>
    </header>
    <main>
        <article class="join">
            <div>

                <div class="iinn1">
                    <h3>마이페이지</h3>
                    <div class="">
                        <h5>쇼핑정보</h5>
                        	<p><a href="/mypage/orderList">- 주문목록/배송조회</a></p>
                        	<p><a href="/mypage/memberOrderCancelList">- 취소/반품/교환 내역</a></p>
                        	<p><a href="#">- 환불 내역</a></p>
                        <h5>고객센터</h5>
                        	<p><a href="/mypage/memberFAQ">- FAQ</a></p>
                        	<p><a href="/mypage/memberBoard">- 1:1 문의</a></p>
                        <h5>회원정보</h5>
                        	<p><a href="/mypage/memberModifyPwCheck">- 회원정보 변경</a></p>
                        	<p><b>- 회원탈퇴</b></p>
                    </div>
                </div>

                <div class="iinn2">
                    <h3>회원탈퇴</h3>

                    <div class="del">
                        <p style="font-size: 20px; color: #557daa; font-weight: bold">MCS 회원 탈퇴</p><br>
                        <p>MCS 탈퇴를 하시면 회원정보가 모두 초기화 되며 복구하실 수 없습니다.</p>
                        <p>정말로 탈퇴를 원하신다면 하단에 비밀번호를 입력하시고 '탈퇴하기' 버튼을 클릭해주세요.</p><br><br><br>
					<form action="/mypage/memberDelete" method="POST" id="deleteForm">
                        <p>비밀번호 확인 : <input type="password" id="pwCheck" name="password"></p>
                    </div>
                    <br><br><br>
                    <button class="b" id="delete" type="button">탈퇴하기</button>
					</form>
                    
                </div>
            </div>
        </article>

    </main>
    
    <footer>
        <div>
            <section>
                <p class="a"><b>M</b>edical <b>C</b>osmetic <b>S</b>kin</p>
                <ul>
                    <li><img src="https://image.flaticon.com/icons/png/512/106/106121.png" alt="">
                        서울시 송파구 오금로 311 (오금동45-1)</li>
                    <li><img src="https://kr.seaicons.com/wp-content/uploads/2015/06/Mobile-Phone-1-icon.png" alt="">
                        <a href="#">1577-5670</a> / 평일 09:30 ~ 17:30
                    </li>
                    <li><img src="https://image.flaticon.com/icons/png/512/54/54761.png" alt="">
                        <button>카톡상담</button> <button>틱톡상담</button>
                    </li>
                </ul>

                <div class="icon">
                    <img src="https://www.iloom.com/img/front/footer/footer_i.png" alt="인스타">
                    <img src="https://www.iloom.com/img/front/footer/footer_f.png" alt="페북">
                    <img src="https://www.iloom.com/img/front/footer/footer_b.png" alt="블로그">
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
                <img src="https://www.iloom.com/img/front/footer/mark_1.png" alt="">
                <img src="https://www.iloom.com/img/front/footer/mark_2.png" alt="">
                <img src="https://www.iloom.com/img/front/footer/mark_4.png" alt="">
            </div>
        </div>
    </article>

</body></html>
