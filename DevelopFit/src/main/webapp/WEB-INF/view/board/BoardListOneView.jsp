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
		background-color: #131826;
		width: 1300px;
		height: 1300px;
		margin: auto;
		color: white;
		}
	#container{
 		margin: 150px 60px 50px;
		border-color: black;
 		background-color: #172036;
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
	#update{
		color: white;
		background-color: #0DA66E;
		float: left;
		width: 60px;
		height: 30px;
		margin-left: 920px;
		margin-top: 40px;
	}
	#delete{
		color: white;
		background-color: #0DA66E;
		float: right;
		width: 60px;
		height: 30px;
		margin-right:137px;
		margin-left: 0px;
		margin-top: 40px;
	}
	#commentview{
		float: left;
		margin-left: 200px;
		margin-top: 80px;
	}
	#commentpagingwrap{
		margin-top: 400px;
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
	<div>
		<form action='./delete.do' method='post'>
			<input type="hidden" name='boardNumber' value='${boardDto.boardNumber}'>
<%--	<input type="hidden" name='memberNumber' value='${member.memberNumber}'> --%>
			<input type="hidden" name='memberNumber' value= 1>
			<input type="submit" id="delete" value="삭제">
		</form>
		<form action='./update.do' method='post'>
			<input type="hidden" name='boardNumber' value='${boardDto.boardNumber}'>
			<input type="hidden" name='memberNumber' value='${boardDto.memberNumber}'>
			<input type="submit" id="update" value="수정">
		</form>
	</div>	
	<div id="commentview">
		<div>댓글</div>
	</div>
	<c:forEach var="boardCommentDto" items="${boardCommentList}">
    	<div id="boardCommentContent">${boardCommentDto.commentContent}</div>
	</c:forEach>
	
	<form action='./commentUpdateCtr.do' method='post'>
			<input type="hidden" name='commentNumber' value='${boardCommentDto.commentNumber}'>
			<input type="hidden" name='memberNumber' value= 1>
			<input type="hidden" id="boardNumber" value="${boardDto.boardNumber}">
			<input type="submit" id="update" value="수정">
	</form>
	
	<div id="commentpagingwrap">
		<jsp:include page="/WEB-INF/view/common/BoardCommentPaging.jsp">
			<jsp:param value="${commentPagingMap}" name="commentPagingMap"/>
		</jsp:include>
		
		<form action="./commentList.do" id='pagingForm' method="post">
			<input type="hidden" id='curPage' name='curPage' 
				value="${commentPagingMap.boardCommentPaging.curPage}">
		</form>
	</div>
</div>
	
		
	
</body>
</html>