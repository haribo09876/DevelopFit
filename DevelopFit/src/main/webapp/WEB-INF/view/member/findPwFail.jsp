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
}

div {
	display: block;
	margin: 0 auto;
}

input {
	font-size: 14px;
	color: white;
}

input::placeholder {
	color: white;
}

input:-webkit-autofill, input:-webkit-autofill:hover, input:-webkit-autofill:focus,
	input:-webkit-autofill:active {
	-webkit-text-fill-color: white;
	-webkit-box-shadow: 0 0 0px 1000px #172036 inset;
	transition: background-color 5000s ease-in-out 0s;
}

a {
	text-decoration: none;
	color: black;
}

#title {
	width: 400px;
	text-align: center;
	margin-top: 100px;
	color: white;
}

#form-wrap {
	width: 358px;
	display: block;
	margin: auto;
	margin-top: 50px;
}

#input-email {
	width: 346px;
	height: 40px;
	border: none;
	border-radius: 6px;
	background-color: #172036;
	padding-left: 10px;
	margin-top: 20px;
}

#input-id {
	width: 346px;
	height: 40px;
	border: none;
	border-radius: 6px;
	background-color: #172036;
	padding-left: 10px;
}

#input-btn {
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

#input-btn:hover {
	opacity: .8;
}

#findPw {
	width: 356px;
	height: 40px;
	border: 1px solid #F24141;
	margin-top: 20px;
	line-height: 40px;
	text-align: center;
	background-color: #F24141;
	border-radius: 6px;
	font-weight: bold;
	font-size: 16px;
	color: white;
}

#findPw:hover {
	opacity: .8;
}

#loginBtn {
	width: 356px;
	height: 40px;
	border: 1px solid #F24141;
	margin-top: 20px;
	line-height: 40px;
	text-align: center;
	background-color: #F24141;
	border-radius: 6px;
	font-weight: bold;
	font-size: 16px;
	color: white;
}

#loginBtn:hover {
	opacity: .8;
}
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/view/Header.jsp" />

	<div id="wrap">
		<div id="wrap">
			<div id="title">
				<h2>비밀번호 찾기</h2>
			</div>
			<div id="form-wrap">
				<form class="findPw-form" name="findPwForm" action="findPwCtr.do"
					method="post">

					<input type="text" name="memberId" placeholder="아이디" id="input-id"
						onfocus="this.placeholder=''" onblur="this.placeholder='아이디'"
						onkeyup="enterKey();"><br> <input type="email"
						name="memberEmail" placeholder="이메일" id="input-email"
						onfocus="this.placeholder=''" onblur="this.placeholder='전화번호'"
						onkeyup="enterKey();"><br> <input type="button"
						value="비밀번호 찾기" id="input-btn" onclick="check();">
					<div id="loginBtn" onclick="pageMoveLogin();">로그인</div>

					<div id="signup" onclick="pageMove();">회원가입</div>

				</form>
			</div>
		</div>
	</div>

	<script type="text/javascript">

	alert("유효하는 회원정보가 없습니다.\n확인 후 다시 입력해주세요.");

	function pageMoveLogin(){
		location.href = "../auth/login.do";
	}
	
	var inputId = document.getElementById('input-id');
	var inputEmail = document.getElementById('input-email');
	
	function enterKey(){
		if (window.event.keyCode == 13) {
			check();
		}
	}
	
	function check(){
		var form = document.findPwForm;
		
			if (inputId.value === '') {
					alert('아이디를 입력해 주세요.');
					form.memberId.focus();
			        return false;
				} else if(inputEmail.value === ''){
					alert('이메일을 입력해 주세요.');
					form.memberEmail.focus();
					return false;
				} 
				form.submit();
			}
	function pageMoveFindPw(){
		location.href = "../member/findPw.do";
	}

</script>
</body>
</html>