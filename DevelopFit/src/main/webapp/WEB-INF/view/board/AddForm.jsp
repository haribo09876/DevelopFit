<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AddForm</title>
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
	
	#write{
		color: white;
		text-align: center;
		font-size: xx-large;
		padding-top: 50px;
	}
	#form{
		height: 900px;
 		width: 1000px;
 		margin-left: 150px;
	}
 	#title{ 
 		font-size: x-large; 
 		width: 900px;
 		height: 40px;
 		margin-bottom: 70px;
 		background-color: #273061;
		border: none;
		color: white;
 	} 
 	#content{
 		float: left;
 		width: 900px;
 		height: 350px; 
 		background-color: #273061;
 		border: none;
 		color: white;
 	}
 	#textTitle{
		width: 100px;
		height: 50px;
		color: white;
		font-size: 22px;
		padding-top: 100px;
	}
	#textContent{
		width: 100px;
		height: 50px;
		color: white;
		font-size: 22px;
	}
	#submit{
		margin-top:40px;
		float: right;
		margin-right: 95px;
		width: 100px;
		height: 30px;
		color: white;
		background-color: #0DA66E;
	}
</style>
</head>
<body>
	<div id="container">
		<div id="write">글쓰기</div>
		<form action='./addCtr.do' id="form" method='post'>
			<input type="hidden" name='memberNumber' value= '${member.memberNumber}'>
			<div id="textTitle">제목:			</div>
			<input id="title" type="text" name="boardTitle" value="${boardDto.boardTitle}"> 
			<div id="textContent">내용:		</div>
			<textarea rows="1" cols="50" name="boardContent" id="content">${boardDto.boardContent}
			</textarea>	
			<input type="submit" id="submit" value="저장" />
		</form>	
		
	</div>	
	
</body>
</html>	 	