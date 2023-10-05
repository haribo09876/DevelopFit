<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	background-color: #101322;
	height: 100%;
	color: white;
}
input:-webkit-autofill, input:-webkit-autofill:hover, input:-webkit-autofill:focus,
	input:-webkit-autofill:active {
	-webkit-text-fill-color: white;
	-webkit-box-shadow: 0 0 0px 1000px #172036 inset;
	transition: background-color 5000s ease-in-out 0s;
}

input{
	color: white;
}
#title {
	width: 400px;
	text-align: center;
	margin: auto;
	margin-top: 100px;
	color: white;
	display: block;
}
#subTitle{
	margin-top: 30px;
}
#memberUpdateForm{
	width: 346px;
	display: block;
	margin: 0 auto;
}
#updateName{
	width: 346px;
	height: 40px;
	margin-top: 20px;
	border: none;
	border-radius: 6px;
	background-color: #172036;
	padding-left: 10px;
}
#updateId{
	width: 346px;
	height: 40px;
	margin-top: 20px;
	border: none;
	border-radius: 6px;
	background-color: #172036;
	padding-left: 10px;
}
#updateEmail{
	width: 346px;
	height: 40px;
	margin-top: 20px;
	border: none;
	border-radius: 6px;
	background-color: #172036;
	padding-left: 10px;
}
#updatePhoneNumber{
	width: 346px;
	height: 40px;
	margin-top: 20px;
	border: none;
	border-radius: 6px;
	background-color: #172036;
	padding-left: 10px;
}
#updatePW{
	width: 346px;
	height: 40px;
	margin-top: 20px;
	border: none;
	border-radius: 6px;
	background-color: #172036;
	padding-left: 10px;
}
#updateBirthDate{
	width: 346px;
	height: 40px;
	margin-top: 20px;
	border: none;
	border-radius: 6px;
	background-color: #172036;
	padding-left: 10px;
}
#updateBtn{
	width: 358px;
	height: 42px;
	margin-top: 20px;
	border-radius: 6px;
	border: 2px solid #0E7356;
	background-color: #0E7356;
	color: white;
	font-weight: bold;
	font-size: 16px;
}

</style>
<script type="text/javascript">
	
function check() {
	var form = document.updateForm;

	if (updatePW.value === '${member.memberPassword}') {
		alert('수정이 완료되었습니다.')
		form.submit();
	} else if (updatePW.value != '${member.memberPassword}') {
		alert('비밀번호를 확인해주세요.');
		return false;
	}
}
	
</script>
</head>
<body>

	<jsp:include page="/WEB-INF/view/Header.jsp" />

	<div id="myPage">
		<div id="title">
			<h2>마이페이지</h2><br>
			<h4 id="subTitle">정보수정</h4>
		</div>
		
		<div id="memberUpdateForm">
			<form action='./updateCtr.do' name='updateForm' method='post'>
				<input type='hidden' name='memberNumber' value='${member.memberNumber}' readonly>
				<input type='text' name='memberName' id="updateName" value='${member.memberName}' readonly><br>
				<input type='text' name='memberId' id="updateId" value='${member.memberId}' readonly><br>
				<input type="email" name='memberEmail' id="updateEmail" value='${member.memberEmail}' readonly><br>
				<input type='text' name='memberPhoneNumber' id="updatePhoneNumber" value='${member.memberPhoneNumber}'><br>
				<input type='date' name='memberBirthDate' id="updateBirthDate" value='${member.memberBirthDate}'><br>
				<input type='text' name='memberMoney' id="updateMoney" value='${member.memberMoney}' readonly><br>
				<input type="password" name="memberPassword" id="updatePW" placeholder="비밀번호를 입력해주세요." onfocus="this.placeholder=''"
							onblur="this.placeholder='비밀번호를 입력해주세요.'" value="" required="required"><br>
				<input type="button" value="수정하기" id="updateBtn" onclick="check();">
			</form>	
		</div>

	</div>


</body>
</html>