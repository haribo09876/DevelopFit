<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>영화 한줄평 상세 (MovieListOneView)</title>
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
	
	<a href='./list.do'>&#128281 한줄평목록으로</a>
	<a href='./update.do?lineReviewNumber=${movieCommentDto.lineReviewNumber}'>&#128465 수정</a>
	<a href='./delete.do?lineReviewNumber=${movieCommentDto.lineReviewNumber}'>&#128465 삭제</a>
	
	
	<h3>영화 한줄평 상세 (MovieListOneView)</h3>
		<div id="thirdSectionDiv">
			<p>
				한줄평 번호 :	${movieCommentDto.lineReviewNumber}
			</p>
			<p>
				한줄평 내용 :	${movieCommentDto.lineReviewContext}
			</p>
			<p>
				회원 번호 :	${movieCommentDto.memberNumber}
			</p>
			<p>
				영화 번호 :	${movieCommentDto.movieNumber}
			</p>
		</div>
	

	<jsp:include page="/WEB-INF/view/Footer.jsp" />
</body>
</html>