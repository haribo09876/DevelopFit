<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
   src="/DevelopFit/resources/js/ShoppingBasket.js"></script>
<link href="/DevelopFit/resources/css/ShoppingBasket.css"
   rel="stylesheet" type="text/css" />

<script type="text/javascript">
   function checkAllFnc() {
      var checkBoxes = document.getElementsByName("product");
      var allCheckObj = document.getElementsByName("allCheck")[0];

      if (allCheckObj.checked == false) {
         for (var i = 0; i < checkBoxes.length; i++) {
            checkBoxes[i].checked = false;
         }
      } else if (allCheckObj.checked == true) {
         for (var i = 0; i < checkBoxes.length; i++) {
            checkBoxes[i].checked = true;
         }
      }

   }

   function sumPriceFnc() {
      var sum = 0;
      var checkBoxes = document.getElementsByName("product");
      var totalPriceObj = document.getElementById("totalPrice");

      for (var i = 0; i < checkBoxes.length; i++) {
         if (checkBoxes[i].checked == true) {
            sum += parseInt(document.getElementById(checkBoxes[i].value).value);
         }
      }
      totalPrice.innerHTML = sum + "원";
   }

   function checkedFnc() {
      var checkBoxes = document.getElementsByName("product");
      var allCheckObj = document.getElementsByName("allCheck")[0];

      for (var i = 0; i < checkBoxes.length; i++) {
         if (checkBoxes[i].checked == false) {
            allCheckObj.checked = false;
            break;
         } else {
            allCheckObj.checked = true;
         }
      }
   }

   function checkStr() {
      var checkBoxes = document.getElementsByName("product");
      var checkStr = "";

      for (var i = 0; i < checkBoxes.length; i++) {
         if (checkBoxes[i].checked == true) {
            checkStr += checkBoxes[i].value + ",";
         }
      }
      return checkStr;
   }

   function buyFnc() {
      var formObj = document.getElementById("formTag");
      
      if (checkStr() == "") {
         alert("상품을 선택해주세요.");
      } else if (checkStr() != "") {
         if(customerAgreeFnc()){
            formObj.setAttribute("method", "post");
            formObj.setAttribute("action", "./payment.do");
            formObj.submit();
         } else if(!customerAgreeFnc()) {
            alert("필수동의를 체크해주세요.");
         }
         
      }

   }

   function deleteSelectFnc() {
      var formObj = document.getElementById("formTag");

      if (checkStr() != "") {
         if (confirm("삭제하시겠습니까?") == true) {
            alert("삭제되었습니다");
            
            formObj.setAttribute("method", "post");
            formObj.setAttribute("action", "./basketCtr.do");
            formObj.submit();
         }
      } else {
         alert("삭제할 상품을 선택해주세요.");
      }
   }

   function moveMovieListFnc() {
      location.href = "../movie/list.do";
   }
   
   function customerAgreeFnc() {
      var agreeCheckBoxes = document.getElementsByName("agree");
      var agreeBoolean = true;
      
      for(i = 0; i < agreeCheckBoxes.length; i++){
         if(agreeCheckBoxes[i].checked == false){
            agreeBoolean = false;
         }
      }
      
      return agreeBoolean;
   }
   
</script>

<style type="text/css">

body {
   background-color: #101322;
   color: white;
}

h1 {
   display: inline-block;
}

#productWrap {
   width: 900px;
   height: auto;
   margin: 30px auto 0px;
}

#selectAll {
   width: 83px;
   height: 20px;
   display: inline-block;
   margin-left: 683px;
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
   display: inline-block;
   float: left;
   cursor: pointer;
}

.productPoster {
   width: 100px;
   height: 150px;
   float: left;
}

.productName {
   width: 380px;
   height: 150px;
   margin: 0px 10px 10px 16px;
   float: left;
   display: inline-block;
/*    line-height: 150px; */
   text-align: center;
}

.productPrice {
   width: 100px;
   height: 90px;
   margin: 0px 10px 10px 12px;
   padding-top: 60px;
   float: left;
   text-align: center;
   vertical-align: middle;
   display: inline-block;
}

#orderWrap {
   width: 900px;
   height: auto;
   margin: 50px auto;
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
   cursor: pointer;
   float: left;
}

#buy {
   width: 200px;
   height: 35px;
   line-height: 35px;
   font-size: 20px;
   background-color: #0DA66E;
   border-radius: 5px;
   text-align: center;
   cursor: pointer;
   float: right;
}

.productSelect {
   width: 50px;
   height: 85px;
   margin: 0px 10px 10px 12px;
   padding-top: 65px;
   text-align: center;
   display: inline-block;
   float: left;
}

.productOtherInfo {
   width: 100px;
   height: 125px;
   margin: 0px 10px 10px 12px;
   padding-top: 25px;
   text-align: center;
   display: inline-block;
   float: left;
}

p {
   /*    display: inline-block; */
   
}

#deleteWrap {
   width: 900px;
   margin: 0px auto;
}

#deleteSelect {
   color: white;
   width: 64px;
   float: right;
   cursor: pointer;
   margin-top: 10px;
}

#emptyBasket {
   width: 830px;
   height: 150px;
   background-color: #172036;
   border-radius: 13px;
   padding: 30px 30px 30px 40px;
   margin-top: 10px;
}

#emptyBasketContent {
   font-size: 20px;
   margin: 48px 290px;
}

#movePageMovie {
   width: 250px;
   height: 45px;
   font-size: 25px;
   background-color: #0DA66E;
   border-radius: 5px;
   text-align: center;
   padding-top: 8px;
   display: inline-block;
   cursor: pointer;
   margin: 50px 0px 0px 300px;
}

#totalPrice {
   text-align: right;
   display: inline-block;
   margin-left: 30px;
}

#orderPrice {
   width: 700px;
   height: 30px;
   display: inline-block;
}

#consentOrder {
   width: 700px;
   height: 100px;
}

#payAmount {
   display: inline-block;
}

#customerAgree {
   display: inline-block;
   float: left;
}

input[name=agree] {
   margin: 5px;
}

#buttonWrap {
   width: 900px;
   margin: 0px auto;
}

label {
	cursor: pointer;
	display: block;
}

input {
	cursor: pointer;
}

#agreeBox {
	display: inline-block;
	margin-left: 5px;
}
</style>

</head>
<body>

   <!--    헤더 -->
   <jsp:include page="/WEB-INF/view/Header.jsp" />



   <!--    장바구니 -->
   <div id="productWrap">
      <h1>장바구니</h1>

      <c:choose>
         <c:when test="${not empty basketList}">


            <div id="selectAll" >
               <label><input type="checkbox" name="allCheck" onclick="checkAllFnc(); sumPriceFnc();"> 전체선택</label>
            </div>
            
            <form id="formTag">
               <c:forEach var="basketList" items="${basketList}" varStatus="status">
                     <div class="productDetail">
                        <div class="productImg">
                           <a href="../movie/listOne.do?movieNumber=${basketList.movieNumber}">
                              <img class="productPoster" src="${basketList.movieMainPoster}" />
                           </a>
                        </div>
                        <div class="productName">
                           <h2>${basketList.movieTitle}</h2>
                        </div>
                        <div class="productOtherInfo">
                           <h4>개봉일</h4>
                           <p>
                              <fmt:formatDate value="${basketList.movieReleaseDate}" pattern="yyyy.MM.dd"/>
                           </p>
                           <div>
                              <br>
                           </div>
                           <h4>상영시간</h4>
                           <p>${basketList.movieRuntime}분</p>
                        </div>
                        <div class="productPrice">
                           <h4>상품금액</h4>
                           <p>${basketList.moviePrice}원</p>
                        </div>
   
                        <div class="productSelect">
                           <input type="checkbox" name="product" value="${basketList.movieNumber}" 
                              onclick="checkedFnc(); sumPriceFnc();">
                           <input type="hidden" id="${basketList.movieNumber}" value="${basketList.moviePrice}">
                        </div>
                     </div>
               </c:forEach>
            </form>



            <div id="deleteWrap">
               <div id="deleteSelect" onclick="deleteSelectFnc();">선택삭제</div>
            </div>



            <!--    주문금액 -->
            <div id="orderWrap">
               <h1>주문금액</h1>
               <div id="orderDetail">
               
                  <div id="orderPrice">
                     <h4 id="payAmount">주문금액</h4>
                     <p id="totalPrice">0원</p>
                  </div>

                  <div id="consentOrder">
                     <h4 id="customerAgree">주문자 동의</h4>
                     <div id="agreeBox">
	                     <label>
	                     	<input type="checkbox" name="agree" value="주문자 동의">만 14세 이상입니다.
	                     </label>
	                     <label>
	                     	<input type="checkbox" name="agree" value="주문자 동의">7일 이내 환불 가능합니다.
	                     </label>
                     </div>
                  </div>
                  
               </div>
            </div>



            <!--    구매취소버튼 -->
            <div id="selectWrap">
               <div id="cancel" onclick="이전페이지">취소</div>
               <div id="buy" onclick="buyFnc();">주문</div>
            </div>
         </c:when>

         <c:otherwise>
            <div id="emptyBasket">
               <div id="emptyBasketContent">
                  장바구니가 비어있어요..<br>영화를 담아주세요!
               </div>
            </div>

            <div id="buttonWrap">
               <div id="movePageMovie" onclick="moveMovieListFnc();">영화페이지로
               </div>
            </div>
         </c:otherwise>
      </c:choose>

   </div>
   <!-- productWrap end -->



   <%--    <jsp:include page="/WEB-INF/view/Footer.jsp"/> --%>

</body>
</html>