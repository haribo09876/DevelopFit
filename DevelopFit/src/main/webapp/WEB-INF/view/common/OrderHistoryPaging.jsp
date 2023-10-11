<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script type="text/javascript" src="/DevelopFit/resources/js/jquery-3.7.1.js"></script>

<!DOCTYPE html>
<style type="text/css">
nav>ul {
	list-style-type: none;
	padding: 0;
	overflow: hidden;
	background-color: #131826;
	display: table;
	margin: 10px auto;
}

nav>ul>li {
	float: left;
	width: 40px;
 	display: white;
 	line-height: 40px;
}

nav>ul>li>a {
	display: block;
	text-align: center;
	text-decoration: none;
	width: 40px;
	color: white;
}

nav>ul>li>a:hover {
	color: #FFD9EC;
	background-color: #5D5D5D;
	font-weight: bold;
}
</style>


<script type="text/javascript">
		function goPage(pageNumber) {
			var curPageObj = $("#curPage");
			curPageObj.val(pageNumber);
			var pagingFormObj = $('#pagingForm');
			pagingFormObj.submit();
		}
</script>


</head>
<body>


	<nav class='jqueryTest'>
		<ul>
			<c:if test="${pagingMap.orderHistoryPaging.prevBlock ne 1}">
				<li>
					<a href="#" onclick="goPage(${pagingMap.orderHistoryPaging.prevBlock});">
						<span>＜</span>
					</a>
				</li>
			</c:if>

			<c:forEach var="num" begin="${pagingMap.orderHistoryPaging.blockBegin}"
				end="${pagingMap.orderHistoryPaging.blockEnd}">
				<li>
					<a href="#" onclick="goPage(${num});">${num}</a>
				</li>
			</c:forEach>

			<c:if test="${pagingMap.orderHistoryPaging.curBlock < pagingMap.orderHistoryPaging.totBlock}">
				<li>
					<a href="#" onclick="goPage(${pagingMap.orderHistoryPaging.nextBlock});">
						<span>＞</span>
					</a>
				</li>
			</c:if>
		</ul>
	</nav>




</body>
