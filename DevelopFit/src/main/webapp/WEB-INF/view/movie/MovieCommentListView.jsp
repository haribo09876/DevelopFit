<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>영화 한줄평 목록</title>
	<style>
		body{
			background-color: #101322;
		}
		h3{
			color: #FFFFFF;
		}
		#contentsAreaDiv{
			width: 1000px;
			margin-top: 30px;
		  	position: absolute;
		  	left: 50%;
			transform: translateX(-50%);
		}
		#title{
			width: 300px;
			display: block;
			margin: 0 auto;
			text-align: center;
		}
		#movieListTable {
			background-color: #172036;
			color: white;
			text-align: center;
			margin-top: 30px;
			width: 1000px;
			border-radius: 6px;
			padding: 9px;
		}
		tr th td {
			border:1px solid black;
			color: white;
		}
		td{
			font-size: 14px;
			padding: 5px;
		}
		#movieListPoster {
			width: 100px;
		}
		#newWrite{
			width: 100px;
			height: 30px;
			margin-top: 20px;
			border: 1px solid #0E7356;
			background-color: #0E7356;
			font-size: 14px;
			line-height: 30px;
			text-align: center;
			border-radius: 6px;
			float: right;
		}
		#newWrite:hover {
			opacity: .8;
		}
	</style>
	<script type="text/javascript">
	</script>
</head>
<body>
	<jsp:include page="/WEB-INF/view/Header.jsp"/>
	
	<div id="contentsAreaDiv">
		<div id="title">
			<h3>영화 한줄평 목록</h3>
		</div>
		<table id="movieListTable">
			<tr>
				<th>한줄평 번호</th>
				<th>회원 아이디</th>
				<th>영화 번호</th>
				<th>영화 제목</th>
				<th>한줄평 내용</th>
				<c:if test="${movieDto.memberId eq 'admin1'}">
					<th>수정 및 삭제</th>
				</c:if>	
			</tr>

			<c:forEach var="movieDto" items="${movieCommentList}">
				<input type="hidden" name='movieNumber' value='${movieDto.movieNumber}'>
				<input type="hidden" name='movieNumber' value='${movieDto.lineReviewNumber}'>
				<tr>
					<td>
						<a href='./commentListOne.do?lineReviewNumber=${movieDto.lineReviewNumber}'>${movieDto.lineReviewNumber}</a>
					</td>
					<td>${movieDto.memberId}</td>
					<td>${movieDto.movieNumber}</td>
					<td>${movieDto.movieTitle}</td>
					<td>${movieDto.lineReviewContext}</td>
					<c:if test="${movieDto.memberId eq 'admin1'}">
						<td>
							<a href='./commentUpdate.do?lineReviewNumber=${movieDto.lineReviewNumber}'>&#128465 수정</a>
							<a href='./commentDelete.do?lineReviewNumber=${movieDto.lineReviewNumber}'>&#128465 삭제</a>
<!-- 							<button> id="modifyBtn" type="button">수정</button> -->
<!-- 							<button> id="deleteBtn" type="button">삭제</button> -->
						<td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
	
	
		<div id="newWrite"><a href='./commentAdd.do'>새 한줄평 등록</a></div>
	
		<jsp:include page="/WEB-INF/view/common/MoviePaging.jsp">
			<jsp:param value="${pagingMap}" name="pagingMap"/>
		</jsp:include>
	</div>
		<form action="./commentList.do" id='pagingForm' method="post">
			<input type="hidden" id='curPage' name='curPage' value="${pagingMap.movieCommentPaging.curPage}">
		</form>
		
	
	<jsp:include page="/WEB-INF/view/Footer.jsp" />
</body>
</html>