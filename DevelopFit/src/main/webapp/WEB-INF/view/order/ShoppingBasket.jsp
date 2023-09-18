<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>

<script type="text/javascript" src="/Final/resources/js/ShoppingBasket.js" ></script>
<link href="/Final/resources/css/ShoppingBasket.css" rel="stylesheet" type="text/css" /> 

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
	margin: 30px auto;
   	background-color: skyblue;
}

#selectProduct {
	width: 83px;
	height: 20px;
	display: inline-block;
	margin-left: 624px;
}

#productDetail {
	width: 830px;
	height: 150px;
	background-color: #172036;
	border-radius: 13px;
	padding: 30px 30px 30px 40px;
	margin-bottom: 15px;
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
	margin: 30px auto;
   	background-color: skyblue;
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
	border: 1px solid white;
	float: left;
}

#productPrice {
	width: 100px;
	height: 90px;
	margin: 0px 10px 10px 12px;
	padding-top: 60px;
	border: 1px solid white;
	float: left;
	text-align: center;
	vertical-align: middle;
}

#productSelect {
	width: 50px;
	height: 85px;
	margin: 0px 10px 10px 12px;
	padding-top: 65px;
	border: 1px solid white;
	text-align: center;
}

#productOtherInfo {
	width: 100px;
	height: 125px;
	margin: 0px 10px 10px 12px;
	padding-top: 25px;
	border: 1px solid white;
	text-align: center;
}

p {
	display: inline-block;
}

</style>


<script type="text/javascript">

	function checkAllFnc() {
		var checkBoxes = document.getElementsByName("product");
		var allCheckObj = document.getElementsByName("allCheck")[0];
		
		if(allCheckObj.checked == false){
			for (var i = 0; i < checkBoxes.length; i++) {
				checkBoxes[i].checked = false;
			}
		} else if(allCheckObj.checked == true){
			for (var i = 0; i < checkBoxes.length; i++) {
				checkBoxes[i].checked = true;
			}
		}
		
	}
	
	
	function checkedFnc() {
		var checkBoxes = document.getElementsByName("product");
		var allCheckObj = document.getElementsByName("allCheck")[0];
		
		for (var i = 0; i < checkBoxes.length; i++) {
			if(checkBoxes[i].checked == false) {
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
			if(checkBoxes[i].checked == true) {
				checkStr += checkBoxes[i].value + ",";
			}
		}
		return checkStr;
	}
	
	
	function buyFnc() {
		var checkStrObj = document.getElementById("checkStr");
		var formObj = document.getElementsByTagName("Form")[0];

		checkStrObj.value = checkStr();
		
		alert(checkStrObj.value);
		formObj.setAttribute("method", "post");
		formObj.setAttribute("action", "./basketCtr.do");
		formObj.submit();
	}


</script>


</head>
<body>
	
<!-- 	헤더 -->
	<jsp:include page="/WEB-INF/view/Header.jsp"/>
	
	
	
	
	
<!-- 	장바구니 -->
	<div id="productWrap">
		<h1>장바구니</h1>
		<div id="selectProduct">전체선택 <input type="checkbox" name="allCheck" onclick="checkAllFnc();"></div>
		
		<form action="./basketCtr.do" method="POST">
		
		<c:forEach var="basketList" items="${basketList}">
		<div id="productDetail">
			<div id="productImg" class="productInfo">
				<img id="productPoster" src="${basketList.moviePoster}" />
			</div>
			<div id="productName" class="productInfo">
				<h2>${basketList.movieTitle}</h2>
				<br/>
				<p>${basketList.movieSummary}</p>
			</div>
			<div id="productOtherInfo" class="productInfo">
				<h4>개봉일</h4><p><fmt:formatDate value="${basketList.movieReleaseDate}"/></p>
				<div><br></div>
				<h4>상영시간</h4><p>${basketList.movieRuntime}분</p>
			</div>
			<div id="productPrice" class="productInfo">
				<h4>상품금액</h4>
				<p>${basketList.moviePrice}원</p>
			</div>
			<div id="productSelect" class="productInfo">
				<label>
					<input type="checkbox" name="product" value="${basketList.movieNumber}" onclick="checkedFnc();">
				</label>
			</div>
		</div>
		</c:forEach>
		
		</form>
	</div>
	
	
	
	
	
	
	
	
	
	
<!-- 	결제정보 -->
	<div id="payWrap">
		<h1>결제정보</h1>
		<div id="payDetail">
			<div id="payment">
				<p>결제금액</p>
				<p style="text-align: right;">0원</p>
			</div>
			<div id="refund">
				<p>품절 시 환불 안내</p>
				<p>환불안내 내용환불안내 내용환불안내 내용</p>
			</div>
			<div id="consentOrder">
				<p style="display: inline-block;">주문자 동의</p>
					<label><input type="checkbox" name="agree" value="1">1</label>
					<label><input type="checkbox" name="agree" value="2">2</label>
			</div>
		</div>
	</div>
	
	
	
<!-- 	버튼 -->
	<div id="selectWrap">
		<div id="cancel" onclick="이전페이지">취소</div>
		<div id="buy" onclick="buyFnc();">구매</div>
		
		
			<input type="hidden" name="checkStr" id="checkStr">
	</div>
	
	
<%-- 	<jsp:include page="/WEB-INF/view/Footer.jsp"/> --%>
	
</body>
</html>