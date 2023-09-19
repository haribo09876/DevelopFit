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
/* 	width: 1270px; */
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
}

#input-phoneNum {
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
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/view/Header.jsp" />

		<div id="wrap">
			<div id="title">
				<h2>아이디찾기</h2>
			</div>
			<div id="form-wrap">
				<form class="findId-form" name="findIdForm" action="findIdCtr.do"
					method="post">

					<input type="email" name="memberEmail" placeholder="이메일"
						id="input-email" onfocus="this.placeholder=''"
						onblur="this.placeholder='이메일'" onkeyup="enterKey();"><br>

					<input type="text" name="memberPhoneNumber" placeholder="전화번호"
						id="input-phoneNum" onfocus="this.placeholder=''"
						onblur="this.placeholder='전화번호'" onkeyup="enterKey();"><br>

					<input type="button" value="아이디찾기" id="input-btn"
						onclick="check();">
					<div id="findPw" onclick="pageMoveFindPw();">비밀번호 찾기</div>

				</form>
			</div>
		</div>

	<script type="text/javascript">
	var inputEmail = document.getElementById('input-email');
	var inputPhoneNum = document.getElementById('input-phoneNum');
	
	function enterKey(){
		if (window.event.keyCode == 13) {
			check();
		}
	}
	
	function check(){
		var form = document.findIdForm;
		
			if (inputEmail.value === '') {
					alert('이메일를 입력해 주세요.');
					form.memberEmail.focus();
			        return false;
				} else if(inputPhoneNum.value === ''){
					alert('휴대폰 번호를 입력해 주세요.');
					form.memberPhoneNumber.focus();
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