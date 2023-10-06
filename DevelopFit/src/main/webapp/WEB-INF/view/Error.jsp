<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다시 한번 확인해주세요.</title>

<script type="text/javascript">
	function prevFnc() {
		history.back();
		
	}
	
	
	function homeFnc() {
		location.href = "../auth/login.do";
	}
	
</script>

<style type="text/css">
	body {
		background-color: #101322;
		color: white
	}
	
	
	#contentWrap {
		width: 800px;
		height: 200px;
		margin: 200px auto 0px;
	}
	
	#btnWrap {
		width: 800px;
  		margin: 0px auto;
	}
	#prevPageBtn {
		width: 150px;
	    height: 35px;
	    font-size: 20px;
	    background-color: #f24141;
	    border-radius: 5px;
	    text-align: center;
	    padding-top: 8px;
	    display: inline-block;
	    cursor: pointer;
	}
	
	#mainPageBtn {
		width: 150px;
	    height: 35px;
	    font-size: 20px;
	    background-color: #0DA66E;
	    border-radius: 5px;
	    text-align: center;
	    padding-top: 8px;
	    display: inline-block;
	    cursor: pointer;
	}
</style>
</head>
<body>
	
	<div id="contentWrap">
		
		<div>
			<h2>다시 한번 확인해주세요!</h2>
		</div>
		
		<div>
			<a>
				지금 입력하신 주소의 페이지는<br>
				사라졌거나 다른 페이지로 변경되었습니다.<br>
				주소를 다시 확인해주세요.
			</a>
		</div>
		
	</div>
	
	
	
	
	
	<div id="btnWrap">
		
		<div id="prevPageBtn" onclick="prevFnc();">
			<a>이전 페이지</a>
		</div>
		
		<div id="mainPageBtn" onclick="homeFnc();">
			<a>홈으로</a>
		</div>
		
	</div>
	
	
	
	
</body>
</html>