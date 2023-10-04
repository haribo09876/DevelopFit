<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>충전</title>

<script type="text/javascript">
	function chargeFnc() {
		var chargeBtnObj = document.getElementById("chargeBtn");
		var formObj = document.getElementById("formTag");
		
		formObj.submit();
		
		
	}
</script>

<style type="text/css">
	label {
		font-size: 20px;
	}
	
	#chargeBtn {
		width: 200px;
		height: 35px;
		line-height: 35px;
		font-size: 20px;
		background-color: #0DA66E;
		border-radius: 5px;
		text-align: center;
		cursor: pointer;
		border: 0px;
	}
</style>


</head>
<body>
	
	
	<div>
		<h1>
			충전금액
		</h1>
		
		<form action="./chargingCtr.do" method="post" id="formTag">
			<label><input type="radio" value="10000" name="chargingMoney">10000원</label>
			<label><input type="radio" value="20000" name="chargingMoney">20000원</label><br>
			<label><input type="radio" value="30000" name="chargingMoney">30000원</label>
			<label><input type="radio" value="50000" name="chargingMoney">50000원</label><br>
			
			<input type="button" value="충전하기" id="chargeBtn" onclick="chargeFnc();">
		</form>
		
		
	</div>
	
	
	
	
</body>
</html>