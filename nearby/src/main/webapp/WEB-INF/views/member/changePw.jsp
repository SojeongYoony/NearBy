<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<style>
	*{
	    margin: 0; padding: 0;
	    box-sizing: border-box;
	    font-size: 14px;
	    font-weight: 600;
	}
	
	html{
	    background-color: rgb(240, 242, 245);
	}
	
	a{
	    text-decoration: 0;
	    color: black;
	}
	
	ul, ol{
	    list-style-type: none;
	}
	
	label{
	    display: block;
	    text-align: left;
	    padding-bottom: 5px;
	    font-size: 18px;
	}
	
	input{
	    background-color: aliceblue;
	    border: 2px solid rgb(0, 0, 0, 0);
	}
	
	input:focus{
	    outline: none;
	}
	
	.container{
	    width: 600px;
	    margin: 100px auto;
	    background-color: white;
	    border-radius: 30px;
	}
	
	.head{
	    width: 100%;
	}
	
	/* 상단 로고 */
	.title > a{
	    display: block;
	    width: 200px; height: 130px;
	    margin: 30px auto;
	    text-align: center;
	    font-size: 0;
	
	    background-image: url(/NearBy_logo.png);
	    background-size: 200px 130px;
	    background-repeat: no-repeat;
	}
	
	.join_form{
	    width: 600px;
	    margin: 0 auto;
	}
	
	/* 
	    아이디, 비밀번호, 비밀번호 재확인, 이름
	*/
	.input_box{
	    width: 450px;
	    margin: 35px auto;
	
	}
	
	.input_box input{
	    width: 100%; height: 45px;
	    border-radius: 10px;
	}
	
	/* 이메일 */
	.email_box{
	    width: 450px;
	    margin: 35px auto;
	}
	
	.email_box input[type=text]{
	    width: 75%; height: 45px;
	    border-radius: 10px;
	    margin-bottom: 5px;
	}
	
	.email_box input[type=button]{
	    width: 23%; height: 45px;
	    background-color: pink;
	    border-radius: 10px;
	    font-size: 12px;
	}
	
	.email_box input[type=button]:hover{
	    background-color: #ff3268;
	}
	
	/* 번호 */
	.tel_box{
	    width: 450px; height: 100%;
	    margin: 35px auto;
	
	}
	
	.tel_box > span > input{
	    width: 450px; height: 45px;
	    border-radius: 10px;
	}
	
	/* 생년월일 */
	.birth_box{
	    width: 450px;
	    margin: 35px auto;
	}
	
	.birth_box > select, option{
	    width: 135px; height: 45px;
	    text-align: center;
	    margin: 0 5px 0 5px;
	    font-size: 18px;
	}
	
	/* 성별 */
	.gender_box{
	    width: 450px;
	    margin: 35px auto;
	}
	
	.gender_box > p{
	    font-size: 18px;
	    padding-bottom: 5px;
	}
	
	.gender_box > label{
	    display: inline-block;
	    padding-bottom: 5px;
	    margin: 0 40px 0 40px;
	}
	
	/* input tag 공백 */
	.space input[type=text] {
		padding-left:15px;
	}
	
	/* 회원가입 버튼 */
	.join_btn_wrap{
	    width: 450px;
	    margin: 35px auto;
	}
	
	.join_btn_wrap input, button{
		color:white;
	    width: 220px; height: 50px;
	    background: linear-gradient(#ff6e56,#ff3268);
	    border-radius: 10px;
	    margin-bottom: 40px;
		border: none; 
	}
	
	/* 정규식 메세지 */
	.error_msg {
	    font-size:13px;
	    color:red;
	}
	.pass_msg {
	    font-size:13px;
	    color:grey;
	}
	
	.btns:hover {
		cursor: pointer;
	}

</style>

<script type="text/javascript">

//이름/비밀번호/핸드폰/생일/성별 --> 이메일은X

	$(document).ready(function(){
		fnCheckSubmit();             // 모든 함수 확인 후 서브밋넘기기
		fnbirth();                     // 생년월일 삽입
		fnIdCheck();				 
		fnPwCheck();				   
		fnPwDoubleCheck();
		fnNameCheck();
		fnPhoneCheck();
		fnResetBtn();
	}); 
	
	// 서브밋
	 function fnCheckSubmit(){
	    $('#join_form').on('submit',function(event){
	      if( confirm('가입하시겠습니까?') == false){
				event.preventDefault(); 
	          return false;
			} else if (  id_result == false ) {
	            event.preventDefault();  
	            return false;    
			} else if ( pw_result == false ) {
                event.preventDefault(); 
                return false;  
            } else if ( pw_double_result == false ) {
                event.preventDefault();  
                return false;  
            } else if ( name_result == false ) {
                event.preventDefault();  
                return false;  
            } else if ( email_result == false ) {
				event.preventDefault();
                return false;  
            } else if ( authCodePass == false ) { // 12/14 추가
				event.preventDefault();
				alert('이메일 인증을 진행해주세요'); 
            	return false;
            } else if ( phone_result == false ) {
				event.preventDefault(); 
               return false;
            } else 
            	return true;
	        });
	    } //   function fnCheckSubmit()
	    
	
	// 생년월일 삽입
	function fnbirth(){
		let year = '';
		year +=  '<option value="year">년도</option>';
		for(let i=2007; i>=1907; i--){
		    year += '<option value="'+i+'">'+i+'</option>';
		}
		 $('#birthday').html(year);
		
		let month = '';
		month +=  '<option value="month">월</option>';
		for(let i=1; i<=12; i++){
		    month += '<option value="'+i+'">'+i+'</option>';
		}
		 $('#month').html(month);
		 
		 let day ='';
		 day += '<option value="day">일</option>';
		 for(let i=1; i<=31; i++){
		     day += '<option value="'+i+'">'+i+'</option>';
		 }
		  $('#day').html(day);	 
	}
 
    // 아이디
	let regId = /^[a-zA-Z0-9_-]{4,}$/;
    // 비밀번호
	let regPwd = /^[a-zA-Z0-9!@$%^&*()]{8,20}$/;
    // 이름
	let regName = /^[a-zA-Z가-힣]{1,30}$/;
    // 이메일
	let regEmail = /^[0-9a-zA-Z-_]+@[a-zA-Z0-9]+([.][a-zA-Z]{2,}){1,2}/;
    // 핸드폰 번호
	let regPhone = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;
	let id_result = false;
	let pw_result = false;
	let pw_double_result = false;
	let name_result = false;
	let email_result = false;
	let authCodePass = false;
	let phone_result = false; 
   
      
      function fnIdCheck(){   
            
            $("#id").on('keyup blur',function(){
            	if ( regId.test($(this).val()) == false ) {
    				$('#id_check').text("아이디는 소문자/숫자 4자 이상 사용 가능합니다.").addClass('error_msg').removeClass('pass_msg');
    				id_result = false;
    				return;
    			  }
				$.ajax({
					url : '/nearby/member/idCheck',
					type : 'post',
					data : 'id=' + $('#id').val(),
					dataType: 'json',               // 받아올 데이터 타입
					success : function(resData){
						 if( resData.result == null){
							 $('#id_check').text('사용 가능한 아이디').addClass("pass_msg").removeClass('error_msg');
							 id_result = true;
						 } else if($('#id').val() == '' ){
							 $('#id_check').text('입력 필수입니다.').addClass('error_msg').removeClass('pass_msg');;
			                    id_result = false;
			             } else if(resData.result != null) {
							 $('#id_check').text('이미 사용중인 아이디').addClass('error_msg').removeClass('pass_msg');;
							 id_result = false;
						 }
					},
					error : function(xhr, ajaxOptions, thrownError) {
				       alert(xhr.responseText);
				//		console.log(xhr.status);
				  //      console.log(thrownError);
					}
					
				}) // ajax
				 console.log("id: "+id_result);
				  return id_result;	 
			}); // id
    } // fnId
        
      // 비밀번호 정규식 
      function fnPwCheck(){
         
         $('#pw').on('blur keyup', function(){
            if( regPwd.test( $("#pw").val())){    
                $("#pw_check").text("사용가능한 비밀번호입니다.").addClass("pass_msg").removeClass('error_msg');
                pw_result = true;
            } else if (    $('#pw').val() == '' ){
                $("#pw_check").text('입력은 필수입니다.').addClass('error_msg').removeClass('pass_msg');
                pw_result = false;
            }    else {
                $("#pw_check").text("비밀번호는 8~20자의 영문 대/소문자, 숫자, 특수문자 등 3종류 이상으로 조합해주세요.").addClass('error_msg').removeClass('pass_msg');
                pw_result = false;
            }
         console.log("pw: "+pw_result);
            return pw_result;
         }); 
      
      } // fnPwCheck
      
   // 비밀번호 재확인 일치 
         function fnPwDoubleCheck(){
          
          $('#pwCheck').on('blur keyup', function(){     
                if($('#pw').val() !=  $("#pwCheck").val() ){
                    $("#pw_doubleCheck").text( '비밀번호가 일치하지 않습니다.').addClass('error_msg').removeClass('pass_msg');
                    pw_double_result = false;
                } else{
                    $("#pw_doubleCheck").text('').removeClass('error_msg').removeClass('pass_msg');
                    pw_double_result = true;
                }  
          console.log("pw2 : "+pw_double_result);
          return pw_double_result;
            });
      }
          
      // 이름 정규식
        function fnNameCheck() {  
           $('#name').on('blur', function(){
               if( regName.test( $(this).val())){    
                 $('#name_check').text('');
                 $('#name_check').removeClass('error_msg');
                 name_result = true;
               } else if ( $('#name').val() == '' ){
                   $('#name_check').text('이름은 필수입니다.').addClass('error_msg').removeClass('pass_msg');
                   name_result = false;
               }  else if( regName.test( $(this).val()) == false){    
                   $('#name_check').text('잘못된 이름 형식입니다.').addClass('error_msg').removeClass('pass_msg'); 
                   name_result = false;
               }
           console.log(name_result);
               return name_result;
           });
         
          } // fnName
          
    /*     // 이메일    
      function  fnEmailCheck(){
         $('#email').on('blur', function(){
                  if( regEmail.test( $('#email').val())){    
                    
                      $.ajax({
      					url : '/nearby/member/selectByEmail',
      					type : 'post',
      					data : 'email=' + $('#email').val(),
      					dataType: 'json',               // 받아올 데이터 타입
      					success : function(resData){
      					 if(resData.result == null) {
      						  $('#email_check').text('사용 가능한 이메일입니다.').addClass('pass_msg').removeClass('error_msg');
                        	   email_result = true;
                        	   fnSendAuthCode();
                        	   return;
      					 } else if(resData.result != null) {
      			            	 $('#email_check').text('이미 사용중인 이메일입니다.').addClass('error_msg').removeClass('pass_msg');
      							 email_result = false;
      						 }
      					},
      					error : function(xhr, ajaxOptions, thrownError) {
      				       alert(xhr.responseText);
      					}
      				}) // ajax
                   
                   } else if( $('#email').val() ==''  ) {
                	   $('#email_check').text('이메일은 필수입니다.').addClass('error_msg').removeClass('pass_msg');
                   } else{
                       $('#email_check').text('잘못된 이메일 형식입니다.').addClass('error_msg').removeClass('pass_msg');
                       email_result = false;
                  }
                  return email_result;
           });
         } // fnEmail
         
         function fnSendAuthCode(){
         	
         	$('#authCode_btn').click(function(){
         		$.ajax({
         			url : '/nearby/member/sendAuthCode',
         			type: 'post',
         			data: 'email='+ $('#email').val(),
         			dataType: 'json',
         			success : function(map) {
         				alert('인증코드가 발송되었습니다.');
         				fnVerifyAuthcode(map.authCode); // 12/13추가
         			//	alert(map.authCode);   ==> SecurityUtils에 authCode 확인용 sysout 추가
         			},
         			error: function() {
     					alert('인증코드 전송 실패');
     				}
         		});	 // ajax
         	});
         	return;
         } */
/* ******************* 12/14 수정 ************* fnVerifyAuthcode() ********************* */
      	// 인증코드 검증 변수와 함수
      	function fnVerifyAuthcode(authCode){
      		$('#verify_btn').click(function(){
      			if ( $('#authCode').val() == authCode ) {
      				alert('인증되었습니다.');
      				authCodePass = true;
      			} else if ( $('#authCode').val() == '' ) { // 12/14 추가
      				alert('인증번호를 입력하세요');
      				authCodePass = false;
      			} else {
      				alert('인증에 실패했습니다.');
      				authCodePass = false;
      			}
      			
      		}); // end click
      	}         
 /* ************************************************************************************ */
         
     
          // 핸드폰
      function	fnPhoneCheck() {
           $('#phone').on('blur', function(){
               if( regPhone.test( $('#phone').val())){    
                   $('#phone_check').text('');
                   $('#phone_check').removeClass('error_msg');
                   phone_result = true;
               } else if ($('#phone').val() == '' ){
                   $('#phone_check').text('핸드폰번호는 필수입니다.');
                   $('#phone_check').addClass('error_msg');
                   phone_result = false;
               } else {
                   $('#phone_check').text('잘못된 형식입니다.');
                   $('#phone_check').addClass('error_msg');
                   phone_result = false;
               }
               return phone_result;
           });
    }  // fnPhone
    
  
    
  // reset_btn 클릭시 msg 없애기
  function fnResetBtn(){
    $('#reset_btn').on('click',function(){
    	$('#id_check').text('');
    	$('#pw_check').text('');
    	$('#pw_double_check').text('');
    	$('#name_check').text('');
    	$('#email_check').text('');
    	$('#authCode').text('');
    	$('#phone_check').text('');
    })
   }
</script>

</head>
<body>

 <!-- 레이아웃 header 삽입하기 -->
 
    <div class="container">
    
        <div class="head">
            <h1 class="title"><a href="#">NearBy</a></h1>
        </div>
 
        <div class="join_form">
    
            <form action="/nearby/member/insertMember" method="post" id="join_form">
                <!-- 아이디 -->
                <div class="input_box">
                    <label for="id">아이디</label>
                    <span class="space">
                 	   <input type="text" id="id" name="id">
                    </span>
                    <span id="id_check"></span>
                </div>

                <!-- 비밀번호 -->
                <div class="input_box">
                    <label for="pw">비밀번호</label>
                    <span class="space">
                  	  <input type="text" id="pw" name="pw">
                    </span>
                    <span id="pw_check"></span>
                </div>

                <!-- 비밀번호 확인 -->
                <div class="input_box">
                    <label for="pw">비밀번호 재확인</label>
                    <span class="space">
	                    <input type="text" id="pwCheck" >
                    </span>
                    <span id="pw_doubleCheck"></span>
                </div>
                
                <!-- 이름 -->
                <div class="input_box">
                    <label for="name">이름</label>
                    <span class="space">
	                    <input type="text" id="name" name="name">
                    </span>
                    <span id="name_check"></span>
                </div>

                <!-- 이메일 -->
                <div class="email_box">

                    <!-- 이메일 -->
                    <label for="email">이메일</label>
                    <span class="space">
	                    <input type="text" id="email" name="email">
                    </span>

                    <!-- 인증코드 발송 -->
                    <span class="space">
	                    <input type="button" value="인증번호받기" id="authCode_btn" class="btns">
                    </span>
                    <span id="email_check"></span>

                    <!-- 인증코드 입력 칸 -->
                    <span class="space">
	                    <input type="text" name="authCode" id="authCode">
                    </span>
                    <input type="button" value="인증하기" id="verify_btn" class="btns">
                </div>

                <!-- 번호 -->
                <div class="tel_box">
                    <label for="phone">번호</label>
                    <span class="space">
	                    <input type="text" id="phone" name="phone" placeholder=" - 표시 없이 입력해주세요">
                    </span>
                    <span id="phone_check"></span>
                </div>

                <!-- 생년월일 -->
                <div class="birth_box">
                    
                    <!-- 년도 -->
                    <label for="birthday">생년월일</label>
                    <select id="birthday" name="year"></select>

                    <!-- 월 -->
                    <select id="month" name="month">
                        <option value="월">월</option>
                    </select>

                    <!-- 일 -->
                    <select id="day" name="day">
                        <option value="일"></option>
                    </select>
                </div>

                <!-- 성별 -->
                <div class="gender_box">
                    <p id="gender_box">성별</p>
                    <!-- 여성 -->
                    <input type="radio" name="gender" value="f" id="female" checked>
                    <label id="f" for="female">여성</label>

                    <!-- 남성 -->
                    <input type="radio" name="gender" value="m" id="male">
                    <label id="m"  for="male">남성</label>

                    <!-- 선택 안 함 -->
                    <input type="radio" name="gender" value="n" id="n">
                    <label id="n"  for="n">선택안함</label>
                </div>

                <div class="join_btn_wrap" id="join_btn_wrap">
                    <button class="btn btn-primary btns">회원가입</button>                 
                    <input type="reset" value="다시작성" id="reset" class="reset btns">                
                </div>                
            </form>
        </div>
   
    </div>
</body>
</html>