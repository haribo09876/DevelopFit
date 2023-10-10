<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 취소</title>

<style type="text/css">
body {
	background-color: #101322;
	color: white;
}

#productWrap {
	width: 900px;
	height: auto;
	margin: 30px auto 0px;
}

#productDetail {
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

#cancelWrap {
	width: 900px;
	height: auto;
	margin: 50px auto;
}

#cancelDetail {
	width: 830px;
	height: 90px;
	background-color: #172036;
	border-radius: 13px;
	padding: 30px 30px 30px 40px;
	margin-top: 10px;
	margin-bottom: 15px;
	font-size: 18px;
}

#cancelContent {
	display: inline-block;
	margin-left: 110px;
}

#selectCancelReason {
	display: inline-block;
	margin-left: 10px;
}

#refundAmount {
	display: inline-block;
	margin-left: 200px;
}

#totalRefund {
	display: inline-block;
	margin-left: 10px;
}

.cDetails {
	line-height: 90px;
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

#refund {
	width: 200px;
	height: 35px;
	line-height: 35px;
	font-size: 20px;
	background-color: #0E7356;
	border-radius: 5px;
	text-align: center;
	cursor: pointer;
	float: right;
}

.movieSummary {
	display: -webkit-box;
	-webkit-line-clamp: 4;
	-webkit-box-orient: vertical;
	overflow: hidden;
	text-overflow: ellipsis;
	word-break: break-word;
}
</style>

<script type="text/javascript">
	window.onload = function() {
		var moviePriceList = document.getElementsByClassName("moviePrice");
		var totalRefundObj = document.getElementById("totalRefund");
		var totalPriceObj = document.getElementsByClassName("totalPrice")[0];
		var totalPrice = 0;

		for (var i = 0; i < moviePriceList.length; i++) {
			totalPrice += parseInt(moviePriceList[i].innerHTML);
			moviePriceList[i].innerHTML = moviePriceList[i].innerHTML + "원";
		}
		totalRefundObj.innerHTML = totalPrice + "원";
		totalPriceObj.value = totalPrice;
	}

	function refundFnc() {
		var FormObj = document.getElementById("form");
		
		if(confirm("환불하시겠습니까?") == true) {
			alert("환불되었습니다.");
			FormObj.submit();
		}
	}
	
	function cancelFnc() {
		location.href = "./history.do";
		
	}
</script>


</head>
<body>

	<jsp:include page="/WEB-INF/view/Header.jsp" />

	<div id="productWrap">
		<div>
			<h3>상품정보</h3>
		</div>

		<form action="./cancelCtr.do" method="post" id="form">
			<input type="hidden" name="orderHistoryNumber" value="${orderHistory[0].orderHistoryNumber}">
			
			<c:forEach items="${orderHistory}" var="orderHistory">
			
			<input type="hidden" name="movieNumber" value="${orderHistory.movieNumber}">

				<div id="productDetail">

					<div class="productImg">
						<a href="../movie/listOne.do?movieNumber=${orderHistory.movieNumber}">
							<img class="productPoster" src="${orderHistory.movieMainPoster}" />
						</a>
					</div>

					<div class="productName">
						<h4>${orderHistory.movieTitle}</h4>
						<br>
						<a class="movieSummary">${orderHistory.movieSummary}</a>
					</div>

					<div class="productOtherInfo">
						<h4>개봉일</h4>
						<p>
							<fmt:formatDate value="${orderHistory.movieReleaseDate}" pattern="yyyy.MM.dd" />
						</p>
						<div>
							<br>
						</div>
						<h4>상영시간</h4>
						<p>${orderHistory.movieRuntime}분</p>
					</div>

					<div class="productPrice">
						<h4>상품금액</h4>
						<p class="moviePrice">${orderHistory.moviePrice}</p>
					</div>

				</div>

			</c:forEach>
			
		</form>
		
	</div>




	<div id="cancelWrap">
		<h3>취소</h3>

		<div id="cancelDetail">

			<div id="cancelContent" class="cDetails">
				<h4>취소 내용</h4>
			</div>

			<div id="selectCancelReason" class="cDetails">
				<select name="reason">
					<option selected="selected" hidden="">선택</option>
					<option value="단순 변심">단순 변심</option>
					<option value="잘못 주문">잘못 주문</option>
					<option value="서비스 불만족">서비스 불만족</option>
				</select>
			</div>

			<div id="refundAmount" class="cDetails">
				<h4>환불 금액</h4>
			</div>
			<div id="totalRefund" class="cDetails"><a>0원</a></div>

		</div>
	</div>

	<div id="selectWrap">
		<div id="cancel" onclick="cancelFnc();"><a>취소하기</a></div>
		<div id="refund" onclick="refundFnc();"><a>환불하기</a></div>
	</div>


</body>
</html>