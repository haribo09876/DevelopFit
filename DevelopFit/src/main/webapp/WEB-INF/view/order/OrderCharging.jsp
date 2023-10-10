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
// 		var inputMoneyVal = document.getElementById("inputMoney").value;
// 		var submitInputMoneyVal = document.getElementById("submitInputMoney").value;
		
// 		submitInputMoneyVal = parseInt(inputMoneyVal);
		
// 		if(Number.isNaN(submitInputMoneyVal)){
// 			alert("숫자를 입력해주세요.");
// 		} else if(submitInputMoneyVal < 10){
// 			alert("10이상의 숫자를 입력해주세요.")
// 		} else {
			
// 		}
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
		background-color: #0E7356;
		border-radius: 5px;
		text-align: center;
		cursor: pointer;
		border: 0px;
	}
	button:hover {
	  	opacity: .8;
	}
</style>


</head>
<body>
	
	
	<div>
		<h1>
			충전금액
		</h1>
		
		<form action="./chargingCtr.do" method="post" id="formTag">
			<label><input type="radio" value="5000" name="chargingMoney">5000원</label>
			<label><input type="radio" value="10000" name="chargingMoney">10000원</label>
			<label><input type="radio" value="20000" name="chargingMoney">20000원</label>
			<br>
			<label><input type="radio" value="30000" name="chargingMoney">30000원</label>
			<label><input type="radio" value="50000" name="chargingMoney">50000원</label>
<!-- 			<label><input type="radio" value="" name="chargingMoney" id="submitInputMoney"></label> -->
		</form>
		
<!-- 		<input type="text" placeholder="직접입력" value="" id="inputMoney"> -->
		<button type="button" id="chargeBtn" onclick="chargeFnc();">충전하기</button>
		
		
	</div>
	
	
	
	
</body>
</html>