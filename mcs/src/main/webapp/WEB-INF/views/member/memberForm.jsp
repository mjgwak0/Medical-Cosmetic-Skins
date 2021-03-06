<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<c:set var="contextPath" value="${pageContext.request.contextPath}"  />     

   
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=3.0">
    <title>MCS 회원가입</title>
    <link rel="stylesheet" href="/css/membership.css">
    <style type="text/css"></style>
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript" src="../resources/static/css/script.js"></script>
    <script type="text/javascript"></script>
    <!----아이콘---->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css'>

</head>
<body style="overflow-x:hidden; overflow-y:auto;">
    <a href="#" class="top">︽<br>top</a>

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
        <nav>

        </nav>
    </header>
    
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
	function fn_overlapped(){		
		var checkID = /^[a-zA-Z0-9]{6,12}$/; //ID 유효성 검사 정규식  변수선언  
   	 	var _id=$("#_username").val();
		
    	if(_id==''){
   	 		alert("ID를 입력하세요");
   	 		return false;
    	}

    	if (!checkID.test(_username.value)) {   
    		alert("영문과 숫자로 이루어진 6~12자의 아이디를 입력하세요"); 
     		return false;
    	}
   
    	$.ajax({
    	
       		type:"post",
       		async:false,  
       		url:"/idCheck",
       		dataType:"text",
       		data: {userid:_id},
       		success:function (data,textStatus){
          		if(data==1){
       	    		alert("사용할 수 있는 ID입니다.");   	    
          		}else{
        			alert("사용할 수 없는 ID입니다.");
          		}
       		},
       		error:function(data,textStatus){
          		alert("에러가 발생했습니다.");
       		},
       		complete:function(data,textStatus){
          		//alert("작업을완료 했습니다");
       		}
    	});  //end ajax	 
	}

	
	
	
/* 	var code = ""; 
	$("#emailChk").click(function(){ 
		var email = $("#email").val(); 
		
		$.ajax({ 
			type:"GET", 
			url:"mailCheck?email=" + email, 
			cache : false, 
			success:function(data){ 
				if(data == "error"){ 
					alert("이메일 주소가 올바르지 않습니다. 유효한 이메일 주소를 입력해주세요."); 
						$("#email").attr("autofocus",true); 
						$(".successEmailChk").text("유효한 이메일 주소를 입력해주세요."); 
						$(".successEmailChk").css("color","red"); }
				else{ 
					alert("인증번호 발송이 완료되었습니다.\n입력한 이메일에서 인증번호 확인을 해주십시오."); 
						$("#sm_email2").attr("disabled",false); 
						$("#emailChk2").css("display","inline-block"); 
						$(".successEmailChk").text("인증번호를 입력한 뒤 이메일 인증을 눌러주십시오."); 
						$(".successEmailChk").css("color","green"); 
						code = data; 
				} 
			} 
		}); 
	});

	//이메일 인증번호 대조
	$("#emailChk2").click(function(){ 
		if($("#sm_email2").val() == code){ 
			$(".successEmailChk").text("인증번호가 일치합니다."); 
			$(".successEmailChk").css("color","green"); 
			$("#emailDoubleChk").val("true"); 
			$("#sm_email2").attr("disabled",true); 
			//$("#sm_email").attr("disabled",true); 
		}else{ $(".successEmailChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다."); 
			$(".successEmailChk").css("color","red"); 
			$("#emailDoubleChk").val("false"); 
			$("#sm_email2").attr("autofocus",true); 
		} 
	}); */

	
	
	
	</script>
	

    <article class="hello">

        <h1>회원가입</h1>

        <ul class="nav nav-tabs">
            <li class="active"><a href="#tab1" data-toggle="tab">가입</a></li>
            <li><a href="#tab2" data-toggle="tab">약관동의</a></li>
            <li><a href="#tab3" data-toggle="tab">정보입력</a></li>
            <li><a href="#tab4" data-toggle="tab">가입완료</a></li>
        </ul>

        <div class="tab-content">

            <div class="tab-pane active" id="tab1">

                <div>
                    <h2>회원가입을 환영합니다.</h2>
                    <h4>회원으로 가입하시면<br>
                        다양한 혜택과
                        서비스를 이용하실 수 있습니다.</h4>
                </div>

                <a class="btn btn-primary btnNext">14세 이상 회원가입하기</button></a>
                <p>가입은 만 14세 이상만 가능합니다.</p>
            </div>

            <div class="tab-pane" id="tab2">
                <div>
                    <h3>약관동의</h3>
                    <form id="terms_form" class="form-f" action="http://javaking75.blog.me">
                        <h5>필수동의항목</h5>
                        <span class="signall"> <label> <input type="checkbox" id="check_0">

                                <p>MCS 회원 약관에 동의합니다.</p>
                            </label> <small>전체보기 > </small></span>
                        <span class="signall"><label><input type="checkbox" id="check_1">
                                <p>개인정보 수집 및 이용에 동의합니다.
                            </label></span>
                        <h5>선택동의항목</h5>
                        <span> <label> <input type="checkbox" id="check_2">
                                <p>개인정보 수집 및 이용 동의</p>
                            </label></span>
                        <span> <label><input type="checkbox" id="check_3">
                                <p>마케팅 수신 동의</p>
                            </label></span>
                        <span> <label> <input type="checkbox" id="check_4">
                                <p>화장품정보수신(SNS)</p>
                            </label></span>
                        <p class="red1">* 정보수신에 동의하지 않으셔도 정상적인 서비스 이용이 가능합니다.</p>
                      
                    </form>
                </div>

                <a class="btn btn-primary btnNext">동의하고 회원가입</a>
            </div>

            <div class="tab-pane" id="tab3">
                <div>
                    <form action="/signup" method="post">
                        <h3>회원정보 입력<h3>
                                <span> <label>이름 </label><input type="text" id="_name" name="name" maxlength="12" placeholder="이름를 입력하세요" /></span>
                                
                                <span> <label>아이디 </label><input type="text" name="userid"  id="_username" maxlength="12" placeholder="영문 숫자조합,6~12자" />
                               <!--  <input type="hidden" name="member_id1"  id="member_id" /> -->
					  			<input type="button"  id="btnOverlapped" value="중복체크" onClick="fn_overlapped()" /></span>
                                
                                <span> <label>비밀번호 </label><input type="password" name="password" maxlength="12" placeholder="영문 숫자 필수조합,6~12자" /></span>
                                <span> <label>비밀번호 확인 </label><input type="password" maxlength="12" placeholder="영문 숫자 필수조합,6~12자" /></span>
                                <span> <label>휴대폰 </label><input type="text" name="phone" style="width:127px;height:45px;font-size:10px;margin-right:10px;"></span>
                               
                               <tr>
                               	<td>
                                <span> <label>이메일 </label>
                                <input type="text" id="_email1" name="email" style="width:127px;height:45px;font-size:10px;margin-right:10px;">@
                                <input type="text" id="_email2" style="width:188px;height:45px;font-size:10px;margin-left:5px; margin-right:15px;">
                                    <select id="selectemail" onChange="emailSelect();" title="직접입력">
                                        <option value="">직접입력</option>
                                        <option value="daum.net">daum.net</option>
                                        <option value="naver.com">naver.com</option>
                                        <option value="google.com">google.com</option>
                                    </select>
         		                     	<!-- <input type="hidden" id="totalemail" name="email"> -->
         		                     	
         		                     	
         		                     	<!-- <p>
         		                     	<input id="email" type="text" name="email" title="이메일 주소를 입력해주세요." required/>
         		                     	<span id="emailChk" class="doubleChk">인증번호 보내기</span><b></b>
         		                     	<input id="sm_email2" type="text" name="sm_email2" title="인증번호 입력" disabled required/>
                                    	<span id="emailChk2" class="doubleChk">이메일인증</span>
                                    	<span class="point successEmailChk">이메일 입력후 인증번호 보내기를 해주십시오.</span>
                                    	<input type="hidden" id="emailDoubleChk"/>
                                    	</p> -->
                                </span>
                                 </td>
                                </tr>
                                
                                <span> <label for="address1" style="width:80px;">주소 </label>
         						<input type="text" id="addr_num" name="addr_num" placeholder="우편번호" style="width:100px;">
         						<input type="button" style="width: 100px;" id="btn_find" onclick="wf_findClick()" value="주소찾기"><br><br>
         						<input type="text" id="addr" name="addr" placeholder="주소를 입력하세요" style="width:400px;">
         						<label for="address2" style="width:80px;"></label>
         						<input type="text" id="addr2" name="addr2" placeholder="상세 주소를 입력하세요" style="width:400px;"></span>
         						<!-- <input type="hidden" id="sample6_extraAddress" placeholder="참고항목" > -->
                                
                                <span class="birth"> <label>생년월일(6자리) </label><input type="date" name="birth" maxlength="12" placeholder="ex) 931214">
                                <span> <label>성별 </label>
                                
                                    <input type="radio" name="gender" value="남자" style="width:15px;height:15px;margin-right:5px;">남성
                                    <input type="radio" name="gender" value="여자" style="width:15px;height:15px;margin-right:5px;">여성

                                    <h3 class="join_title"><label for="pawword answer">비밀번호 찾기 질문</label></h3>
                                    <span class="box answer_code">
                                        <select id="answer" class="pa" name="pw_find">
                                            <option>질문</option>
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
                                        </span>
                                        <span class="birth"><input type="text" name="pw_answer" maxlength="12" placeholder="입력"/>
                                        
                		<input type="submit" value="동의하고 회원가입">
                    </form>
                </div>

            </div>

            <div class="tab-pane" id="tab4">

                <div>
                    <h2>가입을 환영합니다.</h2>
                    <h4>다양한 혜택과<br>

                        서비스를 이용하실 수 있습니다.</h4>
                </div>

                <button class="custom-btn btn-15">로그아웃</button>
                <button class="custom-btn btn-16">쇼핑하기</button>
            </div>
    </article>

    <script src='https://getbootstrap.com/dist/js/bootstrap.min.js'></script>
    <script src='https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js'></script>
    <script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js'></script>
    <script id="rendered-js">
        $('.btnNext').click(function() {
            $('.nav-tabs > .active').next('li').find('a').trigger('click');
        });

        $('.btnPrevious').click(function() {
            $('.nav-tabs > .active').prev('li').find('a').trigger('click');
        });

    </script>

</body>

</html>