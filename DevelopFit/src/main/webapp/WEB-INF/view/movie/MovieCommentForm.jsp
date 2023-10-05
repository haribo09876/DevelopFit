<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>영화 한줄평 추가</title>
   <style>
      body{
         background-color: #101322;
         color: white;
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
         width: 266px;
         display: block;
         margin: 0 auto;
         text-align: center;
         margin-top: 30px;
      }
      #addCommentForm{
         width: 400px;
         display: block;
         margin: 0 auto;
      }
      #lineReviewContext{
         width: 390px;
         height: 150px;
         border: none;
         border-radius: 6px;
         background-color: #172036;
         padding-left: 10px;
      }
      #btnList{
         width: 264px;
         height: 22px;
         display: block;
         margin: 0 auto;
         margin-top: 20px;
      }
      #pageBack{
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
      #addComment{
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
         color: white;
      }
   </style>   
   <script type="text/javascript">
		window.onload = function(){
			var lineReviewContext = document.getElementById('lineReviewContext');
		}
		function check() {
			var form = document.addCommentForm;
		
			if (lineReviewContext.value === '') {
				alert('한줄평 내용을 입력해 주세요.');
				form.lineReviewContext.focus();
				return false;
			}
			form.submit();
		}
   </script>
</head>
<body>
   <jsp:include page="/WEB-INF/view/Header.jsp"/>

      <div id="contentsAreaDiv">
         <div id="title">
            <h3>영화 한줄평 추가</h3>
         </div>
         <form action="./commentAddCtr.do" method="post" id="addCommentForm" name="addCommentForm" enctype="multipart/form-data">
            <input type="hidden" name='memberNumber' value= '${member.memberNumber}'><br>
            <input type="hidden" name='movieNumber' value= '${movieDto.movieNumber}'><br>
            <input type='text' name='lineReviewContext' id='lineReviewContext' placeholder="내용을 입력해주세요." maxlength="33"><br>
            <div id="btnList">
               <div id="pageBack">
                  <a href='./commentList.do'>뒤로가기</a>
               </div>
               <input type="button" id="addComment" value="추가" onclick="check();">
            </div>
         </form>
      </div>
   
   <jsp:include page="/WEB-INF/view/Footer.jsp" />
</body>
</html>