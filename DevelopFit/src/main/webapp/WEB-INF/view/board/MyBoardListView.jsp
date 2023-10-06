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
/*    body{ */
/*       background-color: #101322; */
/*       width: 1300px; */
/*       height: 1300px; */
/*       margin: auto; */
/*       color: white; */
/*       } */
/*    #container{ */
/*        margin: 0px 60px 50px; */
/*       border-color: black; */
/*        background-color: #101322; */
/*        height: 450px; */
/*        width: 1200px; */
/*    } */
/*    #headtext{ */
/*       height:30px; */
/*       width:30px; */
/*       padding-top: 100px; */
/*       padding-left: 70px; */
/*       font-size: 30px; */
/*    } */
/*    #comunityboard{ */
/*       margin-left: 70px; */
/*       height: 250px; */
/*       width: 1000px; */
/*    } */
/*    #menuwrap{ */
/*       margin-top: 40px; */
/*       margin-left: 70px; */
/*       margin-bottom: 10px; */
/*       width: 1000px; */
/*       height: 38px; */
/*       border-bottom: 1px solid white; */
/*    } */
/*    #menuBoardNum{ */
/*       width: 70px; */
/*       text-align: center; */
/*       float: left; */
/*    } */
/*    #menuTitle{ */
/*       width: 200px; */
/*       text-align: center; */
/*       float: left; */
/*    } */
/*    #menuContent{ */
/*       width: 300px; */
/*       text-align: center; */
/*       float: left; */
/*    } */
/*    #menuMemberId{ */
/*       width: 150px; */
/*       text-align: center; */
/*       float: left; */
/*    } */
/*    #menuCreDate{ */
/*       width: 150px; */
/*       text-align: center; */
/*       float: left; */
/*    } */
/*    #menuBoardHit{ */
/*       width: 70px; */
/*       text-align: center; */
/*       float: right; */
/*    } */
/*    #boardContentWrap{ */
/*       width: 1000px; */
/*       height: 32px; */
/*       margin-top: 2px; */
/*       padding-top: 5px; */
/*       padding-bottom: 5px; */
/*    } */
/*    #boardNum{ */
/*       width: 70px; */
/*       text-align: center; */
/*       float: left; */
/*    } */
/*    #boardTitle{ */
/*       width: 200px; */
/*       text-align: center; */
/*       float: left; */
/*       text-overflow: ellipsis; */
/*       overflow: hidden; */
/*       white-space: nowrap; */
/*    } */
/*    #boardMemberId{ */
/*       width: 150px; */
/*       text-align: center; */
/*       float: left; */
/*       text-overflow: ellipsis; */
/*       overflow: hidden; */
/*       white-space: nowrap; */
/*    } */
/*    #boardCreDate{ */
/*       width: 150px; */
/*       text-align: center; */
/*       float: left; */
/*    } */
/*    #BoardBoardHit{ */
/*       width: 70px; */
/*       text-align: center; */
/*       float: right; */
/*    } */
/*    #headtext{ */
/* /*       float: right; */
* /
	/*    } */    
#aTag {
	color: inherit;
	text-decoration: none;
	text-align: center;
}

#write {
	background-color: #0DA66E;
	color: white;
	float: right;
	margin-right: 10px;
	height: 30px;
	width: 60px;
	border-radius: 6px;
	border-color: #0DA66E;
	margin-top: 30px;
}

#write:hover {
	opacity: .8;
}

body {
	background-color: #101322;
	color: #FFFFFF;
}

table tr th td {
	border-collapse: collapse;
	border-width: 0;
	border-style: solid;
}

.sectionTitle {
	color: #FFFFFF;
	font-size: 20px;
	font-weight: bold;
}

.cardTable {
	min-width: 100%;
	table-layout: fixed;
	background-color: #172036;
	border-radius: 6px;
	padding: 9px;
	border-collapse: separate;
	border-spacing: 15px;
}

.tableHead {
	background-color: #172036;
	color: #9ca3af;
	height: 30px;
}

.tableGroup {
	border-top-width: 1px;
	border-color: #172036;
	background-color: #172036;
	text-align: center;
}

.boardTitle {
	color: #D1D5DB;
}

#contentsAreaDiv {
	width: 1250px;
	margin-top: 30px;
	position: absolute;
	left: 50%;
	transform: translateX(-50%);
}
.ellipsis {
    text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
    width: 450px;
}

#udwrap{
	width: 130px;
	height: 32px;
	float: right;
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

#update:hover {
	opacity: .8;
}
#delete:hover {
	opacity: .8;
}

</style>
</head>
<body>

	<jsp:include page="/WEB-INF/view/Header.jsp" /><br><br><br>

	<div id="contentsAreaDiv">
		<a class="sectionTitle">Community</a><br><br>
		<table class="cardTable">
			<thead>
				<tr class="tableHead">
					<th>게시번호</th>
					<th width="20%">제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			
			<c:forEach var="boardDto" items="${boardList}">
				<tr class="tableGroup">
					<td width="10%">${boardDto.boardNumber}</td>
					<td>
						<div class="ellipsis">
							<a href='./listOne.do?boardNumber=${boardDto.boardNumber}'>
								${boardDto.boardTitle}
							</a>
							<input type="hidden" name="memberNumber" value='${member.memberNumber}'>
						</div>
					</td>
					<td width="180px;">${boardDto.memberId} <input type="hidden"
						name="boardNumber" value="${boardDto.boardNumber}">
					</td>
					<td width="100px;"><fmt:formatDate pattern="yyyy-MM-dd"
							value="${boardDto.boardCreateDate}" /></td>
					<td width="100px;">${boardDto.boardHit}</td>
					<td id="udwrap">
						<form action='./delete.do' method='post'>
							<input type="hidden" name='boardNumber'value='${boardDto.boardNumber}'>
							<input type="hidden" name='memberNumber' value='${member.memberNumber}'>
							<input type="submit" id="delete" value="삭제"
								${canEdit ? '' : 'style="display: none;"'}>
						</form>
						<form action='./update.do' method='post'>
							<input type="hidden" name='boardNumber' value='${boardDto.boardNumber}'>
							<input type="submit" id="update" value="수정"
								${canEdit ? '' : 'style="display: none;"'}>
						</form>
					</td>
				</tr>
				
			</c:forEach>

	
		</table>
		
		<form action="./add.do" id='AddForm' method="post">
			<input type="hidden" name="memberNumber" value="${member.memberNumber}">
			<input type="submit" id="write" value="글쓰기">
		</form>
		
		<br>
		<br>
		<br>
		<br>
		<br>
		
		<div id="pagingwrap">
			<jsp:include page="/WEB-INF/view/common/BoardPaging.jsp">
				<jsp:param value="${pagingMap}" name="pagingMap" />
			</jsp:include>

			<form action="./myList.do" id='pagingForm' method="post">
				<input type="hidden" id='curPage' name='curPage'
					value="${pagingMap.boardPaging.curPage}">
			</form>
		</div>



		<%--       <jsp:include page="/WEB-INF/view/Footer.jsp"/> --%>
	</div>

</body>
</html>