<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>영화 목록</title>
	<style>
		body{
			background-color: #101322;
			color: #FFFFFF;
		}
		table tr th td {
		    border-collapse: collapse;
		    border-width: 0;
		    border-style: solid;
		}
		.sectionTitle{
			color: #FFFFFF;
			font-size: 20px;
			font-weight: bold;
		}
		.cardTable {
		    min-width: 100%;
			table-layout: fixed;
		}
		.tableHead {
 			background-color: #303846;
    		color: #9ca3af;
		}
		.tableGroup {
		    border-top-width: 1px;
			border-color: #1f2937;
			background-color: #374151;
		}
		.movieTitle{
			color: #D1D5DB;
		}
		.swiperPoster{
			width: 300px;
			margin-left: 42%;
		}
		.listPoster{
			width: 50px;
		}
		#contentsAreaDiv{
			width: 1250px;
			margin-top: 30px;
		  	position: absolute;
		  	left: 50%;
			transform: translateX(-50%);
		}
	</style>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js">

	</script>
</head>
<body>
	<jsp:include page="/WEB-INF/view/Header.jsp"/>
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css"/>

	<!-- Swiper -->
	<div class="swiper mySwiper">
		<div class="swiper-wrapper">
    		<c:forEach var="movieDto" items="${movieList}">
				<div class="swiper-slide">
					<img class="swiperPoster" alt="포스터" src="${movieDto.moviePoster}">
				</div>
			</c:forEach>
		</div>
		<div class="swiper-button-next"></div>
		<div class="swiper-button-prev"></div>
		<div class="swiper-pagination"></div>
		<div class="autoplay-progress">
			<svg></svg>
			<span></span>
		</div>
	</div>

  <!-- Initialize Swiper -->
  <script>
    const progressCircle = document.querySelector(".autoplay-progress svg");
    const progressContent = document.querySelector(".autoplay-progress span");
    var swiper = new Swiper(".mySwiper", {
      spaceBetween: 30,
      centeredSlides: true,
      autoplay: {
        delay: 2500,
        disableOnInteraction: false
      },
      pagination: {
        el: ".swiper-pagination",
        clickable: true
      },
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev"
      },
      on: {
        autoplayTimeLeft(s, time, progress) {
          progressCircle.style.setProperty("--progress", 1 - progress);
          progressContent.textContent = `${Math.ceil(time / 1000)}s`;
        }
      }
    });
  </script>

	<div id="contentsAreaDiv">
		<a class="sectionTitle">영화 목록</a><br><br>
		<table class="cardTable">
			<thead>
				<tr class="tableHead">
					<th>영화번호</th>
					<th>포스터</th>
					<th>영화명</th>
					<th>장르</th>
					<th>개봉일</th>
					<th>런타임</th>
					<th>가격</th>
					<th>수정 및 삭제</th>
				</tr>
			</thead>

			<c:forEach var="movieDto" items="${movieList}">
				<tr class="tableGroup">
					<td>${movieDto.movieNumber}</td>
					<td>
						<a href='./listOne.do?movieNumber=${movieDto.movieNumber}'>
							<img class="listPoster" alt="포스터" src="${movieDto.moviePoster}">			
						</a>
					</td>
					<td>
						<div class=movieTitle>
							<a href='./listOne.do?movieNumber=${movieDto.movieNumber}'>${movieDto.movieTitle}</a>
						</div>
					</td>
					<td>${movieDto.genreName}</td>
					<td>${movieDto.movieReleaseDate}</td>
					<td>${movieDto.movieRuntime} 분</td>
					<td>${movieDto.moviePrice} 원</td>
					<td>
						<a href='./update.do?movieNumber=${movieDto.movieNumber}'>&#128465 수정</a>
						<a href='./delete.do?movieNumber=${movieDto.movieNumber}'>&#128465 삭제</a>						
					</td>
				</tr>
			</c:forEach>
		</table>
		<br>
		<a href='./add.do'>새 영화 등록</a>
		<br>
		<div>
			<jsp:include page="/WEB-INF/view/common/MoviePaging.jsp">
				<jsp:param value="${pagingMap}" name="pagingMap"/>
			</jsp:include>
		
			<form action="./list.do" id='pagingForm' method="post">
				<input type="hidden" id='curPage' name='curPage' value="${pagingMap.moviePaging.curPage}">
			</form>
		</div>
		
	</div>
	
<%-- 	<jsp:include page="/WEB-INF/view/Footer.jsp" /> --%>
</body>
</html>