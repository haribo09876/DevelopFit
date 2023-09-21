<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>영화 수정</title>
	<style>
		body{
			background-color: #101322;
		}
		h3{
			margin-top: 25px;
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
		#poster{
			width: 350px;
			margin: 30px;
		}
		#ratingTable {
			background-color: #FFFFFF;
		}
		table tr th td {
			border:1px solid black;
			background-color: #FFFFFF;
		}
		#firstSectionDiv {
			padding : 30px;
			float: right;
			color: #FFFFFF;
		}
		#secondSectionDiv {
			padding : 30px;
			float: right;
			color: #FFFFFF;
		}
		#thirdSectionDiv {
			padding : 30px;
			color: #FFFFFF;
		}
		#fourthSectionDiv {
			position: relative;
			height:0;
			padding : 30px;
			padding-bottom: 56.25%;
		}
		#fifthSectionDiv {
			padding : 30px;
		}
		#sixthSectionDiv {
			padding : 30px;
			color: #FFFFFF;
		}
		#seventhSectionDiv {
			padding : 30px;
			color: #FFFFFF;
		}
		.actor{
			color: #FFFFFF;
		}	
		.firstButton {
			width: 160px;
			height: 40px;
			margin-bottom: 10px;
			border-radius: 8px;
		}
		#secondButton {
			width: 243px;
			height: 40px;
			border-radius: 8px;
		}
		#thirdButton {
			width: 243px;
			height: 40px;
			background-color: #0E7356;
			border-radius: 8px;
			color: #FFFFFF;
		}
	</style>	
	<script type="text/javascript" src="/SpringHome/resources/js/jquery-3.7.1.js">
	</script>
	<script type="text/javascript">
	</script>
</head>
<body>
	<jsp:include page="/WEB-INF/view/Header.jsp"/>
			
	<h3>영화 수정</h3>	
	<form action='./updateCtr.do' method='post' enctype="multipart/form-data">
		<input type="hidden" name='movieNumber' value='${movieDto.movieNumber}'>
		영화제목 :	<input type='text' name='movieTitle' value='${movieDto.movieTitle}'><br>
		줄거리 :		<input type='text' name='movieSummary' value='${movieDto.movieSummary}'><br>
		개봉일 :		<input type='date' name='movieReleaseDate' value='${movieDto.movieReleaseDate}'><br>
		상영시간 :	<input type='number' name='movieRuntime' value='${movieDto.movieRuntime}'><br>
		가격 :		<input type='number' name='moviePrice' value='${movieDto.moviePrice}'><br>
		포스터 :		<input type='text' name='moviePoster' value='${movieDto.moviePoster}'><br>
		예고편 :		<input type='text' name='moviePreview' value='${movieDto.moviePreview}'><br>

		<input type='submit' value='저장하기'>
		<a href='./list.do'>&#128281 회원목록으로</a>
		<a href='./delete.do?movieNumber=${movieDto.movieNumber}'>&#128465 삭제하기</a>
	</form>

	<jsp:include page="/WEB-INF/view/Footer.jsp" />
</body>
</html>