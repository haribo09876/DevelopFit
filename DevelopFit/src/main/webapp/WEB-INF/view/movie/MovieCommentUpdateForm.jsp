<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>영화 한줄평 수정 (MovieCommentUpdateForm)</title>
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
			
	<h3>영화 한줄평 수정 (MovieCommentUpdateForm)</h3>	
	<form action='./commentUpdateCtr.do' method='post' enctype="multipart/form-data">
		<input type="hidden" name='lineReviewNumber' value='${movieDto.lineReviewNumber}'>
		한줄평 내용 :	<input type='text' name='lineReviewContext' value='${movieDto.lineReviewContext}'><br>
		회원 번호 :		<input type='number' name='memberNumber' value='${movieDto.memberNumber}'><br>
		영화 번호 : 	<input type='number' name='movieNumber' value='${movieDto.movieNumber}'><br>
		<input type='submit' value='저장하기'>
		<a href='./commentList.do'>&#128281 한줄평 목록으로</a>
		<a href='./commentDelete.do?lineReviewNumber=${movieDto.lineReviewNumber}'>&#128465 삭제하기</a>
	</form>

	<jsp:include page="/WEB-INF/view/Footer.jsp" />
</body>
</html>