<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>회원 목록</title>

<script type="text/javascript">
	
</script>
<style type="text/css">
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
	.movieTitle{
		color: #D1D5DB;
	}
	#contentsAreaDiv{
		width: 1250px;
		margin-top: 30px;
	  	position: absolute;
	  	left: 50%;
		transform: translateX(-50%);
	}
	#adminMenu{
		float: left;
	}
</style>
</head>

<body>
	<jsp:include page="/WEB-INF/view/Header.jsp" />
	<jsp:include page="/WEB-INF/view/adminHeader.jsp" />
	
	<div id="contentsAreaDiv">
		<div id="title">
			<h1>회원목록</h1>
		</div>
	
		<table class="cardTable">
			<tr class="tableHead">
				<th>번호</th>
				<th>이름</th>
				<th>이메일</th>
				<th>생년월일</th>
				<th></th>
			</tr>
			
			<c:forEach var="memberDto" items="${memberList}">
				<tr class="tableGroup">
					<td>${memberDto.memberNumber}</td>
					<td>${memberDto.memberName}</td>
					<td>${memberDto.memberEmail}</td>
					<td>${memberDto.memberBirthDate}</td>
					<td>
						<a href='./listOne.do?no=${memberDto.memberNumber}'>&#128393 수정</a>
						<a href='./delete.do?no=${memberDto.memberNumber}' style="color: #F24141;">&#128465 삭제</a>
					</td>
				</tr>
			</c:forEach>
		</table>

		<jsp:include page="/WEB-INF/view/common/memberPaging.jsp">
			<jsp:param value="${pagingMap}" name="pagingMap"/>
		</jsp:include>
		
	<!-- 	정보를 넘기기 위해서 폼을 만들었다 -->
		<form action="./list.do" id="pagingForm" method="post">
	      <input type="hidden" id="curPage" name="curPage" value="${pagingMap.memberPaging.curPage}">
	   </form>
	</div>
</body>
</html>