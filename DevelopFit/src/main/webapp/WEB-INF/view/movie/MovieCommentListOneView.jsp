<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>영화 한줄평 상세</title>
   <style>
      body{
         background-color: #101322;
         color: white;
      }
      #title{
         width: 266px;
         display: block;
         margin: 0 auto;
         text-align: center;
         margin-top: 30px;
      }
      #thirdSectionDiv{
         width: 400px;
         display: block;
         margin: 0 auto;
         text-align: center;
         margin-top: 30px;
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
   <script type="text/javascript">
   </script>
</head>
<body>
   <jsp:include page="/WEB-INF/view/Header.jsp"/>
   
   <div id="title">
      <h3>영화 한줄평 상세</h3>
   </div>
      <div id="thirdSectionDiv">
          <input type="hidden" name='lineReviewNumber' value='${movieDto.lineReviewNumber}'>
          <input type="hidden" name='memberId' value='${movieDto.memberId}'>  
         <p>
            한줄평 번호 :   ${movieDto.lineReviewNumber}
         </p>
         <p>
            한줄평 내용 :   ${movieDto.lineReviewContext}
         </p>
         <p>
            회원 아이디 :   ${movieDto.memberId}
         </p>
         <p>
            영화 이름 :   ${movieDto.movieTitle}
         </p>
      </div>
      
      <div id="btnList">
         <div id="pageMoveList">
            <a href='./commentList.do'>한줄평 목록으로</a>
         </div>
         <div id="commentUpdate">
            <a href='./commentUpdate.do?lineReviewNumber=${movieDto.lineReviewNumber}'>수정</a>
         </div>
         <div id="commentDelete">
            <a href='./commentDelete.do?lineReviewNumber=${movieDto.lineReviewNumber}'>삭제하기</a>
         </div>
      </div>

   <jsp:include page="/WEB-INF/view/Footer.jsp" />
</body>
</html>