<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>

<script type="text/javascript"
	src="/Final/resources/js/ShoppingBasket.js"></script>
<link href="/Final/resources/css/ShoppingBasket.css" rel="stylesheet"
	type="text/css" />

<style type="text/css">
body {
	background-color: #131826;
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
	margin-left: 617px;
}

#productDetail {
	width: 830px;
	height: 150px;
	background-color: #172036;
	border-radius: 13px;
	padding: 30px 30px 30px 40px;
	/* 	margin-bottom: 15px; */
	margin-top: 10px;
}

#productImg {
	display: inline-block;
	float: left;
}

#productInfo {
	display: inline-block;
}

#payWrap {
	width: 900px;
	height: auto;
	margin: 50px auto;
}

#payDetail {
	width: 830px;
	height: 90px;
	background-color: #172036;
	border-radius: 13px;
	padding: 30px 30px 30px 40px;
	margin-bottom: 15px;
	font-size: 18px;
}

#selectWrap {
	width: 556px;
	margin: 50px auto;
}

#cancel {
	width: 250px;
	height: 45px;
	font-size: 25px;
	background-color: #f24141;
	border-radius: 5px;
	text-align: center;
	padding-top: 8px;
	display: inline-block;
	margin-right: 50px;
	cursor: pointer;
}

#buy {
	width: 250px;
	height: 45px;
	font-size: 25px;
	background-color: #0DA66E;
	border-radius: 5px;
	text-align: center;
	padding-top: 8px;
	display: inline-block;
	cursor: pointer;
}

#productPoster {
	width: 100px;
	height: 150px;
	float: left;
}

.productInfo {
	display: inline-block;
	float: left;
}

#productName {
	width: 380px;
	height: 150px;
	margin: 0px 10px 10px 16px;
	float: left;
}

#productPrice {
	width: 100px;
	height: 90px;
	margin: 0px 10px 10px 12px;
	padding-top: 60px;
	float: left;
	text-align: center;
	vertical-align: middle;
}

#productSelect {
	width: 50px;
	height: 85px;
	margin: 0px 10px 10px 12px;
	padding-top: 65px;
	text-align: center;
}

#productOtherInfo {
	width: 100px;
	height: 125px;
	margin: 0px 10px 10px 12px;
	padding-top: 25px;
	text-align: center;
}

p {
/* 	display: inline-block; */
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

#payment {
	width: 700px;
	height: 30px;
	display: inline-block;
}

#consentOrder {
	width: 500px;
	height: 100px;
}

#payAmount {
	display: inline-block;
}

#customerAgree {
	display: inline-block;
	
}

input[name = agree] {
	margin: 5px;
}

#buttonWrap {
	width: 900px;
	margin: 0px auto;
}
</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
	
	function sumPrice() {
		var sum = 0;
		var checkBoxes = document.getElementsByName("product");
		var totalPriceObj = document.getElementById("totalPrice");
		
		for(var i = 0; i < checkBoxes.length; i++){
			if(checkBoxes[i].checked == true){
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
		} else {
			formObj.setAttribute("method", "post");
			formObj.setAttribute("action", "./successCtr.do");
			formObj.submit();
		}

	}

	function deleteSelectFnc() {
		var formObj = document.getElementById("formTag");
		
		if(checkStr() != "") {
			if (confirm("삭제하시겠습니까?") == true) {
				alert("삭제되었습니다");
// 				formObj.setAttribute("method", "post");
// 				formObj.setAttribute("action", "./basketCtr.do");
// 				formObj.submit();
				
				$.ajax({
				    url: "${pageContext.request.contextPath}/order/basketCtr.do",
				    type: 'post',
				    data: 
				    {
				        product: checkStr()
				    },
				    success: function (data) {
				        document.location.href = document.location.href; // 성공시 새로고침
				    },
				    error: function (error) {
				        console.error("AJAX Error:", error);
				    }
				});
			}
		} else {
			alert("삭제할 상품을 선택해주세요.");
		}
	}
	
	function movePageMovieFnc() {
		location.href = "../movie/list.do";
	}
</script>


</head>
<body>

	<!-- 	헤더 -->
	<jsp:include page="/WEB-INF/view/Header.jsp" />





	<!-- 	장바구니 -->
	<div id="productWrap">
		<h1>장바구니</h1>

		<c:choose>
			<c:when test="${not empty basketList}">


				<div id="selectAll">
					전체선택 <input type="checkbox" name="allCheck" onclick="checkAllFnc(); sumPrice();">
				</div>


				<c:forEach var="basketList" items="${basketList}">
					<div id="productDetail">
						<div id="productImg" class="productInfo">
							<img id="productPoster" src="${basketList.moviePoster}" />
						</div>
						<div id="productName" class="productInfo">
							<h2>${basketList.movieTitle}</h2>
							<br />
							<p>${basketList.movieSummary}</p>
						</div>
						<div id="productOtherInfo" class="productInfo">
							<h4>개봉일</h4>
							<p>
								<fmt:formatDate value="${basketList.movieReleaseDate}" />
							</p>
							<div>
								<br>
							</div>
							<h4>상영시간</h4>
							<p>${basketList.movieRuntime}분</p>
						</div>
						<div id="productPrice" class="productInfo">
							<h4>상품금액</h4>
							<p>${basketList.moviePrice}원</p>
						</div>
						<form id="formTag">
							<div id="productSelect" class="productInfo">
								<input type="checkbox" name="product"
									value="${basketList.movieNumber}" onclick="checkedFnc(); sumPrice();">
								<input type="hidden" id="${basketList.movieNumber}"
									value="${basketList.moviePrice}">
							</div>
						</form>
					</div>
				</c:forEach>



				<div id="deleteWrap">
					<div id="deleteSelect" onclick="deleteSelectFnc();">선택삭제</div>
				</div>



				<!-- 	결제정보 -->
				<div id="payWrap">
					<h1>결제정보</h1>
					<div id="payDetail">
						<div id="payment">
							<h4 id="payAmount">결제금액</h4>
							<p id="totalPrice">0원</p>
						</div>
						<div id="consentOrder">
							<h4 id="customerAgree">주문자 동의</h4>
							<label><input type="checkbox" name="agree" value="주문자 동의"> 만 14세 이상입니다.</label>
						</div>
					</div>
				</div>



				<!-- 	구매취소버튼 -->
				<div id="selectWrap">
					<div id="cancel" onclick="이전페이지">취소</div>
					<div id="buy" onclick="buyFnc();">구매</div>
				</div>
			</c:when>

			<c:otherwise>
				<div id="emptyBasket">
					<div id="emptyBasketContent">
						장바구니가 비어있어요..<br>영화를 담아주세요!
					</div>
				</div>
				
				<div id="buttonWrap">
					<div id="movePageMovie" onclick="movePageMovieFnc();">
						영화페이지로
					</div>
				</div>
			</c:otherwise>
		</c:choose>

	</div><!-- productWrap end -->



	<%-- 	<jsp:include page="/WEB-INF/view/Footer.jsp"/> --%>

</body>
</html>