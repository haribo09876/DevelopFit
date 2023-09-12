<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Footer</title>
<style type="text/css">
	footer{
		bottom: 0px;
		position: absolute;
		height: 100px;
		width: 100%;
	}
	#footer-wrap{
		width: 100%;
		height: 100px;
		color: white;
		border-top: 1px solid white;
	}
	#footer-content-left{
		width: 600px;
		height: 100px;
		display: block;
		margin: 0 auto;
	}
	#footer-logo{
		line-height: 33px;
		float:left;
		width:600px;
		height: 33.3%;
		text-align: center;
		font-size: 20px;
		font-weight: bold;
	}
	#footer-menu{
		width: 600px;
		height: 33.3%;
		font-size: 12px;
		text-align: center;
	}
	#footer-menu1{
		width: 150px;
		height: 33px;
		line-height: 33px;
		float: left;
	}
	#footer-menu2{
		width: 150px;
		height: 33px;
		line-height: 33px;
		float: left;
	}
	#footer-menu3{
		width: 150px;
		height: 33px;
		line-height: 33px;
		float: left;
	}
	#footer-menu4{
		width: 150px;
		height: 33px;
		line-height: 33px;
		float: left;
	}
	#footer-copyright{
		width: 600px;
		height: 33.3%;
		line-height: 33px;
 		text-align: center;
		font-size: 12px;
	}
</style>
</head>
<body>

	<footer>
		<div id="footer-wrap">
			<div id="footer-content-left">
				<div id="footer-logo">LOGO</div><br>
					<div id="footer-menu">
						<div id="footer-menu1">MENU1</div>
						<div id="footer-menu2">MENU2</div>
						<div id="footer-menu3">MENU3</div>
						<div id="footer-menu4">MENU4</div>
					</div>
				<div id="footer-copyright">
					copyright &copy; by DevelopFit All Right.
					서울특별시 서초구 1303-37 서초W타워 13층
				</div>
			</div>
		</div>
	</footer>

</body>
</html>