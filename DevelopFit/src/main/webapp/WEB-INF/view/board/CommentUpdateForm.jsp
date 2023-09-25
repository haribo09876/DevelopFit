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
   
   window.onload = function () {
	   var originalString = "${commentDto.commentContent}";
	   var trimmedString = originalString.trim();
	   var con = document.getElementById("content");
	   con.innerHTML = trimmedString;
}
</script>
</head>
<body>
   <jsp:include page="/WEB-INF/view/Header.jsp" />

   <div id="container">
      <div id="title">
            <h2>댓글수정</h2>
   </div>
      <form action='./commentUpdateCtr.do' id="form" method='post'>
         <input type="hidden" name='commentNumber' value='${commentDto.commentNumber}'>
         <input type="hidden" name='memberNumber' value= '${member.memberNumber}'>
         <input type="hidden" name="boardNumber" value="${commentDto.boardNumber}">
         <textarea rows="1" cols="50" name="commentContent" id="content" 
         placeholder="${commentDto.commentContent}">>${commentDto.commentContent}</textarea>
         <div id="btnList">   
         <div id="pageBack" onclick="pageBack();">취소</div>
         <input type="submit" id="submit" value="저장" />
            
         </div>
      </form>   
      
   </div>   
   
</body>
</html> 