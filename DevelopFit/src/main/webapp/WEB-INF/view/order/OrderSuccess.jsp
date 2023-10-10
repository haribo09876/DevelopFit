<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 성공</title>

<script type="text/javascript"
	src="/DevelopFit/resources/css/orderSuccess.js"></script>
<link href="/DevelopFit/resources/css/orderSuccess.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript">
	// 	window.onload = function() {
	// 		history.pushState(null, null, location.origin + '/DevelopFit/order');
	// 	}

	// 	window.onpopstate = function() {
	// 		history.pushState(null, null, location.origin + '/DevelopFit/order');
	// 	}
</script>

<style type="text/css">
body {
	background-color: #101322;
	color: white;
}

#orderWrap {
	width: 900px;
	height: auto;
	margin: 30px auto 0px;
}

#productDetail{
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

.productOtherInfo {
	width: 100px;
	height: 125px;
	margin: 0px 10px 10px 12px;
	padding-top: 25px;
	text-align: center;
	display: inline-block;
	float: left;
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

#selectWrap {
	width: 500px;
	margin: 50px auto;
}

#goOrderDetail {
	width: 200px;
	height: 35px;
	line-height: 35px;
	font-size: 20px;
	background-color: #0E7356;
	border: 1px solid #0E7356;
	color: white;
	border-radius: 5px;
	text-align: center;
	cursor: pointer;
	float: right;
}


#orderCancel {
	width: 200px;
	height: 35px;
	line-height: 35px;
	font-size: 20px;
	background-color: #f24141;
	border: 1px solid #f24141;
	color: white;
	border-radius: 5px;
	text-align: center;
	margin-right: 50px;
	cursor: pointer;
	float: left;
}

.movieSummary {
	display: -webkit-box;
	-webkit-line-clamp: 4;
	-webkit-box-orient: vertical;
	overflow: hidden;
	text-overflow: ellipsis;
	word-break: break-word;
	text-align: left;
}
button:hover {
  	opacity: .8;
}
</style>

</head>
<body>

	<jsp:include page="/WEB-INF/view/Header.jsp" />

	<!-- 	주문완료 -->
	<div id="orderWrap">
		<div>
			<h3>주문완료</h3>
		</div>

		<c:forEach var="orderHistory" items="${orderHistory}">

			<div id="productDetail">
			
				<div class="productImg">
					<a href="../movie/listOne.do?movieNumber=${orderHistory.movieNumber}">
						<img class="productPoster" src="${orderHistory.movieMainPoster}" />
					</a>
				</div>
				
				<div class="productName">
					<h3>${orderHistory.movieTitle}</h3>
					<br>
                    <!-- 영화 줄거리 -->
                    <a class="movieSummary">${orderHistory.movieSummary}</a>
				</div>
				
				<div class="productOtherInfo">
					<h4>개봉일</h4>
					<p>
						<fmt:formatDate value="${orderHistory.movieReleaseDate}" pattern="yyyy.MM.dd"/>
					</p>
					<div>
						<br>
					</div>
					<h4>상영시간</h4>
					<p>
						${orderHistory.movieRuntime}분
					</p>
				</div>
				
				<div class="productPrice">
					<h4>상품금액</h4>
					<p>
						${orderHistory.moviePrice}원
					</p>
				</div>
				
			</div>
			
		</c:forEach>
		
	</div>







	<div id="selectWrap">
		<button type="button" id="orderCancel" onclick="location.href='./cancel.do?orderNumber=${orderHistory[0].orderHistoryNumber}'">주문 취소</button>
		<button type="button" id="goOrderDetail" onclick="location.href='./history.do'">주문내역으로 이동</button>
	</div>




</body>
</html>