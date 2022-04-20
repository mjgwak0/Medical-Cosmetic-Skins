<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link href='https://fonts.googleapis.com/css?family=Roboto+Slab:700'
	rel='stylesheet' type='text/css'>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="/css/survey.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
	<% String a = request.getParameter("baumann"); %>
    <form>
        <div class="container">

            <div class="page-header">
                <h1>나의 피부타입은?</h1>
                    <!--                    
                    <small>Part 1. 지성(Oily) vs 건성(Dry)<br>평상시에 생각하고 있던 부분으로 체크하지 말고 실질적으로 느껴지는 대로 체크해주십시오.</small>
                    -->
            </div>
            <div class="main">
                <div class="cont1">
                    <table class="mbti-grid">
                        <tbody>
                            <tr>
                                <td class="mbti-cell" id="DRPT">
                                    <h6>DRPT</h6>
                                    <p><span class="mbti-text">DRY|RESISTANT|PIGMENTED|TIGHT</span></p>
                                </td>
                                <td class="mbti-cell" id="DRNT">
                                    <h6>DRNT</h6>
                                    <p><span class="mbti-text">DRY|RESISTANT|NON-PIGMENTED|TIGHT</span></p>
                                </td>
                                <td class="mbti-cell" id="DSPT">
                                    <h6>DSPT</h6>
                                    <p><span class="mbti-text">DRY|SENSITIVE|PIGMENTED|TIGHT</span></p>
                                </td>
                                <td class="mbti-cell" id="DSNT">
                                    <h6>DSNT</h6>
                                    <p><span class="mbti-text">DRY|SENSITIVE|NON-PIGMENTED|TIGHT</span></p>
                                </td>
                            </tr>
                            <tr>
                                <td class="mbti-cell" id="DRPW">
                                    <h6>DRPW</h6>
                                    <p><span class="mbti-text">DRY|SENSITIVE|PIGMENTED|WRINKLE PRONE</span></p>
                                </td>
                                <td class="mbti-cell" id="DRNW">
                                    <h6>DRNW</h6>
                                    <p><span class="mbti-text">DRY|RESISTANT|NON-PIGMENTED|WRINKLE PRONE</span></p>
                                </td>
                                <td class="mbti-cell" id="DSPW">
                                    <h6>DSPW</h6>
                                    <p><span class="mbti-text">DRY|SENSITIVE|PIGMENTED|WRINKLE PRONE</span></p>
                                </td>
                                <td class="mbti-cell" id="DSNW">
                                    <h6>DSNW</h6>
                                    <p><span class="mbti-text">DRY|SENSITIVE|NON-PIGMENTED|WRINKLE PRONE</span></p>
                                </td>
                            </tr>
                            <tr>
                                <td class="mbti-cell" id="ORPT">
                                    <h6>ORPT</h6>
                                    <p><span class="mbti-text">OILY|RESISTANT|PIGMENTED|TIGHT</span></p>
                                </td>
                                <td class="mbti-cell" id="ORNT">
                                    <h6>ORNT</h6>
                                    <p><span class="mbti-text">OILY|RESISTANT|NON-PIGMENTED|TIGHT</span></p>
                                </td>
                                <td class="mbti-cell" id="OSPT">
                                    <h6>OSPT</h6>
                                    <p><span class="mbti-text">OILY|RESISTANT|NON-PIGMENTED|TIGHT</span></p>
                                </td>
                                <td class="mbti-cell" id="OSNT">
                                    <h6>OSNT</h6>
                                    <p><span class="mbti-text">OILY|SENSITIVE|NON-PIGMENTED|TIGHT</span></p>
                                </td>
                            </tr>
                            <tr>
                                <td class="mbti-cell" id="ORPW">
                                    <h6>ORPW</h6>
                                    <p><span class="mbti-text">OILY|RESISTANT|PIGMENTED|WRINKLE PRONE</span></p>
                                </td>
                                <td class="mbti-cell" id="ORNW">
                                    <h6>ORNW</h6>
                                    <p><span class="mbti-text">OILY|RESISTANT|NON-PIGMENTED|WRINKLE PRONE</span></p>
                                </td>
                                <td class="mbti-cell" id="OSPW">
                                    <h6>OSPW</h6>
                                    <p><span class="mbti-text">OILY|SENSITIVE|PIGMENTED|WRINKLE PRONE</span></p>
                                </td>
                                <td class="mbti-cell" id="OSNW">
                                    <h6>OSNW</h6>
                                    <p><span class="mbti-text">OILY|SENSITIVE|NON-PIGMENTED|WRINKLE PRONE</span></p>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="cont2">
                    <div>
                        <p class="title"><%=a%></p>
                        <span id="content"></span><br>

                    </div>
                    <div class="box">
                    <!--  
                    <button id="button" class="save">저장하기</button>&nbsp;
                    -->
                        <input type="button" id="button" class="save" value="저장하기">&nbsp;
                        <input type="button" id="button" value="다시하기" onclick="location.href='/baumann/baumannTest'">
                    </div>
                </div>

            </div>

            <hr>

            <div class="product">
                <h2>추천 제품</h2>
            	<c:forEach var="product" items="${resultItem }">
                <div onclick="location.href='/productInfo?pronum=${product.pronum}'" style="cursor: pointer">
                    <img src="/images/${product.files.file_name}">
                    <p>${product.pro_name }</p>
                    <p><fmt:formatNumber value="${product.price }" pattern="#,###"/></p>
                    
                </div>
            	</c:forEach>
            </div>

        </div><!-- /.container -->
    </form>
	<form class="form" action="/main" method="post">
		<input type="hidden" name="baumann" value="<%=a%>">
	</form>
	
<script>
	$(".save").on("click", function(){
		alert("테스트 완료");
		$(".form").submit();
	});
	
	$(window).load(function(){
        var title = $('.title').text();
        
        if(title == 'DRPT'){
            $('#content').text('건조하고, 저항력이 있고, 색소 침착이 있고, 쫀쫀한(주름이 없는) 피부로 여드름 발생, 안면홍조, 피부 발진과 같은 민감성 문제를 거의 겪지 않습니다. 그러나, 멜라즈마나 주근깨와 같은 어두운 반점이 자주 발생합니다. 이 피부 타입은 노화로부터 피부를 보호하는 피부 색소 침착이 증가하고 햇빛 노출을 피하는 등 좋은 생활 습관 때문에 다른 유형보다 주름이 적은 경향이 있습니다. 당신의 피부는 강력한 보호막을 가지고 있으니 유효성분 농도가 높은 제품을 찾아보세요. 권장되는 피부 관리 제품에는 자외선 차단제, 보습제, 레티노이드, 하이드록시산, 탈색 성분을 포함한 것들이 있습니다.');
            $('#DRPT').css('background-color','orange');
            $('#DRPT').css('color','white');
        } else if(title == 'DRNT'){
            $('#content').text('건조하고 저항력이 있으며 색소가 없고 쫀쫀한 피부로 여드름 발생, 안면홍조, 피부 발진과 같은 민감성 문제를 거의 겪지 않습니다. 이 피부 타입은 햇빛 노출을 피하는 등 좋은 생활 습관 때문에 다른 유형보다 주름이 적은 경향이 있습니다. 당신의 피부는 강력한 보호막을 가지고 있으니 유효성분 농도가 높은 제품을 찾아보세요. 권장되는 피부 관리 제품에는 자외선 차단제, 보습제, 레티노이드 성분을 포함한 것들 있습니다.');
            $('#DRNT').css('background-color','orange');
            $('#DRNT').css('color','white');
        } else if(title == 'DSPT'){
            $('#content').text(' 건조하고, 민감하고, 색소 침착이 있고, 쫀쫀한(주름이 없는) 피부로 여드름이 생기거나, 얼굴이 붉어지거나, 피부 발진과 자극이 잦은 것이 특징입니다. 당신의 피부의 보호 장벽은 약하고 이것은 피부 발진과 탈수에 더 민감하게 만듭니다. 여드름이나 피부 발진 부위의 피부가 거무스름해지는 경우가 많습니다. 햇볕에 노출되면 얼굴에 어두운 반점이 생길 수 있습니다. 이 피부 타입은 노화로부터 피부를 보호하는 피부 색소 침착이 증가하고 햇빛 노출을 피하는 등 좋은 생활 습관 때문에 다른 유형보다 주름이 적은 경향이 있습니다. 추천 스킨케어 제품에는 자외선 차단제, 장벽 보수 보습 성분, 레티노이드, 탈색제 성분, 항염증 성분을 포함한 것들 있습니다.');
            $('#DSPT').css('background-color','orange');
            $('#DSPT').css('color','white');
        } else if(title == 'DSNT'){
            $('#content').text('건조하고 민감하며 색소 침착이 없고 쫀쫀한(주름 없는) 피부로 여드름 발생이나 안면홍조, 피부 발진과 자극이 잦은 것이 특징입니다. 당신의 피부의 보호 장벽은 약하고 이것은 피부 발진과 탈수에 더 민감하게 만듭니다. 이 피부 타입은 햇빛 노출을 피하는 등 좋은 생활 습관 때문에 다른 유형보다 주름이 적은 경향이 있습니다. 추천 스킨케어 제품에는 자외선 차단제, 장벽 보수 보습 성분 레티노이드, 항염증 성분을 포함한 것들 있습니다.');
            $('#DSNT').css('background-color','orange');
            $('#DSNT').css('color','white');
        } else if(title == 'DRPW'){
            $('#content').text(' 건조하고, 내성이 있고, 색소 침착이 있고, 주름진 피부로 여드름 발생, 안면 홍조, 또는 피부 발진과 같은 민감성 문제를 거의 겪지 않습니다. 그러나, 멜라즈마나 주근깨와 같은 어두운 반점이 자주 발생합니다. 이 유형은 태양 노출 증가나 흡연 등 현재 또는 과거의 생활 습관으로 인해 주름이 잡히는 경향이 있습니다. 당신의 피부는 강력한 보호막을 가지고 있으니 유효성분 농도가 높은 제품을 찾아보세요. 추천 피부 관리 제품에는 자외선 차단제, 보습제, 하이드록시산, 레티노이드, 탈색소 성분, 항산화제를 포함한 것들 있습니다.');
            $('#DRPW').css('background-color','orange');
            $('#DRPW').css('color','white');
        } else if(title == 'DRNW'){
            $('#content').text('건조하고 저항력이 있으며 색소가 없고 주름진 피부로 여드름 발생, 안면홍조, 피부 발진과 같은 민감성 문제를 거의 겪지 않습니다. 이 피부타입은 보호성 피부색소가 적어 햇볕 노출이나 흡연 등 현재 또는 과거의 생활습관으로 인해 주름이 잡히는 경향이 있습니다. 당신의 피부는 강력한 보호막을 가지고 있으니 유효성분 농도가 높은 제품을 찾아보세요. 권장되는 피부 관리 제품에는 자외선 차단제, 보습제, 레티노이드, 하이드록시산, 항산화제를 포함한 것들 있습니다.');
            $('#DRNW').css('background-color','orange');
            $('#DRNW').css('color','white');
        } else if(title == 'DSPW'){
            $('#content').text('건조하고 민감하며 색소 침착이 있고 주름진 피부로 여드름 발생이나 안면홍조, 피부 발진과 자극이 잦은 것이 특징입니다. 이러한 염증성 문제는 종종 여드름이나 피부 자극 부위의 피부가 검게 변하게 합니다. 햇볕에 노출되면 얼굴에 어두운 반점이 생길 수 있다. 당신의 피부의 보호 장벽은 약하고 이것은 피부 발진과 탈수에 더 민감하게 만듭니다. 또한 햇볕에 노출되거나 흡연과 같은 현재 또는 과거의 생활 습관으로 인해 주름이 잡히는 경향이 있습니다. 추천 스킨케어 제품에는 자외선 차단제, 장벽 복구 보습 성분, 레티노이드, 탈색소 성분, 항산화제, 항염증 성분을 포함한 것들 있습니다.');
            $('#DSPW').css('background-color','orange');
            $('#DSPW').css('color','white');
        } else if(title == 'DSNW'){
            $('#content').text('건조하고 민감하며 색소침착이 없고 주름진 피부로 여드름 발생이나 안면홍조, 피부 발진과 자극이 잦은 것이 특징입니다. 당신의 피부의 보호 장벽은 약하고 이것은 피부 발진과 탈수에 더 민감하게 만듭니다. 이 피부타입은 보호성 피부색소가 적어 햇볕 노출이나 흡연 등 현재 또는 과거의 생활습관으로 인해 주름이 잡히는 경향이 있습니다. 추천 스킨케어 제품에는 자외선 차단제, 장벽 보수 보습 성분, 레티노이드, 항산화제, 항염증 성분을 포함한 것들 있습니다.');
            $('#DSNW').css('background-color','orange');
            $('#DSNW').css('color','white');
        } else if(title == 'ORPT'){
            $('#content').text('지성, 저항성, 색소 침착이 있고, 쫀쫀한 (주름이 없는) 피부로 여드름 발생, 안면홍조, 피부 발진과 같은 민감성 문제를 거의 겪지 않습니다. 하지만, 멜라스마나 주근깨 같은 어두운 부분들이 종종 발생합니다. 이 피부 타입은 노화로부터 피부를 보호하는 피부 색소 침착이 증가하고 햇빛 노출을 피하는 등 좋은 생활 습관 때문에 다른 유형보다 주름이 적은 경향이 있습니다. 당신의 피부는 강력한 보호막을 가지고 있으니 유효성분 농도가 높은 제품을 찾아보세요. 권장되는 피부 관리 제품에는 자외선 차단제, 레티노이드, 히드록시산, 탈색 성분을 포함한 것들 있습니다.');
            $('#ORPT').css('background-color','orange');
            $('#ORPT').css('color','white');
        } else if(title == 'ORNT'){
            $('#content').text('지성, 저항성, 색소침착이 없고 쫀쫀한(주름이 없는) 피부로 여드름 발생, 안면홍조, 피부 발진과 같은 민감성 문제를 거의 겪지 않습니다. 이 피부 타입은 햇빛 노출을 피하는 등 좋은 생활 습관 때문에 다른 유형보다 주름이 적은 경향이 있습니다. 당신의 피부는 강력한 보호막을 가지고 있으니 유효성분 농도가 높은 제품을 찾아보세요. 이런 피부 타입은 여러분이 좋은 습관을 계속 유지한다면 나이가 들수록 관리하기가 더 쉬워질 거예요. 권장되는 피부 관리 제품은 자외선 차단제와 레티노이드를 포함한 것들 있습니다.');
            $('#ORNT').css('background-color','orange');
            $('#ORNT').css('color','white');
        } else if(title == 'OSPT'){
            $('#content').text('지성, 민감성, 색소 침착성, 쫀쫀한(주름이 없는) 피부로 여드름 발생이나 안면홍조, 피부 발진과 자극이 잦은 것이 특징입니다. 이러한 염증성 문제는 종종 여드름이나 피부 자극 부위의 피부가 검게 변하게 합니다. 멜라즈마나 주근깨 등 어두운 반점이 자주 발생합니다. 이 피부 타입은 노화로부터 피부를 보호하는 피부 색소 침착이 증가하고 햇빛 노출을 피하는 등 좋은 생활 습관 때문에 다른 유형보다 주름이 적은 경향이 있습니다. 추천 스킨케어 제품은 자외선 차단제, 레티노이드, 탈색제 성분, 항염증 성분을 포함한 것들 있습니다.');
            $('#OSPT').css('background-color','orange');
            $('#OSPT').css('color','white');
        } else if(title == 'OSNT'){
            $('#content').text('지성, 민감성, 색소 침착 및 팽팽한(주름 없는) 피부로 여드름 발진 또는 안면 발적 및 홍조, 또는 잦은 피부 발진 및 과민성 피부를 특징으로 합니다. 이 피부 타입은 햇빛 노출을 피하는 등 좋은 생활 습관 때문에 다른 유형보다 주름이 적은 경향이 있습니다. 이 피부 유형은 좋은 습관을 계속 유지하면 나이가 들어감에 따라 관리하기가 더 쉬워질 것입니다. 권장 스킨 케어 제품에는 레티노이드와 항염 성분을 포함한 것들 있습니다.');
            $('#OSNT').css('background-color','orange');
            $('#OSNT').css('color','white');
        } else if(title == 'ORPW'){
            $('#content').text('지성, 내성, 색소 침착, 주름진 피부로 여드름 발생, 안면홍조, 피부 발진과 같은 민감성 문제를 거의 겪지 않습니다. 그러나, 멜라즈마나 주근깨와 같은 어두운 반점이 자주 발생합니다. 이 유형은 태양 노출 증가나 흡연 등 현재 또는 과거의 생활 습관으로 인해 주름이 잡히는 경향이 있습니다. 당신의 피부는 강력한 보호막을 가지고 있으니 유효성분 농도가 높은 제품을 찾아보세요. 권장되는 피부 관리 제품에는 자외선 차단제, 하이드록시산, 레티노이드, 탈색소 성분, 항산화제를 포함한 것들 있습니다.');
            $('#ORPW').css('background-color','orange');
            $('#ORPW').css('color','white');
        } else if(title == 'ORNW'){
            $('#content').text('지성, 내성, 색소침착이 없고 주름진 피부로 여드름 발생, 안면홍조, 피부 발진과 같은 민감성 문제를 거의 겪지 않습니다. 이 피부타입은 보호성 피부색소가 적어 햇볕 노출이나 흡연 등 현재 또는 과거의 생활습관으로 인해 주름이 잡히는 경향이 있습니다. 당신의 피부는 강력한 보호막을 가지고 있으니 유효성분 농도가 높은 제품을 찾아보세요. 권장되는 피부 관리 제품에는 자외선 차단제, 레티노이드, 하이드록시산, 항산화제를 포함한 것들 있습니다.');
            $('#ORNW').css('background-color','orange');
            $('#ORNW').css('color','white');
        } else if(title == 'OSPW'){
            $('#content').text('지성, 민감성, 색소 침착 및 주름진 피부로 여드름 발생, 안면 홍조 및 홍조, 피부 발진과 자극이 잦은 것이 특징입니다. 이러한 염증성 문제는 종종 여드름이나 피부 자극 부위의 피부가 검게 변하게 합니다. 멜라즈마나 주근깨 등 어두운 반점이 자주 발생합니다. 이 유형은 태양 노출이나 흡연이 포함될 수 있는 현재 또는 과거의 생활 습관으로 인해 주름이 잡히는 경향이 있습니다. 추천 스킨케어 제품에는 자외선 차단제, 레티노이드, 탈색제 성분, 항산화제, 항염증 성분을 포함한 것들 있습니다.');
            $('#OSPW').css('background-color','orange');
            $('#OSPW').css('color','white');
        } else if(title == 'OSNW'){
            $('#content').text('지성, 민감성, 색소침착이 없고 주름진 피부로 여드름 발생이나 안면홍조, 피부 발진과 자극이 잦은 것이 특징입니다. 이 피부 타입은 보호성 피부 색소가 적기 때문에 태양 노출이나 흡연이 포함될 수 있는 현재 또는 과거의 생활 습관으로 인해 구김이 가는 경향이 있다. 권장되는 피부 관리 제품에는 자외선 차단제, 레티노이드, 항산화제, 항염증 성분을 포함한 것들 있습니다.');
            $('#OSNW').css('background-color','orange');
            $('#OSNW').css('color','white');
        } 
    });

</script>
</body>
</html>