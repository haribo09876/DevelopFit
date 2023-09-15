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

#deleteProduct {
	width: 64px;
	height: 20px;
	display: inline-block;
	margin-left: 650px;
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
	width: 300px;
	height: 500px;
	display: inline-block;
}

#payInfo {
	
}

#payDetail{
	
}




#cancel {
	width: 250px;
	height: 45px;
	font-size: 25px;
	background-color: #0DA66E;
	border-radius: 5px;
	text-align: center;
	padding-top: 8px;
	display: inline-block;
	margin-right: 50px;
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
	width: 300px;
	height: 150px;
	margin: 0px 10px 10px 10px;
	border: 1px solid white;
	float: left;
}

#productPrice {
	width: 100px;
	height: 150px;
	margin: 0px 10px 10px 10px;
	border: 1px solid white;
	float: left;
	text-align: center;
}

#productSelect {
	width: 50px;
	height: 150px;
	margin: 0px 10px 10px 10px;
	border: 1px solid white;
	text-align: center;
}
</style>

</head>
<body>
	
	<jsp:include page="/WEB-INF/view/Header.jsp"/>
	
	
	<div id="productWrap">
		<h1>장바구니</h1>
		<div id="deleteProduct">선택삭제</div>
		
		<c:forEach var="basketList" items="${basketList}">
		<div id="productDetail">
			<div id="productImg" class="productInfo"><img id="productPoster" src="${basketList.moviePoster}" /></div>
			<div id="productName" class="productInfo"><h2>${basketList.movieTitle}</h2></div>
			<div id="productPrice" class="productInfo"><p>상품금액</p><p>${basketList.moviePrice}</p></div>
			<div id="productSelect" class="productInfo"><label><input type="checkbox" name="product" value="${basketList.movieTitle}"></label></div>
		</div>
		</c:forEach>
		
	</div>
	
	
	<div id="payWrap">
		<h1>결제정보</h1>
		<div id="payDetail">
			<div id="pay">
				<p style="display: inline-block;">결제금액</p>
				<p style="display: inline-block;">0원</p>
			</div>
			<div>
				<p style="display: inline-block;">품절 시 환불 안내</p>
				<p style="display: inline-block;">환불안내 내용환불안내 내용환불안내 내용</p>
			</div>
			<div>
				<p style="display: inline-block;">주문자 동의</p>
				<form action="" method="post" >
					<label><input type="checkbox" name="agree" value="1" >1</label>
					<label><input type="checkbox" name="agree" value="2" >2</label>
				</form>
			</div>
		</div>
	</div>
	
	
	<div id="selectWrap">
		<div id="cancel" onclick="이전페이지">취소</div>
		<div id="buy" onclick="다음페이지">구매</div>
	</div>
	
	
<%-- 	<jsp:include page="/WEB-INF/view/Footer.jsp"/> --%>
	
</body>
</html>