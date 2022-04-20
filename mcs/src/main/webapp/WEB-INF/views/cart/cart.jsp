    <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
	


<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="/css/cart.css">
    </head>
    
<body>

<div class="cart_table">
            <p>장바구니</p>
            <ul class="cart_list">
            
           <%--    <form action="/alldelete"  method="post" class="alldelete_cart">
                <button class="delete" data-basketid="${basket.basketid}">전체삭제</button>
              <input type="hidden" name="basketid" class="delete_basket" value="${basket.basketid}"> --%>
                 <li>
                    <div class="checkbox"> 
                        <input type="checkbox" name="all_chk" id="all_chk">
                        <label for="all_chk">전체선택</label> 
                    </div>
                    <div class="del_btn">삭제 (<span class="num">0</span>)</div>
                </li> 
<!--                 </form> -->
                
                <c:forEach var="basket" items="${basket}">
				<fmt:parseNumber var= "salePrice" integerOnly= "true" value= "${basket.product.price - (basket.product.price * basket.product.sale/100)}"/>
                <li>
                    <div class="checkbox">
                        <input type="checkbox" name="item_chk" id="item_chk01">
                        <label for="item_chk01"></label>
                    </div>
                    
                    <div class="item_detail">
                        <img src="/images/${basket.product.files.file_name}">
                        <p class="item_detail"><strong>${basket.basketid}</strong></p>
                       <%--  <input class="item_detail" type="hidden" value="${basket.baskid}"/> --%>
                        <p class="item_detail"><strong>${basket.product.pro_name}</strong></p>
                    </div>
                    <!--원가 :  ${basket.product.price * basket.count}-->
                    <div class="opt_info">
                         <strong class="price_unit" style="color: red; display: none">${salePrice}</strong>
                          <%-- <input type = "text" class="price_unit" value="${salePrice}" /> --%> 
                         <strong class="price_unit2" style="color: red; display: none">${basket.product.price}</strong> 
                          <%-- <input type = "text" name="price_unit2" value="${basket.product.price}"/> --%>  
                        <div class="price_btn">
                            <input type="button" value="-" class="minus_btn">
                            <input type="text" value="1" class="number">
                            <input type="button" value="+" class="plus_btn">
                        </div>
                        <div class="total_p">
                               <strong class="price_amount">${salePrice * basket.count}</strong>원
 	                           <strong class="price_cost">${basket.product.price * basket.count}</strong>원 
                            
                        <!--제품삭제 -->     
                       <form action="/delete"  method="post" class="delete_cart">
                              <button class="delete" data-basketid="${basket.basketid}">삭제</button>
                              <input type="hidden" name="basketid" class="delete_basket" value="${basket.basketid}">
                     		   
                       </form>
              
                 
                        </div>
                    </div>
                </li>
            	</c:forEach>
               
               
            </ul>
		 
            <div class="cart_total_area">
                <p>결제 정보</p>
                <div class="cart_total_price">
                    <p>총 상품금액 <strong class="item_price">${totalPrice}</strong>원<span class="plus_ic"></span></p>
                    <p>할인금액 <strong class="sale_price color-symbol"></strong>원 <span class="plus_ic"></span></p>
                    <p>총 배송비 <strong class="delivery_price">${totalPrice >30000 ? 0 :2500 }</strong>원<span class="equal_ic"></span></p>
                    <p>총 결제금액 <strong class="total_price color-red">${salePrice}</strong></p>원
<!-- 					<p>총 결제금액 <strong class="total_price color-red"></strong></p>원 -->
                </div>
            </div> 
	
            <div class="btn_box">
                <button type="button" onclick="location.href='/product/productList'" class="btn wh-btn">계속 쇼핑하기</button>
                <button type="button" class="btn black-btn" onclick="location.href='/productOrder'">구매하기</button>
            </div>

        </div>
        
<script>
$(document).ready(function(){
    //전체 선택 클릭시 
    $('#all_chk').change(function () {
      if($("#all_chk").is(":checked")){
        $("input[name=item_chk]").prop("checked",true);
      }else{
        $("input[name=item_chk]").prop("checked",false);
      }
      // 전체 체크 순회(체크 확인)
      var check_cnt=0;
      $("input:checkbox[name=item_chk]").each(function() {
         if($("input:checkbox[name=item_chk]").is(":checked") == true){
            check_cnt++;
            //console.log(check_cnt)      
         }
      });
      $('.del_btn .num').text(check_cnt);
    });

   $('input[name="item_chk"]').change(function () {

    var itemLength = $('input[name="item_chk"]').length;
    var checkedLength = $('input[name="item_chk"]:checked').length;
    var selectAll = (itemLength == checkedLength);
    //console.log(checkedLength);

    $('.del_btn .num').text(checkedLength);
    $('#all_chk').prop('checked', selectAll);

    });

   $('.price_btn input[type="button"]').on('click', function(){
       var $ths = $(this);
       var $par = $ths.parent().parent();
       var $obj = $par.find('input[type="text"]');
       var val = $obj.val();
       if ($ths.val()=='-') {
           if (val > 1)
               $obj.val(--val);
       }
       else if ($ths.val()=='+') {
    	   
           if (val < 30)
               $obj.val(++val);
       }
   
     //수량 변경
     var unit_amount=$par.find('.price_unit').text().replace(/[^0-9]/g,"");
     var unit_amount2=$par.find('.price_unit2').text().replace(/[^0-9]/g,"");
     var quantity = val;
     // 결제 수량 변경 로직은 메인터너스의 편리성을 위해서 밖으로 빼서 처리함.
     //1단 세로 부분 결제 금액
     pay_unit_func($par,unit_amount,quantity);
     pay_unit_func2($par,unit_amount2,quantity);
     //2단 결제 금액
     pay_total_func();
   });
  
  function pay_unit_func($par,unit_amount,quantity){
    //1번 단
    var unit_total_amount=$par.find('.price_amount').text((unit_amount*quantity).toLocaleString());
  } 
  
  function pay_unit_func2($par,unit_amount2,quantity){
	    //1번 단
	    var unit_total_amount2=$par.find('.price_cost').text((unit_amount2*quantity).toLocaleString());
	  } 
  
  function pay_total_func(){
    //2번 단 
    var amount_total=0;
    var amount_total2=0;
    var converse_unit=0;
    $('.cart_list li').each(function() {
      //console.log($(this).find('.price_amount').text());
      converse_unit2=$(this).find('.price_cost').text().replace(/[^0-9]/g,"");
      amount_total2=amount_total2+(parseInt(converse_unit2)|| 0);
      
      converse_unit=$(this).find('.price_amount').text().replace(/[^0-9]/g,"");
      amount_total=amount_total+(parseInt(converse_unit)|| 0);
      //총 상품금액
      //console.log(amount_total);
    });
    //총 상품금액
    //var total_amount_money = $('.cart_total_price').children().find('.item_price').text();
    var total_amount_money =$('.cart_total_price').children().find('.item_price').text(amount_total2.toLocaleString());
    //할인금액
    var total_sale_money = parseInt($('.cart_total_price').children().find('.sale_price').text().replace(/[^0-9]/g,"")|| 0);
    console.log(total_sale_money);
    //총 배송비
    var total_delivery_price = parseInt($('.cart_total_price').children().find('.delivery_price').text().replace(/[^0-9]/g,"")|| 0);
    console.log(total_delivery_price);
    //총 결제금액
    var total_price=(parseInt(amount_total|| 0)-total_sale_money+total_delivery_price);
    var total_total_price = $('.cart_total_price').children().find('.total_price').text(total_price.toLocaleString());
    
    if(totalPrice >= 30000){
		deliveryPrice = 0;
	} else if(totalPrice == 0){
		deliveryPrice = 0;
	} else {
		deliveryPrice = 3000;	
	}	
  }
  
   //개별 아이템 삭제
   $('.del_li_btn').on('click', function(){
     var recent_delete_cnt=$('.del_btn .num').text();
     var check_delete_ck=$(this).offsetParent().parent().find('input[type="checkbox"]').is(':checked');
     console.log(check_delete_ck);
     if(check_delete_ck == true){
       recent_delete_cnt=recent_delete_cnt - 1;
       $('.del_btn .num').text(recent_delete_cnt);
     }
     $(this).offsetParent().parent().remove();
     //console.log($(this).offsetParent().parents().find('input[type="checkbox"]').is(':checked'));
     pay_total_func();
   });
   //삭제 버튼을 누르면 지정된 상품 삭제
   $('.del_btn').on('click', function(){
     var recent_delete_cnt=$('.del_btn .num').text();
     $("input:checkbox[name=item_chk]").each(function() {
          var check_delete_ck=$(this).offsetParent().find('input[type="checkbox"]').is(':checked');
          console.log(check_delete_ck);
          if(check_delete_ck == true){
            recent_delete_cnt=recent_delete_cnt - 1;
            $('.del_btn .num').text(recent_delete_cnt);
            $(this).offsetParent().remove();
          }
      });
      pay_total_func();
   }); 
});

// $(".delete").on("click", function(e)){
// 	e.preventDefault();
// 	const basketid = $(this).data("basketid");
// 	$("delete_basket").val(basketid);
// 	$("delete_cart").submit();
// });



</script>
    
    </body>
</html>