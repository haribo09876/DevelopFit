<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>MovieUpdateForm</title>
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
		<h3>인셉션</h3>
		<img id="poster" alt="영화포스터" src="https://m.media-amazon.com/images/M/MV5BMjExMjkwNTQ0Nl5BMl5BanBnXkFtZTcwNTY0OTk1Mw@@._V1_.jpg" />
		<div id="firstSectionDiv">
			<p>영화명 : 인셉션</p>
			<p>장르 : 장르1, 장르2, 장르3</p>
			<p>관람가 : OO세 관람가</p>
			<p>개봉일 : 0000년 00월</p>
			<p>가격 : 00,000 원</p>
		</div>
		<div id="secondSectionDiv">
			<button class="firstButton">&#x1F44D  좋아요</button>
			<button class="firstButton">&#x2714  봤어요</button>
			<button class="firstButton">&#x1F517  공유하기</button><br>
			<button id="secondButton">장바구니추가</button>
			<button id="thirdButton">구매하기</button>			
		</div>
		
		<h3>영화내용</h3>
		<div id="thirdSectionDiv">
			<a>타인의 꿈에 들어가 생각을 훔치는 특수 보안요원 코브. 그를 이용해 라이벌 기업의 정보를 빼내고자 하는
					사이토는 코브에게 생각을 훔치는 것이 아닌, 생각을 심는 ‘인셉션’ 작전을 제안한다.
					성공 조건으로 국제적인 수배자가 되어있는 코브의 신분을 바꿔주겠다는 거부할 수 없는 제안을 하고,
					사랑하는 아이들에게 돌아가기 위해 그 제안을 받아들인다. 최강의 팀을 구성, 표적인 피셔에게 접근해서
					‘인셉션’ 작전을 실행하지만 예기치 못한 사건들과 마주하게 되는데…
					꿈 VS 현실
					시간, 규칙, 타이밍 모든 것이 완벽해야만 하는, 단 한 번도 성공한 적 없는 ‘인셉션’ 작전이 시작된다!
			</a>		
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
					<td>자체지수 : </td>
					<td>IMDB 지수 : </td>
					<td>로튼토마토 지수 : </td>
					<td>카카오영화 지수 : </td>
				</tr>
			</table>
		</div>
		
		<h3>출연진</h3>
		<div id="sixthSectionDiv">
			<p class="actor">레오나르도 디카프리오</p>
			<p class="actor">마리옹 꼬띠아르</p>
			<p class="actor">조셉 고든 레빗</p>
			<p class="actor">톰 하디</p>
			<p class="actor">킬리언 머피</p>
			<p class="actor">엘리엇 페이지</p>
			<p class="actor">와타나베 켄</p>
		</div>
		
		<h3>한줄평</h3>
		<div id="seventhSectionDiv">
			<a>타인의 꿈에 들어가 생각을 훔치는 특수 보안요원 코브. 그를 이용해 라이벌 기업의 정보를 빼내고자 하는
					사이토는 코브에게 생각을 훔치는 것이 아닌, 생각을 심는 ‘인셉션’ 작전을 제안한다.
			</a>
			<hr>
			<a>타인의 꿈에 들어가 생각을 훔치는 특수 보안요원 코브. 그를 이용해 라이벌 기업의 정보를 빼내고자 하는
					사이토는 코브에게 생각을 훔치는 것이 아닌, 생각을 심는 ‘인셉션’ 작전을 제안한다.
			</a>
			<hr>
			<a>타인의 꿈에 들어가 생각을 훔치는 특수 보안요원 코브. 그를 이용해 라이벌 기업의 정보를 빼내고자 하는
					사이토는 코브에게 생각을 훔치는 것이 아닌, 생각을 심는 ‘인셉션’ 작전을 제안한다.
			</a>
			<hr>
			<a>∨ 더보기</a>
			<hr>
		</div>
				
		
	</div>
		
	<jsp:include page="/WEB-INF/view/Footer.jsp" />
		
		
<!-- 	<form action='./updateCtr.do' method='post' enctype="multipart/form-data"> -->
<%-- 		<input type="hidden" name='no' value='${memberDto.no}'> 이름: <input --%>
<%-- 			type='text' name='name' value='${memberDto.name}'><br> --%>
<%-- 		이메일: <input type='text' name='email' value='${memberDto.email}'><br> --%>
<!-- 		비밀번호: <input type='password' name='password" value=' -->
<!-- 			' required="required"><br> 첨부파일: -->
<!-- 		<div id='fileContent'> -->
<!-- 			<div> -->
<%-- 				<c:choose> --%>
<%-- 					<c:when test="${empty fileList}"> --%>
<!-- 						<input type="hidden" id="fileIdx" name="fileIdx" value=""> -->
<!-- 						<input type="file" id="file0" name="file0" value=""> -->
<!-- 						<a href="#this" id="delete0" onclick="addFileFnc();">삭제</a> -->
<!-- 						<br> -->
<%-- 					</c:when> --%>
<%-- 					<c:otherwise> --%>
<%-- 						<c:forEach var="row" items="${fileList}" varStatus="obj"> --%>
<%-- 							<input type="hidden" id="fileIdx_${obj.index}" name="fileIdx" value="${row.IDX}"> --%>
<!-- 							<img alt="image not found" -->
<%-- 								src="<c:url value='/img/${row.STORED_FILE_NAME}'/>"> --%>
<!-- 							<br> -->
<%-- 							${row.ORIGINAL_FILE_NAME} --%>
<%-- 							<input type="file" id="file_${obj.index}" --%>
<%-- 								name="file_${obj.index}"> --%>
<%-- 								(${row.FILE_SIZE}kb) --%>
<%-- 								<a href="#this" id="delete_${obj.index}">삭제</a> --%>
<!-- 							<br> -->
<%-- 						</c:forEach> --%>
<%-- 					</c:otherwise> --%>
<%-- 				</c:choose> --%>
<!-- 			</div> -->
<!-- 		</div> -->

<!-- 		가입일: -->
<%-- 		<fmt:formatDate value="${requestScope.memberDto.createDate}" pattern="yyyy-MM-dd hh:mm" /><br> --%>
<!-- 		<input type="button" value='파일추가' onclick="addFileFnc();"> -->
<!-- 		<input type='submit' value='저장하기'> -->
<%-- 		<input type='button' value='삭제하기' onclick="pageMoveDeleteFnc(${memberDto.no});"> --%>
<!-- 		<input type='button' value='뒤로가기 구현해보자'> -->
<!-- 		<input type='button' value='회원목록으로' onclick="pageMoveListFnc();"> -->
<!-- 	</form> -->


</body>
</html>