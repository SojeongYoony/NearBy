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
</head>
<body>

	<h1>갤러리 목록 보기</h1>
	
	<a href="/nearby/board/insertPage">새 갤러리 작성</a> <!-- header로빠질예정 -->
	
	<hr>
	
	<c:if test="${not empty list}">
	  <c:forEach items="${list}" var="board">
		<div class="MainBoardWrap">
		    <div class="boardIntro"> 
		    	<div class="profileImg"><p>동그란 프로필 이미지 넣기</p></div>
		    	<div class="id"><a href="/nearby/board/selectBoard">${board.id}</a><span>설정아이콘</span></div>
		        <div class="content">${board.content}</div><div class="address">아이콘+주소</div>
  					<c:set value="${board.saved}" var="video"></c:set>
  					
		  				  <c:if test="${not f:contains(video, 'mp4')}">
		  						   <img alt="${board.origin}" src="/board/${board.path}/${board.saved}" width="400px">
		  				</c:if>
		  				<c:if test ="${f:contains(video, 'mp4')}">
		  				<video autoplay controls loop muted poster="video" width="400px">
		  					<source src="/board/${baord.path}/${board.saved}"  type="video/mp4">
		  				</video>
		  				</c:if>
		  			
		    
		    </div>
		
		
		
		
		
		
		
		
		    
		
		
		</div>
	  </c:forEach>
	</c:if>
		



	
</body>
</html>