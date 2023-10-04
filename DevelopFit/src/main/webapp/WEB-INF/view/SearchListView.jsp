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
      color: white;
      }
   #container{
       margin: 0px 60px 50px;
      border-color: black;
       background-color: #101322;
       height: 550px;
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
      height: 250px;
      width: 1000px;
   }
   #menuwrap{
      margin-top: 40px;
      margin-left: 70px;
      margin-bottom: 10px;
      width: 1000px;
      height: 38px;
      border-bottom: 1px solid white;
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
/*       float: right; */
   }
   #aTag{
      color: inherit;
      text-decoration: none;
      width: 300px;
      text-align: center;
      float: left;
      text-overflow: ellipsis;
      overflow: hidden;
      white-space: nowrap;
   }
    #pagingwrap{
        float: left;
        margin-left:500px;
        background-color: #131826;
        margin-top: 28px;
    } 
    #write{
       background-color: #0DA66E;
       color: white;
       float: right;
       margin-right: 150px;
       height: 30px;
       width: 60px;
       border-radius: 6px;
       border-color: #0DA66E;
       margin-top: 30px;
    }
    #write:hover {
   opacity: .8;
	}
	.cardTable {
	    min-width: 100%;
		table-layout: fixed;
		background-color: #172036;
		border-radius: 6px;
		padding: 9px;
	}
	.tableHead {
			background-color: #172036;
   		color: #9ca3af;
   		
	}
	.tableGroup {
	    border-top-width: 1px;
		border-color: #172036;
		background-color: #172036;
		text-align: center;
	}
	.listPoster{
		width: 50px;
	}
</style>
</head>
<script type="text/javascript">
	
	
</script>
<body>

    <jsp:include page="/WEB-INF/view/Header.jsp" />
    <c:if test="${not empty searchBoardsResults}">
    <div id="container">
       <div id="headtext">
          Community
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
             <c:forEach var="boardsresult" items="${searchBoardsResults}">
               	<div id="boardContentWrap">
                  <div id="boardNum">${boardsresult.boardNumber}</div>
             	  <div id="boardTitle">${boardsresult.boardTitle}</div>
               
                   <a href='./listOne.do?boardNumber=${boardsresult.boardNumber}' id="aTag">
                      <input type="hidden" name="memberNumber" value= '${boardsresult.memberNumber}'>
                      ${boardsresult.boardContent}
                   </a>
                   
                   <div id="boardMemberId">${boardsresult.memberId}</div>
                   
                   <div id="boardCreDate">
                       <fmt:formatDate pattern="yyyy-MM-dd" value="${boardsresult.boardCreateDate}"/>
                   </div>
                   
                </div>
                <input type="hidden" name="boardNumber" value="${boardsresult.boardNumber}">
        	  </c:forEach>
      </div>
      </div>
	 </c:if>
<%-- 	  <c:if test="${not empty searchBoardsResults}"> --%>
   
   <table class="cardTable" id="Table">
			<thead>
			<c:if test="${not empty searchMoviesResults}">
				<tr class="tableHead">
					<th>영화번호</th>
					<th>포스터</th>
					<th>영화명</th>
					<th>장르</th>
					<th>개봉일</th>
					<th>런타임</th>
					<th>가격</th>
				</tr>
			</c:if>	
			</thead>
	
			<c:forEach var="moviesresult" items="${searchMoviesResults}">
				<tr class="tableGroup">
					<td>${moviesresult.movieNumber}</td>
					<td>
						<a href='../movie/listOne.do?movieNumber=${moviesresult.movieNumber}'>
							<img class="listPoster" alt="포스터" src="${moviesresult.moviePoster}">			
						</a>
					</td>
					<td>
						<div class=movieTitle>
							<a href='../movie/listOne.do?movieNumber=${moviesresult.movieNumber}'>${moviesresult.movieTitle}</a>
						</div>
					</td>
					<td>${moviesresult.genreName}</td>
					<td>${moviesresult.movieReleaseDate}</td>
					<td>${moviesresult.movieRuntime} 분</td>
					<td>${moviesresult.moviePrice} 원</td>
				</tr>
			</c:forEach>
		</table>
   
	
   
<!--    <div id="pagingwrap"> -->
<%--       <jsp:include page="/WEB-INF/view/common/BoardPaging.jsp"> --%>
<%--          <j
		sp:param value="${pagingMap}" name="pagingMap"/> --%>
<%--       </jsp:include> --%>
      
<!--       <form action="./list.do" id='pagingForm' method="post"> -->
<!--          <input type="hidden" id='curPage' name='curPage'  -->
<%--             value="${pagingMap.boardPaging.curPage}"> --%>
<!--       </form> -->
<!--    </div> -->
   
   
   
<%--       <jsp:include page="/WEB-INF/view/Footer.jsp"/> --%>


</body>
</html>