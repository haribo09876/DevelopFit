<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인</title>

</head>

<body>

<jsp:include page="/WEB-INF/view/Header.jsp"/>

	<h3>로그인</h3>
		<input type="text" name="email" placeholder="아이디"><br>
		<input type="password" name="password" placeholder="비밀번호"><br>
		<input type="submit" value="로그인">

</body>
</html>