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
		<img id="poster" alt="영화포스터" src="https://m.media-amazon.com/images/M/MV5BMjExMjkwNTQ0Nl5BMl5BanBnXkFtZTcwNTY0OTk1Mw@@._V1_.jpg" />
		<div id="firstSectionDiv">
			<input placeholder="영화명 : 인셉션">
			<input placeholder="장르 : 장르1, 장르2, 장르3">
			<input placeholder="관람가 : OO세 관람가">
			<input placeholder="개봉일 : 0000년 00월">
			<input placeholder="가격 : 00,000 원">
		</div>
		<div id="secondSectionDiv">

		</div>
		
		<h3>영화내용</h3>
		<div id="thirdSectionDiv">
			<input placeholder="타인의 꿈에 들어가 생각을 훔치는 특수 보안요원 코브. 그를 이용해 라이벌 기업의 정보를 빼내고자 하는
					사이토는 코브에게 생각을 훔치는 것이 아닌, 생각을 심는 ‘인셉션’ 작전을 제안한다.
					성공 조건으로 국제적인 수배자가 되어있는 코브의 신분을 바꿔주겠다는 거부할 수 없는 제안을 하고,
					사랑하는 아이들에게 돌아가기 위해 그 제안을 받아들인다. 최강의 팀을 구성, 표적인 피셔에게 접근해서
					‘인셉션’ 작전을 실행하지만 예기치 못한 사건들과 마주하게 되는데…
					꿈 VS 현실
					시간, 규칙, 타이밍 모든 것이 완벽해야만 하는, 단 한 번도 성공한 적 없는 ‘인셉션’ 작전이 시작된다!">
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
						<input placeholder="자체지수 : ">
					</td>
					<td>
						<input placeholder="IMDB 지수 : ">
					</td>
					<td>
						<input placeholder="로튼토마토 지수 : ">
					</td>
					<td>
						<input placeholder="카카오영화 지수 : ">					
					</td>
				</tr>
			</table>
		</div>
		
		<h3>출연진</h3>
		<div id="sixthSectionDiv">
			<input placeholder="레오나르도 디카프리오">
			<input placeholder="마리옹 꼬띠아르">
			<input placeholder="조셉 고든 레빗">
			<input placeholder="톰 하디">
			<input placeholder="킬리언 머피">
			<input placeholder="엘리엇 페이지">
			<input placeholder="와타나베 켄">
		</div>
		
		<h3>한줄평</h3>
		<div id="seventhSectionDiv">
			<input placeholder="한줄평1한줄평1한줄평1한줄평1한줄평1한줄평1한줄평1한줄평1한줄평1한줄평1한줄평1한줄평1한줄평1
												한줄평1한줄평1한줄평1한줄평1한줄평1한줄평1한줄평1한줄평1한줄평1한줄평1한줄평1한줄평1한줄평1">
			<hr>
			<input placeholder="한줄평2한줄평2한줄평2한줄평2한줄평2한줄평2한줄평2한줄평2한줄평2한줄평2한줄평2한줄평2한줄평2
												한줄평2한줄평2한줄평2한줄평2한줄평2한줄평2한줄평2한줄평2한줄평2한줄평2한줄평2한줄평2한줄평2">
			<hr>
			<input placeholder="한줄평3한줄평3한줄평3한줄평3한줄평3한줄평3한줄평3한줄평3한줄평3한줄평3한줄평3한줄평3한줄평3
												한줄평3한줄평3한줄평3한줄평3한줄평3한줄평3한줄평3한줄평3한줄평3한줄평3한줄평3한줄평3한줄평3">
			<hr>
			<a>∨ 더보기</a>
			<hr>
		</div>
				
		
	</div>
	
	<jsp:include page="/WEB-INF/view/Footer.jsp" />

<!-- 	<form action='./addCtr.do' method='post' enctype="multipart/form-data"> -->
<!-- 		이름:			<input type='text' name='name'><br>  -->
<!-- 		이메일:		<input type='text' name='email'><br>  -->
<!-- 		암호:			<input type='password' 	name='password'><br> -->
<!-- 		파일:			<input type="file" name='file'><br> -->
<!-- 						<input type='submit' value='추가'> -->
<!-- 						<input type="button" value='뒤로가기' onclick="pageMoveListFnc();"> -->
<!-- 	</form> -->
</body>
</html>