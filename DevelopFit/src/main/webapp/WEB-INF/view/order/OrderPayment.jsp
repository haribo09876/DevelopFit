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
}

#myMoney {
	width: 250px;
	height: 30px;
	margin-top: 3px;
	margin-bottom: 3px;
}

#calResult {
	width: 250px;
	height: 30px;
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
	cursor: pointer;
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
	cursor: pointer;
}

#consentOrder {
	width: 380px;
	height: 120px;
	display: inline-block;
	float: left;
}

#customerAgree {
	width: 100px;
	display: inline-block;
	float: left;
}

#agreeBox {
	width: 250px;
	display: inline-block;
	float: left;
	margin-left: 10px;
}

#payWrap {
	width: auto;
	height: 120px;
	display: inline-block;
	float: left;
	margin-left: 80px;
}

.h4InlineBlock {
	display: inline-block;
	float: left;
}

.pInlineBlock {
	display: inline-block;
	float: left;
}

#orderPrice > p {
	margin-left: 40px;
}

#myMoney > p {
	margin-left: 30px;
}

#calResult > p {
	margin-left: 10px;
}

</style>


<script type="text/javascript">
	// 서브밋
	function paymentFnc() {
		var payFormObj = document.getElementById("payForm");
		var userMoney = parseInt("${member.memberMoney}");
		
		if(!customerAgreeFnc()){
			alert("필수동의를 체크해주세요.");
			return false;
		}
		
		if (confirm("결제하시겠습니까?") == true) {
			if (totalAmountFnc() <= userMoney) {
				payFormObj.setAttribute("method", "post");
				payFormObj.setAttribute("action", "./paymentCtr.do");

				payFormObj.submit();
				alert("결제되었습니다.");

			} else if (totalAmountFnc() > userMoney) {
				if (confirm("잔액이 부족합니다. 충전하시겠습니까?") == true) {
					var popup = window.open('./charging.do', '',
							'width=250px,height=300px');
				}
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
	
	// 필수 동의
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
							<img class="productPoster" src="${productList.movieMainPoster}">
						</a>
					</div>
					<input hidden="" name="product" value="${productList.movieNumber}">
					<div class="productTitle">
						<h2>${productList.movieTitle}</h2>
					</div>
					<div class="productOtherInfo">
						<h4>개봉일</h4>
						<p>
							<fmt:formatDate value="${productList.movieReleaseDate}"
								pattern="yyyy.MM.dd" />
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
						<input hidden="" value="${productList.moviePrice}"
							name="moviePrice">
					</div>
				</div>
			</c:forEach>
		</form>
	</div>


	<div id="paymentWrap">
		<h1>결제상세</h1>

		<div id="orderDetail">
		
			<div id="consentOrder">
				<h4 id="customerAgree">주문자 동의</h4>
				<div id="agreeBox">
					<label>
						<input type="checkbox" name="agree" value="주문자 동의">만 14세 이상입니다.*
					</label>
					<br>
					<label> 
						<input type="checkbox" name="agree" value="주문자 동의">7일 이내 환불 가능합니다.*
					</label>
				</div>
			</div>


			<div id="payWrap">
				<div id="orderPrice">
					<h4 id="payAmount" class="h4InlineBlock">주문금액</h4>
					<p id="totalPrice" class="pInlineBlock"></p>
				</div>
				<div id="myMoney">
					<h4  class="h4InlineBlock">M Money</h4>
					<p class="pInlineBlock">${member.memberMoney}원</p>
				</div>
				<div></div>
				<div id="calResult">
					<h4  class="h4InlineBlock">결제 후 잔액</h4>
					<p id="balance" class="pInlineBlock"></p>
				</div>
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