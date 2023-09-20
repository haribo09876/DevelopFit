<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>영화 상세 (MovieListOneView)</title>
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
	
	<a href='./list.do'>&#128281 영화목록으로</a>
	<a href='./update.do?movieNumber=${movieDto.movieNumber}'>&#128465 수정</a>
	<a href='./delete.do?movieNumber=${movieDto.movieNumber}'>&#128465 삭제</a>
	
	<div id="contentsAreaDiv">
		<h3>영화 상세 (MovieListOneView)</h3>
		<img id="poster" alt="영화포스터" src="${movieDto.moviePoster}" />
		<div id="firstSectionDiv">
			<p>영화명 : ${movieDto.movieTitle}</p>
			<p>장르 : ${movieDto.genreName}</p>
			<p>개봉일 : ${movieDto.movieReleaseDate}</p>
			<p>상영시간 : ${movieDto.movieRuntime}분</p>
			<p>관람가 : 00세 관람가</p>
			<p>가격 : ${movieDto.moviePrice} 원</p>
			<p>!!! 한줄평 테스트 위치 !!! : ${movieDto.lineReviewContext}</p>
		</div>
		<div id="secondSectionDiv">
			<button class="firstButton">&#x1F44D  좋아요</button>
			<button class="firstButton">&#x2714  봤어요</button>
			<button class="firstButton">&#x1F517  공유하기</button><br>
			<button id="secondButton">&#128722 장바구니추가</button>
			<button id="thirdButton">&#127916 구매하기</button>			
		</div>

		<h3>영화내용</h3>
		<div id="thirdSectionDiv">
			<p>
				${movieDto.movieSummary}
			</p>
		</div>
		
		<h3>예고편</h3>
		<div id="fourthSectionDiv">
			<iframe width="560" height="315" src="${movieDto.moviePreview}"
				frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
				allowfullscreen style="position: absolute; width:100%; height:100%;"></iframe>
		</div>
		
		<h3>지수</h3>
		<div id="fifthSectionDiv">
			<table id="ratingTable">
				<tr>
					<td>자체지수 : </td>
					<td>IMDB 지수 : </td>
					<td>로튼토마토 지수 : </td>
					<td>카카오영화 지수 : </td>
				</tr>
			</table>
		</div>
		
		<h3>출연진</h3>
		<div id="sixthSectionDiv">
			<p class="actor">배우1</p>
			<p class="actor">배우2</p>
			<p class="actor">배우3</p>
			<p class="actor">배우4</p>
			<p class="actor">배우5</p>
			<p class="actor">배우6</p>
			<p class="actor">배우7</p>
		</div>

		<h3>한줄평 (MovieCommentList)</h3>
		<c:forEach var="movieDto" items="${movieCommentList}">
			<input type="hidden" name='movieNumber' value='${movieDto.movieNumber}'>
   			<input type="hidden" name='lineReviewNumber' value='${movieDto.lineReviewNumber}'>		
			<p>회원 아이디 : ${movieDto.memberId}</p>
			<p>한줄평 내용 : ${movieDto.lineReviewContext}</p>
			<a href='./commentUpdate.do?lineReviewNumber=${movieDto.lineReviewNumber}'>&#128465 수정</a>
			<a href='./commentDelete.do?lineReviewNumber=${movieDto.lineReviewNumber}'>&#128465 삭제</a>
		</c:forEach>

		<a href='./commentAdd.do'>새 한줄평 등록</a>
	
<<<<<<< HEAD
		<jsp:include page="/WEB-INF/view/common/MovieCommentPaging.jsp">
			<jsp:param value="${pagingMap}" name="pagingMap"/>
		</jsp:include>
	
		<form action="./list.do" id='pagingForm' method="post">
			<input type="hidden" id='curPage' name='curPage' value="${pagingMap.movieCommentPaging.curPage}">
		</form>
=======
			<a href='./commentAdd.do'>새 한줄평 등록</a>
		
<%-- 			<jsp:include page="/WEB-INF/view/common/MovieCommentPaging.jsp"> --%>
				<jsp:param value="${pagingMap}" name="pagingMap"/>
			</jsp:include>
		
			<form action="./list.do" id='pagingForm' method="post">
				<input type="hidden" id='curPage' name='curPage' value="${pagingMap.movieCommentPaging.curPage}">
			</form>
>>>>>>> branch 'main' of https://github.com/haribo09876/DevelopFit.git
	</div>
	
	<jsp:include page="/WEB-INF/view/Footer.jsp" />
</body>
</html>