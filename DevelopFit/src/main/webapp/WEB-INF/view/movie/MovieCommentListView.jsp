<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>영화 한줄평 목록</title>
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
			background-color: #172036;
			border-radius: 6px;
			padding: 9px;
		}
		.tableHead {
 			background-color: #172036;
    		color: #9ca3af;
		}
		.tableGroup {
		    border-top-width: 1px;
			border-color: #172036;
			background-color: #172036;
			text-align: center;
		}
		#contentsAreaDiv{
			width: 1250px;
			margin-top: 30px;
		  	position: absolute;
		  	left: 50%;
			transform: translateX(-50%);
		}
	</style>
	<script type="text/javascript">
	</script>
</head>
<body>
	<jsp:include page="/WEB-INF/view/Header.jsp" />
	<jsp:include page="/WEB-INF/view/adminHeader.jsp" />
	
	<div id="contentsAreaDiv">
		<a class="sectionTitle">영화 한줄평 목록</a>
		<br>
		<br>
		<table id="cardTable">
			<thead>
				<tr class="tableHead">
					<th>한줄평 번호</th>
					<th>영화 번호</th>
					<th>영화 제목</th>
					<th>회원 아이디</th>
					<th>한줄평 내용</th>
					<th>수정 및 삭제</th>
				</tr>
			</thead>

			<c:forEach var="movieDto" items="${movieCommentList}">
				<input type="hidden" name='movieNumber' value='${movieDto.movieNumber}'>
				<input type="hidden" name='movieNumber' value='${movieDto.lineReviewNumber}'>
				<tr class="tableGroup">
					<td>${movieDto.lineReviewNumber}</td>
					<td>${movieDto.movieNumber}</td>
					<td>${movieDto.movieTitle}</td>
					<td>${movieDto.memberId}</td>
					<td>
						<a href='./commentListOne.do?lineReviewNumber=${movieDto.lineReviewNumber}'>${movieDto.lineReviewContext}</a>
					</td>
					<td>
						<a href='./commentUpdate.do?lineReviewNumber=${movieDto.lineReviewNumber}'>&#128393 수정</a>
						<a href='./commentDelete.do?lineReviewNumber=${movieDto.lineReviewNumber}' style="color: #F24141;">&#128465 삭제</a>
					</td>
				</tr>
			</c:forEach>
		</table>
		<br>
		<jsp:include page="/WEB-INF/view/common/MoviePaging.jsp">
			<jsp:param value="${pagingMap}" name="pagingMap"/>
		</jsp:include>

		<form action="./commentList.do" id='pagingForm' method="post">
			<input type="hidden" id='curPage' name='curPage' value="${pagingMap.movieCommentPaging.curPage}">
		</form>
	</div>
	
	<jsp:include page="/WEB-INF/view/Footer.jsp" />
</body>
</html>