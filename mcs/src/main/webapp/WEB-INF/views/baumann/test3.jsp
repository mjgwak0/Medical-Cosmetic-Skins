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
	var Quest = new Array(11);

	function populate() {
		// alert("function populate started");
		// 질문에 답변하지 않으면 각 답변에 0점을 제공합니다.
		for (var i = 0; i < 11; i++) {
			Quest[i] = 0;
		}
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
		var next = confirm('다음 문항으로 넘어갑니다. (3/4)');
		if(next){
			// 실행 후 다음 페이지로 이동
			frm.action = "/baumann/baumannTest4" 
			// 현재 form 정보를 다음 페이지로 전달
			frm.submit();
		}else{
			false;
		}
	}

	function type(myContentsPtr) {
		$('#test').val(myContentsPtr)
	}

	/*
	function scoreSave(myScore) {
	    var myScore = myScore;
	    console.log(myScore);
	}
	 */

	myContents = new Array();
	myContents[0] = "Type N" + "";
	myContents[1] = "Type P" + "";

	function analyzer(myScore) {
		// 계산된 총 점수를 사용하여 자신이 어떤 성격 유형인지 알아냅니다.
		if (myScore > 30) {
			myContentsPtr = "P";
		} else {
			myContentsPtr = "N";
		}
// 		myDisplay(myContents[myContentsPtr], myScore);
	}

	function myDisplay(myContents, myScore) {
		// 새 창을 열고 계산된 결과를 표시합니다.
		alert(myContents, myScore);
		document.getElementById("result").innerHTML = myContents + " & 총 점: "
				+ myScore;
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
					올바른 피부 타입을 찾기 위한 질문<br> <small>Part 3. 색소침착(Pigmented)
						vs 비색소성(Non pigmented)<br>이 설문지에서는 멜라닌을 형성하는 경향, 과색소침착 다크스팟,
						주근깨 그리고 어떤 외상 후에 검은 부분과 함께 피부색소 침착을 측정합니다. 멜라닌은 피부를 번(Burn)하게
						하기보다는 탠(Tan) 하도록 도와줍니다.
					</small>
				</h1>
			</div>

			<div class="quiz-box quiz-1">
				<h2 class="quiz-question">1. 여드름이나 피부속으로 파고드는 헤어가 난 후에 어둡고
					갈색이거나 블랙스팟이 생깁니까?</h2>
				<span class="quiz-answer"> <label><input type="radio"
						name="q1" onClick="saver(1,0)"> 없거나 본적 없습니다.</label> <label><input
						type="radio" name="q1" onClick="saver(1,1)"> 때때로</label> <label><input
						type="radio" name="q1" onClick="saver(1,2)"> 자주</label> <label><input
						type="radio" name="q1" onClick="saver(1,3)"> 항상</label> <label><input
						type="radio" name="q1" onClick="saver(1,2.5)"> 여드름이나 피부속으로
						파고드는 헤어가 없다.</label>
				</span>
			</div>

			<div class="quiz-box quiz-2">
				<h2 class="quiz-question">2. 무엇에 베었을 때, 어둡거나 붉은기가 얼마나 오래도록
					남아있습니까?</h2>
				<span class="quiz-answer"> <label><input type="radio"
						name="q2" onClick="saver(2,0)"> 없거나 본적 없습니다.</label> <label><input
						type="radio" name="q2" onClick="saver(2,1)"> 한주</label> <label><input
						type="radio" name="q2" onClick="saver(2,2)"> 몇 주</label> <label><input
						type="radio" name="q2" onClick="saver(2,3)"> 여러 달</label>
				</span>
			</div>

			<div class="quiz-box quiz-3">
				<h2 class="quiz-question">3. 임신했을 때나 피임약 복용 시, 호르몬 대체요법시 얼마나 많은
					과색소침착된 구역이 있었나요?</h2>
				<span class="quiz-answer"> <label><input type="radio"
						name="q3" onClick="saver(3,0)"> 없습니다.</label> <label><input
						type="radio" name="q3" onClick="saver(3,1)"> 한 구역</label> <label><input
						type="radio" name="q3" onClick="saver(3,2)"> 여러 구역</label> <label><input
						type="radio" name="q3" onClick="saver(3,3)"> 엄청 많음</label> <label><input
						type="radio" name="q3" onClick="saver(3,2.5)"> 이 질문은 나에게
						해당이 안됨(남자이거나 임신한적, 피임약복용한적, 호르몬대체요법을 한적이 없다. 또는 다크스팟이 생긴 적이 없다).</label>
				</span>
			</div>

			<div class="quiz-box quiz-4">
				<h2 class="quiz-question">4. 윗입술이나 양 볼에 어떤 어두운 부분이 있습니까? 또는 과거에
					있었던 적이 있어서 제거했습니까?</h2>
				<span class="quiz-answer"> <label><input type="radio"
						name="q4" onClick="saver(4,0)"> 없습니다.</label> <label><input
						type="radio" name="q4" onClick="saver(4,1)"> 잘 모르겠습니다.</label> <label><input
						type="radio" name="q4" onClick="saver(4,2)"> 약간 보입니다.</label> <label><input
						type="radio" name="q4" onClick="saver(4,3)"> 여러 부분 보입니다.</label>
				</span>
			</div>

			<div class="quiz-box quiz-5">
				<h2 class="quiz-question">5. 햇빛을 보고 돌아다닐 때 피부 위에 있는 어두운 패치같은
					부분들이 더 심해집니까?</h2>
				<span class="quiz-answer"> <label><input type="radio"
						name="q5" onClick="saver(5,0)"> 어두운 패치같은 부위가 없습니다.</label> <label><input
						type="radio" name="q5" onClick="saver(5,1)"> 모름</label> <label><input
						type="radio" name="q5" onClick="saver(5,2)"> 약간 심해짐</label> <label><input
						type="radio" name="q5" onClick="saver(5,3)"> 많이 심해짐</label> <label><input
						type="radio" name="q5" onClick="saver(5,2.5)"> 선크림을 매일 바르고
						햇빛을 보지 않습니다(만약 다크패치가 생기거나 주근깨가 생길까봐 항상 선크림을 바른다면 4번으로 체크하세요).</label>
				</span>
			</div>

			<div class="quiz-box quiz-6">
				<h2 class="quiz-question">6. 기미, 좀 옅거나 어두운 브라운색 또는 그레이 패치가 있다고
					진단 받은 적이 있나요?</h2>
				<span class="quiz-answer"> <label><input type="radio"
						name="q6" onClick="saver(6,0)"> 없습니다.</label> <label><input
						type="radio" name="q6" onClick="saver(6,1)"> 그런 적이 있지만 지금은
						없습니다.</label> <label><input type="radio" name="q6"
						onClick="saver(6,2)"> 지금도 있습니다.</label> <label><input
						type="radio" name="q6" onClick="saver(6,3)"> 심각하게 많습니다.</label> <label><input
						type="radio" name="q6" onClick="saver(6,2.5)"> 잘 모르겠습니다.</label>
				</span>
			</div>

			<div class="quiz-box quiz-7">
				<h2 class="quiz-question">7. 얼굴, 가슴, 등 또는 팔에 작은 브라운 스팟들을 가지고
					있거나 가졌던 적이 있습니까?</h2>
				<span class="quiz-answer"> <label><input type="radio"
						name="q7" onClick="saver(7,0)"> 없습니다.</label> <label><input
						type="radio" name="q7" onClick="saver(7,1)"> 약간 있습니다.
						(1-5)</label> <label><input type="radio" name="q7"
						onClick="saver(7,2)"> 많이 있습니다. (6~15)</label> <label><input
						type="radio" name="q7" onClick="saver(7,3)"> 엄청 많습니다. (16
						이상)</label>
				</span>
			</div>

			<div class="quiz-box quiz-8">
				<h2 class="quiz-question">8. 몇 달 동안 처음으로 햇빛에 노출되었을 때 피부는 어떻습니까?</h2>
				<span class="quiz-answer"> <label><input type="radio"
						name="q8" onClick="saver(8,0)"> 선번만 됩니다.</label> <label><input
						type="radio" name="q8" onClick="saver(8,1)"> 전번 되고 나서
						어두워집니다.</label> <label><input type="radio" name="q8"
						onClick="saver(8,2)"> 점점 어두워집니다.</label> <label><input
						type="radio" name="q8" onClick="saver(8,3)"> 내 피부는 이미 어둡다
						또는 어두워졌다는 것을 잘 모르겠습니다(만약 햇빛에 노출이 되지 않는다면 어린시절의 경험을 기반으로 응답해주십시오).</label>
				</span>
			</div>

			<div class="quiz-box quiz-9">
				<h2 class="quiz-question">9. 몇일동안 지속적으로 햇볕을 본다면 무슨 일이 일어납니까?</h2>
				<span class="quiz-answer"> <label><input type="radio"
						name="q9" onClick="saver(9,0)"> 선번과 물집, 그러나 피부색은 변화 없습니다.</label>
					<label><input type="radio" name="q9" onClick="saver(9,1)">
						피부가 좀 더 어두워집니다.</label> <label><input type="radio" name="q9"
						onClick="saver(9,2)"> 피부가 많이 어두워집니다.</label> <label><input
						type="radio" name="q9" onClick="saver(9,3)"> 내 피부는 이미 어둡다
						또는 어두워졌다는 것을 잘 모르겠습니다(만약 햇빛에 노출이 되지 않는다면 어린시절의 경험을 기반으로 응답해주십시오).</label>
				</span>
			</div>

			<div class="quiz-box quiz-10">
				<h2 class="quiz-question">10. 원래 머리색은 무슨 색 입니까?</h2>
				<span class="quiz-answer"> <label><input type="radio"
						name="q10" onClick="saver(10,0)"> 금발</label> <label><input
						type="radio" name="q10" onClick="saver(10,1)"> 브라운</label> <label><input
						type="radio" name="q10" onClick="saver(10,2)"> 블랙</label> <label><input
						type="radio" name="q10" onClick="saver(10,3)"> 레드</label>
				</span>
			</div>

			<div class="quiz-box quiz-11">
				<h2 class="quiz-question">11. 태양에 노출된 부분에 다크 스팟이 생성됩니까?</h2>
				<span class="quiz-answer"> <label><input type="radio"
						name="q11" onClick="saver(11,0)"> 생성되지 않습니다.</label> <label><input
						type="radio" name="q11" onClick="saver(11,5)"> 생성됩니다.</label>
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
			<hr>
		</div>
		<!-- /.container -->
	</form>

	<% String a = request.getParameter("test1"); %>
	<% String b = request.getParameter("test2"); %>
	<form name="type" method="post">
		<input type="hidden" id="test" name="test3">
		<input type="hidden" name="test1" value="<%=a%><%=b%>">
	</form>

</body>

</html>
