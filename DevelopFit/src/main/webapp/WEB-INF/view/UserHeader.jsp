<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	#subMenu{
		width: 1000px;
		display: block;
		margin:auto;
	}
	#submenu1{
		width: 105px;
		margin: auto;
	}
	.submenu1-1:hover{
		color: #F24141;
		text-decoration: underline;
	}
	#sub{
		margin: auto;
		width: 456px;
	}
</style>
<script>
	
</script>

	<div id="subMenu">
		<ul id="sub">
			<li id="submenu1"><a href="#" class="submenu1-1">개인정보</a></li>
			<li id="submenu1"><a href="../order/basket.do" class="submenu1-1">장바구니</a></li>
			<li id="submenu1"><a href="../order/history.do" class="submenu1-1">주문내역</a></li>
			<li id="submenu1"><a href="../board/myList.do" class="submenu1-1">내 게시물</a></li>
			</ul>
	</div>

