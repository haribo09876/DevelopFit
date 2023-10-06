<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>영화 상세</title>
   <style>
      body{
         background-color: #101322;
      }
      h3{
         margin-top: 25px;
         color: #FFFFFF;
      }
      p{
         margin-bottom: 10px;
      }
      #btnList{
         width: 1100px;
         display: block;
         margin: 0 auto;
      }
      #movieUpdate{
         margin-left: 10px;
      }
      #movieDelete{
         margin-left: 10px;
      }
      #contentsAreaDiv{
         width: 1100px;
         display: block;
         margin: 0 auto;
         margin-top: 30px;
           position: absolute;
           left: 50%;
         transform: translateX(-50%);
      }
      #movieListTable {
         width: 1100px;
         background-color: #172036;
         text-align: center;
         color: white;
         padding: 6px;
         border-radius: 6px;
         margin-top: 30px;
      }
      #movieListTable tr{
         padding: 9px;
      }
      #movieListTable tr td{
         padding: 5px;
         font-size: 14px;
      }
      #poster{
         width: 350px;
         margin: 30px;
         margin-left: 0;
      }
      #ratingTable {
         background-color: #FFFFFF;
      }
      #firstSectionDiv {
         padding : 30px;
         float: right;
         color: #FFFFFF;
         margin-top: 320px;
         margin-right: 300px;
      }
      #secondSectionDiv {
         padding : 30px;
         float: right;
         color: #FFFFFF;
         width: 1100px;
         display: block;
         margin: 0 auto;
      }
      #thirdSectionDiv {
         padding : 30px;
         padding-left: 0;
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
         padding-left: 0;
      }
      #sixthSectionDiv {
         padding : 30px;
         padding-left: 0;
         color: #FFFFFF;
      }
      #seventhSectionDiv {
         padding : 30px;
         color: #FFFFFF;
      }
      .actor1{
         color: #FFFFFF;
      }
      .actor{
         color: #FFFFFF;
         margin-left: 10px;
      }   
      .firstButton {
         width: 200px;
         height: 40px;
         margin-bottom: 10px;
         border-radius: 8px;
         border: 1px solid white;
         background-color: white;
         margin-left: 10px;
      }
      .firstButton1 {
         width: 200px;
         height: 40px;
         margin-bottom: 10px;
         border-radius: 8px;
         border: 1px solid white;
         background-color: white;
         margin-left: 30px;
      }
      #secondButton {
         width: 200px;
         height: 40px;
         border: 1px solid white;
         border-radius: 8px;
         margin-left: 10px;
      }
      #thirdButton {
         width: 200px;
         height: 40px;
         border: 1px solid #0E7356;
         background-color: #0E7356;
         border-radius: 8px;
         color: #FFFFFF;
         margin-left: 10px;
      }
      button:hover {
   opacity: .8;
	}
	</style>
	<script type="text/javascript">
		let nowUrl = window.location.href;

		function copyUrl(){
			navigator.clipboard.writeText(nowUrl).then(res=>{
			alert("주소가 복사되었습니다");
			})
		} 
		
		function insertBasketFnc() {
			var result = [];
			var basketCheck = false;
			
			$.ajax({
				type: 'get',
				url: '../basketList.do',
				dataType: 'json',
				data: {
					memberNumber: "${member.memberNumber}",
				},
				async: false,
				success: function (data) {
                    result = data;
                },
                error: function() {
                    alert("에러 발생");
                }
			});
			
			for (var i = 0; i < result.length; i++) {
				if(result[i].movieNumber == ${movieDto.movieNumber}){
					basketCheck = true;
					break;
				}
			}
			
			if(basketCheck == true){
				alert("장바구니에 담겨있습니다.");
			} else {
				alert("장바구니에 담았습니다.");
				location.href="../order/basketInsertCtr.do?movieNumber=${movieDto.movieNumber}";
			}
		}
		
		
		function buyMovieFnc() {
			location.href="../order/payment.do?product=${movieDto.movieNumber}";
			
		}
		
	</script>
</head>
<body>
	<jsp:include page="/WEB-INF/view/Header.jsp"/>

	<div id="contentsAreaDiv">
		<div id="title">
			<h3>영화 상세</h3>
		</div>
		<div id="movieContent">
			<img id="poster" alt="영화포스터" src="${movieDto.moviePoster}" />
			<div id="firstSectionDiv">
				<p>영화명 : ${movieDto.movieTitle}</p>
				<p>장르 : ${movieDto.genreName}</p>
				<p>개봉일 : ${movieDto.movieReleaseDate}</p>
				<p>상영시간 : ${movieDto.movieRuntime}분</p>
				<p>관람가 : 00세 관람가</p>
				<p>가격 : ${movieDto.moviePrice} 원</p>
			</div>
		</div>
		<div id="secondSectionDiv">
			<button class="firstButton1" onclick="alert('준비 중입니다');return false;">&#x1F44D  좋아요</button>
			<button class="firstButton" onclick="alert('준비 중입니다');return false;">&#x2714  봤어요</button>
			<button class="firstButton" onclick="copyUrl()">&#x1F517  공유하기</button>
			<button id="secondButton" onclick="insertBasketFnc();">&#128722 장바구니추가</button>
			<button id="thirdButton" onclick="buyMovieFnc();">&#127916 구매하기</button>         
		</div>

		<h3>영화내용</h3>
		<div id="thirdSectionDiv">
			<p>
				${movieDto.movieSummary}
			</p>
		</div>

		<h3>예고편</h3>
		<div id="fourthSectionDiv">
			<iframe width="560" height="315" src="${movieDto.moviePreview}" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen style="position: absolute; width:100%; height:100%;"></iframe>
		</div>
		<br>
		<br>
		
<!--	<h3>지수</h3>
		<div id="fifthSectionDiv">
			<table id="ratingTable">
				<tr>
					<td>자체지수 : </td>
					<td>IMDB 지수 : </td>
					<td>로튼토마토 지수 : </td>
					<td>카카오영화 지수 : </td>
				</tr>
			</table>
		</div> -->
      
		<h3>출연진</h3>
		<div id="sixthSectionDiv">
			<span class="actor">배우1</span>
			<span class="actor">배우2</span>
			<span class="actor">배우3</span>
			<span class="actor">배우4</span>
			<span class="actor">배우5</span>
			<span class="actor">배우6</span>
			<span class="actor">배우7</span>
		</div>

		<h3>한줄평</h3>
		<div id="seventhSectionDiv">
		<a href='./commentAdd.do?movieNumber=${movieDto.movieNumber}'>한줄평 추가</a>
		<table id="movieListTable">
			<tr>
				<th>영화 제목</th>
				<th>아이디</th>
				<th>한줄평 내용</th>
				<th>수정 및 삭제</th>
			</tr>

			<c:forEach var="movieDto" items="${movieCommentList}">
				<input type="hidden" name='movieNumber' value='${movieDto.movieNumber}'>
				<input type="hidden" name='lineReviewNumber' value='${movieDto.lineReviewNumber}'>
				<tr>
					<td>${movieDto.movieTitle}</td>
					<td>${movieDto.memberId}</td>
					<td>
						<a href='./commentListOne.do?lineReviewNumber=${movieDto.lineReviewNumber}'>${movieDto.lineReviewContext}</a>
					</td>
					<c:if test="${sessionScope.member.memberId eq movieDto.memberId}">
						<td>
							<a href='./commentUpdate.do?lineReviewNumber=${movieDto.lineReviewNumber}'>&#128393 수정</a>
							<a href='./commentDelete.do?lineReviewNumber=${movieDto.lineReviewNumber}'>&#128465 삭제</a>
						</td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
   
   		<jsp:include page="/WEB-INF/view/common/MoviePaging.jsp">
			<jsp:param value="${pagingMap}" name="pagingMap"/>
		</jsp:include>

		<form action="./list.do" id='pagingForm' method="post">
			<input type="hidden" id='curPage' name='curPage' value="${pagingMap.movieCommentPaging.curPage}">
		</form>
	</div>
   </div>

	<div id="btnList">
		<a href='./list.do' id="movieList">&#128281 영화목록으로</a>
		<a href='./update.do?movieNumber=${movieDto.movieNumber}' id="movieUpdate">&#128393 수정</a>
		<a href='./delete.do?movieNumber=${movieDto.movieNumber}' id="movieDelete">&#128465 삭제</a>
	</div>
<%--    <jsp:include page="/WEB-INF/view/Footer.jsp" /> --%>
</body>
</html>