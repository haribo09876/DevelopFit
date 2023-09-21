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
		height: 100%;
		}
	html{
		height: 100%;
	}
	#container{
 		margin: 150px 60px 50px;
		border-color: black;
 		background-color: #172036;
 		height: auto;
 		width: 1200px;
 		padding-bottom: 5px;
	}
	#topcontent{
		margin-right: 40px;
		margin-left: 40px;
		margin-bottom: 10px;
		margin-top: 50px;
		height: 650px;
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
 		width: 840px;
 		height: 40px;
 		margin-top: 50px;
 		margin-bottom: 70px;
 		word-wrap: break-word;
 		white-space: pre-wrap;
 	} 
 	#content{
 		float: left;
 		width: 780px;
 		height: 300px; 
 		margin-left: 120px;
 		margin-top: 30px;
 	}
 	#boardhit{
 		font-size: 20px;
 		text-align: center;
 		width: 150px;
 		height: 40px;
 		float: right;
 		margin-right: 30px;
	}
	#udwrap{
		width: 130px;
		height: 32px;
		margin-left: 650px;
		margin-right: 47px;
		float: right;
		margin-top: 20px;
	}
	#update{
		color: white;
		background-color: #0DA66E;
		float: left;
		width: 60px;
		height: 30px;
	}
	#delete{
		color: white;
		background-color: #F24141;
		float: right;
		width: 60px;
		height: 30px;
	}
	#commentview{
		font-size: x-large;
		float: left;
		margin-left: 100px;
		margin-top: 100px;
		height: 30px;
	}
	#commentwrap{
		margin-top:200px;
		width: 600px;
 		margin-left: -180px; 
 		
	}
	#commentMemberId{
		width: 800px;
		height: 30px;
		margin-left: 300px;
		text-align: left;
	}
	#commentCreateDate{
		width: 400px;
		height: 30px;
		margin-left: 300px;
		text-align: left;
	}
	#commentContent{
		width: 800px;
		height: 30px;
		margin-left: 300px;
		margin-bottom: 30px;
		text-align: left;
		border-bottom: 1px solid gray;
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
			<div id="udwrap">
				<form action='./delete.do' method='post'>
					<input type="hidden" name='boardNumber' value='${boardDto.boardNumber}'>
					<input type="hidden" name='memberNumber' value= '${member.memberNumber}'>
					<input type="submit" id="delete" 
					value="삭제" ${canEdit ? '' : 'style="display: none;"'}>
				</form>
				<form action='./update.do' method='post'>
					<input type="hidden" name='boardNumber' value='${boardDto.boardNumber}'>
					<input type="submit" id="update" value="수정"
					 ${canEdit ? '' : 'style="display: none;"'}>
				</form>
			</div>		
			
			<div id="commentview">댓글</div>
		</div>
	
	<div id="commentwrap">
		<c:forEach var="commentDto" items="${commentList}">
			<div id="commentMemberId">아이디:		${commentDto.memberId}</div>
	    	<div id="commentCreateDate">작성일:	
	    		<fmt:formatDate pattern="yyyy-MM-dd" value="${commentDto.commentCreateDate}"/>
	    	</div>
	    	<div id="commentContent">${commentDto.commentContent}</div>
		</c:forEach>
	</div>
	<div>
		<form action='./commentUpdateCtr.do' method='post'>
				<input type="hidden" name='commentNumber' value='${commentDto.commentNumber}'>
				<input type="hidden" name='memberNumber' value= '${member.memberNumber}'>
				<input type="hidden" name="boardNumber" value="${commentDto.boardNumber}">
				<input type="submit" id="commentupdate" value="수정">
		</form>
	</div>
<!-- 	<div id="commentpagingwrap"> -->
<%-- 		<jsp:include page="/WEB-INF/view/common/BoardCommentPaging.jsp"> --%>
<%-- 			<jsp:param value="${commentPagingMap}" name="commentPagingMap"/> --%>
<%-- 		</jsp:include> --%>
		
<!-- 		<form action="./commentList.do" id='pagingForm' method="post"> -->
<!-- 			<input type="hidden" id='curPage' name='curPage'  -->
<%-- 				value="${commentPagingMap.boardCommentPaging.curPage}"> --%>
<!-- 		</form> -->
<!-- 	</div> -->
</div>
	
		
	
</body>
</html>