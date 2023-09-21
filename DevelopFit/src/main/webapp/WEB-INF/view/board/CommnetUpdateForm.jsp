<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UpdateForm</title>
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
 		background-color: #172036;
 		height: 1200px;
 		width: 1200px;
	}
	#topcontent{
		margin-right: 40px;
		margin-left: 40px;
		margin-bottom: 10px;
		margin-top: 50px;
		height: 100px;
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
 		color: white;
 	}
 	#createdate{
 		font-size: 20px;
 		text-align: center;
 		width: 250px;
 		height: 40px;
 		float: right;
 		color: white;
 	}
 	#title{ 
 		font-size: x-large; 
 		margin-left: 120px;
 		width: 600px;
 		height: 40px;
 		margin-bottom: 70px;
 	} 
 	#content{
 		float: left;
 		width: 900px;
 		height: 350px; 
 		margin-left: 120px;
 	}
 	#content{
 		background-color: #172036;
 		border: none;
 		color: white;
	}
	#title{
		background-color: #172036;
		border: none;
		color: white;
	}
	#textTitle{
		width: 100px;
		height: 50px;
		color: white;
		margin-left: 120px;
		font-size: 22px;
	}
	#textContent{
		width: 100px;
		height: 50px;
		color: white;
		margin-left: 120px;
		font-size: 22px;
	}
	#button{
		margin-top:40px;
		float: right;
		margin-right: 175px;
		width: 100px;
		height: 30px;
		color: white;
		background-color: #0DA66E;
	}
</style>
</head>
<body>
	<div id="container">
		<div id="topcontent">
			<div id="iddatewrap">
		 		<div id="memberid">글쓴이: ${boardDto.memberId}</div>
		 		<div id="createdate">작성일: 
		 			<fmt:formatDate pattern="yyyy-MM-dd" value="${boardDto.boardCreateDate}"/>
		 		</div>
		 	</div>
		</div>
	 	
		<form action='./updateCtr.do' method='post'>
			<input type="hidden" name='boardNumber' value='${boardDto.boardNumber}'>
			<input type="hidden" name='memberNumber' value='${boardDto.memberNumber}'>
			
			<div id="textTitle">제목:		</div>
			<input id="title" type="text" name="boardTitle" value="${boardDto.boardTitle}"> 
			
			<div id="textContent">내용:		</div>
			<textarea rows="1" cols="50" name="boardContent" id="content">${boardDto.boardContent}
			</textarea>
<%-- 			<input id="content" type="text" name="boardContent" value="${boardDto.boardContent}">  --%>
			
			<input type="submit" id="button" value="수정완료" />
		</form>	

	
</div>
	
		<div id="commentmenu">
			<div>댓글</div>
		</div>
	
</body>
</html>