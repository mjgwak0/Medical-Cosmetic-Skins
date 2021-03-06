<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<head>
    <meta charset="UTF-8">

    <title>MCS</title>
    <link rel="stylesheet" href="/css/product.css">
    <style type="text/css"></style>
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript" src="script.js"></script>
    <script type="text/javascript"></script>
</head>



<script>
function attach(form){
	var file = form.filesinfo.value;
	
	if(!file){
		alert("이미지파일을 첨부하세요");
		return false;
	}else{
		form.submit();
	}
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

            </ul>
        </div>
        <!--     SIDE AREA -->
        <div class="mainArea">
            <!-- BEGIN NAV -->
            <nav class="navTop row">
                <div class="menuIcon fl"><span class="fa fa-bars"></span></div>
                <div class="account fr">
                    <div class="name has-submenu">John Doe<span class="fa fa-angle-down"></span></div>
                    <ul class="accountLinks submenu">
                        <li><a href="">View website</a></li>
                        <li><a href="">Log out<span class="fa fa-sign-out fr"></span></a></li>
                    </ul>
                </div>
            </nav>
            <!-- CONTAINER  -->
            <div class="mainContent">

                <!-- DETAIL FORM -->
                <form action="/company/updateProduct" method="POST" enctype="multipart/form-data" class="form">
                    <div class="formHeader row">
                        <h2 class="text-1 fl">Product Detail</h2>
                        <div class="fr">
                            <input type="button" class="btnSave bg-1 text-fff text-bold fr" onclick="attach(form)" value="SAVE">
                        </div>
                    </div>
                    <div class="formBody row">
                        <div class="column s-6">
                            <label class="inputGroup">
                                <span>Category</span>
                                <span>
                                    <select name="code" value="${product.code}" style="width: 200px">
                                        <option value="CLEANSING">CLEANSING</option>
                                        <option value="PEELING">PEELING</option>
                                        <option value="SKIN">SKIN</option>
                                        <option value="ESSENCE">ESSENCE</option>
                                        <option value="EMULSION">EMULSION</option>
                                        <option value="CREAM">CREAM</option>
                                        <option value="suncare">SUN CARE</option>
                                        <option value="MASK">MASK</option>
                                        <option value="bodycare">BODY CARE</option>
                                        <option value="HAIR">HAIR</option>
                                    </select>
                                </span>
                            </label>
                            <label class="inputGroup">
                                <span>제품명</span>
                                <span><input type="text" name="pro_name"  value="${product.pro_name}"></span>
                            </label>
                            <label class="inputGroup">
                                <span>판매가</span>
                                <span><input type="number" name="price"  value="${product.price}"></span>
                            </label>
                            <label class="inputGroup">
                                <span>할인율</span>
                                <span><input type="number" name="sale"  value="${product.sale}"></span>
                            </label>
                            <label class="inputGroup">
                                <span>제조일자</span>
                                <span><input type="date" name="manufacture"  value="${product.manufacture}" style="width: 200px"></span>
                            </label>
                            <label class="inputGroup">
                                <span>재고</span>
                                <span><input type="number" name="inventory"  value="${product.inventory}"></span>
                            </label>
                        </div>

                        <div class="column s-6">
                            <label class="inputGroup">
                                <span>용량</span>
                                <span><input type="text" name="pro_stock"  value="${product.pro_stock}"></span>
                            </label>
                            <label class="inputGroup">
                                <span>사용기한</span>
                                <span>
                                    <select name="expiration"  value="${product.expiration}" style="width: 200px">
                                        <option value="6개월">6개월</option>
                                        <option value="1년">1년</option>
                                        <option value="2년">2년</option>
                                        <option value="3년">3년</option>
                                    </select>
                                </span>
                            </label>
                            <label class="inputGroup">
                                <span>제조업자</span>
                                <span><input type="text" name="manufacturer"  value="${product.manufacturer}"></span>
                            </label>
                            <label class="inputGroup">
                                <span>제조국</span>
                                <span><input type="text" name="made"  value="${product.made}"></span>
                            </label>
                            <label class="inputGroup">
                                <span>판매업자</span>
                                <span><input type="text" name="seller"  value="${product.seller}"></span>
                            </label>
                            <label class="inputGroup">
                                <span>피부타입태그</span>
                                <span><select id="baumann" name="baumann"  value="${product.baumann}">
                                            <option value="DRPT">DRPT</option>
                                            <option value="DRNT">DRNT</option>
                                            <option value="DSPT">DSPT</option>
                                            <option value="DSNT">DSNT</option>
                                            <option value="DRPW">DRPW</option>
                                            <option value="DRNW">DRNW</option>
                                            <option value="DSPW">DSPW</option>
                                            <option value="DSNW">DSNW</option>
                                            <option value="ORPT">ORPT</option>
                                            <option value="ORNT">ORNT</option>
                                            <option value="OSPT">OSPT</option>
                                            <option value="OSNT">OSNT</option>
                                            <option value="ORPW">ORPW</option>
                                            <option value="ORNW">ORNW</option>
                                            <option value="OSPW">OSPW</option>
                                            <option value="OSNW">OSNW</option>
                                        </select></span>
                            </label>
                        </div>

                        <div class="column">
                            <label class="inputGroup">
                                <span>Image</span>
                                <span>
                                    <input type="file" name="filesinfo" onchange="getImg(this)" multiple>
                                </span>

                            </label>
                        </div>
                        <div class="column">
                            <label class="inputGroup">
                                <span>모든성분</span>
                                <textarea name="ingredients">${product.ingredients}</textarea>
                            </label>
                        </div>
                        <div class="column">
                            <label class="inputGroup">
                                <span>사용방법</span>
                                <textarea name="skill">${product.skill}</textarea>
                            </label>
                        </div>
                        <div class="column">
                            <label class="inputGroup">
                                <span>주요사항</span>
                                <textarea name="spec">${product.spec}</textarea>
                            </label>
                        </div>
                    </div>
                    
                    <input type="hidden" name="pronum"  value="${product.pronum}">
                    <input type="hidden" name="filenum"  value="${product.files.filenum}">
                    <input type="hidden" name="company"  value="${product.company}">
                    
                </form>

                <div id="pagination">
                    <ul class="pagination list-inline text-center">
                        <li class="is-active"><a href="?page=1">1</a></li>
                        <li><a href="?page=2">2</a></li>
                        <li><a href="?page=3">3</a></li>
                        <li><a href="?page=4">4</a></li>
                        <li><a href="?page=5">5</a></li>
                    </ul>
                </div>
            </div>
            <!-- END CONTAINER  -->
        </div>
    </div>
    <script>
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
                    img.style.width = "300px";
                    img.style.verticalAlign = "top";
                    parent.appendChild(img);
                }
                fr.readAsDataURL(x.files[0]);
            }
        }

    </script>
</body>

</html>