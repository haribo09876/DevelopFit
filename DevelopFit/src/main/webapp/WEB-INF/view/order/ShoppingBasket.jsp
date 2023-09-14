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
	height: 420px;
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
	width: 840px;
	height: 120px;
	background-color: #172036;
	border-radius: 10px;
	padding: 30px;
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





#selectWrap {
	
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
</style>

</head>
<body>
	
	<jsp:include page="/WEB-INF/view/Header.jsp"/>
	
	
	<div id="productWrap">
		<h1>장바구니</h1>
		<div id="deleteProduct">선택삭제</div>
		<c:forEach var="basketList" items="${basketList}">
		<div id="productDetail">
			<div id="productImg">
				<img style="width:100px; height: 150px;" src="${basketList.moviePoster}" />
<%-- 				${basketList.moviePoster} --%>
			</div>
			<div id="productInfo">
				<h2>${basketList.movieTitle}</h2>
				<p>${basketList.moviePrice}</p>
				<label><input type="checkbox" name="product" value="오펜하이머"></label>
			</div>
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