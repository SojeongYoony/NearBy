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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boardFindView.css">
<style>
   .board_icon{
       margin-left: 25px;
	   color: gray;
	   width: 35px;
	   line-height: 32px;
	   cursor: pointer;
    }
   .like   { color: #fe4662; cursor: pointer;  }
   .unlike { color: gray; cursor: pointer;     }
   	.pointer {
   		cursor: pointer;
   	} 
/* ------------------- reply 구역 ----------------- */

	#reply_count_per_board {
		margin: 10px;
	}
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
	.insert_btn_area {
		position: relative;
	}
	#insert_reply_btn {
		right: 34px;
		border-radius: 10px;
	}
	#input_reply_table input[type=text]{
		margin: 5px;
		width: 440px;
		height: 24px;
		font-size: 12px;
		outline-style: none;
		padding:14px;
		border-style: none;
		background-color: #f0f2f5;
		border-radius: 20px;
	}
	.disapear{
		display: none;
	}
	
	/* 댓글 보여주는 구역 CSS */
	.replyCount {
		margin-left: 100px; 
	}
	.output_reply_area {
		width: 500px; 
		margin:10px auto 5px;
	}
	.reply_user_image_area {
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
	.input_row {
		position: relative;
	}
	.input_row .reply_btns {
		position: absolute;
		top: 10px;
		right: 20px;
		background-color: #f0f2f5;
	}
	.btn_area {
		position: relative;
	}
	.btn_area .show_reply_btn {
		position: absolute;
		right: 58px;
		width: 30px
	}
	.delete_reply_btn {
		position: absolute;
		right: 28px;
		width: 30px
	}
	.output_reply_table input[type=text]{
		margin: 5px;
		width: 490px;
		height: 24px;
		font-size: 12px;
		outline-style: none;
		padding:18px;
		border-style: none;
		background-color: #f0f2f5;
		border-radius: 20px;
	}
	.reply_content {
		word-break: break-all;
	}
	.btn_area {
		width: auto;
	}
	.reply_insert_btns{
		margin-right:5px;
		width:36px; 
		font-size: 12px;
		border: none;
		padding: 5px 0 5px 0;
		background-color:#fe4662;
		color:white;
		border-radius: 5px;
	}
	.reply_btns{
		font-size: 12px;
		border-style: none;
		padding-right: 5px;
		background-color: rgba(255, 250, 250, 0.8);
		color: gray;
	}
	.reply_btns:hover{
		text-decoration: underline;
	}

/* 페이징용 CSS */
   #paging {
      display: flex;
      justify-content: center;
   }
   #paging > div {
      width: 35px;
      heigth: 20px;
      text-align: center;
   }
   .disable_link {
      color: lightgray;
   }
   .enable_link {
      cursor: pointer;
   }
   .now_page {
      color: red;
   }


</style>
<script>
	$(document).ready(function(){
		fnSendBno();     // 로그인 유저의 게시글 좋아요 한 유무 
		fnReplyList();	 // 게시글 댓글 리스트
		fnInsertReply(); // 댓글 삽입
		fnChangePage();  // 페이징
		fnShowUpdateBtn();
		fnUpdateReply(); // 댓글 수정
		fnDeleteReply(); // 댓글 삭제
		
	    var txtArea = $(".content_height");
	    if (txtArea) {
	        txtArea.each(function(){
	            $(this).height(this.scrollHeight);
	        });
	    }
	})

	function fnSetting(){
		$('.delete_update_form').toggleClass('b_see b_no');
		$('.delete_form').toggleClass('b_see b_no');
	}
	
	function fnDelete(){
		if ( confirm('게시글을 삭제하시겠습니까?') ){
			location.href= '/nearby/board/deleteBoard?bNo='+${board.bNo};
		}
	}
	
	function fnAdminDelete(i){
		if( confirm('게시글 번호 '+i+'를 삭제하시겠습니까?') ){
 			$.ajax({
 				url : '/nearby/admin/adminBoardDelete',
 				type: "get",
 				data : "bNo="+i,
 				dataType: 'json',
 				contentType:'application/json',
 				success: function(map){
 					 if(map.result.result > 0){
 						alert('삭제성공');
 						location.href= "/nearby/board/boardList";
 					 } else {
 						 alert('삭제실패');
 					 }
 					}, 
 				error: function(){
 					alert("ajax에러입니다")
 				}
 			})
 		}
	}
	
	function fnUpdate(){
		if(confirm('게시글을 수정하시겠습니까?') )
			location.href= '/nearby/board/updateBoardPage?bNo='+${board.bNo};
	}
	
    function fnSendBno(){
		
		$.each($('.output_reply_table'), function(i, replyTable) {	
 		let bNo = '${board.bNo}';
 		$.ajax({
 			      url: '/nearby/board/boardBnoList',
			      type: 'get',
			      data: "bNo=" + bNo,
			      dataType: 'json',
 			      success: function(map) {
			    	  console.log('성공했을때');
			    	  console.log(map.count);
			    	    if( map.count == 1 ){
			    	    	// 색 있는 하트
			    	    	 console.log("색 채우기")
			    	    	 	$("#like"+bNo).addClass('like');
			    	    	    
			    	    	 
			    	    } else if (map.count == 0) {
			    	    	// 빈 하트
			    	    	 console.log("색이 없기")
			    	    	$("#like"+bNo).removeClass('like');
			    	    }
			    	  
			      },
			      error: function() {
 			      }
 			   }) // End ajax			
		
 		}); // each
 	} //  fnSendBno()
	
	
	
	function fnLike(i){
	       let likeBtn = $('.like_btn');
	       let bNo = '${board.bNo}';
	          
	          if( $("#"+i).find('i').hasClass('like') == false )  {
	            	$("#"+i).find('i').addClass('like');
		            $.ajax({
		 				url : '/nearby/board/likes',
		 				type: 'post',
						data: "bNo="+i, 
						dataType: 'json',
		 				success: function(board){
		 					console.log(board);
		 					console.log("좋아요 누른 카운트"+ board.likes);
  			  			   $( '#like_count'+bNo ).text(board.likes);
  			  			   location.href="/nearby/board/selectBoard?bNo="+bNo;
		 					
		 				},
		 				error : function(xhr, error){
		 					console.log(xhr.status);
		 					console.log(error);
		 				}				
		 			 }); 
		            return
		   }
 			
	 	//	  console.log("likehasClass = " + $("#"+i).children('i').hasClass('like') )
  
  
	    if(  $("#"+i).find('i').hasClass('like') ) {
	    	$("#"+i).find('i').removeClass('like');
	    	
	 		$.ajax({
	  				url : '/nearby/board/likesCancel',
	  				type: 'post',
	  				data: "bNo="+i, 
	 				dataType: 'json',
	  				success: function(board){
	  			//	  console.log("좋아요 취소 카운트" + board.likes);
	  				   $( '#like_count'+ bNo ).text(board.likes);
	  				 location.href="/nearby/board/selectBoard?bNo="+bNo;
	  				   
	  				},
	  				error : function(xhr, error){
	  					console.log(xhr.status);
	  					console.log(xhr.error)
	  				}				
	  			});  // ajax
	  			return;
	      } // if 
	    }	 
 			
 	

	
/* ----------------------------------------- fnReplyList() --------------------------------  */
var page = 1; // 시작은 무조건 1page이니까. 1로 초기화
function fnReplyList(){
   $.ajax({
      url: '/nearby/reply/replyList',
      type: 'get',
      data: "bNo=" + '${board.bNo}' + "&page=" + page,
      dataType: 'json',
      success: function(map) {
         fnPrintReplyList(map);
         fnPrintPaging(map.pageUtils);
         fnReplyTotalCount(map);
      },
      error: function(xhr) {
         console.log(xhr.responseText);
      }
   }) // End ajax
} // End fnReplyList

   function fnReplyTotalCount(map) {
         $('#reply_count_per_board').text(map.total);
         console.log('  여기는 함수 내부이다     : '+map.total);
         if (map.total > 0 ) {
            $('.replyCount').addClass('like').removeClass('unlike');
         } else if (map.total == 0) {
            $('.replyCount').addClass('unlike').removeClass('like');
         }
}


/* ----------------------------------------- fnPrintReplyList() --------------------------------  */

	function fnPrintReplyList(map){
		 $('.output_reply_table').empty();
		 
		 var p = map.pageUtils;
		 let id = '${loginUser.id}';
		 
		 if (p.totalRecord == 0) {
		    $('<tr>')
		    .append( $('<td colspan="5">').text('첫 번째 댓글의 주인공이 되어보세요!') )
		    .appendTo( '.output_reply_table' );
		 } else {
		    
		    $.each(map.replyList, function(i, reply){
		         if ( reply.profile.pSaved != null ) { // 댓글 작성자의 프로필 사진이 있을 때 프로필 사진을 보여주고
		        
						let pSaved = reply.profile.pSaved;
						let pPath = reply.profile.pPath;
		        
						$('.output_reply_table').append( $('<tr>').html( $('<td rowspan="2" class="reply_user_image_area"><img class="reply_user_img pointer" src="/nearby/'+pPath+'/'+pSaved+'"></td>') ) );
		           } else if(reply.profile.pPath == null) { // 댓글 작성자의 프로필 사진이 없을 때 디폴트 사진을 보여준다.
						$('.output_reply_table').append( $('<tr>').html( $('<td rowspan="2" class="reply_user_image_area"><img class="reply_user_img pointer" src="${pageContext.request.contextPath}/resources/image/profile_default.png"></td>') ) );
		           } // End if 프사 부분 
				
				$('<tr class="icon_row">')
				.append( $('<td class="reply_user_name_area">').html( $('<a href="#">'+reply.id+'</a>') ) )
				.append( $('<td class="like_icon_area">') )//.html( $('<i class="fas fa-thumbs-up pointer" style="color:#fe4662; width: 16px"></i>') ) )
				.append( $('<td class="btn_area">').html( $('<input type="button" class="show_reply_btn pointer disapear reply_btns" data-upno="'+reply.rNo+'" value="수정" data-login="'+id+'" data-writer="'+reply.id+'"></td>') ) )
				.append( $('<td class="btn_area">').html( $('<input type="button" class="delete_reply_btn pointer disapear reply_btns" data-no="'+ reply.rNo +'" value="삭제" data-login="'+id+'" data-writer="'+reply.id+'" ></td>') ) )
				.appendTo( '.output_reply_table' );
				$('.output_reply_table').append( $('<tr class="input_row">').html( $('<td colspan="4"><input type="text" class="reply_content" id="updateContent" value="'+reply.rContent+'" readonly></td><td class="btn_area"><input type="button" class="update_reply_btn pointer reply_btns disapear reply_insert_btns" data-updateno="'+reply.rNo+'" value="등록"></td>') ) );

		    }) // End each
		    
		    
			$.each( $('.icon_row') , function(i, row) {
				
				let update_btn = $($(this).find('.reply_btns')[0]);
				let delete_btn = $($(this).find('.reply_btns')[1]);
				if (update_btn.data('login') == update_btn.data('writer')){			
					update_btn.removeClass('disapear');
					delete_btn.removeClass('disapear');
				}
				
			});
		    
		    
		 } // End if 
	} // End fnPringReplyList
   
/* ----------------------------------------- fnInsertReply() ----------------------------------------- */
function fnInsertReply(){
   $('#insert_reply_btn').on('click', function(){
       let reply = JSON.stringify({
         id: '${loginUser.id}',
         bNo : '${board.bNo}',
         rContent: $('#rContent').val(),
         depth: 0,
         groupNo: 0,
         groupOrd: 0
      }); 
      $.ajax({
         url: '/nearby/reply/insertReply',
         type: 'post',
         data: reply,
         contentType: 'application/json',
         dataType: 'json',
         success: function(map) {
               fnReplyList();
               $('#rContent').val(''); // 나중에 주석 지워야 할 부분
         },
         error: function(xhr) {
            console.log(xhr.responseText);
         }
      }) // End ajax
   }) // End click event
}  // End fnInsertReply

/* ----------------------------------------- fnDeleteReply() ----------------------------------------- */

	function fnDeleteReply(){
		$('body').on('click', '.delete_reply_btn', function(){
			let deleteNo = $(this).data('no');
			//console.log(deleteNo);
			alert(deleteNo);
				$.ajax({
					url: '/nearby/reply/deleteReply',
					type: 'get',
					data: 'rNo=' + deleteNo,
					dataType: 'json',
					success: function(map){
						fnReplyList();
					},
					error: function(xhr){
					}
				})// end ajax
		})
	} // end fnDeleteMember
/* ----------------------------------------- fnShowUpdateBtn() ----------------------------------------- */

	function fnShowUpdateBtn(){
		$('body').on('click', '.show_reply_btn', function(){
			let upNo = $(this).data('upno');
			let content = $(this).parent().parent().next().children().find('input');
			let completeBtn = $(this).parent().parent().next().children().next().find('input');
			
			content.removeAttr('readonly');
			completeBtn.toggleClass('disapear');
		}) // fnShowUpdateBtn
	}

/* ----------------------------------------- fnUpdateReply() ----------------------------------------- */
		
	function fnUpdateReply(){
		$('body').on('click', '.update_reply_btn', function(){
			let updateNo = $(this).data('updateno');
			let updateContent = $(this).parent().prev().find('input').val();
	          let reply = JSON.stringify({
	              rNo : updateNo,
	              rContent: updateContent
	           });
			 	$.ajax({
					url: '/nearby/reply/updateReply',
					type: 'post',
					contentType: 'application/json',
					data: reply,
					dataType: 'json',
					success: function(map){
						fnReplyList();
					},
					error: function(){
						alert('응답 실패');
					}
				})// end ajax 
		})
	} // end fnDeleteMember


/* ----------------------------------------- fnPrintPaging() ----------------------------------------- */
// 페이징 출력 함수
	function fnPrintPaging(p) {
		$('#paging').empty();
	   // 1페이지로 이동
		if (page == 1) {
			$('<div class="disable_link">PREV</div>').appendTo('#paging');
		} else {
			$('<div class="enable_link" data-page="1">PREV</div>').appendTo('#paging'); 
		}
		// 이전 블록으로 이동
		if (page <= p.pagePerBlock) {
			$('<div class="disable_link">&nbsp;&nbsp;&nbsp;&lt;</div>').appendTo('#paging');
		} else {
			$('<div class="enable_link" data-page="'+(p.beginPage-1)+'">&nbsp;&nbsp;&nbsp;&lt;</div>').appendTo('#paging');
		}
		// 페이지 번호
		for (let i = p.beginPage; i <= p.endPage; i++) {
			if (i == page) {
			   $('<div class="disable_link now_page">'+i+'</div>').appendTo('#paging');
			} else {
			   $('<div class="enable_link" data-page="'+i+'">'+i+'</div>').appendTo('#paging');
			}
		}
		// 다음블록으로 이동
		if (p.endPage == p.totalPage) {
			$('<div class="disable_link">&gt;</div>').appendTo('#paging');
		} else {
			$('<div class="enable_link" data-page="'+(p.endPage+1)+'">&gt;</div>').appendTo('#paging');
		}
		
		// 마지막 페이지로 이동
		if (page == p.totalPage) {
			$('<div class="disable_link">NEXT</div>').appendTo('#paging');
		} else {
			$('<div class="enable_link" data-page="'+p.totalPage+'">NEXT</div>').appendTo('#paging');
		}
	} // End fnPrintPaging

/* ----------------------------------------- fnChangePage() ----------------------------------------- */
// 페이징 링크 처리 함수
	function fnChangePage() {
		$('body').on('click', '.enable_link', function(){
			page = $(this).data('page');
			fnReplyList();
		}) // body click event
	} // End fnChangePage   
	
	
	
</script>
</head>
<body>
	 <c:if test="${loginUser.id != 'admin'}"> 
		<header class="header">
			<jsp:include page="/WEB-INF/views/layout/header.jsp" flush="true" />
		</header>
	</c:if>
	
	 <c:if test="${loginUser.id == 'admin'}"> 
			<jsp:include page="/WEB-INF/views/layout/adminHeader.jsp" flush="true" />
	</c:if>	
	
	<div class="mainBoardWrap" >
	    <div class="boardIntro"> 
	    	<div class="profileImg" id="p_img">
	    	  <c:if test="${empty board.profile.pSaved}">
				<img id="user_img" src="${pageContext.request.contextPath}/resources/image/profile_default.png" class="pointer defaultImg">
			</c:if>
		    <c:if test="${board.profile.id == board.id and not empty board.profile.pSaved}" >
		    		<img id="user_img" src="/nearby/${board.profile.pPath}/${board.profile.pSaved}"  class="pointer">
		    </c:if>
	    	</div>
	    	<input type="hidden" id="bNo" value="${board.bNo}">
	    	<div class="id">
	    	   <a href="/nearby/board/selectBoard" id="board_writer">${board.id}</a>
	    	</div> 
	    
		<c:if test="${board.id == loginUser.id}">   
		 <div class="setting_wrap">	
	    	<i class="fas fa-cog setting" onclick="fnSetting()" >
	    	</i>
	    	<ul class="delete_update_form b_no">
		    		<li class="update_link" onclick="fnUpdate(); return false;">게시글 수정</li>
		    		<li class="delete_link" onclick="fnDelete(); return false; ">게시글 삭제</li>
		    </ul>
		   </div> 
	    </c:if>	
	    
    	<!-- 관리자일때만 삭제가능  아이콘 표시 -->
   		<c:if test="${ 'admin' == loginUser.id}">   
   		 <div class="setting_wrap">	
				<i class="fas fa-cog setting" onclick="fnSetting()" ></i>
				 <ul class="delete_form b_no">
 			   		<li class="delete_link" onclick="fnAdminDelete(${board.bNo}); return false;">게시글삭제</li>
		  		 </ul>
  		</div>
	   </c:if>
	    	
	 </div>
		<!--------------------- 내용만 삽입할 때 ------------------------------->
 			 <c:if test="${ null == board.origin }">
	  			<div class="AddrAndContent"  onclick="location.href='/nearby/board/selectBoard?bNo=${board.bNo}';">
	  				  <div class="addrAndMap">
						       		  <i class="fas fa-map-marker-alt" style="color:#fe4662; font-size:15px; width:30px"></i>
						              <span class="address"> ${board.location} </span>
				      </div>
		  		       <div class="content onlyContent">
		           			<textarea readonly="readonly" class="content_height"> ${board.content}</textarea> 
		       		   </div>
	  		    </div>
		  </c:if>
  		<!-------------------- 이미지/비디오 삽입할때 ---------------->		  
		 <c:if test="${board.saved ne null}">	  
		      <div class="addressAndImage"  onclick="location.href='/nearby/board/selectBoard?bNo=${board.bNo}';">
			      <div class="addrAndMap">
			       		  <i class="fas fa-map-marker-alt" style="color:#fe4662; font-size:15px; width:30px"></i>
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
		  			<span class="like_btn" id="${board.bNo}"  data-bno="${board.bNo}" onclick="fnLike(${board.bNo})">
  			 	    	<i class="fas board_icon fa-thumbs-up" id="like${board.bNo}" > </i>
	  					<span class="like_count"  id="like_count${board.bNo}">${board.likes}</span> 
  					</span>
	            </div>
			  		<div class="countIcon replyCount">
			  			<i class="fas fa-comments countIcon replyCount">
			  				<span id="reply_count_per_board"></span>
			  			</i>
			  		</div>
		  		</div>
	 
<!--  댓글 보이기  -->
	<div class="input_reply_area">
		<!-- 댓글 작성 -->
		<table id="input_reply_table">
			<tr>
				<td>
					<c:if test="${empty loginUser.profile.pSaved}">
						<img class="reply_user_img" src="${pageContext.request.contextPath}/resources/image/profile_default.png" class="pointer defaultImg">
					</c:if>
					<c:if test="${not empty loginUser.profile.pSaved}">
						<img class="reply_user_img" src="/nearby/${loginUser.profile.pPath}/${loginUser.profile.pSaved}" class="pointer">
					</c:if>
				</td>
				<td>
					<input type="text" name="rContent" id="rContent" placeholder="댓글을 입력하세요">
				</td>
				<td id="insert_btn_area">
					<input type="button" id="insert_reply_btn" class="pointer reply_insert_btns" value="등록">
				</td>
			</tr>
		</table>
	</div>
	<div class="reply_wrap">
		<!-- 댓글 뿌리기 -->
  			<div class="output_reply_area">
	  			<table>
	  				<tbody class="output_reply_table"></tbody>
					<tfoot>
						<tr>
							<td colspan="5"><div id="paging"></div></td>
						</tr>
					</tfoot>
	  			</table>
  			</div>
  		</div>
	</div>
</body>
</html>