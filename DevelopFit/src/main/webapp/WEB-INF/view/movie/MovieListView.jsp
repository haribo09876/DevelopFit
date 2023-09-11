<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>MovieListView</title>
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
		}
		tr th td {
			border:1px solid black;
			background-color: #FFFFFF;
		}
	
	</style>

</head>

<body>
	<jsp:include page="/WEB-INF/view/Header.jsp"/>

	
	<div id="contentsAreaDiv">
		<h3>영화목록 (MovieListView)</h3>
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
					<td>${movieDto.moviePoster}</td>
					<td>
						<a href='./listOne.do?no=${movieDto.movieNumber}'>${movieDto.movieTitle}</a>
					</td>
					<td>장르</td>
					<td>${movieDto.movieRuntime}</td>
					<td>${movieDto.moviePrice}</td>
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

<!-- 	<p> -->
<!-- 		<a href='./add.do'>신규 영화</a> -->
<!-- 	</p> -->

<!-- 	<p> -->
<%-- 		<a href='./delete.do?no=${movieDto.no}'>[삭제]</a> --%>
<!-- 	</p> -->
	</div>
</body>
</html>