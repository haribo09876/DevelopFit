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
	html{
		height: 100%;
	}
	body{
		background-color: #101322;
		width: 1300px;
		height: 1300px;
		margin: auto;
		color: white;
		height: 100%;
		}
	#container{
 		margin: 150px 60px 50px;
		border-color: black;
 		background-color: #172036;
 		height: auto;
 		width: 1200px;
 		padding-bottom: 50px;
 		border-radius: 6px;
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
 		word-break:break-all;
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
		border-radius: 6px;
	}
	#delete{
		color: white;
		background-color: #F24141;
		float: right;
		width: 60px;
		height: 30px;
		border-radius: 6px;
	}
	#commentview{
		font-size: x-large;
		float: left;
		margin-left: 100px;
		margin-top: 100px;
		height: 30px;
	}
	#commentMemberId{
		width: 400px;
		height: 30px;
		margin-left: 200px;
		text-align: left;
		float: left;
		margin-bottom: 20px;
	}
	#commentCreateDate{
		width: 330px;
		height: 30px;
		margin-left: 175px;
		text-align: left;
		float: right;
		margin-bottom: 20px;
		margin-right: 10px;
	}
	#commentContentWrap{
		width: 800px;
		height: 140px;
		margin-left: 200px;
		margin-bottom: 30px;
		margin-top: 60px;
		text-align: left;
		border-bottom: 1px solid gray;
	}
	#commentContent{
		width: 800px;
		height: 80px;
		text-align: left;
		margin-top: 10px;
		float: left;
		word-break:break-all;
	}
	#addForm{
		margin-left: 200px;
		width: 820px;
		margin-top: 70px;
		margin-bottom: 20px;
		height: 150px;
	}
	#commentInsert{
		width: 800px;
		height: 90px;
		margin-bottom: 20px;
		background-color: #273061;
		color: white;
		font-size: x-large;
		border-radius: 6px;
	}
	#addButton{
		width: 100px;
		height: 30px;
		color: white;
		background-color: #0DA66E;
		float: right;
		margin-right: 10px;
		border-radius: 6px;
	}
	#commentUpdate{
		color: white;
		background-color: #0DA66E;
		width: 60px;
		height: 30px;
		float: left;
		border-radius: 6px;
	}
	#commentDelete{
		color: white;
		background-color: #F24141;
		width: 60px;
		height: 30px;
		border-radius: 6px;
	}
	#btnwrap{
		margin-top: 40px;
		width: 130px;
		margin-left: 682px;
	}
	
	#update:hover {
		opacity: .8;
	}
	#delete:hover {
		opacity: .8;
	}
	#addButton:hover {
		opacity: .8;
	}
	#commentUpdate:hover {
		opacity: .8;
	}
	#commentDelete:hover {
		opacity: .8;
	}
	
</style>
<script type="text/javascript">
	function check() {
		var commentInsertObj = document.getElementById("commentInsert");
		
		if (commentInsertObj === null || commentInsertObj.value.trim() === '') {
			alert("내용을 확인해주세요.");
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	
	<jsp:include page="/WEB-INF/view/Header.jsp" />

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
					<input type="submit" id="delete" value="삭제" 
					${canEdit ? '' : 'style="display: none;"'}>
				</form>
				<form action='./update.do' method='post'>
					<input type="hidden" name='boardNumber' value='${boardDto.boardNumber}'>
					<input type="submit" id="update" value="수정"
					 ${canEdit ? '' : 'style="display: none;"'}>
				</form>
			</div>		
			
			<div id="commentview">댓글</div>
			</div>
	
		<form action="./commentAddCtr.do" method="post" id="addForm" onsubmit="return check();">
			<input type="hidden" name='boardNumber' value="${boardDto.boardNumber}">
			<input type="hidden" name='memberNumber' value="${member.memberNumber}">
			<textarea rows="1" cols="20" name="commentContent" id="commentInsert" 
			maxlength="33" style="resize: none;"></textarea>	
			<input type="submit" id="addButton" value="등록">
		</form>
		
		<c:forEach var="commentDto" items="${commentList}">
			<div id="commentMemberId">아이디:		'${commentDto.memberId}'</div>
	    	<div id="commentCreateDate">작성일:	
	    		<fmt:formatDate pattern="yyyy-MM-dd" value="${commentDto.commentCreateDate}"/>
	    	</div>
	    	<div id="commentContentWrap">
	    	<div id="commentContent">${commentDto.commentContent}
	   			<div id="btnwrap">
	   				<c:if test="${commentDto.memberNumber == member.memberNumber || member.memberNumber == 0}">
				    	<form action='./commentUpdate.do' method='post' name="updateForm">
							<input type="hidden" name='commentNumber' value='${commentDto.commentNumber}'>
							<input type="hidden" name='memberNumber' value= '${member.memberNumber}'>
							<input type="hidden" name="boardNumber" value="${commentDto.boardNumber}">
							<input type="hidden" name="commentContent" value="${commentDto.commentContent}">
							<input type="submit" id="commentUpdate" value="수정">
						</form>
					</c:if>
					
				   <c:if test="${commentDto.memberNumber == member.memberNumber || 
				   				member.memberNumber == 0}">
						<form action='./commentDeleteCtr.do' method='post' name="deleteForm">
								<input type="hidden" name='commentNumber' value=
								'${commentDto.commentNumber}'>
								<input type="hidden" name='memberNumber' value= '${member.memberNumber}'>
								<input type="hidden" name="boardNumber" value="${commentDto.boardNumber}">
								<input type="submit" id="commentDelete" value="삭제">
						</form>
					</c:if>
				</div>
			</div>
			</div>
		</c:forEach>
		
		
		
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