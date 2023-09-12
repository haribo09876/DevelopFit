<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body{
		background-color: #101322;
		height: 100%;
		color: white;
	}
	input{
		color:white;
	}
	div{
		display: block;
		margin: 0 auto;
	}
	#title{
		width: 400px;
		text-align: center;
		margin-top: 50px;
		color: white;
	}
	#signup-form{
		width: 358px;
		display: block;
		margin: 0 auto;
		margin-top: 50px; 
	}	
	#signup-input-id{
		width: 346px;
		height: 40px;
		border: none;
		border-radius: 6px;
		background-color: #172036;
		padding-left: 10px;
	}
	#signup-input-password{
		width: 346px;
		height: 40px;
		margin-top: 20px;
		border: none;
		border-radius: 6px;
		background-color: #172036;
		padding-left: 10px;
	}
	#signup-input-password-chk{
		width: 346px;
		height: 40px;
		margin-top: 20px;
		border: none;
		border-radius: 6px;
		background-color: #172036;
		padding-left: 10px;
	}
	#signup-input-name{
		width: 346px;
		height: 40px;
		margin-top: 20px;
		border: none;
		border-radius: 6px;
		background-color: #172036;
		padding-left: 10px;
	}
	#signup-input-phonenum{
		width: 346px;
		height: 40px;
		margin-top: 20px;
		border: none;
		border-radius: 6px;
		background-color: #172036;
		padding-left: 10px;
	}
	#signup-input-email{
		width: 346px;
		height: 40px;
		margin-top: 20px;
		border: none;
		border-radius: 6px;
		background-color: #172036;
		padding-left: 10px;
	}
	#input-gender{
		width: 358px;
		height: 40px;
		margin-top: 20px;
		border: none;
		border-radius: 6px;
		background-color: #172036;
		padding-left: 10px;
		color: white;
	}
	#favorite1, #favorite2, #favorite3{
		width: 115px;
		height: 40px;
		margin-top: 20px;
		border: none;
		border-radius: 6px;
		background-color: #172036;
		padding-left: 10px;
		color: white;
	}
	#input-date{
		width: 346px;
		height: 10px;
		margin-top: 20px;
		color: white;
	}
	#date-select{
		width: 250px;
		height: 40px;
		border: none;
		border-radius: 6px;
		background-color: #172036;
		color: white;
		margin-left: 15px;
		padding-left: 11px;
	}
	#signup-btn{
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
	#cancle-btn{
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
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/view/Header.jsp"/>
		<div id="wrap">
			<div id="title"><h2>회원가입</h2></div>
				<div id="signup-form">
					<form action="" name="signUpForm" method="post">
						<input type="text" name="id" placeholder="아이디" onfocus="this.placeholder=''" 
						onblur="this.placeholder='아이디'" id="signup-input-id"><br>
						
						<input type="password" name="password" placeholder="비밀번호" onfocus="this.placeholder=''"
						onblur="this.placeholder='비밀번호'" id="signup-input-password"><br>
						
						<input type="password" name="passwordChk" placeholder="비밀번호 확인" onfocus="this.placeholder=''"
						onblur="this.placeholder='비밀번호 확인'" id="signup-input-password-chk"><br>
						
						<input type="text" name="mname" placeholder="이름"  onfocus="this.placeholder=''"
						onblur="this.placeholder='이름'" id="signup-input-name"><br>
						
						<input type="text" name="phonenum" placeholder="전화번호"  onfocus="this.placeholder=''"
						onblur="this.placeholder='전화번호'" id="signup-input-phonenum"><br>
						
						<input type="email" name="email" placeholder="email"  onfocus="this.placeholder=''"
						onblur="this.placeholder='이메일'" id="signup-input-email"><br>
						
						<select name="gender" id="input-gender">
						    <option value="">성별</option>
						    <option value="액션">남</option>
						    <option value="로맨스">여</option>
						</select>
						<br>
						
						<select name="favorite1" id="favorite1">
						    <option value="">선호장르1</option>
						    <option value="액션">액션</option>
						    <option value="로맨스">로맨스</option>
						    <option value="공포">공포</option>
						    <option value="SF">SF</option>
						</select>
						
						<select name="favorite2" id="favorite2">
						    <option value="">선호장르2</option>
						    <option value="액션">액션</option>
						    <option value="로맨스">로맨스</option>
						    <option value="공포">공포</option>
						    <option value="SF">SF</option>
						</select>
						
						<select name="favorite3" id="favorite3">
						    <option value="">선호장르3</option>
						    <option value="액션">액션</option>
						    <option value="로맨스">로맨스</option>
						    <option value="공포">공포</option>
						    <option value="SF">SF</option>
						</select>
						<br>
						
						<div id="input-date">
						생년월일
						<input type="date" name="birdthDate" id="date-select">
						</div>
						<br>
					
					<input type="button" value="회원가입" id="signup-btn" onclick="check();">
					<input type="button" value="취소" id="cancle-btn" onclick="history_back();">
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
				form.id.focus();
		        return false;
			} else if(inputPw.value === ''){
				alert('비밀번호를 입력해 주세요.');
				form.password.focus();
				return false;
			} else if(!reg_pwd.test(inputPw.value)){
				alert('비밀번호는 영문, 숫자 혼합하여 6~20자리');
				inputPw.value = "";
				form.password.focus();
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
				form.mname.focus();
				return false;
			} else if(!phoneRule.test(inputPhoneNum.value)){
				alert('번호 양식이 맞지 않습니다. '-'을 빼고 입력해주세요.');
				form.phonenum.focus();
				return false;
			} else if(inputPhoneNum.value === ''){
				alert('휴대폰 번호를 입력해 주세요.');
				form.phonenum.focus();
				return false;
			} else if(!exptext.test(inputEmail.value)){
				alert('이메일 양식이 맞지 않습니다.');
				form.email.focus();
				return false;
			} else if(inputEmail.value === ''){
				alert('이메일 입력해 주세요.');
				form.email.focus();
				return false;
			} else if(inputGender.value === ''){
				alert('성별을 입력해 주세요.');
				form.gender.focus();
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
			} else if(inputBirthDate.value === ''){
				alert('생년월일을 입력해 주세요.');
				form.birdthDate.focus();
				return false;
			}
			form.submit();
	}
</script>
</body>
</html>