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
			color: #FFFFFF;
		}
		table tr th td {
		    border-collapse: collapse;
		    border-width: 0;
		    border-style: solid;
		}
		.sectionTitle{
			color: #FFFFFF;
			font-size: 20px;
			font-weight: bold;
		}
		.cardTable {
		    min-width: 100%;
			table-layout: fixed;
			background-color: #172036;
			border-radius: 6px;
			padding: 9px;
		}
		.tableHead {
 			background-color: #172036;
    		color: #9ca3af;
		}
		.tableGroup {
		    border-top-width: 1px;
			border-color: #172036;
			background-color: #172036;
			text-align: center;
		}
		.movieTitle{
			color: #D1D5DB;
		}
		.swiperPoster{
			width: 300px;
			margin-top: 100px;
			margin-left: 42%;
		}
		.listPoster{
			width: 50px;
		}
		#contentsAreaDiv{
			width: 1250px;
			margin-top: 30px;
		  	position: absolute;
		  	left: 50%;
			transform: translateX(-50%);
		}
		#newMovie{
			width: 100px;
			height: 30px;
			text-align: center;
			line-height: 30px;
			border-radius: 6px;
			border: 1px solid #0E7356;
			background-color: #0E7356;
			float: right;
			font-size: 14px;
		}
	</style>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js">

	</script>
</head>
<body>
	<jsp:include page="/WEB-INF/view/Header.jsp"/><br><br><br>

	<div id="contentsAreaDiv">
		<a class="sectionTitle">영화 목록</a>
		<br>
		<br>
		<table class="cardTable">
			<thead>
				<tr class="tableHead">
					<th>포스터</th>
					<th>영화명</th>
					<th>장르</th>
					<th>개봉일</th>
					<th>런타임</th>
					<th>가격</th>
				</tr>
			</thead>

			<c:forEach var="movieDto" items="${movieList}">
				<tr class="tableGroup">
					<td>
						<a href='./listOne.do?movieNumber=${movieDto.movieNumber}'>
							<c:choose>
								<c:when test="${not empty movieDto.moviePoster}" >
									<img class="listPoster" alt="영화포스터" src="${movieDto.moviePoster}" />
								</c:when>
								<c:otherwise>
									<img class="listPoster" alt="영화포스터" src="http://www.myeongin.net/app/dubu_board/docs/imgs/d/d16124045780126_%EC%9D%B4%EB%AF%B8%EC%A7%80%EC%A4%80%EB%B9%84%EC%A4%91.jpg" />
								</c:otherwise>
							</c:choose>	
						</a>
					</td>
					<td>
						<div class=movieTitle>
							<a href='./listOne.do?movieNumber=${movieDto.movieNumber}'>${movieDto.movieTitle}</a>
						</div>
					</td>
					<td>${movieDto.genreName}</td>
					<td>${movieDto.movieReleaseDate}</td>
					<td>${movieDto.movieRuntime} 분</td>
					<td>${movieDto.moviePrice} 원</td>
				</tr>
			</c:forEach>
		</table>
		<br>
		<div>
			<jsp:include page="/WEB-INF/view/common/MoviePaging.jsp">
				<jsp:param value="${pagingMap}" name="pagingMap"/>
			</jsp:include>
		
			<form action="./list.do" id='pagingForm' method="post">
				<input type="hidden" id='curPage' name='curPage' value="${pagingMap.moviePaging.curPage}">
			</form>
		</div>
		
	</div>
	
<%-- 	<jsp:include page="/WEB-INF/view/Footer.jsp" /> --%>
</body>
</html>