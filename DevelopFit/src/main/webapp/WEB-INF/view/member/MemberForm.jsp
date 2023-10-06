<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<title>회원가입</title>
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
	border: 1px solid #0E7356;
	background-color: #0E7356;
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
					<div id="idChk" onclick="idChkFnc();">중복확인</div>
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
					<div id="emailChk" onclick="emailChkFnc();">중복확인</div>
				</div>

				<select name="memberGender" id="input-gender">
					<option value="" hidden="">성별</option>
					<option value="M">M</option>
					<option value="F">F</option>
				</select>
				<br>
				<select name="favorite1" id="favorite1">
					<option value="" disabled selected hidden>선호장르1</option>
					<option value="0">없음</option>
					<option value="1">SF</option>
					<option value="2">가족</option>
					<option value="3">공연</option>
					<option value="4">공포(호러)</option>
					<option value="5">기타</option>
					<option value="6">다큐멘터리</option>
					<option value="7">드라마</option>
					<option value="8">멜로/로멘스</option>
					<option value="9">뮤지컬</option>
					<option value="10">미스테리</option>
					<option value="11">범죄</option>
					<option value="12">사극</option>
					<option value="13">서부극(웨스턴)</option>
					<option value="14">스릴러</option>
					<option value="15">애니메이션</option>
					<option value="16">액션</option>
					<option value="17">어드벤쳐</option>
					<option value="18">전쟁</option>
					<option value="19">코미디</option>
					<option value="20">판타지</option>
				</select>
				<select name="favorite2" id="favorite2">
					<option value="" disabled selected hidden>선호장르2</option>
					<option value="0">없음</option>
					<option value="1">SF</option>
					<option value="2">가족</option>
					<option value="3">공연</option>
					<option value="4">공포(호러)</option>
					<option value="5">기타</option>
					<option value="6">다큐멘터리</option>
					<option value="7">드라마</option>
					<option value="8">멜로/로멘스</option>
					<option value="9">뮤지컬</option>
					<option value="10">미스테리</option>
					<option value="11">범죄</option>
					<option value="12">사극</option>
					<option value="13">서부극(웨스턴)</option>
					<option value="14">스릴러</option>
					<option value="15">애니메이션</option>
					<option value="16">액션</option>
					<option value="17">어드벤쳐</option>
					<option value="18">전쟁</option>
					<option value="19">코미디</option>
					<option value="20">판타지</option>
				</select>
				<select name="favorite3" id="favorite3">
					<option value="" disabled selected hidden>선호장르3</option>
					<option value="0">없음</option>
					<option value="1">SF</option>
					<option value="2">가족</option>
					<option value="3">공연</option>
					<option value="4">공포(호러)</option>
					<option value="5">기타</option>
					<option value="6">다큐멘터리</option>
					<option value="7">드라마</option>
					<option value="8">멜로/로멘스</option>
					<option value="9">뮤지컬</option>
					<option value="10">미스테리</option>
					<option value="11">범죄</option>
					<option value="12">사극</option>
					<option value="13">서부극(웨스턴)</option>
					<option value="14">스릴러</option>
					<option value="15">애니메이션</option>
					<option value="16">액션</option>
					<option value="17">어드벤쳐</option>
					<option value="18">전쟁</option>
					<option value="19">코미디</option>
					<option value="20">판타지</option>
				</select>
				<br>
				<div id="input-date">
					생년월일 <input type="date" max="2010-01-01" 
					min="1900-01-01"name="memberBirthDate" id="date-select">
				</div>
				<br> <input type="button" value="회원가입" id="signup-btn"
					onclick="check();"> <input type="button" value="취소"
					id="cancle-btn" onclick="history_back();">
			</form>

		</div>

	</div>

</body>


<script type="text/javascript">
	
	function idChkFnc(){
		var inputMemberIdVal = document.getElementsByName("memberId")[0].value;
		var result = "";
		
		$.ajax({
			type: 'get',
			url: '../idExist.do',
			dataType: 'text',
			data: {
				idChk: inputMemberIdVal,
			},
			success: function (data) {
				if(inputMemberIdVal != ""){
					if(data == inputMemberIdVal){
	                	alert("다른 아이디를 사용해주세요.")
	                } else if(data != inputMemberIdVal){
	                	alert("사용 가능한 아이디입니다.")
	                }
				} else if(inputMemberIdVal == ""){
                	alert("아이디를 입력해 주세요.")
                }
                
            },
            error: function(request, status, error) {
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
		});
	}
	
	function emailChkFnc() {
		var inputMemberEmailVal = document.getElementsByName("memberEmail")[0].value;
		var result = "";
		
		$.ajax({
			type: 'get',
			url: '../emailExist.do',
			dataType: 'text',
			data: {
				emailChk: inputMemberEmailVal,
			},
			success: function (data) {
				if(inputMemberEmailVal != ""){
					if(data == inputMemberEmailVal){
                	alert("다른 이메일을 사용해주세요.")
                	} else if(data != inputMemberEmailVal){
                		alert("사용 가능한 이메일입니다.")
                	}
				} else if(inputMemberEmailVal == ""){
                	alert("이메일을 입력해 주세요.")
                }
            },
            error: function(request, status, error) {
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
		});
	}
	
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


</html>