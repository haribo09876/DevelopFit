<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>영화 추가 (MovieForm)</title>
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
	<script type="text/javascript">

	</script>
</head>
<body>
	<jsp:include page="/WEB-INF/view/Header.jsp"/>
				
		<div id="contentsAreaDiv">
			<h3>영화 추가 (MovieForm)</h3>
			<form action="./addCtr.do" method="post" enctype="multipart/form-data">
				영화제목 :		<input type='text' name='movieTitle'><br>
				줄거리 :			<input type='text' 	name='movieSummary'><br>
				개봉일 :			<input type='date' name='movieReleaseDate'><br>				
				상영시간 :		<input type='number' name='movieRuntime'><br>
				가격 :			<input type='number' name='moviePrice'><br>
				포스터 :			<input type='text' 	name='moviePoster'><br>
				예고편 :			<input type='text' 	name='moviePreview'><br>
				장르번호 :		<input type='number' name='genreNumber'><br>
				<a href='./list.do'>뒤로가기</a>
				<input type="submit" value="추가">
			</form>
		</div>
	
	<%-- 	<jsp:include page="/WEB-INF/view/Footer.jsp" /> --%>
</body>
</html>