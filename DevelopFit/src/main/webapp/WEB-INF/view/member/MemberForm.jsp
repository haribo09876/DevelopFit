<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/view/Header.jsp"/>

		<div id="title"><h2>회원가입</h2></div>
			<div id="form-wrap">
				<form class="form-signUp" name="loginForm" action="./login" method="post">
					<input type="text" name="name" placeholder="이름" id="input-name"><br>
					<input type="email" name="name" placeholder="이메일" id="input-email"><br>
					<input type="text" name="name" placeholder="이름" id="input-name"><br>
					<input type="button" value="취소" id="input-btn" onclick="check();">
					<input type="button" value="회원가입" id="input-btn" onclick="check();">
					<div id="signup" onclick="pageMove();">회원가입</div>
					<div id="signup-kakao"><a href="#">카카오로 회원가입</a></div><br>
					<div id="link-form">
						<div id="findId"><a href="#">아이디 찾기</a></div>
						<div id="findPw"><a href="#">비밀번호 찾기</a></div>
					</div>
				</form> 
			</div>
			
<script type="text/javascript">
	function pageMove(){
		location.href = "../member/add.do";
	}
</script>
</body>
</html>