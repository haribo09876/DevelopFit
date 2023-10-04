<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
* {
   margin: 0;
}

a {
   text-decoration: none;
   color: white;
}

ul {
   list-style: none;
   margin: 0;
}

li {
   float: left;
   width: 180px;
   line-height: 100px;
}

#header {
   width: 100%;
   height: 100px;
   background-color: #101322;
   color: white;
}

#header-content {
   width: 1200px;
   display: block;
   margin: 0 auto;
}

#content-left {
   width: 1000px;
   height: 100px;
   float: left;
}

#logo {
   line-height: 90px;
   float: left;
   width: 200px;
   text-align: center;
   font-size: 26px;
   font-weight: bold;
}
#logo1{
   color: #0E7356;
}
#logo2{
   color: #F24141;
}

#menu {
   width: 800px;
   height: 100px;
   text-align: center;
   float: right;
   font-size: 16px;
}

#content-right {
   width: 200px;
   float: right;
}

#loginout {
   width: 208px;
   text-align: center;
   font-size: 12px;
   margin-top: 30px;
}

#login {
   width: 104px;
   height: 20px;
   float: left;
}

#logout {
   width: 104px;
   height: 20px;
   float: right;
}

#search {
   width: 200px;
   margin-top: 5px;
   border-radius: 5px;
}

#search::placeholder {
   color: black;
}

#menu1:hover, #menu2:hover, #menu3:hover, #menu4:hover {
   color: #F24141;
   text-decoration: underline;
}

#login:hover {
   border-bottom: 1px solid white;
}

#logout:hover {
   border-bottom: 1px solid white;
}
#subMenu{
   width: 1200px;
   height: 50px;
   display: block;
   margin: 0 auto;
}
#submenu1{
   width: 110px;
   height: 50px;
   line-height: 50px;
   text-align: center;
}

</style>
<script>
   function alertFnc(){
      alert("로그인 후 이용 가능합니다.");
   }
   function alertReadyFnc(){
		alert("준비 중입니다.");
	}
</script>

<div id="header">


   <div id="header-content">
   <c:if test="${sessionScope.member.memberId == null }">
      <div id="content-left">
         <div id="logo">
            <a href="../auth/login.do"><span id="logo1">Movie</span><span id="logo2">Market</span></a>
         </div>
         <div id="menu">
            <ul>
               <li><a href="#" id="menu1" onclick="alertFnc();">홈</a></li>
               <li><a href="#" id="menu2" onclick="alertReadyFnc();">추천영화</a></li>
               <li><a href="#" id="menu3" onclick="alertFnc();">영화전체</a></li>
               <li><a href="#" id="menu4" onclick="alertFnc();">커뮤니티</a></li>
            </ul>
         </div>
      </div>
   </c:if>
   
   <c:if test="${sessionScope.member.memberId ne null }">
      <div id="content-left">
         <div id="logo">
            <a href="../movie/list.do"><span id="logo1">Movie</span><span id="logo2">Market</span></a>
         </div>
         <div id="menu">
            <ul>
               <li><a href="../movie/list.do" id="menu1">홈</a></li>
               <li><a href="#" id="menu2"  onclick="alertReadyFnc();">추천영화</a></li>
               <li><a href="#" id="menu3">영화전체</a></li>
               <li><a href="../board/list.do" id="menu4">커뮤니티</a></li>
            </ul>
         </div>
      </div>
   </c:if>
   
   
      <!--       로그인 성공시 -->
      <c:if test="${sessionScope.member.memberId ne null }">
         <div id="content-right">
            <div id="loginout">
               <div id="login">
                  <a href="../member/myPage.do">${member.memberName}</a>
               </div>
               <div id="logout">
                  <a href="<%=request.getContextPath()%>/auth/logout.do">로그아웃</a>
               </div>
            </div>
            <input id="search" type="text" placeholder="검색어를 입력하세요."
               onfocus="this.placeholder=''"
               onblur="this.placeholder='검색어를 입력하세요.'">
         </div>
      </c:if>
      
      

      <!--       로그인전 -->
      <c:if test="${sessionScope.member.memberId == null }">
         <div id="content-right">
            <div id="loginout">
               <div id="login">
                  <a href="../auth/login.do">로그인</a>
               </div>
               <div id="logout">
                  <a href="../member/add.do">회원가입</a>
               </div>
            </div>
            <input id="search" type="text" placeholder="검색어를 입력하세요."
               onfocus="this.placeholder=''"
               onblur="this.placeholder='검색어를 입력하세요.'">
         </div>
      </c:if>
      
      
   </div>

</div>

<c:if test="${sessionScope.member.memberId == 'admin1' }">
   <jsp:include page="/WEB-INF/view/adminHeader.jsp"/>
</c:if>