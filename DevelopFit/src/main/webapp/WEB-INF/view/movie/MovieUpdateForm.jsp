<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>영화 수정</title>
   <style>
      body{
         background-color: #101322;
         color: white;
      }
      #title{
         width: 400px;
         display: block;
         margin: 0 auto;
         text-align: center;
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
      #movieUpdateForm{
         width: 400px;
         display: block;
         margin: 0 auto;
      }
      #movieTitle, #movieSummary, #movieReleaseDate, #movieRuntime, #moviePrice, #moviePoster, #moviePreview{
          width: 390px;
         height: 50px;
         border: none;
         border-radius: 6px;
         background-color: #172036;
         padding-left: 10px;
         margin-bottom: 20px;
      }
      #btnList{
         width: 400px;
         display: block;
         margin: 0 auto;
         margin-top: 20px;
         margin-top: 5px;
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
      #updateMovieForm{
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
      #deleteBtn{
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
      #pageMoveList:hover, #updateMovieForm:hover, #deleteBtn:hover{
         opacity: .8;
      }
   </style>   
   <script type="text/javascript" src="/SpringHome/resources/js/jquery-3.7.1.js">
   </script>
   <script type="text/javascript">
   </script>
</head>
<body>
   <jsp:include page="/WEB-INF/view/Header.jsp"/>
   <div id="title">   
      <h3>영화 수정</h3>
   </div>   
   <form action='./updateCtr.do' method='post' enctype="multipart/form-data" id="movieUpdateForm">
      <input type="hidden" name='movieNumber' value='${movieDto.movieNumber}'>
      영화제목<input type='text' name='movieTitle' id="movieTitle" value='${movieDto.movieTitle}'><br>
      줄거리<input type='text' name='movieSummary' id="movieSummary" value='${movieDto.movieSummary}'><br>
      개봉일<input type='date' name='movieReleaseDate' id="movieReleaseDate" value='${movieDto.movieReleaseDate}'><br>
      상영시간<input type='number' name='movieRuntime' id="movieRuntime" value='${movieDto.movieRuntime}'><br>
      가격<input type='number' name='moviePrice' id="moviePrice" value='${movieDto.moviePrice}'><br>
      포스터<input type='text' name='moviePoster' id="moviePoster" value='${movieDto.moviePoster}'><br>
      예고편<input type='text' name='moviePreview' id="moviePreview" value='${movieDto.moviePreview}'><br>
      
      <div id="btnList">
         <input type='submit' value='저장하기' id="updateMovieForm">
         <a href='./list.do' id="pageMoveList">회원목록으로</a>
         <a href='./delete.do?movieNumber=${movieDto.movieNumber}' id="deleteBtn">삭제하기</a>
      </div>
   </form>

   <jsp:include page="/WEB-INF/view/Footer.jsp" />
</body>
</html>