<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 취소</title>

<style type="text/css">

body{
	background-color: #131826;
	color: white;
}

#productWrap {
	width: 900px;
	height: 300px;
	margin: 30px auto;
}


#productDetail {
	width: 900px;
	height: 200px;
	background-color: #172036;
	border-radius: 10px;
	padding: 30px;
}





#cancelWrap {
	width: 300px;
	margin: 0px auto;
}


</style>
</head>
<body>
	
	<jsp:include page="/WEB-INF/view/Header.jsp"/>
	
	<div id="productWrap">
		<div id="productInfo">
			<h1>상품정보</h1>
		</div>
		<div id="productDetail">
			<img src="https://i.namu.wiki/i/m6l0w2CgAGQrxSKy7rrcLB261rrMO-oq04ZCnS-wEU5sNqq8rR-gG2Zki_HloDFgP7gdfM_IoQK_m19OGqJKjw.webp" style="width:120px; float: left;"/>
			<p>영화명</p>
			<p>가격</p>
		</div>
	</div>
	
	
	
	
	<div id="cancelWrap">
		<h3>취소 사유</h3>
		
		<select name="reason">
			<option selected="selected" hidden="">선택</option>
			<option value="">사유 1</option>
			<option value="">사유 2</option>
			<option value="">사유 3</option>
			<option value="">사유 4</option>
			<option value="">직접 입력</option>
		</select>
	</div>
	
	
	
</body>
</html>