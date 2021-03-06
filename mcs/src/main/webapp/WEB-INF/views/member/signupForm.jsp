<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=3.0">
<title>MCS 회원가입</title>
<link rel="stylesheet" href="/css/membership.css">
<style type="text/css"></style>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="/css/script.js"></script>
<script type="text/javascript"></script>
<!----아이콘---->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel='stylesheet'
	href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css'>

</head>

<body style="overflow-x: hidden; overflow-y: auto;">
	<a href="#" class="top">︽<br>top
	</a>

	<header>
		<article class="header1">
			<section>
				<div>
					<a href="#"><img src="image/mcs.png"></a>
				</div>

			</section>
		</article>
		<!--------------네비게이션---------------->



		<!--------------네비게이션---------------->
		<nav></nav>
	</header>

	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	
		var BtnChk = true;
		$(document).ready(function(){
    
            $("#nextBtn").click(function(){    
                if($("#check_0").is(":checked") == false){
                    alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다.");
                    return $('.nav-tabs > .active').prev('li').find('a').trigger('click');
                }else if($("#check_1").is(":checked") == false){
                    alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다..");
                    $('.nav-tabs > .active').prev('li').find('a').trigger('click');
                }else{
                	 BtnChk = true;
                }
            });    
        });
		
		function formCheck() {

			var checkName = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|\*]+$/;//한글+영어 정규식
			var checkPw = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/; //PASSWORD 유효성 검사 정규식
			var checkBirth = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/; // 생년월일 정규식. 숫자만 입력 가능하게 하는 정규식 ex)[0-9] 0~9까지.
			var checkPhone = /^\d{3}\d{3,4}\d{4}$/; // 휴대폰번호정규식 

			var email1 = $("#_email1").val();
			var email2 = $("#_email2").val();
			var totalemail = "";

			totalemail = email1 + "@" + email2;
			$("#totalemail").val(totalemail);

			
			if (_name.value == "") {
				alert("이름을 입력해주세요.");
				_name.focus(); //해당 함수에 포커스를 넣는다.
				return false;
			}
			//이름 정규식 검사
			if (!checkName.test(_name.value)) {
				alert("올바르지 않은 형식입니다.");
				return false;
			}

			if (_username.value == "") {
				alert("아이디를 입력해주세요.");
				_username.focus();
				return false;
			}
			
			if (overlapped == false) {
				alert("중복체크를 클릭해주세요.");
				_username.focus();
				return false;
			} 

			if (_password.value == "") {
				alert("비밀번호를 입력해주세요.");
				_password.focus();
				return false;
			}
			//비밀번호 정규식 검사
			if (!checkPw.test(_password.value)) {
				alert("영문+숫자+특수문자로 이루어진 8~16자의 비밀번호로 입력해주세요.");
				return false;
			}
			// 휴대폰번호	
			if (_phone.value == "") {
				alert('휴대전화번호를 입력해주세요.')
				_phone.focus();
				return false;
			}
			// 휴대폰번호 정규식 검사
			if (!checkPhone.test(_phone.value)) {
				alert("11자리 숫자로 입력해주세요. (예)01012345678");
				return false;
			}
			// 이메일
			if (_email1.value == "") {
				alert("이메일을 입력해주세요.");
				_email1.focus();
				return false;
			}
			if (addr_num.value == "") {
				alert("주소를 입력해주세요.");
				addr_num.focus();
				return false;

			}
			if (_birth.value == "") {
				alert("생년월일을 입력해주세요.");
				_birth.focus();
				return false;
			}
						
			if (_pw_find.value == "") {
				alert("비밀번호 찾기 질문을 선택해주세요.");
				_pw_find.focus();
				return false;
			}
			if (_pw_answer.value == "") {
				alert("비밀번호 찾기 답을 입력해주세요.");
				_pw_answer.focus();
				return false;
			}
		}

		// 비밀번호 일치 확인 유효성 검사
		$(function() {

			$('#_passwordck').keyup(function() {

				var _passwordck = $("#_passwordck").val();
				var _password = $("#_password").val();
				console.log(_passwordck);
				if (_password == _passwordck) {
					$('#pwck1').css('display', 'block');
					$('#pwck2').css('display', 'none');

				} else {
					$('#pwck1').css('display', 'none');
					$('#pwck2').css('display', 'block');

				}

			});
		});
		
		// ID 중복체크 확인 유효성 검사
		var overlapped = false;
		
		//ID 유효성 검사
		function fn_overlapped() {

			var checkID = /^[a-zA-Z0-9]{6,20}$/; //ID 유효성 검사 정규식 변수선언  

			var _id = $("#_username").val();
			if (_id == '') {
				alert("ID를 입력하세요");
				return;
			}
			
			//id 정규식 유효성검사(6~12자리 입력하게끔) 
			if (!checkID.test(_username.value)) {
				alert("영문과 숫자로 이루어진 6~20자의 아이디를 입력하세요");
				return false;
			}

			$.ajax({

				type : "post",
				async : false,
				url : "/idCheck",
				dataType : "text",
				data : {
					userid : _id
				},
				success : function(data, textStatus) {
					if (data == 1) {
						alert("사용할 수 있는 ID입니다.");

					} else {
						alert("사용할 수 없는 ID입니다.");
					}
				},
				error : function(data, textStatus) {
					alert("에러가 발생했습니다.");
				},
				complete : function(data, textStatus) {
					//alert("작업을완료 했습니다");
				}
			}); //end ajax
			overlapped = true;
		}

		// 이메일 주소 선택 - 자동입력 기능
		function emailSelect() {
			$('#_email2').val($('#selectemail').val())

		}
		
		// 다음 주소 연동 -> 정상
	    function wf_findClick(){
	    	new daum.Postcode({
	    		oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	    			var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	 
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	 
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    // document.getElementById("sample6_extraAddress").value = extraAddr;
	                 	// 주소변수 문자열과 참고항목 문자열 합치기
	                    addr += extraAddr;
	                
	                } else {
	                    // document.getElementById("sample6_extraAddress").value = '';
	                	addr += ' ';
	                }
	 
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('addr_num').value = data.zonecode;
	                document.getElementById("addr").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("addr2").focus();
	            }
	        }).open(); 
	    } 
	    
	    
	</script>

	<article class="hello">

		<h1>회원가입</h1>

		<ul class="nav nav-tabs">
			<li class="active"><a href="#tab1" data-toggle="tab">가입</a></li>
			<li><a href="#tab2" data-toggle="tab" id="not">약관동의</a></li>
			<li><a href="#tab3" data-toggle="tab" id="not">정보입력</a></li>
			<li><a href="#tab4" data-toggle="tab" id="not">가입완료</a></li>
		</ul>

		<div class="tab-content">

			<div class="tab-pane active" id="tab1">

				<div>
					<h2>회원가입을 환영합니다.</h2>
					<h4>
						회원으로 가입하시면<br> 다양한 혜택과 서비스를 이용하실 수 있습니다.
					</h4>
				</div>

				<a class="btn btn-primary btnNext">14세 이상 회원가입하기
					</button>
				</a>
				<p>가입은 만 14세 이상만 가능합니다.</p>
			</div>

			<div class="tab-pane" id="tab2">
				<div>
					<h3>약관동의</h3>
					<form id="terms_form" class="form-f"
						action="http://javaking75.blog.me">
						<h5>필수동의항목</h5>
						<span class="signall"> <label> <input
								type="checkbox" id="check_0">
								<p>MCS 회원 약관에 동의합니다.</p>
						</label> <small>전체보기 > </small></span> <span class="signall"><label><input
								type="checkbox" id="check_1">
								<p>개인정보 수집 및 이용에 동의합니다.</label></span>
						<h5>선택동의항목</h5>
						<span> <label> <input type="checkbox" id="check_2">
								<p>개인정보 수집 및 이용 동의</p>
						</label></span> <span> <label><input type="checkbox" id="check_3">
								<p>마케팅 수신 동의</p> </label></span> <span> <label> <input
								type="checkbox" id="check_4">
								<p>화장품정보수신(SNS)</p>
						</label></span>
						<p class="red1">* 정보수신에 동의하지 않으셔도 정상적인 서비스 이용이 가능합니다.</p>
					</form>
				</div>
				<a class="btn btn-primary btnNext" id="nextBtn">동의하고 회원가입</a>
			</div>

			<div class="tab-pane" id="tab3">
				<div>
					<form action="/signup" method="post">
						<h3>회원정보 입력</h3>
						<span> <label>이름 </label><input type="text" id="_name" name="name" maxlength="12" placeholder="이름를 입력해주세요." /></span> 
						<span> <label>아이디 </label><input type="text" id="_username" name="userid" minlength="6" maxlength="20" placeholder="영문+숫자, 6~20자" />
							   <input type="button"id="btnOverlapped" value="중복체크" onClick="fn_overlapped()" /></span>
						<span> <label>비밀번호 </label><input type="password"id="_password" name="password" minlength="8" maxlength="16" placeholder="영문+숫자+특수문자, 8~16자" /></span>
						<span> <label>비밀번호 확인 </label><input type="password" id="_passwordck" minlength="8" maxlength="16" placeholder="영문+숫자+특수문자, 8~16자" /></span>
						<span id="pwck1" style="color: lime; display: none; font-size: 14px;">비밀번호가 일치합니다.</span>
						<span id="pwck2" style="color: red; display: none; font-size: 14px;">비밀번호가 일치하지 않습니다.</span> 
						<span> <label>휴대폰 </label><input type="text" id="_phone" name="phone" maxlength="11" style="width: 127px; height: 45px; font-size: 12px; margin-right: 10px;"></span>
						<tr>
							<td><span> <label>이메일 </label> 
							<input type="text" id="_email1" style="width: 127px; height: 45px; font-size: 12px; margin-right: 10px;">@
							<input type="text" id="_email2" style="width: 188px; height: 45px; font-size: 12px; margin-left: 5px; margin-right: 15px;">
							<select id="selectemail" onChange="emailSelect();" title="직접입력">
										<option value="">직접입력</option>
										<option value="hanmail.net">hanmail.net</option>
										<option value="naver.com">naver.com</option>
										<option value="gmail.com">gmail.com</option>
							</select> 
							<input type="hidden" id="totalemail" class="mail_input" name="email"> <!-- <input type="submit" value="인증"> -->
							<!-- <input type="text" class="mail_check_input">
							<input type="button" class="mail_check_button" value="인증번호전송"> -->
							</span></td>
						</tr>

						<span> <label for="address1" style="width: 80px;">주소</label> 
						<input type="text" id="addr_num" name="addr_num" placeholder="우편번호" style="width: 100px;"> 
						<input type="button" style="width: 100px;" id="btn_find" onclick="wf_findClick()" value="주소찾기"><br> <br> 
						<input type="text" id="addr" name="addr" placeholder="주소를 입력해주세요." style="width: 400px;">
							<label for="address2" style="width: 80px;"></label> 
							<input type="text" id="addr2" name="addr2" placeholder="상세 주소를 입력해주세요." style="width: 400px;"></span>
						<!-- <input type="hidden" id="sample6_extraAddress" placeholder="참고항목" > -->

						<span class="birth"> <label>생년월일</label> <input type="date" style="width: 130px;" id="_birth" name="birth" maxlength="8"></span>
						<span> <label>성별 </label> <input type="radio" name="gender" value="남자" style="width: 15px; height: 15px; margin-right: 5px;" checked>남성 <input type="radio" name="gender" value="여자"
							style="width: 15px; height: 15px; margin-right: 5px;">여성</span>

						<h3 class="join_title">
							<label for="password answer">비밀번호 찾기 질문</label><span
								class="box answer_code"> <select id="_pw_find"
								name="pw_find">
									<option value="">질문</option>
									<option value="1">졸업한 학교 이름?</option>
									<option value="2">나의 신발 사이즈?</option>
									<option value="3">애완동물 이름?</option>
									<option value="4">가장 좋아하는 계절?</option>
									<option value="5">가장 좋아하는 색깔?</option>
									<option value="6">가장 좋아하는 숫자?</option>
									<option value="7">가장 좋아하는 음식?</option>
									<option value="8">가장 좋아하는 캐릭터 이름?</option>
									<option value="9">내가 태어난 고향?</option>
									<option value="10">존경하는 인물 이름?</option>
							</select>

							</span> <input type="text" id="_pw_answer" name="pw_answer"
								maxlength="50" placeholder="비밀번호 찾기 답변을 입력해주세요." /><br>
							<br>
						</h3>
						<input type="submit" value="동의하고 회원가입"
							onclick="return formCheck()">
					</form>
				</div>

			</div>

			<div class="tab-pane" id="tab4">

				<div>
					<h2>가입을 환영합니다.</h2>
					<h4>
						다양한 혜택과<br> 서비스를 이용하실 수 있습니다.
					</h4>
				</div>

				<button class="custom-btn btn-15">로그아웃</button>
				<button class="custom-btn btn-16">쇼핑하기</button>
			</div>
	</article>

	<script src='https://getbootstrap.com/dist/js/bootstrap.min.js'></script>
	<script
		src='https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js'></script>
	<script
		src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js'></script>
	<script id="rendered-js">
		$('.btnNext').click(function() {
			if (BtnChk == true) {
				$('.nav-tabs > .active').next('li').find('a').trigger('click');
			}
			
		});

		$('.btnPrevious').click(function() {
			$('.nav-tabs > .active').prev('li').find('a').trigger('click');
		});
	</script>

</body>

</html>