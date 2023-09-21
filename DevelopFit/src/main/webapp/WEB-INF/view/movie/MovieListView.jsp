<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>영화 목록</title>
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
		<h3>영화 목록</h3>
		<table id="movieListTable">
			<tr>
				<th>영화번호</th>
				<th>포스터</th>
				<th>영화명</th>
				<th>장르</th>
				<th>개봉일</th>
				<th>런타임</th>
				<th>가격</th>
			</tr>

			<c:forEach var="movieDto" items="${movieList}">
				<tr>
					<td>${movieDto.movieNumber}</td>
					<td>
						<img id="movieListPoster" alt="포스터" src="${movieDto.moviePoster}">			
					</td>
					<td>
						<a href='./listOne.do?movieNumber=${movieDto.movieNumber}'>${movieDto.movieTitle}</a>
					</td>
					<td>${movieDto.genreName}</td>
					<td>${movieDto.movieReleaseDate}</td>
					<td>${movieDto.movieRuntime} 분</td>
					<td>${movieDto.moviePrice} 원</td>
					<td>
						<a href='./update.do?movieNumber=${movieDto.movieNumber}'>&#128465 수정</a>
					</td>
					<td>
						<a href='./delete.do?movieNumber=${movieDto.movieNumber}'>&#128465 삭제</a>
					</td>
				</tr>
			</c:forEach>
		</table>

		<a href='./add.do'>새 영화 등록</a>
	
		<jsp:include page="/WEB-INF/view/common/MoviePaging.jsp">
			<jsp:param value="${pagingMap}" name="pagingMap"/>
		</jsp:include>
	
		<form action="./list.do" id='pagingForm' method="post">
			<input type="hidden" id='curPage' name='curPage' value="${pagingMap.moviePaging.curPage}">
		</form>
	</div>
	
<%-- 	<jsp:include page="/WEB-INF/view/Footer.jsp" /> --%>
</body>
</html>