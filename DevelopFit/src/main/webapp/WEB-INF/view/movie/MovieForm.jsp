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
		
	<form action="">
		<div id="contentsAreaDiv">
			<h3>영화 추가 (MovieForm)</h3>
			<img id="poster" alt="영화포스터" src="https://m.media-amazon.com/images/M/MV5BMjExMjkwNTQ0Nl5BMl5BanBnXkFtZTcwNTY0OTk1Mw@@._V1_.jpg" />
			<div id="firstSectionDiv">
				<input placeholder="영화명"><br>
				<input placeholder="장르"><br>
				<input placeholder="관람가"><br>
				<input placeholder="개봉일"><br>
				<input placeholder="가격">
			</div>
			
			<div id="secondSectionDiv">

			</div>
		
			<h3>영화내용</h3>
			<div id="thirdSectionDiv">
				<input placeholder="영화내용~~~">
			</div>
		
			<h3>예고편</h3>
			<div id="fourthSectionDiv">
				<iframe width="560" height="315" src="https://www.youtube.com/embed/GuW4X4Gwq2w?si=BfKvaQolvbm6BSgu"
					frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen style="position: absolute; width:100%; height:100%;"></iframe>
			</div>
		
			<h3>지수</h3>
			<div id="fifthSectionDiv">
				<table id="ratingTable">
					<tr>
						<td>
							<input placeholder="자체지수">
						</td>
						<td>
							<input placeholder="IMDB 지수">
						</td>
						<td>
							<input placeholder="로튼토마토 지수">
						</td>
						<td>
							<input placeholder="카카오영화 지수">					
						</td>
					</tr>
				</table>
			</div>
			
			<h3>출연진</h3>
			<div id="sixthSectionDiv">
				<input placeholder="배우명1"><br>
				<input placeholder="배우명2"><br>
				<input placeholder="배우명3"><br>
				<input placeholder="배우명4"><br>
				<input placeholder="배우명5"><br>
				<input placeholder="배우명6"><br>
				<input placeholder="배우명7">
			</div>
			
			<h3>한줄평</h3>
			<div id="seventhSectionDiv">
				<input placeholder="한줄평1내용~~~">
				<hr>
				<input placeholder="한줄평2내용~~~">
				<hr>
				<input placeholder="한줄평3내용~~~">
				<hr>
				<a>∨ 더보기</a>
				<hr>
			</div>
		</div>
	</form>
	
	<%-- 	<jsp:include page="/WEB-INF/view/Footer.jsp" /> --%>
</body>
</html>