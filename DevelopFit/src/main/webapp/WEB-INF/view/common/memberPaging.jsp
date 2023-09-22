<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- <script type="text/javascript" src="/SpringHome/resources/js/jquery-3.7.1.js"> -->

<!-- </script> -->

<style type="text/css">
.jqueryTest{
	margin-top: 50px;
}
.numClass{
	width: 50px;
	height: 50px;
	line-height: 50px;
}
nav > ul {
    list-style-type: none;
    padding: 0;
    overflow: hidden;
    background-color: #333333;
    margin-left: auto;
    margin-right: auto;
    width: 200px;
}

nav > ul > li {
   float: left;
   width: 50px;
}

nav > ul > li > a {
    display: block;
    color: white; 
    text-align: center;
    text-decoration: none;
}

nav > ul > li > a:hover { 
     color: white; 
     background-color: #5D5D5D; 
     font-weight: bold; 
 } 
#beforePage{
	width: 50px;
	height: 50px;
	line-height: 50px;
}
#nextPage{
	width: 50px;
	height: 50px;
	line-height: 50px;
}
</style>

<script type="text/javascript">

	function goPage(pageNumber) {
		//자바스크립트
		var curPageObj = document.getElementById('curPage');
		curPageObj.value = pageNumber;
		var pagingFormObj = document.getElementById('pagingForm');
		pagingFormObj.submit();
		
	}

</script>
	<nav class='jqueryTest'>
	
		<ul>
			<c:if test="${pagingMap.memberPaging.prevBlock ne 1}">
				<li id="beforePage">
<!-- 												EL 태그라서 get을 호출하는 매서드이다. -->
					<a href="#" onclick="goPage(${pagingMap.memberPaging.prevBlock});">
						<span>≪</span>
					</a>
				</li>
			</c:if>
			
			<c:forEach var="num" begin="${pagingMap.memberPaging.blockBegin}" 
				end="${pagingMap.memberPaging.blockEnd}">
				<li>
					<a class='numClass' href="#" onclick="goPage(${num})"
						 <c:if test="${num == pagingMap.memberPaging.curPage}">
	               			style="background-color: #0E7356;"
	           			</c:if>>
	           			${num}
	           		</a>
				</li>
			</c:forEach>

			<c:if test="${pagingMap.memberPaging.curBlock < pagingMap.memberPaging.totBlock}">
				<li id="nextPage">
					<a href="#" onclick="goPage(${pagingMap.memberPaging.nextBlock});">
						<span>≫</span>
					</a>
				</li>
			</c:if>

		</ul>
	</nav>
