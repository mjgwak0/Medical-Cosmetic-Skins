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
        var Quest = new Array(20); 

        function populate() {
            // alert("function populate started");
            // 질문에 답변하지 않으면 각 답변에 0점을 제공합니다.
            for (var i = 0; i < 20; i++) {
                Quest[i] = 0;
            }
        }

        function total() {
            // 각 답변의 값을 합산합니다.
            myScore = 0;
            for (var i = 0; i < 20; i++) {
                myScore = myScore + Quest[i];
            }
            analyzer(myScore);            
            type(myContentsPtr);
            
    		var frm = document.type;
    		var next = confirm('테스트가 끝났습니다. 결과를 확인하시겠습니까? (3/4)');
    		if(next){
    			// 실행 후 다음 페이지로 이동
    			frm.action = "/baumann/baumannResult" 
    			// 현재 form 정보를 다음 페이지로 전달
    			frm.submit();
    		}else{
    			false;
    		}
        }


    	function type(myContentsPtr){
    		$('#test').val(myContentsPtr);
    		
    		// 바우만 결과값 저장
    	    var test1 = $("#test1").val();
    	    var test4 = $("#test").val();
    	    var baumannType ="";
    	    
    	    
    	    baumannType = test1 + test4;
    	    $("#baumannType").val(baumannType); 
    	    
    	}
        
        /*
        function scoreSave(myScore) {
            var myScore = myScore;
            console.log(myScore);
        }
        */

        myContents = new Array();
        myContents[0] = "Type T" + "";
        myContents[1] = "Type W" + "";

        function analyzer(myScore) {
            // 계산된 총 점수를 사용하여 자신이 어떤 성격 유형인지 알아냅니다.
            if (myScore > 40) {
                myContentsPtr = "W";
            }
            else {
                myContentsPtr = "T";
            }
//             myDisplay(myContents[myContentsPtr], myScore);
        }

        function myDisplay(myContents, myScore) {
            // 새 창을 열고 계산된 결과를 표시합니다.
            alert(myContents, myScore);
            document.getElementById("result").innerHTML = myContents + " & 총 점: " +myScore;
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
                    <small>Part 4. 주름진(Wrinkled) vs 탱탱한(Tight)<br>이 설문지는 현재 얼마나 주름이 졌는지 . 그리고 주름지는 경향을 측정하는 파트입니다.</small>
                </h1>
            </div>

            <div class="quiz-box quiz-1">
                <h2 class="quiz-question">1. 얼굴에 주름이 있습니까?</h2>
                <span class="quiz-answer">
                    <label><input type="radio" name="q1" onClick="saver(1,0)"> 아니오. 웃거나 찡그리거나 눈썹을 들어올려도 생기지 않습니다.</label>
                    <label><input type="radio" name="q1" onClick="saver(1,1)"> 표정을 지을 때만 생깁니다.</label>
                    <label><input type="radio" name="q1" onClick="saver(1,2)"> 표정을 지을 때도 생기도 표정을 짓지 않아도 주름이 좀 있습니다.</label>
                    <label><input type="radio" name="q1" onClick="saver(1,3)"> 어떤 표정도 짓고 있지 않아도 주름들이 있습니다.</label>
                </span>
            </div>

            <div class="quiz-box quiz-2">
                <h2 class="quiz-question">&lt;2-7번을 응답할 때 본인 및 가족까지 생각하면서 답변해주세요.&gt;<br><br>2. 당신의 어머니의 피부 나이는 얼마로 보이십니까?</h2>
                <span class="quiz-answer">
                    <label><input type="radio" name="q2" onClick="saver(2,0)"> 그녀의 나이보다 5년에서 10년 어려 보입니다.</label>
                    <label><input type="radio" name="q2" onClick="saver(2,1)"> 그대로의 나이로 보입니다.</label>
                    <label><input type="radio" name="q2" onClick="saver(2,2)"> 5년 정도 더 나이 들어 보입니다.</label>
                    <label><input type="radio" name="q2" onClick="saver(2,3)"> 5년 이상 더 나이 들어 보입니다.</label>
                    <label><input type="radio" name="q2" onClick="saver(2,2.5)"> 알 수 없다(입양, 또는 전혀 기억이 안 남).</label>
                </span>
            </div>

            <div class="quiz-box quiz-3">
                <h2 class="quiz-question">3. 당신의 아버지의 피부 나이는 얼마로 보입니까?</h2>
                <span class="quiz-answer">
                    <label><input type="radio" name="q3" onClick="saver(3,0)"> 그의 나이보다 5년에서 10년 어려 보입니다.</label>
                    <label><input type="radio" name="q3" onClick="saver(3,1)"> 그대로의 나이로 보입니다.</label>
                    <label><input type="radio" name="q3" onClick="saver(3,2)"> 5년 정도 더 나이 들어 보입니다.</label>
                    <label><input type="radio" name="q3" onClick="saver(3,3)"> 5년 이상 더 나이 들어 보입니다.</label>
                    <label><input type="radio" name="q3" onClick="saver(3,2.5)"> 알 수 없다(입양, 또는 전혀 기억이 안 남).</label>
                </span>
            </div>

            <div class="quiz-box quiz-4">
                <h2 class="quiz-question">4. 당신의 외할머니의 피부 나이는 얼마로 보이십니까?</h2>
                <span class="quiz-answer">
                    <label><input type="radio" name="q4" onClick="saver(4,0)"> 그녀의 나이보다 5년에서 10년 어려 보입니다.</label>
                    <label><input type="radio" name="q4" onClick="saver(4,1)"> 그대로의 나이로 보입니다.</label>
                    <label><input type="radio" name="q4" onClick="saver(4,2)"> 5년 정도 더 나이 들어 보입니다.</label>
                    <label><input type="radio" name="q4" onClick="saver(4,3)"> 5년 이상 더 나이 들어 보입니다.</label>
                    <label><input type="radio" name="q4" onClick="saver(4,2.5)"> 알 수 없다(입양, 또는 전혀 기억이 안 남).</label>
                </span>
            </div>

            <div class="quiz-box quiz-5">
                <h2 class="quiz-question">5. 당신의 외할아버지 피부 나이는 얼마로 보이십니까?</h2>
                <span class="quiz-answer">
                    <label><input type="radio" name="q5" onClick="saver(5,0)"> 그의 나이보다 5년에서 10년 어려 보입니다.</label>
                    <label><input type="radio" name="q5" onClick="saver(5,1)"> 그대로의 나이로 보입니다.</label>
                    <label><input type="radio" name="q5" onClick="saver(5,2)"> 5년 정도 더 나이 들어 보입니다.</label>
                    <label><input type="radio" name="q5" onClick="saver(5,3)"> 5년 이상 더 나이 들어 보입니다.</label>
                    <label><input type="radio" name="q5" onClick="saver(5,2.5)"> 알 수 없다(입양, 또는 전혀 기억이 안 남).</label>
                </span>
            </div>

            <div class="quiz-box quiz-6">
                <h2 class="quiz-question">6. 당신의 친할머니의 피부 나이는 얼마로 보이십니까?</h2>
                <span class="quiz-answer">
                    <label><input type="radio" name="q6" onClick="saver(6,0)"> 그녀의 나이보다 5년에서 10년 어려 보입니다.</label>
                    <label><input type="radio" name="q6" onClick="saver(6,1)"> 그대로의 나이로 보입니다.</label>
                    <label><input type="radio" name="q6" onClick="saver(6,2)"> 5년 정도 더 나이 들어 보입니다.</label>
                    <label><input type="radio" name="q6" onClick="saver(6,3)"> 5년 이상 더 나이 들어 보입니다.</label>
                    <label><input type="radio" name="q6" onClick="saver(6,2.5)"> 알 수 없다(입양, 또는 전혀 기억이 안 남).</label>
                </span>
            </div>

            <div class="quiz-box quiz-7">
                <h2 class="quiz-question">7. 당신의 친할아버지의 피부 나이는 얼마로 보이십니까?</h2>
                <span class="quiz-answer">
                    <label><input type="radio" name="q7" onClick="saver(7,0)"> 그의 나이보다 5년에서 10년 어려 보입니다.</label>
                    <label><input type="radio" name="q7" onClick="saver(7,1)"> 그대로의 나이로 보입니다.</label>
                    <label><input type="radio" name="q7" onClick="saver(7,2)"> 5년 정도 더 나이 들어 보입니다.</label>
                    <label><input type="radio" name="q7" onClick="saver(7,3)"> 5년 이상 더 나이 들어 보입니다.</label>
                    <label><input type="radio" name="q7" onClick="saver(7,2.5)"> 알 수 없다(입양, 또는 전혀 기억이 안 남).</label>
                </span>
            </div>

            <div class="quiz-box quiz-8">
                <h2 class="quiz-question">8. 살면서 2주 이상 피부를 태닝했던 적이 있습니까? 그렇다면 몇 번이나 그렇게 하셨습니까? (테니스, 낚시, 골프, 스키 등의 외부 운동들도 포함)</h2>
                <span class="quiz-answer">
                    <label><input type="radio" name="q8" onClick="saver(8,0)"> 없다.</label>
                    <label><input type="radio" name="q8" onClick="saver(8,1)"> 1~5년 정도</label>
                    <label><input type="radio" name="q8" onClick="saver(8,2)"> 5~10년 정도</label>
                    <label><input type="radio" name="q8" onClick="saver(8,3)"> 10년 이상</label>
                </span>
            </div>

            <div class="quiz-box quiz-9">
                <h2 class="quiz-question">9. 살면서 시즌에 따라서 2주 이상 태닝 프로그램을 진행한 적이 있습니까?</h2>
                <span class="quiz-answer">
                    <label><input type="radio" name="q9" onClick="saver(9,0)"> 없다.</label>
                    <label><input type="radio" name="q9" onClick="saver(9,1)"> 1~5년 정도</label>
                    <label><input type="radio" name="q9" onClick="saver(9,2)"> 5~10년 정도</label>
                    <label><input type="radio" name="q9" onClick="saver(9,3)"> 10년 이상</label>
                </span>
            </div>

            <div class="quiz-box quiz-10">
                <h2 class="quiz-question">10. 사는 곳을 기준으로 하루에 얼마나 많이 태양에 노출되어 지내십니까?</h2>
                <span class="quiz-answer">
                    <label><input type="radio" name="q10" onClick="saver(10,0)"> 거의 없음 : 대부분 실내에 머물고 햇빛을 많이 보는 지역이 아닙니다.</label>
                    <label><input type="radio" name="q10" onClick="saver(10,1)"> 약간 : 햇빛이 강하지는 않으나 일반적으로 해를 보고 삽니다.</label>
                    <label><input type="radio" name="q10" onClick="saver(10,2)"> 중간 정도 : 꽤 햇빛 노출되어 지냅니다.</label>
                    <label><input type="radio" name="q10" onClick="saver(10,3)"> 많음 : 적도부위, 햇빛이 쨍쨍한 지역에 삽니다.</label>
                </span>
            </div>

            <div class="quiz-box quiz-11">
                <h2 class="quiz-question">11. 보기에 나이가 어느정도 되어 보입니까?</h2>
                <span class="quiz-answer">
                    <label><input type="radio" name="q11" onClick="saver(11,0)"> 나이보다 1~5년정도 젊어 보임</label>
                    <label><input type="radio" name="q11" onClick="saver(11,1)"> 그대로의 나이로 보임</label>
                    <label><input type="radio" name="q11" onClick="saver(11,2)"> 5년 정도 더 많아 보임</label>
                    <label><input type="radio" name="q11" onClick="saver(11,3)"> 5년 이상 더 많아 보임</label>
                </span>
            </div>

            <div class="quiz-box quiz-12">
                <h2 class="quiz-question">12. 최근 5년동안 의도적이든 그렇지 않든 실외스포츠나 다른 활동 등으로 피부를 햇빛에 오래도록 노출한적인 있습니까?</h2>
                <span class="quiz-answer">
                    <label><input type="radio" name="q12" onClick="saver(12,0)"> 없습니다.</label>
                    <label><input type="radio" name="q12" onClick="saver(12,1)"> 한달에 한 번</label>
                    <label><input type="radio" name="q12" onClick="saver(12,2)"> 일주일에 한 번</label>
                    <label><input type="radio" name="q12" onClick="saver(12,3)"> 매일</label>
                </span>
            </div>

            <div class="quiz-box quiz-13">
                <h2 class="quiz-question">13. 얼마나 자주 태닝을 받으러 다니십니까? (한 달 기준)</h2>
                <span class="quiz-answer">
                    <label><input type="radio" name="q13" onClick="saver(13,0)"> 없습니다.</label>
                    <label><input type="radio" name="q13" onClick="saver(13,1)"> 1~5번 정도</label>
                    <label><input type="radio" name="q13" onClick="saver(13,2)"> 5~10번 정도</label>
                    <label><input type="radio" name="q13" onClick="saver(13,3)"> 10번 이상</label>
                </span>
            </div>

            <div class="quiz-box quiz-14">
                <h2 class="quiz-question">14. 인생을 살면서 얼마나 많이 담배를 피우십니까? 또는 담배 피는 환경에 노출되어 있으십니까?</h2>
                <span class="quiz-answer">
                    <label><input type="radio" name="q14" onClick="saver(14,0)"> 없습니다.</label>
                    <label><input type="radio" name="q14" onClick="saver(14,1)"> 몇 보루정도</label>
                    <label><input type="radio" name="q14" onClick="saver(14,2)"> 여러 보루</label>
                    <label><input type="radio" name="q14" onClick="saver(14,3)"> 매일 담배를 핌</label>
                </span>
            </div>

            <div class="quiz-box quiz-15">
                <h2 class="quiz-question">15. 거주하는 곳의 공기 상태는 어떻습니까?</h2>
                <span class="quiz-answer">
                    <label><input type="radio" name="q15" onClick="saver(15,0)"> 맑고 깨끗합니다.</label>
                    <label><input type="radio" name="q15" onClick="saver(15,1)"> 맑고 깨끗한 때도 있고 그렇지 않을 때도 있습니다.</label>
                    <label><input type="radio" name="q15" onClick="saver(15,2)"> 약간 오염되어 있습니다.</label>
                    <label><input type="radio" name="q15" onClick="saver(15,3)"> 공기 오염이 심합니다.</label>
                </span>
            </div>

            <div class="quiz-box quiz-16">
                <h2 class="quiz-question">16. 레티놀, 레노바, 레틴-A, 타자로틴, 디페린, 에바쥐와 같은 비타민 페이셜 크림을 얼마나 오래 사용했습니까?</h2>
                <span class="quiz-answer">
                    <label><input type="radio" name="q16" onClick="saver(16,0)"> 수년</label>
                    <label><input type="radio" name="q16" onClick="saver(16,1)"> 때때로</label>
                    <label><input type="radio" name="q16" onClick="saver(16,2)"> 어렸을 때 여드름으로</label>
                    <label><input type="radio" name="q16" onClick="saver(16,3)"> 없다.</label>
                </span>
            </div>

            <div class="quiz-box quiz-17">
                <h2 class="quiz-question">17. 얼마나 자주 과일과 채소를 드십니까?</h2>
                <span class="quiz-answer">
                    <label><input type="radio" name="q17" onClick="saver(17,0)"> 매일</label>
                    <label><input type="radio" name="q17" onClick="saver(17,1)"> 하루 한 번</label>
                    <label><input type="radio" name="q17" onClick="saver(17,2)"> 때때로</label>
                    <label><input type="radio" name="q17" onClick="saver(17,3)"> 안 먹음</label>
                </span>
            </div>

            <div class="quiz-box quiz-18">
                <h2 class="quiz-question">18. 하루 먹는 것 중에서 과일과 채소가 차지하는 비율은 얼마나 됩니까?</h2>
                <span class="quiz-answer">
                    <label><input type="radio" name="q18" onClick="saver(18,0)"> 75~100%</label>
                    <label><input type="radio" name="q18" onClick="saver(18,1)"> 25~75%</label>
                    <label><input type="radio" name="q18" onClick="saver(18,2)"> 10~25%</label>
                    <label><input type="radio" name="q18" onClick="saver(18,3)"> 0~10%</label>
                </span>
            </div>

            <div class="quiz-box quiz-19">
                <h2 class="quiz-question">19. 본연의 피부색은 어떻습니까?</h2>
                <span class="quiz-answer">
                    <label><input type="radio" name="q19" onClick="saver(19,0)"> 어두움</label>
                    <label><input type="radio" name="q19" onClick="saver(19,1)"> 밝음</label>
                    <label><input type="radio" name="q19" onClick="saver(19,2)"> 중간</label>
                    <label><input type="radio" name="q19" onClick="saver(19,3)"> 매우 밝음</label>
                </span>
            </div>

            <div class="quiz-box quiz-20">
                <h2 class="quiz-question">20. 현재 당신의 나이는 어디에 해당됩니까?</h2>
                <span class="quiz-answer">
                    <label><input type="radio" name="q20" onClick="saver(20,0)"> 만 65세 미만</label>
                    <label><input type="radio" name="q20" onClick="saver(20,5)"> 만 65세 이상</label>
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
    <% String b = request.getParameter("test3"); %>
    <input type="hidden" id="test" name="test4">
    <input type="hidden" id="test1" name="test1" value="<%=a%><%=b%>">
    
    <form name="type" method="post">
    <input type="hidden" id="baumannType" name="baumann">
    </form>
    
</body>
</html>
