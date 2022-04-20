<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">

    <title>통계</title>
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
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
    <script>
    window.onload = function() {
	var ctx = document.getElementById('test1').getContext('2d');
	var chart = new Chart(ctx, {
		type: 'bar', 
		data: { labels: ['0~9세','10대','20대','30대','40대','50대','60대','70대'],
		datasets: [{ label: '단위 : 명',
		backgroundColor: [ 'rgba(255, 153, 102, 0.5)', 'rgba(102, 255, 153, 0.5)', 'rgba(255, 153, 204, 0.5)', 'rgba(153, 255, 204, 0.5)',
			'rgba(78, 127, 185, 0.5)','rgba(204, 000, 051, 0.5)', 'rgba(255, 051, 139, 0.5)', 'rgba(051, 255, 204, 0.5)'],
		borderColor: ['rgb(255, 99, 132,1.5)', 'rgba(54, 162, 235, 1.5)',
			'rgba(255, 206, 86, 1.5)', 'rgba(75, 192, 192, 1.5)', 'rgba(153, 102, 255, 1.5)',
			'rgba(255, 159, 64, 1.5)'],
		data: [${skinage[0]}, ${skinage[1]}, ${skinage[2]}, ${skinage[3]}, ${skinage[4]}, ${skinage[5]},${skinage[6]},${skinage[7]}] }] },
		options: { title: { display: true, text: '고객 연령별 인구 분포',
		fontSize: 30, fontColor: 'rgba(46, 49, 49, 1)' },
		legend: { labels: { fontColor: 'rgba(83, 51, 237, 1)',
		fontSize: 15 } },
		scales: {
			xAxes: [{
				ticks: { fontColor: 'rgba(27, 163, 156, 1)', fontSize: '15' } }],
				yAxes: [{ ticks: { beginAtZero: true, fontColor: 'rgba(246, 36, 89, 1)', fontSize: '15' } }] } } });

};
    
    </script>
</head>

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
                    <ul class="submenu">
                        <li><a href="/company/orderList"><span class="fa fa-magnifying-glass"></span>주문정보</a></li>
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
                    <ul class="submenu" style="display: block;">
                        <li><a href="/totalAccount1" style="background: rgba(255,255,255,0.5);"><span class="fa fa-users"></span>고객통계</a></li>
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
                    <h2 class="text-1 fl">통계</h2>
                    <div class="fr">
                       
                        <!--                        
                        <form action="/excel/download" method="get">
                            <button type="submit" class="btnAdd fa fa-file-excel bg-1 text-fff">Excel</button>
                        </form> 
                        -->
                        <button type="submit" class="btnAdd fa fa-file-excel bg-1 text-fff"></button>
                        
                        
                    </div>
                    <div class="chart-container" style="position: relative; height:80vh; width:80vw"> <canvas id="test1"></canvas>
                </div>
                
                
            </div>
            <!-- END CONTAINER  -->
        </div>
    </div>

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
