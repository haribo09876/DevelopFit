<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>영화 한줄평 목록 (MovieCommentListView)</title>
	<style>
		body{
			background-color: #101322;
		}
		h3{
			color: #FFFFFF;
		}
		#contentsAreaDiv{
			width: 1250px;
			margin-top: 30px;
		  	position: absolute;
		  	left: 50%;
			transform: translateX(-50%);
		}
		#movieListTable {
			background-color: lightgray;
			color: black;
		}
		tr th td {
			border:1px solid black;
			color: black;
		}
		#movieListPoster {
			width: 100px;
		}
	</style>
	<script type="text/javascript">
	</script>
</head>
<body>
	<jsp:include page="/WEB-INF/view/Header.jsp"/>
	
	<div id="contentsAreaDiv">
		<h3>영화 한줄평 목록 (MovieCommentListView)</h3>
		<table id="movieListTable">
			<tr>
				<th>한줄평번호</th>
				<th>회원 아이디</th>
				<th>영화 제목</th>
				<th>한줄평 내용</th>
			</tr>

			<c:forEach var="movieCommentDto" items="${movieCommentList}">
				<tr>
					<td>
						<a href='./listOne.do?lineReviewNumber=${movieCommentDto.lineReviewNumber}'>${movieCommentDto.lineReviewNumber}</a>
					</td>
					<td>${movieCommentDto.memberId}</td>
					<td>${movieCommentDto.movieTitle}</td>
					<td>${movieCommentDto.lineReviewContext}</td>
					<td>
						<a href='./update.do?lineReviewNumber=${movieCommentDto.lineReviewNumber}'>&#128465 수정</a>
					</td>
					<td>
						<a href='./delete.do?lineReviewNumber=${movieCommentDto.lineReviewNumber}'>&#128465 삭제</a>
					</td>
				</tr>
			</c:forEach>
		</table>

		<a href='./add.do'>새 한줄평 등록</a>
	
		<jsp:include page="/WEB-INF/view/common/MoviePaging.jsp">
			<jsp:param value="${pagingMap}" name="pagingMap"/>
		</jsp:include>
	
		<form action="./list.do" id='pagingForm' method="post">
			<input type="hidden" id='curPage' name='curPage' value="${pagingMap.moviePaging.curPage}">
		</form>
	</div>
	<jsp:include page="/WEB-INF/view/Footer.jsp" />
</body>
</html>