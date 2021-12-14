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
</head>
<body>

	<h1>갤러리 목록 보기</h1>
	
	<a href="/nearby/board/insertPage">새 갤러리 작성</a> <!-- header로빠질예정 -->
	<a href="/nearby/member/logout">로그아웃</a>
	<hr>
	
	<c:if test="${not empty list}">
	  <c:forEach items="${list}" var="board">
	
		<div class="MainBoardWrap" style="border:1px solid silver; width: 500px">
		${board.ip}
		    <div class="boardIntro"> 
		    	<div class="profileImg"><p>(프로필이미지추가)</p></div>
		    	<div class="id"><a href="/nearby/board/selectBoard">${board.id}프로필이동?(상세구현x)</a>
		    	<span><i class="fas fa-cog" style="color:pink;"></i></span></div>
		        <br>
		        <div class="content">내용 : ${board.content}</div>
		        <br>
		        <div class="address"> <i class="fas fa-map-marker-alt" style="color:pink; font-size:15px;"></i> ${board.location}</div>
		      
  					<c:set value="${board.saved}" var="video"></c:set>
  					
		  				 <c:if test="${not f:contains(video, 'mp4')}">
		  						   <img alt="${board.origin}" src="/nearby/${board.path}/${board.saved}" width="400px">
		  				  </c:if>
		  				<c:if test ="${f:contains(video, 'mp4')}">
		  				<video autoplay controls loop muted poster="video" width="400px">
		  					<source src="/nearby/${board.path}/${board.saved}"  type="video/mp4">
		  				</video>
		  				</c:if>
		  	
		    </div>
				    
		
		</div>
	  </c:forEach>
	</c:if>
	
	
</body>
</html>