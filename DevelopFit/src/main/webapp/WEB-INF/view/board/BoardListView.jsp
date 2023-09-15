<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardListView</title>
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
		margin-left: 70px;
		height: 500px;
		width: 1000px;
	}
	#menuwrap{
		margin-top: 40px;
		margin-left: 70px;
		margin-bottom: 10px;
		width: 1000px;
		height: 38px;
		border-bottom: 1px solid black;
	}
	#menuBoardNum{
		width: 70px;
		text-align: center;
		float: left;
	}
	#menuTitle{
		width: 200px;
		text-align: center;
		float: left;
	}
	#menuContent{
		width: 300px;
		text-align: center;
		float: left;
	}
	#menuMemberId{
		width: 150px;
		text-align: center;
		float: left;
	}
	#menuCreDate{
		width: 150px;
		text-align: center;
		float: left;
	}
	#menuBoardHit{
		width: 70px;
		text-align: center;
		float: right;
	}
	#boardContentWrap{
		width: 1000px;
		height: 32px;
		margin-top: 2px;
		padding-top: 5px;
		padding-bottom: 5px;
	}
	#boardNum{
		width: 70px;
		text-align: center;
		float: left;
	}
	#boardTitle{
		width: 200px;
		text-align: center;
		float: left;
		text-overflow: ellipsis;
		overflow: hidden;
		white-space: nowrap;
	}
	#boardMemberId{
		width: 150px;
		text-align: center;
		float: left;
		text-overflow: ellipsis;
		overflow: hidden;
		white-space: nowrap;
	}
	#boardCreDate{
		width: 150px;
		text-align: center;
		float: left;
	}
	#BoardBoardHit{
		width: 70px;
		text-align: center;
		float: right;
	}
	#headtext{
/* 		float: right; */
	}
	a{
		color: inherit;
  		text-decoration: none;
  		width: 300px;
		text-align: center;
		float: left;
		text-overflow: ellipsis;
		overflow: hidden;
		white-space: nowrap;
	}
/* 	#pagingwrap{ */
/* 		width: 600px; */
/* 		margin: auto; */
/* 		height: 35px; */
/* 	} */
</style>
</head>
<body>
	<div id="container">
 		<div id="headtext">
 			community
 		</div>
			<div id="menuwrap">
				<div id="menuBoardNum">게시번호</div>
				<div id="menuTitle">제목</div>
				<div id="menuContent">내용</div>
				<div id="menuMemberId">작성자</div>
				<div id="menuCreDate">작성일</div>
				<div id="menuBoardHit">조회수</div>
			</div>
		<div id="comunityboard">	
       		<c:forEach var="boardDto" items="${boardList}">
       			<div id="boardContentWrap">
	            	<div id="boardNum">${boardDto.boardNumber}</div>
					                
	                <div id="boardTitle">${boardDto.boardTitle}</div>
	               
	                <a href='./listOne.do?boardNumber=${boardDto.boardNumber}'>
	                	${boardDto.boardContent}
	                </a>
	                
	               	<div id="boardMemberId">${boardDto.memberId}</div>
	                
	                <div id="boardCreDate">
	                    <fmt:formatDate pattern="yyyy-MM-dd" value="${boardDto.boardCreateDate}"/>
	                </div>
	                
	                <div id="BoardBoardHit">${boardDto.boardHit}</div>
                
                </div>
                    <input type="hidden" name="boardNumber" value="${boardDto.boardNumber}">
        </c:forEach>
	</div>
	<div id="pagingwrap">
		<jsp:include page="/WEB-INF/view/common/BoardPaging.jsp">
			<jsp:param value="${pagingMap}" name="pagingMap"/>
		</jsp:include>
		
		<form action="./list.do" id='pagingForm' method="post">
			<input type="hidden" id='curPage' name='curPage' 
				value="${pagingMap.boardPaging.curPage}">
		</form>
	</div>
	
	<form action="./add.do" id='AddForm' method="post">
		<input type="hidden" name="memberNumber" value="${boardDto.memberNumber}">
		<input type="submit" value="글쓰기">
	</form>
	
<%-- 		<jsp:include page="/WEB-INF/view/Footer.jsp"/> --%>
</div>

</body>
</html>