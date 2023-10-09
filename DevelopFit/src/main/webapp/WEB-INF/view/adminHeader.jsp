<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	#adminHeader{
	}
	#subMenu{
		width: 1000px;
		display: block;
		margin-right: auto;
	}
	.submenu1{
		width: 105px;
	}
	.submenu1-1:hover{
		color: #F24141;
		text-decoration: underline;
	}
</style>
<script>
	
</script>

<div id="adminHeader">

	<div id="subMenu">
		<ul>
			<li class="submenu1"><a href="../member/myPage.do" class="submenu1-1">개인정보</a></li>
			<li class="submenu1"><a href="../order/basket.do" class="submenu1-1">장바구니</a></li>
			<li class="submenu1"><a href="../order/history.do" class="submenu1-1">주문내역</a></li>
			<li class="submenu1"><a href="../board/myList.do" class="submenu1-1">내 게시물</a></li>
			<li class="submenu1"><a href="../member/list.do" class="submenu1-1">전체회원</a></li>
			<li class="submenu1"><a href="../movie/list.do" class="submenu1-1">전체영화</a></li>
			<li class="submenu1"><a href="../board/adminList.do" class="submenu1-1">전체게시물</a></li>
			<li class="submenu1"><a href="../admin/history.do" class="submenu1-1">전체주문내역</a></li>
			<li class="submenu1"><a href="../movie/commentList.do" class="submenu1-1">전체한줄평</a></li>
			</ul>
	</div>

</div>