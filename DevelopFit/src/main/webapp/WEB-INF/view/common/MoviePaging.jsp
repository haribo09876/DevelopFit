<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
	<script type="text/javascript" src="/DevelopFit/resources/js/jquery-3.7.1.js">
	</script>
	<script type="text/javascript">
		function goPage(pageNumber) {
			var curPageObj = $("#curPage");
			curPageObj.val(pageNumber);
			var pagingFormObj = $('#pagingForm');
			pagingFormObj.submit();
		}
	</script>
<style type="text/css">
/* 	.page_wrap { */
/* 		text-align:center; */
/* 		font-size:0; */
/* 	 } */
/* 	.page_nation { */
/* 		display:inline-block; */
/* 	} */
/* 	.page_nation .none { */
/* 		display:none; */
/* 	} */
/* 	.page_nation a { */
/* 		display:block; */
/* 		margin:0 3px; */
/* 		float:left; */
/* 		border:1px solid #e6e6e6; */
/* 		width:28px; */
/* 		height:28px; */
/* 		line-height:28px; */
/* 		text-align:center; */
/* 		background-color:#fff; */
/* 		font-size:13px; */
/* 		color:#999999; */
/* 		text-decoration:none; */
/* 	} */
/* 	.page_nation .arrow { */
/* 		border:1px solid #ccc; */
/* 	} */
/* 	.page_nation .pprev { */
/* 		background:#f8f8f8 url('img/page_pprev.png') no-repeat center center; */
/* 		margin-left:0; */
/* 	} */
/* 	.page_nation .prev { */
/* 		background:#f8f8f8 url('img/page_prev.png') no-repeat center center; */
/* 		margin-right:7px; */
/* 	} */
/* 	.page_nation .next { */
/* 		background:#f8f8f8 url('img/page_next.png') no-repeat center center; */
/* 		margin-left:7px; */
/* 	} */
/* 	.page_nation .nnext { */
/* 		background:#f8f8f8 url('img/page_nnext.png') no-repeat center center; */
/* 		margin-right:0; */
/* 	} */
/* 	.page_nation a.active { */
/* 		background-color:#42454c; */
/* 		color:#fff; */
/* 		border:1px solid #42454c; */
/* 	} */
   
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
	<nav class='jqueryTest'>
<!-- 		<div class="page_wrap"> -->
<!-- 			<div class="page_nation"> -->
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
							<a href="#" onclick="goPage(${num});">${num}</a>
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
<!-- 			</div> -->
<!-- 		</div> -->
	</nav>