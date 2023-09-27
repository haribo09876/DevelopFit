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
	#adminMenu{
		width: 800px;
		height: 100px;
		text-align: center;
		float: right;
		border-bottom: 1px solid gray;
	}
	#adminMenu1{
		font-size: 16px;
		margin-bottom: 30px;
	}
	#adminMenu3{
		font-size: 16px;
		margin-bottom: 30px;
	}#adminMenu4{
		font-size: 16px;
		margin-bottom: 30px;
	}#adminMenu6{
		font-size: 16px;
		margin-bottom: 30px;
	}
	
	
</style>
</head>

<body>

	<jsp:include page="/WEB-INF/view/Header.jsp" />
	<div id="title">
		<h1>회원목록</h1>
	</div>
	
<!-- 	<ul> -->
<!--                <li><a href="#" id="menu1" onclick="alertFnc();">홈</a></li> -->
<!--                <li><a href="#" id="menu3" onclick="alertFnc();">영화전체</a></li> -->
<!--                <li><a href="#" id="menu4" onclick="alertFnc();">커뮤니티</a></li> -->
<!--             </ul> -->
	<div id="adminMenu">
		<div id="adminMenu1"><a href='#'>주문내역</a></div>
<%-- 		<div id="adminMenu2"><a href='./order/basket.do?memberNumber=${member.memberNumber}'>장바구니</a></div> --%>
		<div id="adminMenu3"><a href='../board/list.do?memberNumber=${member.memberNumber}'>작성게시물</a></div>
		<div id="adminMenu4"><a href='./admin.do?memberNumber=${member.memberNumber}'>회원정보</a></div>
<%-- 		<div id="adminMenu5"><a href='./adminMemberListOneView.do?memberNumber=${member.memberNumber}'> --%>
<!-- 			회원수정</a></div> -->
		<div id="adminMenu6"><a href='../movie/list.do?memberNumber=${member.memberNumber}'>영화정보수정</a></div>
<%-- 		<div><a href='./board/listOne.do?memberNumber=${member.memberNumber}'>게시물수정</a></div> --%>
<!-- 		<div id="adminMenu8"><a href="#">상품수정</a></div> -->
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
					<a href='./adminMemberListOneView.do?no=${memberDto.memberNumber}' style="color: green;">[수정]</a>
					<a href='./adminDelete.do?no=${memberDto.memberNumber}' style="color: #F24141;">[삭제]</a>
				</td>
			</tr>
		
		</c:forEach>
		
	</table>
		

	<jsp:include page="/WEB-INF/view/common/memberPaging.jsp">
		<jsp:param value="${pagingMap}" name="pagingMap"/>
	</jsp:include>
	
<!-- 	정보를 넘기기 위해서 폼을 만들었다 -->
	<form action="./admin.do" id="pagingForm" method="post">
      <input type="hidden" id="curPage" name="curPage"
         value="${pagingMap.memberPaging.curPage}">
   </form>
   
</body>
</html>