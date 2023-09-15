<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardListOneView</title>
<style type="text/css">
	body{
		background-color: #101322;
		width: 1300px;
		height: 1300px;
		margin: auto;
		}
	#container{
 		margin: 150px 60px 50px;
		border-color: black;
 		background-color: white;
 		height: 1200px;
 		width: 1200px;
	}
	#topcontent{
		margin-right: 40px;
		margin-left: 40px;
		margin-bottom: 10px;
		margin-top: 50px;
		height: 600px;
		padding-top: 50px;
	}
	#iddatewrap{
		height: 60px;
 		width: 1100px;
	}
 	#memberid{ 
 		text-overflow: ellipsis; 
 		overflow: hidden; 
 		white-space: nowrap; 
 		font-size: 20px; 
 		width: 250px; 
 		text-align: center; 
 		float: left; 
 		height: 40px;
 	}
 	#createdate{
 		font-size: 20px;
 		text-align: center;
 		width: 250px;
 		height: 40px;
 		float: right;
 	}
 	#title{ 
 		font-size: x-large; 
 		margin-left: 60px;
 		width: 600px;
 		height: 40px;
 		margin-top: 50px;
 		margin-bottom: 70px;
 	} 
 	#content{
 		float: left;
 		width: 900px;
 		height: 350px; 
 		margin-left: 120px;
 	}
 	#boardhit{
 		font-size: 20px;
 		text-align: center;
 		width: 150px;
 		height: 40px;
 		float: right;
 		margin-right: 30px;
	}
</style>
</head>
<body>
	<div id="container">
		<div id="topcontent">
			<div id="iddatewrap">
				<div>
		 			<div id="memberid">글쓴이: ${boardDto.memberId}</div>
		 		</div>
		 		<div id="createdate">작성일: 
		 			<fmt:formatDate pattern="yyyy-MM-dd" value="${boardDto.boardCreateDate}"/>
		 		</div>
		 	</div>
	 	<div id="boardhit">조회수: ${boardDto.boardHit}</div>
			
		<div id="title">제목: ${boardDto.boardTitle}</div>
			
		<div id="content">
			${boardDto.boardContent}
		</div>
			
		</div>
<%-- 		<c:if></c:if> --%>
		<form action='./update.do' method='post'>
			<input type="hidden" name='boardNumber' value='${boardDto.boardNumber}'>
			<input type="hidden" name='memberNumber' value='${boardDto.memberNumber}'>
			<input type="submit" value="수정">
		</form>
		<form action='./delete.do' method='post'>
			<input type="hidden" name='boardNumber' value='${boardDto.boardNumber}'>
<%--	<input type="hidden" name='memberNumber' value='${memberDto.memberNumber}'> --%>
			<input type="hidden" name='memberNumber' value= 1>
			<input type="submit" value="삭제">
		</form>
		
		
</div>
	
		<div id="commentmenu">
			<div>댓글</div>
		</div>
	
</body>
</html>