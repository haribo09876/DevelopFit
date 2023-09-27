<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 결제</title>

<style type="text/css">
   body {
      background-color: #101322;
      color: white;
   }
   
   #paymentWrap {
      width: 900px;
      height: auto;
      margin: 30px auto 0px;
   }
   
   .productDetail {
      width: 830px;
      height: 150px;
      background-color: #172036;
      border-radius: 13px;
      padding: 30px 30px 30px 40px;
      margin-top: 10px;
   }
   
   .productImg {
      width: 100px;
      height: 150px;
      float: left;
   }
   
   .productPoster {
      width: 100px;
      height: 150px;
      float: left;
   }
   
   .productTitle {
      width: 380px;
      height: 150px;
      margin: 0px 20px 16px;
      float: left;
      display: inline-block;
      line-height: 150px;
      text-align: center;
   }
   
   .productPrice {
      width: 100px;
      height: 90px;
      margin: 0px 20px 12px;
      padding-top: 60px;
      float: left;
      text-align: center;
      vertical-align: middle;
      display: inline-block;
   }
   
   .productOtherInfo {
      width: 100px;
      height: 125px;
      margin: 0px 20px 12px;
      padding-top: 25px;
      text-align: center;
      display: inline-block;
      float: left;
   }
   
   #orderDetail {
      width: 830px;
      height: 90px;
      background-color: #172036;
      border-radius: 13px;
      padding: 30px 30px 30px 40px;
      margin-top: 10px;
      margin-bottom: 15px;
      font-size: 18px;
   }
   
   #orderPrice {
      width: 250px;
      height: 30px;
      float: left;
      padding-left: 70px;
      padding-top: 20px;
   }
   #myMoney {
      width: 250px;
      height: 30px;
      float: left;
      padding-top: 20px;
   }
   #calResult {
      width: 250px;
      height: 30px;
      float: right;
      padding-top: 20px;
   }
   
   
   
   
   
   
   
   #selectWrap {
     width: 500px;
   margin: 50px auto;
   }
   
   
   #cancel {
     width: 200px;
   height: 35px;
   line-height: 35px;
   font-size: 20px;
   background-color: #f24141;
   border-radius: 5px;
   text-align: center;
   margin-right: 50px;
   float: left;
   }
   
   #payment {
      width: 200px;
   height: 35px;
   line-height: 35px;
   font-size: 20px;
   background-color: #0DA66E;
   border-radius: 5px;
   text-align: center;
   float: right;
   }
</style>


<script type="text/javascript">
   
   // 서브밋
   function paymentFnc() {
      var payFormObj = document.getElementById("payForm");
      var userMoney = parseInt("${member.memberMoney}");
      
      if(confirm("결제하시겠습니까?") == true){
         if(totalAmountFnc() <= userMoney){
            payFormObj.setAttribute("method", "post");
            payFormObj.setAttribute("action", "./paymentCtr.do");
            
            payFormObj.submit();
            alert("결제되었습니다.");
            
         } else if (totalAmountFnc() > userMoney){
            alert("잔액이 부족합니다.");
         }
         
      }
      
   }
   
   function cancelFnc() {
      location.href = "./basket.do";
   }
   
   // 결제할 금액
   function totalAmountFnc() {
      var totalAmount = 0;
      
      <c:forEach var="productList" items="${productList}">
         totalAmount += parseInt("${productList.moviePrice}");
      </c:forEach>
      
      return totalAmount;
   }
   
   //결제 후 잔액
   function calResultFnc() {
      var calResultObj = document.getElementById("calResult");
      var result = 0;
      
      return result = parseInt("${member.memberMoney}") - totalAmountFnc();
   }
   
   window.onload = function() {
      var totalPriceObj = document.getElementById("totalPrice");
      totalPriceObj.innerHTML = totalAmountFnc() + "원";
      
      var balanceObj = document.getElementById("balance");
      balanceObj.innerHTML = calResultFnc() + "원";
      
   }
</script>


</head>
<body>
   
   
   <!--    헤더 -->
   <jsp:include page="/WEB-INF/view/Header.jsp" />
   
   
   
   
   <div id="paymentWrap">
      <h1>주문</h1>
      <form id="payForm">
         <c:forEach var="productList" items="${productList}">
            <div class="productDetail">
               <div class="productImg">
                  <a href="../movie/listOne.do?movieNumber=${productList.movieNumber}">
                     <img class="productPoster"src="${productList.movieMainPoster}">
                  </a>
               </div>
               <input hidden="" name="product" value="${productList.movieNumber}">
               <div class="productTitle">
                  <h2>${productList.movieTitle}</h2>
               </div>
               <div class="productOtherInfo">
                  <h4>개봉일</h4>
                  <p>
                     <fmt:formatDate value="${productList.movieReleaseDate}" pattern="yyyy.MM.dd"/>
                  </p>
                  <div>
                     <br>
                  </div>
                  <h4>상영시간</h4>
                  <p>${productList.movieRuntime}분</p>
               </div>
               <div class="productPrice">
                  <h4>상품금액</h4>
                  <p>${productList.moviePrice}원</p>
                  <input hidden="" value="${productList.moviePrice}" name="moviePrice">
               </div>
            </div>
         </c:forEach>
      </form>
   </div>
   
   
   <div id="paymentWrap">
      <h1>결제상세</h1>
      <div id="orderDetail">
         <div id="orderPrice">
            <h4 id="payAmount">주문금액</h4>
            <p id="totalPrice"></p>
         </div>
         <div id="myMoney">
            <div>M Money</div>
            <p>${member.memberMoney}원</p>
         </div>
         <div id="calResult">
            <div>결제 후 잔액</div>
            <p id="balance"></p>
         </div>
      </div>
      
      
   </div>
   
   
   
   <!--    구매취소버튼 -->
   <div id="selectWrap">
      <div id="cancel" onclick="cancelFnc();">취소</div>
      <div id="payment" onclick="paymentFnc();">결제</div>
   </div>
</body>
</html>