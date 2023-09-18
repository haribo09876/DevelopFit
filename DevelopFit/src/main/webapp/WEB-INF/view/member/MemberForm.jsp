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

div {
	display: block;
	margin: 0 auto;
}

#wrap {
	min-height: 100%;
	position: relative;
}

#title {
	width: 400px;
	text-align: center;
	margin-top: 50px;
	color: white;
}

#signup-form {
	width: 358px;
	height: 900px;
	display: block;
	margin: 0 auto;
	margin-top: 50px;
}

#idSection {
	width: 358px;
	height: 42px;
}

#signup-input-id {
	width: 254px;
	height: 40px;
	border: none;
	border-radius: 6px;
	background-color: #172036;
	padding-left: 10px;
	float: left;
}

#idChk {
	width: 80px;
	height: 21px;
	margin-top: -10px;
	font-size: 12px;
	color: white;
	float: left;
	margin-left: 10px;
	border-radius: 6px;
	border: 1px solid #0E7356;
	background-color: #0E7356;
	text-align: center;
	line-height: 21px;
}

#idChk:hover {
	opacity: .9;
}

#signup-input-password {
	width: 346px;
	height: 40px;
	margin-top: 20px;
	border: none;
	border-radius: 6px;
	background-color: #172036;
	padding-left: 10px;
}

#signup-input-password-chk {
	width: 346px;
	height: 40px;
	margin-top: 20px;
	border: none;
	border-radius: 6px;
	background-color: #172036;
	padding-left: 10px;
}

#signup-input-name {
	width: 346px;
	height: 40px;
	margin-top: 20px;
	border: none;
	border-radius: 6px;
	background-color: #172036;
	padding-left: 10px;
}

#signup-input-phonenum {
	width: 346px;
	height: 40px;
	margin-top: 20px;
	border: none;
	border-radius: 6px;
	background-color: #172036;
	padding-left: 10px;
}

#idSection {
	width: 358px;
	height: 42px;
}

#signup-input-email {
	width: 254px;
	height: 40px;
	border: none;
	border-radius: 6px;
	background-color: #172036;
	margin-top: 20px;
	padding-left: 10px;
	float: left;
}

#emailChk {
	width: 80px;
	height: 21px;
	font-size: 12px;
	margin-top: 10px; color : white;
	float: left;
	margin-left: 10px;
	border-radius: 6px;
	border: 1px solid #F24141;
	background-color: #F24141;
	text-align: center;
	line-height: 21px;
	color: white;
}

#emailChk:hover {
	opacity: .8;
}

#input-gender {
	width: 358px;
	height: 40px;
	margin-top: 20px;
	border: none;
	border-radius: 6px;
	background-color: #172036;
	padding-left: 10px;
	color: white;
}

#favorite1, #favorite2, #favorite3 {
	width: 115px;
	height: 40px;
	margin-top: 20px;
	border: none;
	border-radius: 6px;
	background-color: #172036;
	padding-left: 10px;
	color: white;
}

#input-date {
	width: 346px;
	height: 10px;
	margin-top: 20px;
	color: white;
}

#date-select {
	width: 250px;
	height: 40px;
	border: none;
	border-radius: 6px;
	background-color: #172036;
	color: white;
	margin-left: 15px;
	padding-left: 11px;
}

#signup-btn {
	width: 358px;
	height: 42px;
	margin-top: 40px;
	border-radius: 6px;
	border: 2px solid #0E7356;
	background-color: #0E7356;
	color: white;
	font-weight: bold;
	font-size: 16px;
}

#signup-btn:hover {
	opacity: .9;
}

#cancle-btn {
	width: 358px;
	height: 42px;
	margin-top: 20px;
	border-radius: 6px;
	border: 2px solid #F24141;
	background-color: #F24141;
	color: white;
	font-weight: bold;
	font-size: 16px;
}

#cancle-btn:hover {
	opacity: .9;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/view/Header.jsp" />
	<div id="wrap">
		<div id="title">
			<h2>회원가입</h2>
		</div>
		<div id="signup-form">
			<form action='./addCtr.do' name="signUpForm" method="post">
				<div id="idSection">
					<input type="text" name="memberId" placeholder="아이디"
						onfocus="this.placeholder=''" onblur="this.placeholder='아이디'"
						id="signup-input-id"><br>
					<div id="idChk">중복확인</div>
				</div>

				<input type="password" name="memberPassword" placeholder="비밀번호"
					onfocus="this.placeholder=''" onblur="this.placeholder='비밀번호'"
					id="signup-input-password"><br> <input type="password"
					name="passwordChk" placeholder="비밀번호 확인"
					onfocus="this.placeholder=''" onblur="this.placeholder='비밀번호 확인'"
					id="signup-input-password-chk"><br> <input type="text"
					name="memberName" placeholder="이름" onfocus="this.placeholder=''"
					onblur="this.placeholder='이름'" id="signup-input-name"><br>

				<input type="text" name="memberPhoneNumber" placeholder="전화번호"
					onfocus="this.placeholder=''" onblur="this.placeholder='전화번호'"
					id="signup-input-phonenum"><br>

				<div id="emailSection">
					<input type="email" name="memberEmail" placeholder="email"
						onfocus="this.placeholder=''" onblur="this.placeholder='이메일'"
						id="signup-input-email"><br>
					<div id="emailChk">중복확인</div>
				</div>

				<select name="memberGender" id="input-gender">
					<option value="" hidden="">성별</option>
					<option value="M">M</option>
					<option value="F">F</option>
				</select> <br> <select name="favorite1" id="favorite1">
					<option value="" hidden="">선호장르1</option>
					<option value="액션">액션</option>
					<option value="로맨스">로맨스</option>
					<option value="공포">공포</option>
					<option value="SF">SF</option>
				</select> <select name="favorite2" id="favorite2">
					<option value="" hidden="">선호장르2</option>
					<option value="액션">액션</option>
					<option value="로맨스">로맨스</option>
					<option value="공포">공포</option>
					<option value="SF">SF</option>
				</select> <select name="favorite3" id="favorite3">
					<option value="" hidden="">선호장르3</option>
					<option value="액션">액션</option>
					<option value="로맨스">로맨스</option>
					<option value="공포">공포</option>
					<option value="SF">SF</option>
				</select> <br>

				<div id="input-date">
					생년월일 <input type="date" name="memberBirthDate" id="date-select">
				</div>
				<br> <input type="button" value="회원가입" id="signup-btn"
					onclick="check();"> <input type="button" value="취소"
					id="cancle-btn" onclick="history_back();">
			</form>

		</div>

	</div>


	<script type="text/javascript">
	function pageMove(){
		location.href = "../member/add.do";
	}
	
	function history_back(){
		history.back();
	}
	
	var inputID = document.getElementById('signup-input-id');
	var inputPw = document.getElementById('signup-input-password');
	var inputPwChk = document.getElementById('signup-input-password-chk');
	var inputName = document.getElementById('signup-input-name');
	var inputPhoneNum = document.getElementById('signup-input-phonenum');
	var inputEmail = document.getElementById('signup-input-email');
	var inputGender = document.getElementById('input-gender');
	var inputFov1 = document.getElementById('favorite1');
	var inputFov2 = document.getElementById('favorite2');
	var inputFov3 = document.getElementById('favorite3');
	var inputBirthDate = document.getElementById('date-select');
	var reg_pwd = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
	var phoneRule = /^(01[016789]{1})[0-9]{3,4}[0-9]{4}$/;
	var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	
	
	function check(){
		
		var form = document.signUpForm;
			
			if (inputID.value === '') {
				alert('아이디를 입력해 주세요.');
				form.memberId.focus();
		        return false;
			} else if(inputPw.value === ''){
				alert('비밀번호를 입력해 주세요.');
				form.memberPassword.focus();
				return false;
			} else if(!reg_pwd.test(inputPw.value)){
				alert('비밀번호는 영문, 숫자 혼합하여 6~20자리');
				inputPw.value = "";
				form.memberPassword.focus();
				return false;
			} else if(inputPwChk.value === ''){
				alert('비밀번호를 재입력해 주세요.');
				form.passwordChk.focus();
				return false;
			} else if(inputPw.value != inputPwChk.value){
				alert('비밀번호가 맞지 않습니다.');
				form.passwordChk.focus();
				return false;
			} else if(inputName.value === ''){
				alert('이름을 입력해 주세요.');
				form.memberName.focus();
				return false;
			} else if(!phoneRule.test(inputPhoneNum.value)){
				alert('번호 양식이 맞지 않습니다. '-'을 빼고 입력해주세요.');
				form.memberPhoneNumber.focus();
				return false;
			} else if(inputPhoneNum.value === ''){
				alert('휴대폰 번호를 입력해 주세요.');
				form.memberPhoneNumber.focus();
				return false;
			} else if(!exptext.test(inputEmail.value)){
				alert('이메일 양식이 맞지 않습니다.');
				form.memberEmail.focus();
				return false;
			} else if(inputEmail.value === ''){
				alert('이메일 입력해 주세요.');
				form.memberEmail.focus();
				return false;
			} else if(inputGender.value === ''){
				alert('성별을 입력해 주세요.');
				form.memberGender.focus();
				return false;
			} else if(inputFov1.value === ''){
				alert('선호장르를 입력해 주세요.');
				form.favorite1.focus();
				return false;
			} else if(inputFov2.value === ''){
				alert('선호장르를 입력해 주세요.');
				form.favorite2.focus();
				return false;
			} else if(inputFov3.value === ''){
				alert('선호장르를 입력해 주세요.');
				form.favorite3.focus();
				return false;
			} 
			else if(inputBirthDate.value === ''){
				alert('생년월일을 입력해 주세요.');
				form.memberBirthDate.focus();
				return false;
			}
			form.submit();
	}
</script>
</body>
</html>