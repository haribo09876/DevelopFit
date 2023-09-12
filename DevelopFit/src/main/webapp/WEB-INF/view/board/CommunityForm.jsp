<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>community board</title>
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
 		height: 800px;
 		width: 1200px;
	}
	#headtext{
		height:30px;
		width:30px;
		padding-top: 100px;
		padding-left: 70px;
		font-size: 30px;
	}
	#comunityboard{
		margin-top: 80px;
		margin-left: 70px;
		height: 50px;
		border-bottom: 1px solid black;
	}
	#board_num{
		width: 100px;
		text-align: center;
		padding-right: 50px;
	}
	#title{
		width: 300px;
		text-align: center;
		padding-right: 50px;
	}
	#member{
		width: 200px;
		text-align: center;
		padding-right: 50px;
	}
	#cre_date{
		width: 150px;
		text-align: center;
		padding-right: 50px;
	}
</style>
</head>
<body>
	<div id="container">
		<div id="headtext">community</div>
		<div id="comunityboard">

				<div id="board_num">게시번호</div>
				<div id="title">제목</div>
				<div id="member">작성자</div>
				<div id="cre_date">작성일</div>
				<div>조회수</div>

        <c:forEach var="boardDto" items="${boardSelectList}">
                <div>${boardDto.boardnumber}</div>
                <div>
<%--                     <a href='./boardSelectOne.do?no=${boardDto.board_number}'>${boardDto.board_title} --%>
<!--                     </a> -->
                </div>
                <div>
                	${boardDto.boardtitle}	
                </div>
                <div>
                    <fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${boardDto.boardcreatedate}"/>
                </div>
                <div>${boardDto.boardhit}</div>
                
                    <!-- 폼 필드 추가 -->
                    <input type="hidden" name="boardNumber" value="${boardDto.boardnumber}">
        </c:forEach>
   
	</div>
</div>

</body>
</html>