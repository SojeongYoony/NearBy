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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boardView.css">

<script type="text/javascript">
	
	$(document).ready(function(){
		fnReplyList();
		fnLike();
		var txtArea = $(".content_height");
	    if (txtArea) {
	        txtArea.each(function(){
	            $(this).height(this.scrollHeight);
	        });
	    }
	    
	})


 	function fnLike(i){
		   console.log(i)
	       let likeBtn = $('.like_btn');
		   $('#'+i).find('i').toggleClass('like');
	            if(  $('#'+i).find('i').hasClass('like') == true  ) {
	            	
		            $.ajax({
		 				url : '/nearby/board/likes',
		 				type: 'post',
						data: "bNo=" + i,
						dataType: 'json',
		 				success: function(map){
		 					if(map.result > 0){
		 						//likeBtn.find('.like_count').text(map.count);
		 						$('#'+i).find('.like_count').text(map.count);
		 					} else {
		 						alert(map.msg);
		 					}
		 				},
		 				error : function(xhr, error){
		 					console.log(xhr.status);
		 					console.log(error)
		 				}				
		 			 }); 
	 		   } // if
	 		
	 	   //	console.log($('.like_btn').find('i').hasClass('like'));
	 		if(  $('#'+i).find('i').hasClass('like') == false ){
	 			 $.ajax({
	  				url : '/nearby/board/likesCancel',
	  				type: 'post',
	 				data: "bNo=" +i, 
	 				dataType: 'json',
	  				success: function(map){
	  					if(map.result > 0){
	  						$('#'+i).find('.like_count').text(map.count);
	  					} else {	alert(map.msg);	}
	  				},
	  				error : function(xhr, error){
	  					console.log(xhr.status);
	  					console.log(xhr.error)
	  				}				
	  			});  // ajax		
	 	      }
 }	// fnLike

	
</script>
<style>
  .board_icon{
  color: gray;
  cursor: pointer;
  }
   .like {
   		color: pink; cursor: pointer;
   }
 
 
/* ------------------- reply 구역 ----------------- */
/* 	테이블 구역 확인용
	table {
		border-collapse: collapse;
	}
	table tr {
		border: 1px solid;
	}
	table td {
		border: 1px solid;
	} */
	.reply_user_img {
		width:20px;
		height: 20px;
		margin: 5px;
		border-radius: 100%;
	}
	#input_reply_table td:nth-of-type(1){
		width:20px;
	}
	#input_reply_table #reply_user_name_area input[type=text]{
		width: auto;
	}
	#input_reply_table input[type=text]{
		margin: 5px;
		width: 378px;
		height: 22px;
		font-size: 12px;
		outline-style: none;
	}
	
	/* 댓글 보여주는 구역 CSS */
	.output_reply_area {
		border:1px solid black; 
		/* height: 100px;  */
		width: 500px; 
		margin:10px auto 5px;
	}
	.reply_user_image_area{
		width: 25px;
	}
	.reply_user_image_area .reply_user_img{
		width:25px;
		height: 25px;
		margin: 5px;
	}
	.output_reply_area .reply_user_name_area{
		color: black;
		width: auto;
	}
	.like_icon_area {
		font-size: 16px;
		padding: 5px;
	}
	.output_reply_table input[type=text]{
		margin: 5px;
		width: 100%;
		height: 22px;
		font-size: 12px;
		outline-style: none;
	}
	.btn_area {
		width: auto;
	}
	.reply_btns{
		margin-right:5px;
		width:36px; 
		font-size: 12px;
		border: none;
		padding: 5px 0 5px 0;
		background-color: pink;
		border-radius: 5px;
	}
   	.pointer {
   		cursor: pointer;
   	} 

</style>
</head>
<body>
	<header class="header">
		<jsp:include page="/WEB-INF/views/layout/header.jsp" flush="true" />
	</header>
	
 <h1>${loginUser.id}님 환영합니다.</h1>

	<a href="/nearby/board/insertPage">새 갤러리 작성</a> <!-- header로빠질예정 -->
	<a href="/nearby/member/logout">로그아웃</a>

<div class="board_container">
	 <c:if test="${not empty list[0]}"> 
	  <c:forEach items="${list}" var="board">

	    <%-- 	보드 값 확인 용 ${board} --%>
		<div id="mainBoardWrap" >
		    <div class="boardIntro"> 
		    	<div class="profileImg"  id="p_img">
		    <c:if test="${empty board.profile.pSaved}">
				<img id="user_img" src="${pageContext.request.contextPath}/resources/image/profile_default.png" onclick="fnShowBtnBox()" class="pointer defaultImg">
			</c:if>
		    <c:if test="${board.profile.id == board.id and not empty board.profile.pSaved}" >
		    		<img id="user_img" src="/nearby/${board.profile.pPath}/${board.profile.pSaved}"  class="pointer">
		    </c:if>
		    	</div>
		    	<input type="hidden" id="bNo" value="${board.bNo}">
		    	<input type="hidden" id="origin" value="${board.origin}">
		    	<input type="hidden" id="saved" value="${board.saved}">
		    	<input type="hidden" id="location" value="${board.location}">
		    	<div class="id">
		    	   <a href="/nearby/board/selectBoard" id="board_writer">${board.id}</a>
		    	</div>
		    </div>
  		<!--------------------- 내용만 삽입할 때 ------------------------------->
 			 <c:if test="${ null == board.origin }">
	  			<div class="AddrAndContent"  onclick="location.href='/nearby/board/selectBoard?bNo=${board.bNo}';">
	  				  <div class="addrAndMap">
						       		  <i class="fas board_icon fa-map-marker-alt" style="color:#fe4662; font-size:15px; width:30px"></i>
						              <span class="address"> ${board.location} </span>
				      </div>
		  		       <div class="content onlyContent">
		           			<textarea readonly="readonly" class="content_height">${board.content}</textarea>  
		       		   </div>
	  		    </div>
		  </c:if>
  		<!-------------------- 이미지/비디오 삽입할 때---------------->		  
		 <c:if test="${board.saved ne null}">	  
		      <div class="addressAndImage"  onclick="location.href='/nearby/board/selectBoard?bNo=${board.bNo}';">
			      <div class="addrAndMap">
			       		  <i class="fas board_icon fa-map-marker-alt" style="color:#fe4662; font-size:15px; width:30px"></i>
			              <span class="address"> ${board.location} </span>
			      </div>
		    	  <!------------------ 이미지 및 영상 관련 ----------------------------------------->
  					   <c:set value="${board.saved}" var="video"></c:set>
		  				 <c:if test="${not f:contains(video, 'video')}">
		  						 <div class="imgSize">  <img alt="${board.origin}" src="/nearby/${board.path}/${board.saved}" id="image">  </div>
		  				  </c:if>
		  				
		  				<c:if test ="${f:contains(video, 'video')}">
		  				   <div class="imgSize">
			  				    <video autoplay controls loop muted poster="video"  id="video">
			  						<source src="/nearby/${board.path}/${board.saved}"  type="video/mp4" >
			  					</video>
		  					</div>
		  				</c:if>
		  					<input type="hidden" name="path" value="${board.path}">
		  					  <div class="content">  
		            			 	<textarea readonly="readonly"  class="content_height"> ${board.content}</textarea> 
		     				 </div>
		  		</div>
		  		
		  </c:if>		
		  
		  		<!--------------  댓글 + 좋아요 수 ----------------------->
		  		<div class="likesAndReplyCount">
			  		<div class="countIcon likesCount"> 
			  			${board.bNo }
			  		
		  				<span class="like_btn" id="${board.bNo}"  data-bno="${board.bNo}" onclick="fnLike(${board.bNo})">
		  					<i class="fas board_icon fa-thumbs-up"></i>
			  				<span class="like_count">${board.likes}</span>
		  				</span>
		  			
			  		</div>
			  		<div class="countIcon replyCount">
			  			<i class="fas board_icon fa-comments countIcon replyCount" ></i>
			  			<span class=""></span>
			  		</div>
		  		</div>
		  		
		  		<!--  댓글 보이기  -->
	  			<div class="input_reply_area">
	  				<!-- 댓글 작성 -->
		  			<table id="input_reply_table">
		  				<tr>
		  				           <!-- user proflie image -->
		  					<td rowspan="2" class="reply_user_image_area">
		  						<c:if test="${empty loginUser.profile.pSaved}">
									<img class="reply_user_img" src="${pageContext.request.contextPath}/resources/image/profile_default.png" onclick="fnShowBtnBox()" class="pointer defaultImg">
		  						</c:if>
		  						<c:if test="${not empty loginUser.profile.pSaved}">
									<img class="reply_user_img" src="/nearby/${loginUser.profile.pPath}/${loginUser.profile.pSaved}" onclick="fnShowBtnBox()" class="pointer">
		  						</c:if>
		  					</td>
		  					<td id="reply_user_name_area">
		  						${loginUser.id}
		  					</td>
		  					<td>
		  						<input type="text" name="rContent" id="rContent">
		  					</td>
		  					<td>
		  						<input type="button" id="insert_reply_btn" class="pointer reply_btns" value="등록">
		  					</td>
		  				</tr>
		  			</table>
		  			
			  		<div class="reply_wrap">
			  			<!-- 댓글 뿌리기 -->
			  			<div class="output_reply_area">
				  			<table>
				  				<tbody id="output_reply_table">
									<tr>
				         	           <!-- user proflie image -->
										<td rowspan="2" class="reply_user_image_area">
										   <c:if test="${empty board.profile.pSaved}">
												<img class="reply_user_img pointer" src="${pageContext.request.contextPath}/resources/image/profile_default.png" onclick="fnShowBtnBox()" class="pointer defaultImg">
											</c:if>
											<c:if test="${board.profile.id == board.id and not empty board.profile.pSaved}">
												<img class="reply_user_img pointer" src="/nearby/${board.profile.pPath}/${board.profile.pSaved}"  class="pointer">
											</c:if>
										</td>
										<!-- user name -->
										<td class="reply_user_name_area">
										   <a href="#">${loginUser.id}</a>
										</td>
										<!-- like icon -->
										<td class="like_icon_area">
											<i class="fas fa-thumbs-up pointer" style="color:#fe4662; width: 16px"></i>
										</td>
										<!-- update / delete button -->
										<td class="btn_area">
										   <input type="button" class="update_reply_btn" class="pointer reply_btns" value="수정">
										</td>
										<td class="btn_area">
										   <input type="button" class="delete_reply_btn" class="pointer reply_btns" value="삭제">
										</td>
									</tr>	
										<!-- reply content -->
										<tr>
										   <td colspan="4">
										      <input type="text" name="rContent" class="outputContent">
										   </td>
										</tr>
				  				</tbody>
				  			</table>
			  			</div>
			  		</div>
		  			
	  			</div>

		</div>
	  </c:forEach>
	 </c:if> 
	
</div>	
</body>
</html>