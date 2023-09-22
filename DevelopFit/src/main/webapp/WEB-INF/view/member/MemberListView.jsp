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
		color: white;
	}
	#title{
		width: 400px;
		display: block;
		margin: 0 auto;
		text-align: center;
		margin-bottom: 50px;
		margin-top: 50px;
	}
	table{
		width: 1000px;
		display: block;
		margin: 0 auto;
	}
	tr{
		text-align: center;
		
	}
	td{
		padding: 10px;
	}
	th{
		width: 250px;
		text-align: center;
	}
	
</style>
</head>

<body>

	<jsp:include page="/WEB-INF/view/Header.jsp" />
	<div id="title">
		<h1>회원목록</h1>
	</div>
	
	<table>
		<tr id="tr-title">
			<th>번호</th>
			<th>이름</th>
			<th>이메일</th>
			<th>생년월일</th>
			<th></th>
		</tr>
		
		<c:forEach var="memberDto" items="${memberList}">
			<tr id="tr-content">
				<td>${memberDto.memberNumber}</td>
				<td>${memberDto.memberName}</td>
				<td>${memberDto.memberEmail}</td>
				<td> 
					${memberDto.memberBirthDate}
				</td>
				<td>
					<a href='./listOne.do?no=${memberDto.memberNumber}' style="color: green;">[수정]</a>
					<a href='./delete.do?no=${memberDto.memberNumber}' style="color: #F24141;">[삭제]</a>
				</td>
			</tr>
		
		</c:forEach>
		
	</table>
		

	<jsp:include page="/WEB-INF/view/common/memberPaging.jsp">
		<jsp:param value="${pagingMap}" name="pagingMap"/>
	</jsp:include>
	
<!-- 	정보를 넘기기 위해서 폼을 만들었다 -->
	<form action="./list.do" id="pagingForm" method="post">
      <input type="hidden" id="curPage" name="curPage"
         value="${pagingMap.memberPaging.curPage}">
   </form>
   
</body>
</html>