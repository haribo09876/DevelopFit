<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>

<script type="text/javascript" 
	src="/DevelopFit/resources/js/jquery-3.7.1.js"></script>

	<style type="text/css">
		nav>ul {
			list-style-type: none;
			padding: 0;
			overflow: hidden;
			background-color: #FFFFFF;
			/*     width: 1000px; */ /* 넓이를 주면 고정  */
			display: table; /* table을 주면  요소의 내용에 맞게 자동으로 크기 */
			margin-left: auto;
			margin-right: auto;
		}
		
		nav>ul>li {
			float: left;
		}
		
		nav>ul>li>a {
			display: block;
			color: black;
			text-align: center;
			padding: 1px;
			text-decoration: none;
			width: 30px;
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

	<nav class='jqueryTest'>
		<ul>		
			<c:if test="${pagingMap.moviePaging.prevBlock ne 1}">
			<li>
				<a href="#" onclick="goPage(${pagingMap.moviePaging.prevBlock});">
					<span>≪</span>
				</a>
			</li>
			</c:if>

			<c:forEach var="num" begin="${pagingMap.moviePaging.blockBegin}"
				end="${pagingMap.moviePaging.blockEnd}" >
				<li>
					<a href="#" onclick="goPage(${num})">${num}</a>
				</li>
			</c:forEach>
			
			<c:if
				test="${pagingMap.moviePaging.curBlock < pagingMap.moviePaging.totBlock}">
			<li>
				<a href="#" onclick="goPage(${pagingMap.moviePaging.nextBlock});">
					<span>≫</span>
				</a>
			</li>
			</c:if>
		</ul>
	</nav>