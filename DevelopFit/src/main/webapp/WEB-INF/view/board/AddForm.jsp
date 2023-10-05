<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AddForm</title>
<style type="text/css">
   body{
      background-color: #101322;
      color: white;
      }
      #title{
         width: 300px;
         display: block;
         margin: 0 auto;
         text-align: center;
         margin-top: 30px;
      }
      #container{
         width: 900px;
         display: block;
         margin: 0 auto;
      }
      #boardTitle{
         width: 900px;
         height: 30px;
         margin-top: 30px;
         border-radius: 6px;
         border: none;
	     background-color: #172036;
	     padding-left: 10px;
	     color: white;
      }
      #content{
         width: 900px;
         height: 400px;
         margin-top: 10px;
         border-radius: 6px;
         border: none;
	     background-color: #172036;
	     padding-left: 10px;
	     color: white;
      }
      #btnList{
         width: 210px;
         height: 42px;
         float: right;
      }
      #submit {
      width: 100px;
      height: 42px;
      margin-top: 20px;
      border-radius: 6px;
      border: 2px solid #0E7356;
      background-color: #0E7356;
      color: white;
      font-size: 14px;
      float: left;
   }
   #pageBack{
      width: 96px;
      height: 38px;
      text-align: center;
      line-height: 38px;
      margin-top: 20px;
      margin-left: 10px;
      border-radius: 6px;
      border: 2px solid #F24141;
      background-color: #F24141;
      color: white;
      font-size: 14px;
      float: right;
   }
</style>
<script type="text/javascript">
   function pageBack(){
      history.back();
   }
	function check() {
		var boardTitleObj = document.getElementById("boardTitle");
		var contentObj = document.getElementById("content");
		
		if (boardTitleObj === null || boardTitleObj.value.trim() === '') {
			alert("제목을 확인해주세요.");
			return false;
		}
		
		if (contentObj === null || contentObj.value.trim() === '') {
			alert("내용을 확인해주세요.");
			return false;
		}
		
		return true;
	}
	
</script>
</head>
<body>
   <jsp:include page="/WEB-INF/view/Header.jsp" />

   <div id="container">
      <div id="title">
   </div>
      <form action='./addCtr.do' id="form" method='post' onsubmit="return check();">
         <input type="hidden" name='memberNumber' id ="memberNumber"
          value= '${member.memberNumber}'>
          
         <input id="boardTitle" type="text" name="boardTitle" 
          value="${boardDto.boardTitle}" placeholder="제목" maxlength="33"><br>
         
         <textarea rows="1" cols="50" name="boardContent" id="content" maxlength="1000" 
         placeholder="내용을 입력해주세요.">
         </textarea>
         
         <div id="btnList">   
            <div id="pageBack" onclick="pageBack();">취소</div>
            <input type="submit" id="submit" value="저장" onclick="return check();"/>
         </div>
      </form>   
      
   </div>   
   
</body>
</html> 