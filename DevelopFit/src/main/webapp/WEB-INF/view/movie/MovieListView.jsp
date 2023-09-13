<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>영화 목록 (MovieListView)</title>
	<script type="text/javascript">

	</script>
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
			background-color: #FFFFFF;
			color: black;
		}
		tr th td {
			border:1px solid black;
			background-color: #FFFFFF;
			color: black;
		}
		#movieListPoster {
			width: 100px;
		}
	
	</style>

</head>

<body>
	<jsp:include page="/WEB-INF/view/Header.jsp"/>

	
	<div id="contentsAreaDiv">
		<h3>영화 목록 (MovieListView)</h3>
		<table id="movieListTable">
			<tr>
				<th>영화번호</th>
				<th>포스터</th>
				<th>영화명</th>
				<th>장르</th>
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
						<a href='./listOne.do?no=${movieDto.movieNumber}'>${movieDto.movieTitle}</a>
					</td>
					<td>${movieDto.genreNumber}</td>
					<td>${movieDto.movieRuntime} 분</td>
					<td>${movieDto.moviePrice} 원</td>
					<td>
						<button onclick="">&#128398 등록</button>
					</td>
					<td>
						<button onclick="">&#128393 수정</button>
					</td>
					<td>
						<button onclick="">&#128465 삭제</button>
					</td>
				</tr>
			</c:forEach>
		</table>
	
		<jsp:include page="/WEB-INF/view/common/Paging.jsp">
			<jsp:param value="${pagingMap}" name="pagingMap"/>
		</jsp:include>
	
		<form action="./list.do" id='pagingForm' method="post">
			<input type="hidden" id='curPage' name='curPage'
				value="${pagingMap.moviePaging.curPage}">
		</form>
		
	<jsp:include page="/WEB-INF/view/Footer.jsp" />

<!-- 	<p> -->
<!-- 		<a href='./add.do'>신규 영화</a> -->
<!-- 	</p> -->

<!-- 	<p> -->
<%-- 		<a href='./delete.do?no=${movieDto.no}'>[삭제]</a> --%>
<!-- 	</p> -->
	</div>
</body>
</html>