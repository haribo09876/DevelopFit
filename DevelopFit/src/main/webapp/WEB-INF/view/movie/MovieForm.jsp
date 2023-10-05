<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>영화 추가</title>
	<style>
		body {
			background-color: #101322;
			color: white;
		}
		#title {
			width: 266px;
			display: block;
			margin: 0 auto;
			text-align: center;
			margin-top: 30px;
		}
		div {
			display: block;
			margin: 0 auto;
		}
		input {
			font-size: 14px;
			color: white;
		}
		input::placeholder {
			color: white;
		}
		input:-webkit-autofill, input:-webkit-autofill:hover, input:-webkit-autofill:focus,
			input:-webkit-autofill:active {
			-webkit-text-fill-color: white;
			-webkit-box-shadow: 0 0 0px 1000px #172036 inset;
			transition: background-color 5000s ease-in-out 0s;
		}
		#contentsAreaDiv{
			width: 346px;
			display: block;
			margin: 0 auto;
		}
		#movieTitle{
			width: 346px;
			height: 40px;
			border: none;
			border-radius: 6px;
			background-color: #172036;
			margin-top: 30px;
			padding-left: 10px;
		}
		#movieSummary{
			width: 346px;
			height: 40px;
			border: none;
			border-radius: 6px;
			background-color: #172036;
			padding-left: 10px;
			margin-top: 20px;
		}
		#movieReleaseDate{
			width: 346px;
			height: 40px;
			border: none;
			border-radius: 6px;
			background-color: #172036;
			padding-left: 10px;
			margin-top: 20px;
		}
		#movieRuntime{
			width: 346px;
			height: 40px;
			border: none;
			border-radius: 6px;
			background-color: #172036;
			padding-left: 10px;
			margin-top: 20px;
		}
		#moviePrice{
			width: 346px;
			height: 40px;
			border: none;
			border-radius: 6px;
			background-color: #172036;
			padding-left: 10px;
			margin-top: 20px;
		}
		#moviePoster{
			width: 346px;
			height: 40px;
			border: none;
			border-radius: 6px;
			background-color: #172036;
			padding-left: 10px;
			margin-top: 20px;
		}
		#moviePreview{
			width: 346px;
			height: 40px;
			border: none;
			border-radius: 6px;
			background-color: #172036;
			padding-left: 10px;
			margin-top: 20px;
		}
		#genreNumber{
			width: 346px;
			height: 40px;
			color: white;
			border: none;
			border-radius: 6px;
			background-color: #172036;
			padding-left: 10px;
			margin-top: 20px;
		}
		#btnList{
			width: 346px;
			height: 30px;
			float: left;
		}
		#pageBack{
			width: 150px;
			height: 30px;
			margin-top: 20px;
			border-radius: 6px;
			border: 2px solid #F24141;
			background-color: #F24141;
			color: white;
			font-weight: bold;
			font-size: 14px;
			float: left;
			text-align: center;
			line-height: 30px;
			margin-left: 8px;
		}
		#pageBack:hover {
			opacity: .8;
		}
		#input-btn{
			width: 164px;
			height: 34px;
			border: 2px solid #0E7356;
			margin-top: 20px;
			text-align: center;
			margin-left: 20px;
			background-color: #0E7356;
			border-radius: 6px;
			font-weight: bold;
			font-size: 14px;
			color: white;
		}
		#input-btn:hover {
			opacity: .8;
		}
	</style>
	<script type="text/javascript">
		window.onload = function(){
			var movieTitle = document.getElementById('movieTitle');
			var movieSummary = document.getElementById('movieSummary');
			var movieReleaseDate = document.getElementById('movieReleaseDate');
			var movieRuntime = document.getElementById('movieRuntime');
			var moviePrice = document.getElementById('moviePrice');
			var moviePoster = document.getElementById('moviePoster');
			var moviePreview = document.getElementById('moviePreview');
			var genreNumber = document.getElementById('genreNumber');
		}
		
		function check() {
			var form = document.addMovie;
		
			if (movieTitle.value === '') {
				alert('영화제목을 입력해 주세요.');
				form.movieTitle.focus();
				return false;
			} else if (movieSummary.value === '') {
				alert('줄거리를 입력해 주세요.');
				form.movieSummary.focus();
				return false;
			} else if (movieReleaseDate.value === '') {
				alert('개봉일을 입력해 주세요.');
				form.movieReleaseDate.focus();
				return false;
			} else if (movieRuntime.value === '') {
				alert('상영시간을 입력해 주세요.');
				form.movieRuntime.focus();
				return false;
			} else if (moviePrice.value === '') {
				alert('가격을 입력해 주세요.');
				form.moviePrice.focus();
				return false;
			} else if (moviePoster.value === '') {
				alert('포스터를 입력해 주세요.');
				form.moviePoster.focus();
				return false;
			} else if (moviePreview.value === '') {
				alert('예고편을 입력해 주세요.');
				form.moviePreview.focus();
				return false;
			} else if (genreNumber.value === '') {
				alert('장르번호 입력해 주세요.');
				form.genreNumber.focus();
				return false;
			}
			form.submit();
		}
	</script>
</head>
<body>
	<jsp:include page="/WEB-INF/view/Header.jsp"/>
		<div id="contentsAreaDiv">
			<div id="title">
				<h3>영화 추가</h3>
			</div>
			<form action="./addCtr.do" method="post" name="addMovie" enctype="multipart/form-data">
				<input type='text' id="movieTitle" name='movieTitle' placeholder="영화제목" onfocus="this.placeholder=''" 
				onblur="this.placeholder='영화제목'"><br>
				<input type='text' id="movieSummary" name='movieSummary' placeholder="줄거리" onfocus="this.placeholder=''" 
				onblur="this.placeholder='줄거리'"><br>
				<input type='date' id="movieReleaseDate" name='movieReleaseDate' placeholder="개봉일" onfocus="this.placeholder=''" 
				onblur="this.placeholder='개봉일'"><br>
				<input type='number' id="movieRuntime" name='movieRuntime' placeholder="상영시간" onfocus="this.placeholder=''" 
				onblur="this.placeholder='상영시간'"><br>
				<input type='number' id="moviePrice" name='moviePrice' placeholder="가격" onfocus="this.placeholder=''" 
				onblur="this.placeholder='가격'"><br>
				<input type='text' 	id="moviePoster" name='moviePoster' placeholder="포스터" onfocus="this.placeholder=''" 
				onblur="this.placeholder='포스터'"><br>
				<input type='text' 	id="moviePreview" name='moviePreview' placeholder="예고편" onfocus="this.placeholder=''" 
				onblur="this.placeholder='예고편'"><br>
				<select name="genreNumber" id="genreNumber">
					<option value="" disabled selected hidden>영화 장르를 선택해주세요.</option>
					<option value="1">SF</option>
					<option value="2">공포</option>
					<option value="3">로맨스</option>
					<option value="4">멜로</option>
					<option value="5">뮤지컬</option>
					<option value="6">범죄</option>
					<option value="7">스릴러</option>
					<option value="8">스포츠</option>
					<option value="9">액션</option>
					<option value="10">음악</option>
					<option value="11">전쟁</option>
					<option value="12">코미디</option>
					<option value="13">판타지</option>
					<option value="14">미스터리</option>
					<option value="15">드라마</option>
					<option value="16">애니메이션</option>
				</select>
				<div id="btnList">
					<div id="pageBack">
						<a href='./list.do'>뒤로가기</a>
					</div>
					<input type="button" value="추가하기" id="input-btn" onclick="check();">
				</div>
			</form>
		</div>
	<jsp:include page="/WEB-INF/view/Footer.jsp" />
</body>
</html>