<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link href='https://fonts.googleapis.com/css?family=Roboto+Slab:700'
	rel='stylesheet' type='text/css'>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="/css/survey.css">
</head>
<script>
    var Quest = new Array(19); //this sets up an array for all of the answers that are given

    function populate() {
        // alert("function populate started");
        for (var i = 0; i < 19; i++) {
            Quest[i] = 0;
        }
    }

    function total() {
        // 각 답변의 값을 합산합니다.
        myScore = 0;
        for (var i = 0; i < 19; i++) {
            myScore = myScore + Quest[i];
        }
        analyzer(myScore);		
		type(myContentsPtr);
		
		var frm = document.type;
		var next = confirm('다음 문항으로 넘어갑니다. (2/4)');
		if(next){
			// 실행 후 다음 페이지로 이동
			frm.action = "/baumann/baumannTest3" 
			// 현재 form 정보를 다음 페이지로 전달
			frm.submit();
		}else{
			false;
		}
    }

	function type(myContentsPtr){
		$('#test').val(myContentsPtr)
	}

    myContents = new Array();
    myContents[0] = "Type S" + "";
    myContents[1] = "Type R" + "";

    function analyzer(myScore) {
        // 계산된 총 점수를 사용하여 자신이 어떤 성격 유형인지 알아냅니다.
        if (myScore > 29) {
            myContentsPtr = "R";
        } else {
            myContentsPtr = "S";
        }
//         myDisplay(myContents[myContentsPtr]);
    }
    

    function myDisplay(myContents, myScore) {
        // 새 창을 열고 계산된 결과를 표시합니다.
        alert(myContents, myScore);
        document.getElementById("result").innerHTML = myContents + " & 총 점: " + myScore;
    }

    function saver(q, points) {
        // 각 답변의 포인트를 배열에 넣습니다.
        q = q - 1;
        Quest[q] = points;
    }
</script>

<body onLoad="populate()">
    <form name="personalityForm">
        <div class="wrapper container">

            <div class="page-header">
                <h1>올바른 피부 타입을 찾기 위한 질문<br>
                    <small>Part 2. 민감성(Sensitive) vs 저항성(Resistant)<br>이 설문지는 여드름, 붉음증, 확 붉어지는 증상, 가려움 등 모든 예민피부의 증상들에 대한 경향을 측정합니다.</small>
                </h1>
            </div>

            <div class="quiz-box quiz-1">
                <h2 class="quiz-question">1. 얼굴에 붉은 여드름이 있습니까?</h2>
                <span class="quiz-answer">
                    <label><input type="radio" name="q1" onClick="saver(1,0)"> 결코 없습니다.</label>
                    <label><input type="radio" name="q1" onClick="saver(1,1)"> 거의 없습니다.</label>
                    <label><input type="radio" name="q1" onClick="saver(1,2)"> 최소한 한달에 한번정도</label>
                    <label><input type="radio" name="q1" onClick="saver(1,3)"> 최소한 한주에 한번정도</label>
                </span>
            </div>

            <div class="quiz-box quiz-2">
                <h2 class="quiz-question">2. 스킨케어 제품(클렌저, 모이스처라이저, 토너, 메이크업)을 적용했을 때 얼굴에 뭐가 나고 발진이나, 가렵고 쏘는 듯한 증상을 일으킵니까?
                </h2>
                <span class="quiz-answer">
                    <label><input type="radio" name="q2" onClick="saver(2,0)"> 결코 없습니다.</label>
                    <label><input type="radio" name="q2" onClick="saver(2,1)"> 거의 없습니다.</label>
                    <label><input type="radio" name="q2" onClick="saver(2,2)"> 자주</label>
                    <label><input type="radio" name="q2" onClick="saver(2,3)"> 항상</label>
                    <label><input type="radio" name="q2" onClick="saver(2,2.5)"> 제품을 바르지 않습니다.</label>
                </span>
            </div>

            <div class="quiz-box quiz-3">
                <h2 class="quiz-question">3. 여드름이나 로사시아로 진단받은 적이 있습니까?</h2>
                <span class="quiz-answer">
                    <label><input type="radio" name="q3" onClick="saver(3,0)"> 아니오.</label>
                    <label><input type="radio" name="q3" onClick="saver(3,1)"> 친구나 아는 사람들이 내가 그렇다고 합니다.</label>
                    <label><input type="radio" name="q3" onClick="saver(3,2)"> 네.</label>
                    <label><input type="radio" name="q3" onClick="saver(3,3)"> 네, 심각한정도</label>
                    <label><input type="radio" name="q3" onClick="saver(3,2.5)"> 모르겠습니다.</label>
                </span>
            </div>
            <div class="quiz-box quiz-3-1">
                <h2 class="quiz-question">3-1. 다음 병명에 대해 진단받은 적이 있는 분들만 해당 항목에 체크해주십시오. (여드름, 로사시아, 접촉성 피부염, 습진 등)</h2>
                <span class="quiz-answer">
                    <label><input type="radio" name="q3-1" onClick="saver(19,5)"> 피부과 전문의로부터 진단받았다.</label>
                    <label><input type="radio" name="q3-1" onClick="saver(19,2)"> 피부과 전문의가 아닌 다른 의사들로부터 진단받았다.</label>
                </span>
            </div>

            <div class="quiz-box quiz-4">
                <h2 class="quiz-question">4. 악세사리를 하면 진짜가 아닐 때 얼마나 자주 뭐가 올라옵니까?</h2>
                <span class="quiz-answer">
                    <label><input type="radio" name="q4" onClick="saver(4,0)"> 결코 없습니다.</label>
                    <label><input type="radio" name="q4" onClick="saver(4,1)"> 거의 없습니다.</label>
                    <label><input type="radio" name="q4" onClick="saver(4,2)"> 자주</label>
                    <label><input type="radio" name="q4" onClick="saver(4,3)"> 항상</label>
                    <label><input type="radio" name="q4" onClick="saver(4,2.5)"> 잘 모르겠습니다.</label>
                </span>
            </div>

            <div class="quiz-box quiz-5">
                <h2 class="quiz-question">5. 선스크린이 당신의 피부를 가렵거나 타는 듯한 느낌, 여드름 유발이나 붉게 만듭니까?</h2>
                <span class="quiz-answer">
                    <label><input type="radio" name="q5" onClick="saver(5,0)"> 결코 없습니다.</label>
                    <label><input type="radio" name="q5" onClick="saver(5,1)"> 거의 없습니다.</label>
                    <label><input type="radio" name="q5" onClick="saver(5,2)"> 자주</label>
                    <label><input type="radio" name="q5" onClick="saver(5,3)"> 항상</label>
                    <label><input type="radio" name="q5" onClick="saver(5,2.5)"> 잘 모르겠습니다.</label>
                </span>
            </div>

            <div class="quiz-box quiz-6">
                <h2 class="quiz-question">6. 아토피, 습진 또는 접촉성 피부염으로 진단 받은 적이 있습니까?</h2>
                <span class="quiz-answer">
                    <label><input type="radio" name="q6" onClick="saver(6,0)"> 아니오.</label>
                    <label><input type="radio" name="q6" onClick="saver(6,1)"> 친구들이 내가 그렇다고 이야기합니다.</label>
                    <label><input type="radio" name="q6" onClick="saver(6,2)"> 네</label>
                    <label><input type="radio" name="q6" onClick="saver(6,3)"> 네 심각한 상태</label>
                    <label><input type="radio" name="q6" onClick="saver(6,2.5)"> 잘 모르겠습니다.</label>
                </span>
            </div>

            <div class="quiz-box quiz-7">
                <h2 class="quiz-question">7. 반지 낀 자리에 붉게 발진이 어느정도 납니까?</h2>
                <span class="quiz-answer">
                    <label><input type="radio" name="q7" onClick="saver(7,0)"> 결코 없습니다.</label>
                    <label><input type="radio" name="q7" onClick="saver(7,1)"> 거의 없습니다.</label>
                    <label><input type="radio" name="q7" onClick="saver(7,2)"> 자주</label>
                    <label><input type="radio" name="q7" onClick="saver(7,3)"> 항상</label>
                    <label><input type="radio" name="q7" onClick="saver(7,2.5)"> 반지를 끼지 않습니다.</label>
                </span>
            </div>

            <div class="quiz-box quiz-8">
                <h2 class="quiz-question">8. 향기나는 버블 바스, 마사지 오일, 바디로션이 당신의 피부에 뭐가 나게 하거나 간지럽거나 건조하게 합니까?</h2>
                <span class="quiz-answer">
                    <label><input type="radio" name="q8" onClick="saver(8,0)"> 결코 없습니다.</label>
                    <label><input type="radio" name="q8" onClick="saver(8,1)"> 거의 없습니다.</label>
                    <label><input type="radio" name="q8" onClick="saver(8,2)"> 자주</label>
                    <label><input type="radio" name="q8" onClick="saver(8,3)"> 항상</label>
                    <label><input type="radio" name="q8" onClick="saver(8,2.5)"> 위와 같은 타입의 제품을 사용하지 않습니다(만약 사용하지 않는 이유가 위의 현상 때문이라면 1번을 체크해주세요).</label>
                </span>
            </div>

            <div class="quiz-box quiz-9">
                <h2 class="quiz-question">9. 호텔에서 제공되는 바디나 페이스 제품을 사용하고 나서 문제가 없습니까?</h2>
                <span class="quiz-answer">
                    <label><input type="radio" name="q9" onClick="saver(9,0)"> 네</label>
                    <label><input type="radio" name="q9" onClick="saver(9,1)"> 거의 없습니다.</label>
                    <label><input type="radio" name="q9" onClick="saver(9,2)"> 피부가 간지럽고 붉어지고 또는 뭐가 납니다.</label>
                    <label><input type="radio" name="q9" onClick="saver(9,3)"> 사용하지 않습니다. 과거에 문제를 겪었기 때문입니다.</label>
                    <label><input type="radio" name="q9" onClick="saver(9,2.5)"> 제 것을 가지고 다녀서 잘 모르겠습니다.</label>
                </span>
            </div>

            <div class="quiz-box quiz-10">
                <h2 class="quiz-question">10. 가족 중에 아토피, 습진, 알레르기, 천식을 가지고 있는 사람이 있습니까?</h2>
                <span class="quiz-answer">
                    <label><input type="radio" name="q10" onClick="saver(10,0)"> 없습니다.</label>
                    <label><input type="radio" name="q10" onClick="saver(10,1)"> 한 명정도</label>
                    <label><input type="radio" name="q10" onClick="saver(10,2)"> 여러 명</label>
                    <label><input type="radio" name="q10" onClick="saver(10,3)"> 많습니다.</label>
                    <label><input type="radio" name="q10" onClick="saver(10,2.5)"> 잘 모르겠습니다.</label>
                </span>
            </div>

            <div class="quiz-box quiz-11">
                <h2 class="quiz-question">11. 향기나는 세제나 정전기 방지제를 사용한 옷을 입을 때 어떻습니까?</h2>
                <span class="quiz-answer">
                    <label><input type="radio" name="q11" onClick="saver(11,0)"> 괜찮습니다.</label>
                    <label><input type="radio" name="q11" onClick="saver(11,1)"> 약간 드라이합니다.</label>
                    <label><input type="radio" name="q11" onClick="saver(11,2)"> 가렵습니다.</label>
                    <label><input type="radio" name="q11" onClick="saver(11,3)"> 가렵고 뭐가 납니다.</label>
                    <label><input type="radio" name="q11" onClick="saver(11,2.5)"> 사용하지 않거나 잘 모르겠습니다.</label>
                </span>
            </div>

            <div class="quiz-box quiz-12">
                <h2 class="quiz-question">12. 운동, 스트레스, 감정적인 변화 등으로 얼굴과 목이 얼마나 자주 붉어집니까?</h2>
                <span class="quiz-answer">
                    <label><input type="radio" name="q12" onClick="saver(12,0)"> 결코 없습니다.</label>
                    <label><input type="radio" name="q12" onClick="saver(12,1)"> 때때로</label>
                    <label><input type="radio" name="q12" onClick="saver(12,2)"> 자주</label>
                    <label><input type="radio" name="q12" onClick="saver(12,3)"> 항상</label>
                </span>
            </div>

            <div class="quiz-box quiz-13">
                <h2 class="quiz-question">13. 알코올을 마시면 얼마나 자주 피부가 붉어지거나 타는 듯한 느낌을 가집니까?</h2>
                <span class="quiz-answer">
                    <label><input type="radio" name="q13" onClick="saver(13,0)"> 결코 없습니다.</label>
                    <label><input type="radio" name="q13" onClick="saver(13,1)"> 때때로</label>
                    <label><input type="radio" name="q13" onClick="saver(13,2)"> 자주</label>
                    <label><input type="radio" name="q13" onClick="saver(13,3)"> 항상</label>
                    <label><input type="radio" name="q13" onClick="saver(13,2.5)"> 알코올을 마시지 않습니다(만약 얼굴이 확 달아오르는 문제 때문에 먹지 않으면 4번을 선택하세요).</label>
                </span>
            </div>

            <div class="quiz-box quiz-14">
                <h2 class="quiz-question">14. 매운 음식이나 뜨거운 음식을 먹으면 얼마나 자주 붉어지거나 확 달아오릅니까?</h2>
                <span class="quiz-answer">
                    <label><input type="radio" name="q14" onClick="saver(14,0)"> 결코 없습니다.</label>
                    <label><input type="radio" name="q14" onClick="saver(14,1)"> 때때로</label>
                    <label><input type="radio" name="q14" onClick="saver(14,2)"> 자주</label>
                    <label><input type="radio" name="q14" onClick="saver(14,3)"> 항상</label>
                    <label><input type="radio" name="q14" onClick="saver(14,2.5)"> 매운 음식을 먹지 않습니다(만약 얼굴이 확 달아오르는 문제 때문에 먹지 않으면 4번을 선택하세요).</label>
                </span>
            </div>

            <div class="quiz-box quiz-15">
                <h2 class="quiz-question">15. 눈에 띄는 붉음증이나 혈관 확장된 부분이 얼굴과 코에 얼마나 있습니까?</h2>
                <span class="quiz-answer">
                    <label><input type="radio" name="q15" onClick="saver(15,0)"> 없습니다.</label>
                    <label><input type="radio" name="q15" onClick="saver(15,1)"> 거의 없습니다(코를 포함해서 1~3부분).</label>
                    <label><input type="radio" name="q15" onClick="saver(15,2)"> 약간 있습니다(4-6부분 코를 포함해서).</label>
                    <label><input type="radio" name="q15" onClick="saver(15,3)"> 많습니다(코를 포함해서 7부분이상).</label>
                </span>
            </div>

            <div class="quiz-box quiz-16">
                <h2 class="quiz-question">16. 사진 찍을 때 얼굴이 붉습니까?</h2>
                <span class="quiz-answer">
                    <label><input type="radio" name="q16" onClick="saver(16,0)"> 결코 없습니다. 또는 그런 때를 본 적이 없습니다.</label>
                    <label><input type="radio" name="q16" onClick="saver(16,1)"> 때때로</label>
                    <label><input type="radio" name="q16" onClick="saver(16,2)"> 자주</label>
                    <label><input type="radio" name="q16" onClick="saver(16,3)"> 항상</label>
                </span>
            </div>

            <div class="quiz-box quiz-17">
                <h2 class="quiz-question">17. 실제로 선번을 입지 않았는데도 사람들이 그렇게 이야기합니까?</h2>
                <span class="quiz-answer">
                    <label><input type="radio" name="q17" onClick="saver(17,0)"> 결코 없습니다.</label>
                    <label><input type="radio" name="q17" onClick="saver(17,1)"> 때때로</label>
                    <label><input type="radio" name="q17" onClick="saver(17,2)"> 자주</label>
                    <label><input type="radio" name="q17" onClick="saver(17,3)"> 항상</label>
                </span>
            </div>

            <div class="quiz-box quiz-18">
                <h2 class="quiz-question">18. 메이크업, 선스크린, 스킨케어 제품들로 가렵거나, 붓거나, 붉어지는 증상을 가지고 있습니까?</h2>
                <span class="quiz-answer">
                    <label><input type="radio" name="q18" onClick="saver(18,0)"> 결코 없습니다.</label>
                    <label><input type="radio" name="q18" onClick="saver(18,1)"> 때때로</label>
                    <label><input type="radio" name="q18" onClick="saver(18,2)"> 자주</label>
                    <label><input type="radio" name="q18" onClick="saver(18,3)"> 항상</label>
                    <label><input type="radio" name="q18" onClick="saver(18,2.5)"> 제품을 사용하지 않는다(만약 위의 증상 때문이라면 4번을 선택하세요).</label>
                </span>
            </div>
            <hr>
            
            <div class="get-result">
                <input class="btn btn-primary" type="button" name="result" value="Submit" onClick="total()">
                <input class="btn btn-default" type="reset" value="Reset">
            </div>

            <hr>

            <div class="result-box" style="display: none">
                <h3>Your skin type is: </h3>
                <div id="result">
                </div>
                
            </div>
            <hr>
        </div>
        <!-- /.container -->
    </form>
    
    <% String a = request.getParameter("test1"); %>
    <form name="type" method="post">
    	<input type="hidden" id="test" name="test2">
    	<input type="hidden" name="test1" value="<%=a%>">
    </form>
    
</body>
</html>