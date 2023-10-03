<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<c:forEach var="historyList1d" items="${historyList2d}">
		<div>${historyList1d[0].orderHistoryNumber}</div>
		
		<c:forEach var="historyList" items="${historyList1d}">
			<div>${historyList.movieTitle}</div>
		</c:forEach>
	</c:forEach>
	
	<div id="pagingwrap">
      <jsp:include page="/WEB-INF/view/common/OrderHistoryPaging.jsp">
         <jsp:param value="${pagingMap}" name="pagingMap"/>
      </jsp:include>
      
      <form action="" id='pagingForm' method="post">
         <input type="hidden" id='curPage' name='curPage' 
            value="${pagingMap.orderHistoryPaging.curPage}">
      </form>
   </div>
   
   
   
</body>
</html>