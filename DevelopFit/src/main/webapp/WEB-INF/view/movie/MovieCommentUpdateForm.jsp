<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>영화 한줄평 수정</title>
   <style>
      body{
         background-color: #101322;
         color: #FFFFFF;
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
      #title{
         width: 300px;
         display: block;
         margin: 0 auto;
         text-align: center;
         margin-top: 30px;
      }
      #commentForm{
         width: 400px;
         display: block;
         margin: 0 auto;
         margin-top: 30px;
      }
      #content{
         width: 390px;
         height: 150px;
         border: none;
         border-radius: 6px;
         background-color: #172036;
         padding-left: 10px;
      }
      #btnList{
         width: 400px;
         display: block;
         margin: 0 auto;
         margin-top: 20px;
      }
      #pageMoveList{
         width: 120px;
         height: 20px;
         font-size: 14px;
         border: 1px solid #0E7356;
         background-color: #0E7356;
         text-align: center;
         line-height: 20px;
         border-radius: 6px;
         float: left;
         margin-left: 10px;
      }
      #commentUpdate{
         width: 122px;
         height: 22px;
         font-size: 14px;
         border: 1px solid #0E7356;
         background-color: #0E7356;
         text-align: center;
         line-height: 20px;
         border-radius: 6px;
         float: left;
         margin-left: 10px;
      }
      #commentDelete{
         width: 120px;
         height: 20px;
         font-size: 14px;
         border: 1px solid #F24141;
         background-color: #F24141;
         text-align: center;
         line-height: 20px;
         border-radius: 6px;
         float: left;
         margin-left: 10px;
      }
   </style>   
   <script type="text/javascript" src="/SpringHome/resources/js/jquery-3.7.1.js">
   </script>
   <script type="text/javascript">
   </script>
</head>
<body>
   <jsp:include page="/WEB-INF/view/Header.jsp"/>
   <div id='title'>
      <h3>영화 한줄평 수정</h3>
   </div>   
      
   <form action='./commentUpdateCtr.do' method='post' id="commentForm" enctype="multipart/form-data">
      <input type="hidden" name='lineReviewNumber' value='${movieDto.lineReviewNumber}'>
      <input type='text' name='lineReviewContext' id='content' value='${movieDto.lineReviewContext}'><br>
      <div id="btnList">
         <div id="pageMoveList">
            <a href='./commentList.do'>한줄평 목록으로</a>
         </div>
         <div id="commentDelete">
            <a href='./commentDelete.do?lineReviewNumber=${movieDto.lineReviewNumber}'>삭제하기</a>
         </div>
		<input type='submit' value='저장하기' id='commentUpdate'>
      </div>
   </form>

   <jsp:include page="/WEB-INF/view/Footer.jsp" />
</body>
</html>