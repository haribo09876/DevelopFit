<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 주문 내역</title>
<style type="text/css">
body {
	background-color: #101322;
	color: white;
}

#historyWrap {
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
	margin: 0px 10px 10px 10px;
	float: left;
	display: inline-block;
	/*    line-height: 150px; */
	text-align: center;
}

.productOtherInfo {
	width: 100px;
	height: 125px;
	margin: 0px 10px 10px 10px;
	padding-top: 25px;
	text-align: center;
	display: inline-block;
	float: left;
}

.productPrice {
	width: 100px;
	height: 90px;
	margin: 0px 10px 10px 10px;
	padding-top: 60px;
	float: left;
	text-align: center;
	vertical-align: middle;
	display: inline-block;
	float: left;
}

.orderTime {
	width: 70px;
	height: 90px;
	margin: 0px 10px 10px 10px;
	padding-top: 50px;
	float: left;
	text-align: center;
	vertical-align: middle;
	display: inline-block;
}

.refund {
	width: 64px;
	cursor: pointer;
	margin-left: 370px;
	text-align: right;
	display: inline-block;
	float: right;
}

.confirmed {
	width: 64px;
	margin-left: 370px;
	text-align: right;
	display: inline-block;
	float: right;
}

.orderNumberWrap {
	width: 900px;
}

.orderNumber {
	width: auto;
	display: inline-block;
}

.orderUnit {
	background-color: #172036;
	height: auto;
	margin-bottom: 40px;
	margin-top: 10px;
	border-radius: 13px;
}

.info {
	float: left;
	margin-right: 15px;
}

#orderEmpty {
	padding: 60px 0px 0px 300px;
}

#searchId {
	width: 205px;
	height: 25px;
	display: inline-block;
 	float: right;
 	background-color: white;
 	border-radius: 5px;
}

#searchId > input{
	display: inline-block;
	height: 20px;
	border: 0px;
}

#searchId > button{
	display: inline-block;
	float: right;
}

#historyText {
	display: inline-block;
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
</style>

<script type="text/javascript">
	function searchBtnFnc() {
		
	}
</script>

</head>
<body>

	<!--    헤더 -->
	<jsp:include page="/WEB-INF/view/Header.jsp" />
	
	<c:if test="${sessionScope.member.memberNumber == 0}">
		<jsp:include page="/WEB-INF/view/adminHeader.jsp" />
	</c:if>
	
	<c:choose>
		<c:when test="${empty historyList2d}">
			<div id="historyWrap">
				<h3>주문내역</h3>
				
				<div class="orderNumberWrap">
					<div class="orderUnit">
						<div class="productDetail">
							<h4 id="orderEmpty">주문 내역이 없습니다.</h4>
						</div>
					</div>
				</div>
			</div>
		</c:when>

		<c:otherwise>
			<div id="historyWrap">
				<h3 id="historyText">주문내역</h3>
				<br>
<!-- 				<div id="searchId"> -->
<!-- 					<input type="text" placeholder="&nbsp;&nbsp;ID입력" value=""/> -->
<!-- 					<button type="button" id="searchBtn" onclick="searchBtnFnc();">&#128269</button> -->
<!-- 				</div> -->
				<br>
				<c:forEach var="historyList1d" items="${historyList2d}"
					varStatus="varStatus">
					<div class="orderNumberWrap">
						<div class="orderNumber">
							<h4 class="info">주문번호 ${historyList1d[0].orderHistoryNumber}</h4>
							<h4 class="info">회원번호 ${historyList1d[0].memberNumber}</h4>
							<h4 class="info">회원ID ${historyList1d[0].memberId}</h4>
						</div>

						<!-- 환불날짜 계산 -->
						<c:set var="now" value="<%=new java.util.Date()%>" />
						<fmt:parseNumber var="today" value="${now.time}" />
						<fmt:parseNumber var="weekAfterPurchase"
							value="${historyList1d[0].orderHistoryTime.time + (1000*60*60*24*7)}" />

						<!-- 7일 이내시 환불버튼 -->
						<c:if
							test="${weekAfterPurchase > today and historyList1d[0].orderHistoryState eq 'N'}">
							<div class="refund"
								onclick="location.href='./cancel.do?orderNumber=${historyList1d[0].orderHistoryNumber}'">
								<a>환불하기</a>
							</div>
						</c:if>

						<!-- 구매 확정 -->
						<c:if
							test="${weekAfterPurchase < today and historyList1d[0].orderHistoryState eq 'Y'}">
							<div class="confirmed">
								<a>구매확정</a>
							</div>
						</c:if>

						<!-- 환불 완료 -->
						<c:if test="${historyList1d[0].orderHistoryState eq 'R'}">
							<div class="confirmed">
								<a>환불완료</a>
							</div>
						</c:if>
					</div>

					<div class="orderUnit">
						<c:forEach var="historyList" items="${historyList1d}"
							varStatus="status">
							<div class="productDetail">
								<div class="productImg">
									<a
										href="../movie/listOne.do?movieNumber=${historyList.movieNumber}">
										<img class="productPoster"
										src="${historyList.movieMainPoster}" />
									</a>
								</div>

								<div class="productName">
									<h3>${historyList.movieTitle}</h3>
									<br>
									<a class="movieSummary">${historyList.movieSummary}</a>
								</div>

								<div class="productOtherInfo">
									<h4>개봉일</h4>
									<p>
										<fmt:formatDate value="${historyList.movieReleaseDate}"
											pattern="yyyy.MM.dd" />
									</p>
									<div>
										<br>
									</div>
									<h4>상영시간</h4>
									<p>${historyList.movieRuntime}분</p>
								</div>

								<div class="productPrice">
									<h4>상품금액</h4>
									<p>${historyList.moviePrice}원</p>
								</div>

								<div class="orderTime">
									<h4>주문일시</h4>
									<p>
										<fmt:formatDate value="${historyList.orderHistoryTime}"
											pattern="yyyy.MM.dd HH:mm:ss" />
									</p>
								</div>
							</div>

							<c:if test="${!status.last}">
								<hr style="border: 1px dashed #3F485E">
							</c:if>
						</c:forEach>
					</div>

				</c:forEach>

			</div>

			<div id="pagingwrap">
				<jsp:include page="/WEB-INF/view/common/OrderHistoryPaging.jsp">
					<jsp:param value="${pagingMap}" name="pagingMap" />
				</jsp:include>

				<form action="./history.do" id='pagingForm' method="post">
					<input type="hidden" id='curPage' name='curPage'
						value="${pagingMap.orderHistoryPaging.curPage}">
				</form>
			</div>
		</c:otherwise>
	</c:choose>




	<%-- 	<jsp:include page="/WEB-INF/view/Footer.jsp"/> --%>
</body>
</html>