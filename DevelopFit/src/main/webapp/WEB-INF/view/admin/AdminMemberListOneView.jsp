<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<style type="text/css">
body {
	background-color: #101322;
	color: white;
}

input {
	color: white;
}

input:-webkit-autofill, input:-webkit-autofill:hover, input:-webkit-autofill:focus,
	input:-webkit-autofill:active {
	-webkit-text-fill-color: white;
	-webkit-box-shadow: 0 0 0px 1000px #172036 inset;
	transition: background-color 5000s ease-in-out 0s;
}

input::placeholder {
	color: white;
}
#title{
	width: 256px;
	display: block;
	margin: 0 auto;
	margin-top: 30px;
	text-align: center;
}
#updateForm{
	width: 266px;
	display: block;
	margin: 0 auto;
	margin-top: 50px;
}
#memberName{
	width: 254px;
	height: 40px;
	border: none;
	border-radius: 6px;
	background-color: #172036;
	padding-left: 10px;
}
#memberId{
	width: 254px;
	height: 40px;
	border: none;
	border-radius: 6px;
	background-color: #172036;
	margin-top: 20px;
	padding-left: 10px;
}

#memberEmail{
	width: 254px;
	height: 40px;
	border: none;
	border-radius: 6px;
	background-color: #172036;
	margin-top: 20px;
	padding-left: 10px;
}

#memberPhoneNumber{
	width: 254px;
	height: 40px;
	border: none;
	border-radius: 6px;
	background-color: #172036;
	margin-top: 20px;
	padding-left: 10px;
}

#memberBirthDate{
	width: 256px;
	height: 40px;
	border: none;
	border-radius: 6px;
	background-color: #172036;
	color: white;
	margin-top: 20px;
	padding-left: 10px;
}
#btnList{
	width: 266px;
	height: 30px;
	margin-top: 20px; 
}
#submit{
	width: 120px;
	height: 30px;
	border-radius: 6px;
	border: 1px solid #0E7356;
	background-color: #0E7356;
	float: left;
	margin-left: 24px;
}
#pageBack{
	width: 120px;
	height: 30px;
	border-radius: 6px;
	border: 1px solid #F24141;
	background-color: #F24141;
	float: left;
}

</style>

<script type="text/javascript">
		function pageMoveListFnc() {
			location.href = "./admin.do";
		}
</script>
</head>
<body>

	<jsp:include page="/WEB-INF/view/Header.jsp" />
	<div id="title">
		<h2>회원정보 수정</h2>
	</div>
	<div id="updateForm">
		<form action='./adminUpdateCtr2.do' method='post'>
			<input type="hidden" name='no' id="memberNumber" value='${memberDto.memberNumber}'>
			<input type='text' name='memberName' id="memberName" value='${memberDto.memberName}'><br> 
			<input type='text' name='memberId' id="memberId" value='${memberDto.memberId}'><br> 
			<input type='text' name='memberEmail' id="memberEmail" value='${memberDto.memberEmail}'><br>
			<input type='text' name='memberPhoneNumber' id="memberPhoneNumber" value='${memberDto.memberPhoneNumber}'><br>
			<input type='date' name='memberBirthDate' id="memberBirthDate" value='${memberDto.memberBirthDate}'><br> 
		
		<div id="btnList">
		<input type='button' id="pageBack" value='이전페이지' onclick='pageMoveListFnc();'>
			<input type='submit' id="submit" value='수정하기'> 
			
		</div>
	</form>
	</div>

</body>
</html>
