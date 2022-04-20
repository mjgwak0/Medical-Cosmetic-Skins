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
	// 이것은 주어진 모든 답변에 대한 배열을 설정합니다.
	var Quest = new Array(11);

	function populate() {
		// alert("function populate started");
		// 질문에 답변하지 않으면 각 답변에 0점을 제공합니다.
		for (var i = 0; i < 11; i++) {
			Quest[i] = 0;
		}
	}
	function myDisplay(myContents, myScore) {
		// 새 창을 열고 계산된 결과를 표시합니다.
		//alert(myContents);
		document.getElementById("result").innerHTML = myContents + " & 총 점: "
				+ myScore;
	}

	function total() {
		// 각 답변의 값을 합산합니다.
		myScore = 0;
		for (var i = 0; i < 11; i++) {
			myScore = myScore + Quest[i];
		}
		analyzer(myScore);		
		type(myContentsPtr);
		
		var frm = document.type;
		var next = confirm('다음 문항으로 넘어갑니다. (1/4)');
		if(next){
			// 실행 후 다음 페이지로 이동
			frm.action = "/baumann/baumannTest2" 
			// 현재 form 정보를 다음 페이지로 전달
			frm.submit();
		}else{
			false;
		}
	}
	
	function type(myContentsPtr){
		$('#test').val(myContentsPtr)
	}

	/*
	function scoreSave(myScore) {
	    var myScore = myScore;
	    console.log(myScore);
	}
	 */

	myContents = new Array();
	myContents[0] = "D";
	myContents[1] = "O";
	
	function analyzer(myScore) {
		// 계산된 총 점수를 사용하여 자신이 어떤 성격 유형인지 알아냅니다.
		if (myScore > 26) {
			myContentsPtr = "O";
		} else {
			myContentsPtr = "D";
		}
// 		myDisplay(myContents[myContentsPtr]);
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
				<h1>
					올바른 피부 타입을 찾기 위한 질문<br> <small>Part 1. 지성(Oily) vs
						건성(Dry)<br>평상시에 생각하고 있던 부분으로 체크하지 말고 실질적으로 느껴지는 대로 체크해주십시오.
					</small>
				</h1>
			</div>

			<div class="quiz-box quiz-1">
				<h2 class="quiz-question">1. 클렌징 후에, 아무것도 바르지 말고 2~3시간 후에 밝은 빛
					아래서 거울을 보세요. 이마와 볼이 어떻게 보이고 느껴지나요?</h2>
				<span class="quiz-answer"> <label><input type="radio"
						name="q1" onClick="saver(1,0)"> 매우 거칠고, 버석거리고 각질이 들떠 보입니다.</label>
					<label><input type="radio" name="q1" onClick="saver(1,1)">
						당깁니다.</label> <label><input type="radio" name="q1"
						onClick="saver(1,2)"> 당기지 않고 건조해 보이지 않고 번들거리지 않습니다.</label> <label><input
						type="radio" name="q1" onClick="saver(1,3)"> 밝은 빛에 반사되는 듯이
						번들거립니다.</label>
				</span>
			</div>

			<div class="quiz-box quiz-2">
				<h2 class="quiz-question">2. 사진을 찍었을 때, 피부가 번들거리나요?</h2>
				<span class="quiz-answer"> <label><input type="radio"
						name="q2" onClick="saver(2,0)"> 결코 그렇지 않습니다.</label> <label><input
						type="radio" name="q2" onClick="saver(2,1)"> 때때로 </label> <label><input
						type="radio" name="q2" onClick="saver(2,2)"> 자주</label> <label><input
						type="radio" name="q2" onClick="saver(2,3)"> 항상</label>
				</span>
			</div>

			<div class="quiz-box quiz-3">
				<h2 class="quiz-question">3. 메이크업 파운데이션(파우더는 안 바른 상태)을 바른 지
					2~3시간 후에 메이크업이 어찌 보이나요?</h2>
				<span class="quiz-answer"> <label><input type="radio"
						name="q3" onClick="saver(3,0)"> 약간 들떠 보이고 주름진 부분이 나타납니다.</label> <label><input
						type="radio" name="q3" onClick="saver(3,1)"> 부드러워 보입니다.</label> <label><input
						type="radio" name="q3" onClick="saver(3,2)"> 번들거립니다.</label> <label><input
						type="radio" name="q3" onClick="saver(3,3)"> 고정이 안되고
						번들거립니다.</label> <label><input type="radio" name="q3"
						onClick="saver(3,2.5)"> 페이셜 파운데이션을 바르지 않습니다.</label>
				</span>
			</div>

			<div class="quiz-box quiz-4">
				<h2 class="quiz-question">4. 건조할 때 모이스처라이저나 선크림을 안 바르면 당신의 피부는
					어떠한가요?</h2>
				<span class="quiz-answer"> <label><input type="radio"
						name="q4" onClick="saver(4,0)"> 건조하고 갈라질 것 같습니다.</label> <label><input
						type="radio" name="q4" onClick="saver(4,1)"> 당김을 느낍니다.</label> <label><input
						type="radio" name="q4" onClick="saver(4,2)"> 정상적입니다.</label> <label><input
						type="radio" name="q4" onClick="saver(4,3)"> 번들거리고
						모이스처라이저가 필요 없습니다.</label> <label><input type="radio" name="q4"
						onClick="saver(4,2.5)"> 잘 모르겠습니다.</label>
				</span>
			</div>

			<div class="quiz-box quiz-5">
				<h2 class="quiz-question">5. 확대경을 보았을 때, 모공이 많고 사이즈가 핀의 끝보다도 더
					커보이나요?</h2>
				<span class="quiz-answer"> <label><input type="radio"
						name="q5" onClick="saver(5,0)"> 아니오.</label> <label><input
						type="radio" name="q5" onClick="saver(5,1)"> 티존이 좀 보입니다.
						(이마와 코)</label> <label><input type="radio" name="q5"
						onClick="saver(5,2)"> 많이 보입니다.</label> <label><input
						type="radio" name="q5" onClick="saver(5,3)"> 정말 엄청나게 보입니다.</label>
					<label><input type="radio" name="q5" onClick="saver(5,2.5)">
						잘 모르겠습니다. (다시 보고도 정말 판별 안될 때 체크하세요)</label>
				</span>
			</div>

			<div class="quiz-box quiz-6">
				<h2 class="quiz-question">6. 당신의 피부를 어떻게 생각하고 계십니까?</h2>
				<span class="quiz-answer"> <label><input type="radio"
						name="q6" onClick="saver(6,0)"> 드라이</label> <label><input
						type="radio" name="q6" onClick="saver(6,1)"> 노말</label> <label><input
						type="radio" name="q6" onClick="saver(6,2)"> 복합</label> <label><input
						type="radio" name="q6" onClick="saver(6,3)"> 오일리</label>
				</span>
			</div>

			<div class="quiz-box quiz-7">
				<h2 class="quiz-question">7. 거품이 많이 나는 비누를 사용할 때 피부의 상태는 어떠한가요?</h2>
				<span class="quiz-answer"> <label><input type="radio"
						name="q7" onClick="saver(7,0)"> 건조하고 갈라집니다.</label> <label><input
						type="radio" name="q7" onClick="saver(7,1)"> 약간 건조하고 갈라지지는
						않습니다.</label> <label><input type="radio" name="q7"
						onClick="saver(7,2)"> 정상</label> <label><input
						type="radio" name="q7" onClick="saver(7,3)"> 오일리</label> <label><input
						type="radio" name="q7" onClick="saver(7,2.5)"> 비누나 거품형
						클렌저를 사용하지 않습니다. (만약 사용하지 않는 이유가 피부가 건조해져서 그렇다면 1번을 선택하십시오)</label>
				</span>
			</div>

			<div class="quiz-box quiz-8">
				<h2 class="quiz-question">8. 모이스처라이저를 안 발랐을 때, 당신의 피부 상태는 당기나요?</h2>
				<span class="quiz-answer"> <label><input type="radio"
						name="q8" onClick="saver(8,0)"> 항상</label> <label><input
						type="radio" name="q8" onClick="saver(8,1)"> 때때로</label> <label><input
						type="radio" name="q8" onClick="saver(8,2)"> 거의 그렇지 않습니다.</label>
					<label><input type="radio" name="q8" onClick="saver(8,3)">
						결코 그렇지 않습니다.</label>
				</span>
			</div>

			<div class="quiz-box quiz-9">
				<h2 class="quiz-question">9. 화이트헤드나 블랙헤드가 있는지요?</h2>
				<span class="quiz-answer"> <label><input type="radio"
						name="q9" onClick="saver(9,0)"> 결코 없습니다.</label> <label><input
						type="radio" name="q9" onClick="saver(9,1)"> 거의 그렇지 않습니다.</label>
					<label><input type="radio" name="q9" onClick="saver(9,2)">
						때때로 그렇습니다.</label> <label><input type="radio" name="q9"
						onClick="saver(9,3)"> 항상 그렇습니다.</label>
				</span>
			</div>

			<div class="quiz-box quiz-10">
				<h2 class="quiz-question">10. 얼굴에서 T-존이 오일리 합니까? (이마와 코)</h2>
				<span class="quiz-answer"> <label><input type="radio"
						name="q10" onClick="saver(10,0)"> 결코 아닙니다.</label> <label><input
						type="radio" name="q10" onClick="saver(10,1)"> 때때로</label> <label><input
						type="radio" name="q10" onClick="saver(10,2)"> 자주</label> <label><input
						type="radio" name="q10" onClick="saver(10,3)"> 항상</label>
				</span>
			</div>

			<div class="quiz-box quiz-11">
				<h2 class="quiz-question">11. 모이스처라이저를 바르고 2~3시간 후에 당신의 볼은
					어떻습니까?</h2>
				<span class="quiz-answer"> <label><input type="radio"
						name="q11" onClick="saver(11,0)"> 매우 거칠고, 각질이 일어나거나 또는 각질이
						떨어집니다.</label> <label><input type="radio" name="q11"
						onClick="saver(11,1)"> 부드럽습니다.</label> <label><input
						type="radio" name="q11" onClick="saver(11,2)"> 조금 번들거림이
						있습니다.</label> <label><input type="radio" name="q11"
						onClick="saver(11,3)"> 번들거리고 기름집니다 또는 모이스처라이저를 사용하지 않습니다.</label>
				</span>
			</div>
			<hr>

			<div class="get-result">
				<input class="btn btn-primary" type="button" name="result"
					value="Submit" onClick="total()"> <input
					class="btn btn-default" type="reset" value="Reset">
			</div>

			<hr>

			<div class="result-box" style="display: none">
				<h3>Your skin type is:</h3>
				<div id="result"></div>

			</div>
		</div>
		<!-- /.container -->
	</form>
	
	<form name="type" method="post">
<!-- 		<input type="text" id="test" name="balance"> -->
		<input type="hidden" id="test" name="test1">
	</form>
	
</body>
</html>
