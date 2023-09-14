<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
	
	
</style>
</head>
<body>
	
	<jsp:include page="/WEB-INF/view/Header.jsp"/>
	
	이름 : ${member.memberName}<br>
	번호 : ${member.memberNumber}<br>
	아이디 : ${member.memberId}<br>
	비밀번호 : ${member.memberPassword}<br>
	이메일 : ${member.memberEmail}<br>
	생년월일 : ${member.memberBirthDate}<br>
	휴대폰번호 : ${member.memberPhoneNumber}<br>
	성별 : ${member.memberGender}<br>
	생성일 : ${member.memberCreateDate}<br>
	수정일 : ${member.memberModifyDate}
	
</body>
</html>