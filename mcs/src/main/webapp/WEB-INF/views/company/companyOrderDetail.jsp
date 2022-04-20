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

    <title>OrderDetail</title>
    <link rel="stylesheet" href="/css/product.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
    <style type="text/css"></style>
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript" src="script.js"></script>
    <script type="text/javascript"></script>
<!--    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <style src="https://googledrive.com/host/0B1RR6fhjI2QROGt0MTFoVkhMdUk/fonts.css"></style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
</head>

<script>
// $(function(){

	function deliReady(detailnum) {
		var num = detailnum;
		
		if(!confirm("해당 상품을 '배송준비중'으로 변경하시겠습니까?")){
			alert("변경이 취소되었습니다.")
			return false;
		}
		
		$.ajax({
			url : "/company/orderState",
			type : "POST",
			data : {'detailnum': num,
					'result': 1},
			async : false,
			success : function(data) {

				if (data == 0) {
					alert("'배송준비중'으로 변경되었습니다.")
				} else {
					confirm("변경실패")
				}
			}
		})
	}
	
	function deliCancel(detailnum) {
		var num = detailnum;
		
		if(!confirm("해당 상품을 '주문취소' 하시겠습니까?")){
			alert("변경이 취소되었습니다.")
			return false;
		}
		
		$.ajax({
			url : "/company/orderState",
			type : "POST",
			data : {'detailnum': num,
					'result': 2},
			async : false,
			success : function(data) {

				if (data == 0) {
					alert("'주문취소'로 변경되었습니다.")
				} else {
					confirm("변경실패")
				}
			}
		})
	}
	
	function deliConfirm(detailnum) {
		var num = detailnum;
		
		if(!confirm("해당 상품을 '배송완료'로 변경하시겠습니까?")){
			alert("변경이 취소되었습니다.")
			return false;
		}
		
		$.ajax({
			url : "/company/orderState",
			type : "POST",
			data : {'detailnum': num,
					'result': 3},
			async : false,
			success : function(data) {

				if (data == 0) {
					alert("'배송완료'로 변경되었습니다.")
				} else {
					confirm("변경실패")
				}
			}
		})
	}
	
	
</script>

<body>
    <div class="container">
        <!--     SIDE AREA -->
        <div class="sideArea">
            <div class="avatar">
                <img src="/image/mcs2.png" onclick="location.href='/home'">
                <div class="avatarName">Welcome,<br>Company !</div>
            </div>
            <ul class="sideMenu">
                 <li><a href="javascript:undefined" class="has-submenu"><span class="fa fa-sitemap"></span>INFO</a>
                    <ul class="submenu">
                        <li><a href=""><span class="fa fa-user-tie"></span>기업페이지</a></li>
                    </ul>
                </li>
                <li><a href="javascript:undefined" class="has-submenu"><span class="fa fa-address-card"></span>고객관리</a>
                    <ul class="submenu">
                        <li><a href=""><span class="fa fa-user"></span>고객정보</a></li>
                        <li><a href=""><span class="fa fa-seedling"></span>Baumann</a></li>
                        <li><a href=""><span class="fa fa-pencil"></span>Review</a></li>
                    </ul>
                </li>
                <li><a href="javascript:undefined" class="has-submenu"><span class="fa fa-spray-can-sparkles"></span>제품관리</a>
                    <ul class="submenu">
                        <li><a href="/company/ProductList"><span class="fa fa-magnifying-glass"></span>제품정보</a></li>
                        <li><a href="/company/ProductIngredients"><span class="fa fa-magnifying-glass"></span>원료정보</a></li>                       
                    </ul>
                </li>
                <li><a href="javascript:undefined" class="has-submenu"><span class="fa fa-store"></span>주문관리</a>
                    <ul class="submenu" style="display: block;">
                        <li><a href="/company/orderList" style="background: rgba(255,255,255,0.5);"><span class="fa fa-magnifying-glass"></span>주문정보</a></li>
                        <li><a href="/company/orderCancelList"><span class="fa fa-magnifying-glass"></span>취소정보</a></li>
                    </ul>
                </li>
                <li><a href="javascript:undefined" class="has-submenu"><span class="fa fa-truck"></span>배송관리</a>
                    <ul class="submenu">
                        <li><a href=""><span class="fa fa-magnifying-glass"></span>배송정보</a></li>
                        <li><a href=""><span class="fa fa-magnifying-glass"></span>배송업체정보</a></li>
                    </ul>
                </li>
                <li><a href="javascript:undefined" class="has-submenu"><span class="fa fa-gift"></span>적립금관리</a>
                    <ul class="submenu">
                        <li><a href=""><span class="fa fa-magnifying-glass"></span>적립금정보</a></li>
                    </ul>
                </li>
                <li><a href="javascript:undefined" class="has-submenu"><span class="fa fa-line-chart"></span>통계관리</a>
                    <ul class="submenu">
                        <li><a href="/totalAccount1"><span class="fa fa-users"></span>고객통계</a></li>
                        <li><a href="/totalAccount"><span class="fa fa-pencil"></span>평가통계</a></li>
                    </ul>
                </li>
                
            </ul>
        </div>
        <!--     SIDE AREA -->
        <div class="mainArea">
            <!-- BEGIN NAV -->
            <nav class="navTop row">
                <div class="menuIcon fl"><span class="fa fa-bars"></span></div>
                <div class="account fr">
                    <div class="name has-submenu">Company<span class="fa fa-angle-down"></span></div>
                    <ul class="accountLinks submenu">
                        <li><a href="">View website</a></li>
                        <li><a href="">Log out<span class="fa fa-sign-out fr"></span></a></li>
                    </ul>
                </div>
            </nav>
            <!-- END NAV -->
            <!-- CONTAINER  -->
            <div class="mainContent">
                <!-- LIST FORM -->
                <div class="row filterGroup">
                    <form action="" method="POST" class="formSearch fl">
                        <input type="text" class="inputSearch" placeholder="Search">
                        <button type="submit" class="btnSearch"><i class="fa fa-search"></i></button>
                    </form>
                    <div class="areaFilter fr row">
                        <div class="boxSelect fr">
                            <div class="titleSelect">Sort by</div>
                            <ul class="optionSelect">
                                <li sortIndex="0"><a href="">Alphabet</a></li>
                                <li sortIndex="1"><a href="">Price, Ascending</a></li>
                                <li sortIndex="2"><a href="">Price, Descending</a></li>
                                <li sortIndex="3"><a href="">Latest</a></li>
                            </ul>
                        </div>
                        <!--         FILTER -->
                        <div class="btnFilter fr bg-fff"><span class="fa fa-filter"></span>Filter</div>
                        <div class="boxFilter">
                            <div class="btnFilter"><span class="fa fa-close"></span>Close</div>
                            <!--             GROUP -->
                            <div class="groupInput">
                                <select name="">
                                    <option value="">Brand</option>
                                    <option value="">Brand 01</option>
                                    <option value="">Brand 02</option>
                                </select>
                                <select name="">
                                    <option value="">Category</option>
                                    <option value="">Category 01</option>
                                    <option value="">Category 02</option>
                                </select>
                                <select name="">
                                    <option value="">Author</option>
                                    <option value="">Author 01</option>
                                    <option value="">Author 02</option>
                                </select>
                            </div>
                            <!--             END GROUP -->
                            <!--             GROUP -->
                            <div class="groupInput">
                                <p class="titleInput">Price</p>
                                <div id="filterPrice"></div>
                                <div class="areaValue">
                                    <p>From</p>
                                    <input type="text" class="rangeValue">
                                    <p>To</p>
                                    <input type="text" class="rangeValue">
                                </div>
                            </div>
                            <!--             END GROUP -->
                        </div>
                    </div>
                </div>
                <div class="formHeader row">
                    <h2 class="text-1 fl">OrderDetail</h2>
                    <div class="fr">
<!--                        
                        <form action="/excel/download" method="get">
                            <button type="submit" class="btnAdd fa fa-file-excel bg-1 text-fff">Excel</button>
                        </form>                        
-->
                        <button type="submit" class="btnAdd fa fa-file-excel bg-1 text-fff"></button>
                    </div>
                </div>
                <div name="listForm" class="form scrollX">
                    
                    <div class="table" style="min-width: 1600px">
                        <div class="row bg-1">
                            <div class="cell cell-50 text-fff">NO</div>
                            <div class="cell cell-100 text-fff">제품번호</div>
                            <div class="cell cell-100 text-fff">IMAGE</div>
                            <div class="cell cell-100p text-fff">제품명</div>
                            <div class="cell cell-100 text-fff">정가</div>
                            <div class="cell cell-100 text-fff">할인율</div>
                            <div class="cell cell-100 text-fff">판매가</div>
                            <div class="cell cell-100 text-fff">수량</div>
                            <div class="cell cell-100 text-fff">적립금</div>
                            <div class="cell cell-150 text-fff">EDIT</div>
                        </div>
                        <!--   BEGIN LOOP -->
                        <c:forEach var="orderDetail" items="${orderDetailList}">
                        <c:if test="${orderDetail.state eq '결제완료' || orderDetail.state eq '배송준비중' || orderDetail.state eq '배송중' || orderDetail.state eq '배송완료'}">
                        <ul>
                            <li class="row">
                                <div class="cell cell-50">${orderDetail.detailnum}</div>
                                <div class="cell cell-100">${orderDetail.product.pronum}</div>
                                <div class="cell cell-100">
                                    <a href=""><img src="/images/${orderDetail.product.files.file_name}" alt="" width="50"></a>
                                </div>
                                <div class="cell cell-100p"><a href="">${orderDetail.product.pro_name}</a></div>
                                <div class="cell cell-100"><a href=""><fmt:formatNumber value= "${orderDetail.product.price}" pattern="#,###"/></a></div>
                                <div class="cell cell-100"><a href="">${orderDetail.product.sale}</a>%</div>
                                <div class="cell cell-100"><a href=""><fmt:formatNumber value= "${orderDetail.price}" pattern="#,###"/></a></div>
                                <div class="cell cell-100"><a href="">${orderDetail.order_count}</a></div>
                                <div class="cell cell-100"><a href=""><fmt:formatNumber value= "${orderDetail.price/100}" pattern="#,###"/></a></div>
                                <c:set var="totalPrice" value="${totalPrice + orderDetail.price}"/>
                        <c:choose>
                        	<c:when test="${orderDetail.state eq '결제완료'}">
                               	<div class="cell cell-150">
                                    <a href="" class="btnEdit bg-1 text-fff" onClick="deliReady(${orderDetail.detailnum})">배송준비중</a><p><hr></p>
                                    <a href="" class="btnEdit bg-1 text-fff" onClick="deliCancel(${orderDetail.detailnum})">주문취소</a>
                                </div>
                            </c:when>
                            <c:when test="${orderDetail.state eq '배송중'}">
                            	<div class="cell cell-150">
                                    <a class="btnEdit bg-1 text-fff" style="background-color: #808080;">${orderDetail.state}</a><p><hr></p>
                                    <a href="" class="btnEdit bg-1 text-fff" onClick="deliConfirm(${orderDetail.detailnum})">배송완료</a>
                                </div>
                            </c:when>
                            <c:when test="${orderDetail.state ne '주문취소' and orderDetail.state ne '결제완료' and orderDetail.state ne '배송중' and orderDetail.state ne '환불신청' and orderDetail.state ne '환불승인'}">
                            	<div class="cell cell-150">
                                    <a class="btnEdit bg-1 text-fff" style="background-color: #808080;">${orderDetail.state}</a>
                                </div>
                            </c:when>
                        </c:choose>
                            </label>
                            </li>
                        </ul>
                        </c:if>
                        </c:forEach>
                        <!--   END LOOP -->
                        
                    <li class="row" style="list-style: none; line-height: 30px; font-weight: bold;">
                        <div style="text-align: right">총 결제금액 : <fmt:formatNumber value= "${totalPrice}" pattern="#,###"/>원</div>
                    </li>
                    </div>
                </div>
                    <!-- 환불 테이블 -->
                    
                <div class="formHeader row">
                    <h2 class="text-1 fl" style="color: #808080;">CancelList</h2>
                </div>
                <form action="" method="GET" name="listForm" class="form scrollX">
                    
                    <div class="table" style="min-width: 1600px;">
                        <div class="row bg-1" style="background-color: #808080;">
                            <div class="cell cell-50 text-fff">NO</div>
                            <div class="cell cell-100 text-fff">제품번호</div>
                            <div class="cell cell-100 text-fff">IMAGE</div>
                            <div class="cell cell-100p text-fff">제품명</div>
                            <div class="cell cell-100 text-fff">정가</div>
                            <div class="cell cell-100 text-fff">할인율</div>
                            <div class="cell cell-100 text-fff">판매가</div>
                            <div class="cell cell-100 text-fff">수량</div>
                            <div class="cell cell-100 text-fff">적립금</div>
                            <div class="cell cell-100 text-fff">EDIT</div>
                        </div>
                        <!--   BEGIN LOOP -->
                        <c:forEach var="orderDetail" items="${orderDetailList}">
                        <c:if test="${orderDetail.state eq '주문취소' || orderDetail.state eq '환불신청' || orderDetail.state eq '환불승인'}">
                        <ul>
                            <li class="row">
                                <div class="cell cell-50">${orderDetail.detailnum}</div>
                                <div class="cell cell-100">${orderDetail.product.pronum}</div>
                                <div class="cell cell-100">
                                    <a href=""><img src="/images/${orderDetail.product.files.file_name}" alt="" width="50"></a>
                                </div>
                                <div class="cell cell-100p"><a href="">${orderDetail.product.pro_name}</a></div>
                                <div class="cell cell-100"><a href=""><fmt:formatNumber value= "${orderDetail.product.price}" pattern="#,###"/></a></div>
                                <div class="cell cell-100"><a href="">${orderDetail.product.sale}</a>%</div>
                                <div class="cell cell-100"><a href=""><fmt:formatNumber value= "${orderDetail.price}" pattern="#,###"/></a></div>
                                <div class="cell cell-100"><a href="">${orderDetail.order_count}</a></div>
                                <div class="cell cell-100"><a href=""><fmt:formatNumber value= "${orderDetail.price/100}" pattern="#,###"/></a></div>
                                <c:set var="totalPrice" value="${totalPrice + orderDetail.price}"/>
                             <c:if test="${orderDetail.state eq '주문취소'}">
                               		<div class="cell cell-100">
                                    	<a class="btnEdit bg-1 text-fff" style="background-color: #808080;">취소상품</a>
                                	</div>
							 </c:if>
							 <c:if test="${orderDetail.state eq '환불신청' || orderDetail.state eq '환불승인'}">
                               		<div class="cell cell-100">
                                    	<a class="btnEdit bg-1 text-fff" style="background-color: #808080;">환불상품</a>
                                	</div>
							 </c:if>
<!--                             		<div class="cell cell-100"> -->
<!--                                     	<a href="" class="btnEdit" style="background-color: white; color: balck; border: 1px solid black">환불완료</a> -->
<!--                                 	</div> -->


                            </label>
                            </li>
                        </ul>
                        </c:if>
                        </c:forEach>
                        <!--   END LOOP -->
                    </div>
                    
<!--
                        
                    <li class="row" style="list-style: none; line-height: 30px; width: 1000px;">
                        <div style="text-align: left; float: left; ">배송비: 50,000원 이상 구매 시 무료</div>
                        <div style="text-align: right">제품 합계(220,000원) - 할인 합계(22,000원) + 배송비(3,000원) = 총 결제금액 : 196,000원</div>
                    </li>
-->
                    
                </form>
                
                <form action="/company/orderSubmit" method="post" name="listForm" class="form scrollX">
                    <div class="formHeader row">
                        <h2 class="text-1 fl">Reciever Info　　　※ <font color="red">'배송준비중'</font>인 상품만 배송상태 변경이 가능합니다.</h2>
                    </div>
                    <div class="formBody row">
                        <div class="column s-4" style="width: auto">
                            <label class="inputGroup">
                                <span>주문번호</span>
                                <span>${order.ordernum}</span>
                            </label>
                            <label class="inputGroup">
                                <span>주문일</span>
                                <span>${order.orderdate}</span>
                            </label>
                            <label class="inputGroup">
                                <span>구매가격</span>
                                <span>${totalPrice}원</span>
                            </label>
                            <label class="inputGroup">
                                <span>결제수단</span>
                                <span>신용카드</span>
                            </label>
                            <label class="inputGroup">
                                <span>주문자명</span>
                                <span>${order.name}</span>
                            </label>
                        </div>

                        <div class="column s-4" style="width: auto">
                            <label class="inputGroup">
                                <span>연락처</span>
                                <span>${order.phone}</span>
                            </label>
                            <label class="inputGroup">
                                <span>주문상태</span>
                                <span>
                                	<input type="text" name="state" value="배송중" readonly>
<!--                                     <select name="state" style="width: 200px"> -->
<!--                                         <option value="배송중">배송중</option> -->
<!--                                     </select> -->
                                </span>
                            </label>
                            <label class="inputGroup">
                                <span>배송업체</span>
                                <span>
                                    <select name="ship_comp" style="width: 200px">
                                        <option value="CJ대한통운">CJ대한통운</option>
                                        <option value="롯데택배">롯데택배</option>
                                        <option value="한진택배">한진택배</option>
                                        <option value="로젠택배">로젠택배</option>
                                    </select>
                                </span>
                            </label>
                            <label class="inputGroup">
                                <span>운송장번호</span>
                                <span><input type="text" name="waybill"></span>
                            </label>
                        </div>

                        <div class="column">
                            <label class="inputGroup">
                                <span>관리자 메모</span>
                                <textarea name=""></textarea>
                            </label>
                        </div>
                    </div>
                    
                    
                    <c:forEach var="orderDetail" items="${orderDetailList}">
                    	<c:if test="${orderDetail.state eq '배송준비중'}">
                    		<input type="hidden" name="detailnum" value="${orderDetail.detailnum}">
                    	</c:if>
                    </c:forEach>
                    <input type="hidden" name="ordernum" value="${order.ordernum}">
                    
                <div id="btn_group">
                    <a href=""><button type="submit" id="test_btn1">확인</button></a>
                    <button type="submit" id="test_btn2">취소</button>
                </div>
                    
                    
                </form>
                <br>
            </div>
            <!-- END CONTAINER  -->
        </div>
    </div>
	<style>
#test_btn1 {
	margin-right: -4px;
}

#test_btn2 {
	margin-left: -3px;
}

#btn_group button {
	width: 80px;
	border: 1px solid #557daa;
	background-color: rgba(0, 0, 0, 0);
	color: fff;
	padding: 5px;
}

#btn_group button:hover {
	color: white;
	background-color: #557daa;
}

#btn_group {
	width: 160px;
	margin: auto;
	display: block;
}

hr {
	border: 1px dotted #bbb;
}

/* Reciever Info */
.inputGroup {
	line-height: 20px;
}
</style>
	<script>
        // ELEMENT
        function elm(x) {
            var target = x.substring(1);
            var type = x.charAt(0);
            if (type == '#') {
                return document.getElementById(target);
            } else if (type == '.') {
                return document.getElementsByClassName(target);
            } else {
                return document.getElementsByTagName(x);
            }
        }

        // ACCOUNT CLICK
        window.onclick = function() {
            elm(".accountLinks")[0].style.display = 'none';
        };

        // SUB MENU
        if (elm(".has-submenu")) {
            for (var i = 0, len = elm(".has-submenu").length; i < len; i++) {
                elm(".has-submenu")[i].onclick = function(e) {
                    e.stopPropagation();
                    toggle(this.nextElementSibling);
                }
            }
        }

        // BTN SWITCH
        if (elm(".checkAll") != undefined) {
            for (var i = 0, len = elm(".checkAll").length; i < len; i++) {
                var target = elm(".checkAll")[i].getAttribute("target");
                if (elm(target)[i] != undefined) {
                    elm(".checkAll")[i].onchange = function() {
                        var checked = this.checked;
                        for (var i = 0, len = elm(target).length; i < len; i++) {
                            elm(target)[i].checked = checked;
                        }
                    }
                }
            }
        }

        // MENU ICON CLICK
        if (elm(".menuIcon")) {
            elm(".menuIcon")[0].onclick = function() {
                elm(".container")[0].classList.toggle("is-click");
            };
        }

        // INPUT IMG
        function getImg(x) {
            if (x.files.length > 0) {
                var fr = new FileReader();
                var imgSrc = null;
                var parent = x.parentElement;
                fr.onload = function(e) {
                    imgSrc = e.target.result;
                    if (parent.getElementsByTagName("img").length > 0) {
                        parent.removeChild(parent.getElementsByTagName("img")[0]);
                    }
                    var img = document.createElement("img");
                    img.setAttribute("src", imgSrc);
                    img.style.width = "80px";
                    img.style.verticalAlign = "top";
                    parent.appendChild(img);
                }
                fr.readAsDataURL(x.files[0]);
            }
        }

        // NEW INPUT
        for (var i = 0, len = elm(".btnNewInput").length; i < len; i++) {
            elm(".btnNewInput")[i].onclick = function() {
                findClosest(this, elm(".inputGroup")).nextElementSibling.classList.remove("hide");
            };
        }

        // SUB LIST
        if (elm(".btnCaret")) {
            for (var i = 0, len = elm(".btnCaret").length; i < len; i++) {
                elm(".btnCaret")[i].onclick = function() {
                    var row = findClosest(this, elm(".row"));
                    row.classList.toggle("is-active");
                }
            }
        }
        if (elm(".caretAll")) {
            for (var i = 0, len = elm(".caretAll").length; i < len; i++) {
                elm(".caretAll")[i].onchange = function() {
                    var stt = this.checked;
                    var table = findClosest(this, elm(".table"));
                    var row = findChildren(table, elm(".row"));
                    for (var i = 0, len = row.length; i < len; i++) {
                        if (stt) {
                            row[i].classList.add("is-active");
                        } else {
                            row[i].classList.remove("is-active");
                        }
                    }
                }
            }
        }

        // SORT
        if (elm(".titleSelect") != undefined) {
            for (var i = 0, len = elm(".titleSelect").length; i < len; i++) {
                elm(".titleSelect")[i].onclick = function(e) {
                    e.stopPropagation();
                    this.classList.toggle("is-active");
                }
            }
        }
        window.onclick = function() {
            for (var i = 0, len = elm(".titleSelect").length; i < len; i++) {
                elm(".titleSelect")[i].classList.remove("is-active");
            }
        }


        // FILTER
        if (elm('.btnFilter') != undefined) {
            for (var i = 0, len = elm('.btnFilter').length; i < len; i++) {
                elm('.btnFilter')[i].onclick = function() {
                    elm('.boxFilter')[0].classList.toggle('is-active');
                }
            }
        }

        // PRICE BAR
        var slider = document.getElementById('filterPrice');
        var rangeValue = document.getElementsByClassName('rangeValue');

        noUiSlider.create(slider, {
            start: [0, 100],
            connect: true,
            range: {
                'min': 0,
                'max': 100
            }
        });

        slider.noUiSlider.on('update', function(values) {
            for (var i = 0, len = values.length; i < len; i++) {
                rangeValue[i].setAttribute('value', values[i]);
            }
            values = values.map(function(x) {
                return parseInt(x);
            });
            // AJAX HERE
            //     $.ajax({
            //         url: 'ajax.php',
            //         type: 'GET',
            //         data: {},
            //         success: function(){

            //         }
            //     });  
        });

        for (var i = 0, len = rangeValue.length; i < len; i++) {
            rangeValue[i].addEventListener('change', function() {
                var v = [];
                for (var i = 0, len = rangeValue.length; i < len; i++) {
                    v[i] = rangeValue[i].value;
                }
                slider.noUiSlider.set(v);
                // AJAX HERE
                console.log(v);
            });
        }

        var noUihandle = elm('.noUi-handle');
        if (noUihandle != undefined) {
            for (var i = 0, len = noUihandle.length; i < len; i++) {
                noUihandle[i].addEventListener('click', function() {
                    var v = slider.noUiSlider.get();
                    // AJAX HERE
                    console.log(v);
                });
            }
        }

        //FIND PARENT
        function findClosest(x, parent) {
            do {
                if (parent.length > 0) {
                    for (var i = 0, len = parent.length; i < len; i++) {
                        if (x.isSameNode(parent[i])) {
                            return x;
                        }
                    }
                } else {
                    if (x.isSameNode(parent)) {
                        return x;
                    }
                }
            } while (x = x.parentElement);
        }

        // FIND CHILDREN
        function findChildren(x, y) {
            var arr = [];
            if (y.length > 0) {
                for (var i = 0, len = y.length; i < len; i++) {
                    if (x.isSameNode(findClosest(y[i], x))) {
                        arr.push(y[i]);
                    }
                }
            } else {
                if (x.isSameNode(findClosest(y, x))) {
                    arr.push(y);
                }
            }
            return arr;
        }

        //RENDER HTML
        function renderHTML(x, content) {
            var tag = document.createElement(x);
            tag.append(content);
            return tag;
        }

        //TOGGLE
        function toggle(x) {
            var css = window.getComputedStyle(x, null);
            if (css.getPropertyValue("display") == 'none') {
                x.style.display = 'block';
            } else {
                x.style.display = 'none';
            }
        }


        //SLIDE	
        function slideToggle(el) {
            var elCss = window.getComputedStyle(el, null);
            if (elCss.getPropertyValue("height") == 0 + 'px') {
                el.style.height = el.scrollHeight + "px";
            } else {
                el.style.height = 0;
            }
        }

        function extend(o1, o2) {
            if (o1 instanceof Array) {
                var result = [];
                // RESULT = O1
                for (var i = 0, len = o1.length; i < len; i++) {
                    result.push(o1[i]);
                }
                // RESULT = O2
                for (var i = 0, len = o2.length; i < len; i++) {
                    if (result.indexOf(o2[i]) < 0) {
                        result.push(o2[i]);
                    }
                }
            } else if (typeof o1 == 'object') {
                var result = {};
                var o1Keys = Object.keys(o1);
                for (var i = 0, len = o1Keys.length; i < len; i++) {
                    result[o1Keys[i]] = o1[o1Keys[i]];
                }
                var o2Keys = Object.keys(o2);
                for (var i = 0, len = o2Keys.length; i < len; i++) {
                    result[o2Keys[i]] = o2[o2Keys[i]];
                }
            }
            return result;
        }

        function extend2(o1, o = []) {
            var result = o1;
            for (var i = 0, len = o.length; i < len; i++) {
                var result = extend(result, o[i]);
            }
            return result;
        }

    </script>
    
</body>
</html>