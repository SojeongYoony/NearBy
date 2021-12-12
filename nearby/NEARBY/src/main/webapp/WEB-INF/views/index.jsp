<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script type="text/javascript">
  $(document).ready(function(){
	 
  });

    function fnLogin(){
     $("#login_btn").on("click",function(){
		  $("#login_form").addClass("see");


	   });
	}



</script>
<style>
    #login_form {
       display: none;
	}
	.see {
		display: block;
		width: 500px;
		height: 600px;


	}

</style>

</head>
<body>
	 
	
	<header class="index_header">
	  <div class="logo_wrap"> 
	  	<div><img src="resources/image/blacklogo.png" width="200px"></div> 
	  	<div><input type="button" value="login" id="login_btn"></div>
	  </div>

	</header>
	
	<main>


		안녕 나는 main
         <form id="login_form" method="post" action="/nearby/member/login">
            <div class="idWrap">
				<label for="id">아이디</label>
				<input type="text" name="id" id="id">
			</div> 
			<div class="pwWrap">
				<label for="pw">비밀번호</label>
				<input type="text" name="pw" id="pw">
			</div> 
		 </form>

  <br><br><br>
  
	<a href="/nearby/board/boardList">MainPage으로 가기</a>
	<a href="/nearby/member/memberJoin">회원가입하러가기</a>
	
	<br><br><br>
	
	
	</main>


	<footer>
		 안녕 나는 footer 
	</footer>
	
</body>
</html>
