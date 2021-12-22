<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/functions" prefix="f" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
<style>
   *{
      padding: 0;
      margin: 0;
      box-sizing: border-box;   
      width: 100%;
   }
   a {
      text-decoration: none;
      color: black;
      font-weight: bold;
   }
   .board_container {
      width: 100%;
      
   }
   .mainBoardWrap {
   width: 560px; 
   height: 700px;
   border:1px solid pink;
   padding: 15px;
   border-radius: 10px;
   margin: 30px auto;
   background-color: white;
   }
   .boardIntro{
      display: flex;   
      width: 500px;
   }
   .profileImg{
         width : 110px;
      height : 80px;
      border : 1px solid silver;
       display: inline-block;
       border-radius: 100%;
      margin-right: 10px;
   }
   #board_writer {
      font-weight: bold;
      font-size: 18px;
      display: inline-block;
      margin-left: 10px;
      width: 250px;
        
   }
   .setting { 
       color: #fe4662; 
       font-size:20px;
        width:30px
   }
   .addrAndMap {
      text-align: right;
      padding-right: 10px;
      margin-top: 10px;
      margin-bottom: 10px;
   }
   .addressAndImage {
       width:500px;
    margin: 30px auto;
      position: relative;
   }
   #select_link {
    display:inline-block;
      width: 500px;
      height: 400px;

   }
   
   
   .content {
      margin-top: 5px;
      margin-bottom: 10px;
      margin-left: 100px;
      width : 300px;
   }
    #home_btn { border-bottom: 8px solid  #fe4662;   }
   .fa-home { color: #fe4662; }
   
   
   .fas {  display: inline-block;  }
   .likesAndReplyCount  {
         border-top : 1px solid gray;
         border-bottom : 1px solid gray;
         height: 35px;
         line-height: 35px;
         display: flex;
    }

   .likesCount .replyCount { color :#fe4662;  }
   
    .see {
      display: block;
      width: 90px;
      height: 55px;
   }
   .no {
      display: none;
   }
   .delete_update_form {
       position:absolute;
       top: 155px;
       left: 1045px;
       border-radius: 10px;
       border : 1px solid rgba(50,50,50,0.3);
       margin: 0 auto;
       margin-top: 20px;
       padding: 3px;
       text-align: center;
       background-color: white;
   }
   .delete_update_form li:first-child {
   padding-bottom: 3px;
      border-bottom: 1px solid rgba(50,50,50,0.3);
   }
    .delete_update_form li a {
       font-size: 10px;
        font-weight: 400;
    }
    .delete_update_form li a:hover {   font-weight: bold;  }
   
   
   
   
</style>


<script type="text/javascript">

   function fnSetting(){
       $('.delete_update_form').toggleClass('see no');
   }


   $(document).ready(function(){
      //   fnLike();         
   });

   function fnselectBoard(){
      $(".addressAndImage").click(function(){
         location.href=
       console.log($('#bNo').val() );
         
      })
      
   }
   
   


   
//    function fnLike(){
//       $('.like_btn').click(function(){
//          alert( $('#bNo').val() );
//          $.ajax({
//             url : '/nearby/like/likes',
//             type: 'post',
//             data: JSON.stringify({
//                "bNo": $('#bNo').val()
//             }),  // json 데이터를 서버로 보냄
//             contentType: 'application/json',
//             dataType: 'json',
//             success: function(resData){
//                alert(resData);
//                $('.like_count').text(resData.result);
//             },
//             error : function(xhr, error){
//                console.log(xhr.status);
//                console.log(error)
//             }            
//          });
//       });
//    }
   
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/layout/header.jsp" flush="true" />
   
   <h1>로그인 유저 아이디 : ${loginUser.id}</h1>
   
<%--  로그인 유저 확인용 ${loginUser}    --%>


   <a href="/nearby/board/insertPage">새 갤러리 작성</a> <!-- header로빠질예정 -->
   <a href="/nearby/member/logout">로그아웃</a>
   <hr>

<div class="board_container">

   <c:if test="${not empty list}">
     <c:forEach items="${list}" var="board">
   
   
<%--    보드 값 확인 용 ${board} --%>
   
   
      <div class="mainBoardWrap"  >
          <div class="boardIntro"> 
             <div class="profileImg">(프로필)
             <img src="/nearby/${loginUser.profile.path}/${loginUser.profile.pSaved}">
             </div>
             <input type="hidden" id="bNo" value="${board.bNo}">
             <input type="hidden" id="origin" value="${board.origin}">
             <input type="hidden" id="saved" value="${board.saved}">
             <input type="hidden" id="location" value="${board.location}">
             <div class="id">
                <a href="/nearby/board/selectBoard" id="board_writer">${board.id}</a>
             </div>
             
      <c:if test="${board.id == loginUser.id}">       
          <i class="fas fa-cog setting" onclick="fnSetting()" ></i>
       </c:if>   
          <ul class="delete_update_form no">
             <li><a href="/nearby/board/modifyBoard" >게시물 수정</a></li>
             <li><a href="/nearby/board/deleteBoard"  >게시글 삭제</a></li>
          </ul>
             
          </div>
              
              <div class="content">
                   ${board.content}
              </div>
              
            <div class="addressAndImage"  onclick="location.href='/nearby/board/selectBoard?bNo=${board.bNo}';">
<%--           <a id="select_link" href= '/nearby/board/selectBoard?bNo=${board.bNo}'>${board.bNo}</a> --%>
               <div class="addrAndMap">
                        <i class="fas fa-map-marker-alt" style="color:#fe4662; font-size:15px; width:30px"></i>
                       <span class="address"> ${board.location} </span>
               </div>
               <!-- 이미지 및 영상 관련 -->
            
                 <c:set value="${board.saved}" var="video"></c:set>
                    
                     <c:if test="${not f:contains(video, 'video')}">
                             <img alt="${board.origin}" src="/nearby/${board.path}/${board.saved}" style="width:500px;">
                      </c:if>
                    
                    <c:if test ="${f:contains(video, 'video')}">
                    <video autoplay controls loop muted poster="video" width="500px">
                       <source src="/nearby/${board.path}/${board.saved}"  type="video/mp4" >
                    </video>
                    </c:if>
                       <input type="hidden" name="path" value="${board.path}">
                       
              </div>
              
              <div class="likesAndReplyCount">
                 <div class="countIcon likesCount"> 
                       <button type="button"  class="like_btn"  style="background-color: white; border: none; width:60px; cursor: pointer;">
                          <i class="fas fa-thumbs-up" style="color:#fe4662; width: 50px"></i>
                          <span class="like_count"></span>
                       </button>
                 </div>
                 <div class="countIcon replyCount">
                    <i class="fas fa-comments countIcon replyCount" style="color:#fe4662"></i>
                    <span class=""></span>
                 </div>
                 
              </div>
              
              <div class="reply_wrap" style="margin: 20px">
                 소정언니댓글구현
              </div>
              
      </div>
     </c:forEach>
   </c:if>
   
</div>   
</body>
</html>