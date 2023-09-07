<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	ul{
		list-style: none;
		margin: 0;
	}
	li{
		float: left;
		width: 150px;
		line-height: 150px;
	}
	#header{
		width: 100%;
		height: 150px;
		background-color: orange;
	}
	#header-content{
		width: 1200px;
		display: block;
		margin: 0 auto;
	}
	#content-left{
		width: 1000px;
		height: 150px;
		float: left;
	}
	#logo{
		line-height: 150px;
		float:left;
		width:200px;
		text-align: center;
	}
	#menu{
		width: 800px;
		height: 150px;
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
		margin-top: 50px;
	}
	#login{
		width: 100px;
		float:left;
	}
	#logout{
		width: 100px;
		float:right;
	}
	#search{
		width: 200px;
		margin-top: 10px;
	}
</style>  

<div id="header">

	<div id="header-content">
		<div id="content-left">
			<div id="logo">LOGO</div>
			<div id="menu">
				<ul>
					<li>MENU1</li>
					<li>MENU2</li>
					<li>MENU3</li>
					<li>MENU4</li>
				</ul>
			</div>
		</div>	
		
		<div id="content-right">
			<div id="loginout">
				<div id="login">
					로그인
				</div>
				<div id="logout">
					회원가입
				</div>
			</div>
			<input id="search" type="text" placeholder="검색어를 입력하세요.">
		</div>
	</div>
	
</div>