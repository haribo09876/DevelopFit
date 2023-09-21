<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 성공</title>

<script type="text/javascript" src="/DevelopFit/resources/css/orderSuccess.js"></script>
<link href="/DevelopFit/resources/css/orderSuccess.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">

</script>

</head>
<body>
	
	<jsp:include page="/WEB-INF/view/Header.jsp"/>
	
	<div id="orderWrap">
		<div id="orderInfo">
			<h1>주문완료</h1>
		</div>
		<div id="orderDetail">
			<img />
				<c:forEach var="orderHistory" items="${orderHistory}">
			<div>
				${orderHistory.movieTitle}
			</div>
				</c:forEach>
		</div>
	</div>
	
	
	
	
	
	
	
	<div id="selectWrap">
		<div id="goOrderDetail">주문내역으로 이동</div>
		<div id="orderCancel">주문 취소</div>
	</div>
	
	
	
	
</body>
</html>