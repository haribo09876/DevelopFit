<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	*{
		margin: 0;
	}
	a{
		text-decoration: none;
		color: white;
	}
	ul{
		list-style: none;
		margin: 0;
	}
	li{
		float: left;
		width: 180px;
		line-height: 100px;
	}
	#header{
		width: 100%;
		height: 100px;
		background-color: #101322;
		color: white;
	}
	#header-content{
		width: 1200px;
		display: block;
		margin: 0 auto;
	}
	#content-left{
		width: 1000px;
		height: 100px;
		float: left;
	}
	#logo{
		line-height: 100px;
		float:left;
		width:200px;
		text-align: center;
		font-size: 24px;
		font-weight: bold;
	}
	#menu{
		width: 800px;
		height: 100px;
		text-align: center;
		float: right;
	}
	#content-right{
		width: 200px;
		float: right;
	}
	#loginout{
		width: 200px;
		text-align: center;
		font-size: 12px;
		margin-top: 30px;
	}
	#login{
		width: 100px;
		height: 20px;
		float:left;
	}
	#logout{
		width: 100px;
		height: 20px;
		float:right;
	}
	#search{
		width: 200px;
		margin-top: 5px;
		border-radius: 5px;
	}
	#menu1:hover, #menu2:hover, #menu3:hover, #menu4:hover{
		color:#F24141;
	}
	#login:hover{
		border-bottom: 1px solid white;
	}
	#logout:hover{
		border-bottom: 1px solid white;
	}
</style>  

<div id="header">

	<div id="header-content">
		<div id="content-left">
			<div id="logo">LOGO</div>
			<div id="menu">
				<ul>
					<li><a href="#" id="menu1">MENU1</a></li>
					<li><a href="#" id="menu2">MENU2</a></li>
					<li><a href="#" id="menu3">MENU3</a></li>
					<li><a href="#" id="menu4">MENU4</a></li>
				</ul>
			</div>
		</div>	
		
		<div id="content-right">
			<div id="loginout">
				<div id="login">
					<a href="../auth/login.do">로그인</a>
				</div>
				<div id="logout">
					<a href="../member/add.do">회원가입</a>
				</div>
			</div>
			<input id="search" type="text" placeholder="검색어를 입력하세요.">
		</div>
	</div>
	
</div>