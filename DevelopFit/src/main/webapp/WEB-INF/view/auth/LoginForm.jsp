<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style type="text/css">
body {
	background-color: #101322;
	height: 100%;
	width: 100%;
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

#wrap {
	min-height: 100%;
	position: relative;
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

#input-id {
	width: 346px;
	height: 40px;
	border: none;
	border-radius: 6px;
	background-color: #172036;
	padding-left: 10px;
}

#input-pw {
	width: 346px;
	height: 40px;
	margin-top: 20px;
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

#signup {
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

#signup:hover {
	opacity: .8;
}

#signup-kakao {
	width: 356px;
	height: 40px;
	border: 1px solid #FAE100;
	margin-top: 20px;
	line-height: 40px;
	text-align: center;
	background-color: #FAE100;
	border-radius: 6px;
	font-weight: bold;
	font-size: 16px;
	color: #402121;
}

#signup-kakao:hover {
	opacity: .8;
}

#link-form {
	width: 350px;
	text-align: center;
}

#findId {
	width: 175px;
	height: 30px;
	float: left;
	font-size: 14px;
	color: white;
}

#findId:hover {
	border-bottom: 1px solid white;
}

#findPw {
	width: 175px;
	height: 30px;
	float: right;
	font-size: 14px;
	color: white;
}

#findPw:hover {
	border-bottom: 1px solid white;
}
</style>
</head>

<body>

	<jsp:include page="/WEB-INF/view/Header.jsp" />


	<div id="wrap">
		<div id="title">
			<h2>로그인</h2>
		</div>
		<div id="form-wrap">
			<form class="form-login" name="loginForm" action="loginCtr.do"
				method="post">
				<input type="text" name="memberId" placeholder="아이디" id="input-id" onfocus="this.placeholder=''" 
				onblur="this.placeholder='아이디'" onkeyup="enterKey();"><br> 
				<input type="password" name="memberPassword" placeholder="비밀번호" id="input-pw" onfocus="this.placeholder=''" 
				onblur="this.placeholder='비밀번호'" onkeyup="enterKey();"><br> 
				
				<input type="button" value="로그인" id="input-btn" onclick="check();">

				<div id="signup" onclick="pageMove();">회원가입</div>

				<div id="signup-kakao" onclick="alert('준비 중입니다');return false;">카카오로 회원가입</div>
				<br>

				<div id="link-form">
					<div id="findId" onclick="pageMoveFindId();">아이디 찾기</div>
					<div id="findPw" onclick="pageMoveFindPw();">비밀번호 찾기</div>
				</div>

			</form>
		</div>
	</div>


<%-- 	<jsp:include page="/WEB-INF/view/Footer.jsp" /> --%>

	<script type="text/javascript">
		var inputID = document.getElementById('input-id');
		var inputPW = document.getElementById('input-pw');

		function enterKey() {
			if (window.event.keyCode == 13) {
				check();
			}
		}

		function check() {
			var form = document.loginForm;

			if (inputID.value === '') {
				alert('아이디를 입력해 주세요.');
				form.memberId.focus();
				return false;
			} else if (inputPW.value === '') {
				alert('비밀번호를 입력해 주세요.');
				form.memberPassword.focus();
				return false;
			}
			form.submit();
		}

		function pageMove() {
			location.href = "../member/add.do";
		}

		function pageMoveFindId() {
			location.href = "../member/findId.do";
		}

		function pageMoveFindPw() {
			location.href = "../member/findPw.do";
		}
	</script>
</body>
</html>