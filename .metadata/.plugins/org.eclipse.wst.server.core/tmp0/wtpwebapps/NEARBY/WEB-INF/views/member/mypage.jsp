<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<style>
	/* 초기화 */
	*{ margin: 0; padding: 0; box-sizing: border-box; font-size: 14px; font-weight: 600; }
	html{ background-color: rgb(240, 242, 245); }
	a{ text-decoration: 0; color: black; }
	ul, ol{ list-style-type: none; }
	
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
	
	/* profile area */
	#profile_area {
		height: 200px;
		padding: 50px 0 0 80px;
	}
	#profile_result {
		width: 100px;
		height: 100px;
		border-radius:  100px;
	}
	.p_btn {
		padding-top: 10px;
		background-color: white;
		font-size: 14px;
	}
	.p_btn:hover {
		text-decoration: underline;
	}
	#user_name_area {
		font-size: 20px;
		padding-top: 50px;
		margin-left: 50px;
	}
	#file {
		width: 200px;
	}
	#p_img img {
		width: 100%;
		height: 100%;
		border-radius: 100%;
	}
	
	#profile_form {
		display: flex;
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
	    width: 120px; height: 40px;
	    text-align: center;
	    margin: 0 10px 0 0;
	    font-size: 16px;
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
	#find_pw_btn {
		background-color: pink;
	}
	#find_pw_btn:hover {
		background-color: #ff6e56;
	}
	
	.join_btn_wrap input, button{
		color:white;
	    width: 220px; height: 50px;
	    background: linear-gradient(#ff6e56,#ff3268);
	    border-radius: 10px;
	    margin-bottom: 40px;
		border: none; 
	}
	
	/* 모든 버튼 */
	.btns:hover {
		cursor: pointer;
	}

</style>

<script type="text/javascript">

//이름/비밀번호/핸드폰/생일/성별 --> 이메일은X

	$(document).ready(function(){
		fnFindMemberInfo();
		fnBirth();
		fnFileCheck();
		fnHomeBtn();
		fnProfilePic(); // 프로필 사진 등록
		fnModifyMemberInfo();
	}); 
 
    // 아이디
	let regId = /^[a-zA-Z0-9_-]{4,}$/;
    // 이름
	let regName = /^[a-zA-Z가-힣]{1,30}$/;
    // 핸드폰 번호
	let regPhone = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;
	let id_result = false;
	let name_result = false;
	let phone_result = false; 
   
 /* ************************************************************************************ */
 
 
 
 
 
         
	
/* ------------------------------------------------------------ fnFindMemberInfo() ------------------------------------------------------------ */
	// 회원 조회 함수
	function fnFindMemberInfo(){
		let member = JSON.stringify({
			pw: '${loginUser.pw}',
			id: '${loginUser.id}'
		});
		$.ajax({
			 url: '/nearby/member/memberInfo', // url에 param이 아니라, 변수가 포함되어 넘어간다.
		    data: member,
			type: 'post',
			dataType: 'json', // 받아오는 data Type
			success: function(map){
				let birthday = map.result.birthday;
				let year = birthday.substring(0,4);
				let month = birthday.substring(4,6);
				let day = birthday.substring(6,8);
				if (map.member != null) { 
					$('#mNo').val(map.result.mNo); 
					$('#phone').val(map.result.phone);
					$('#content').val(map.result.content);
					$('#name').val(map.result.name);
					$('#birthday').val(year);
					$('#month').val(month);
					$('#day').val(day);
					$('input:radio[name="gender"][value="'+map.result.gender+'"]').prop('checked', true); // prop는 객체에 저장 된 값이므로 true or false가 된다
				} else {
					alert( $('#name') + '님의 회원 정보가 없습니다.');
				}
			}
		}) // End ajax
 	} // End fnFindMemberInfo

/* ------------------------------------------------------------ fnFileCheck() ------------------------------------------------------------ */
	// 첨부파일 점검 함수 (확장자 + 크기)
	function fnFileCheck(){
		
		$('#file').on('change', function(){
			/* 확장자 점검 */
			let origin = $(this).val(); // 첨부된 파일명
			let extName = origin.substring(origin.lastIndexOf(".") + 1).toUpperCase(); // 확장자를 대문자로 저장 aaa.aaa.aaa.ccc 일 때, 마지막 마침표 다음 자리부터 끝까지 substring으로 가지고오고 
			if ( $.inArray(extName, ['JPG', 'JPEG', 'GIF', 'PNG']) == -1 ) {	// 첨부된 파일이 ['JPG', 'JPEG', 'GIF', 'PNG'] 중 하나가 아니면 (-1) :: 확장자 제한 두기
				Swal.fire({
					icon: 'warning',
					title: '확장자를 확인해주세요',
					text: '첨부 가능한 이미지의 확장자는 jpg, jpeg, gif, png 입니다.'
				});
				$(this).val(''); // 첨부 초기화
				return;
			}			
			
			/* 파일크기 점검 */
			let maxSize = 1024 * 1024 * 10;	// 최대 크기 10MB
			let fileSize = $(this)[0].files[0].size; // 첨부된 파일 크기
			if (fileSize > maxSize) {
				Swal.fire({
					icon: 'warning',
					title: '파일의 크기를 확인해 주세요',
					text: '10MB 이하의 파일만 사용하실 수 있습니다.'
				});
				$(this).val('');
				return;
			}
			
		}) // change function
		
	} //fn FileCheck
	

/* ------------------------------------------------------------ fnProfilePic() ------------------------------------------------------------ */
	// 사진 변경
	function fnProfilePic(){
		$('#insert_btn').on('click', function(){
/* 			if($('#file').val() == '') {
				Swal.fire({
					icon: 'warning',
					title: '등록된 사진이 없습니다'
				});
				return;
			} // End if */
			
			var formData = new FormData();
				formData.append('content', $('#content').val());
				formData.append('id', $('#id').val());
				
				let file = $('#file')[0].files[0];
				formData.append('file', file); // 첨부를 FormData에 넣기
				console.log(formData);
			
				$.ajax({
				url: '/nearby/profile/profilePic',
				type: 'post',
				contentType: false,
				processData: false,
				data: formData,
				enctype: 'multipart/form-data',
				dataType: 'json',
				success: function(map){
					if(map.insertResult && map.insertResult > 0) {
						Swal.fire({
							icon: 'success',
							title: '사진등록완료',
							text: map.profile.id + '님의 프로필 사진등록이 완료되었습니다.',
						})
						$('#file').val('');
						$('#content').val('');
						fnShowAttachedFile(map);
					} else {
						Swal.fire({
							icon: 'error',
							title: '사진등록실패',
							text: map.profile.id + '님의 프로필 사진등록을 실패했습니다.',
						})
					}
				} // success
			}) // End ajax
			
		}) // End insert_btn click event
	} // fnProfilePic

	
/* ------------------------------------------------------------ fnShowAttachedFile() ------------------------------------------------------------ */
	// 첨부된 파일 확인 함수
 	function fnShowAttachedFile(map) {
		$('#profile_result').empty();
	
		$('#profile_result')
		.append( $('<div id="p_img" style="width:100%;height:100%;">').html( $('<img>').attr('src', '/nearby/' + map.profile.path + '/' + map.profile.pSaved) ) );
	} 
	

/* ---------------------------------------------------------- fnModifyMemberInfo() ------------------------------ */
	// 회원정보 수정하기 modify_btn"
	function fnModifyMemberInfo() {
		$('#modify_btn').click(function(){
	// /nearby/member/modifyMember'
			let member = JSON.stringify({
				mNo: $('#mNo').val(),
				name: $('#name').val(),
				phone: $('#phone').val(),
				birthday: $('#birthday').val() + $('#month').val() + $('#day').val(),
				gender: $('input:radio[name="gender"]:checked').val()
			});
			$.ajax({
				url: '/nearby/member/modifyMember',
				type: 'post',
				data: member,
				contentType: 'application/json',
				dataType: 'json',
				success: function(map){
					if(map.result && map.result > 0) {
						Swal.fire({
				            icon: 'success',
				            title: '수정완료',
				            text: map.member.name + '님의 회원정보가 수정되었습니다.',
				        });
						fnFindMemberInfo();
					} else {
						Swal.fire({
				            icon: 'error',
				            title: map.nullErrorMsg,
				            text: map.nullErrorMsg + ' 내용을 채워주세요.',
				        });
					}
					
					console.log(map.member.mNo); // 성공시 member 객체에 각 data가 담겨있음.
					console.log(map.member.name);
					console.log(map.member.phone);
					console.log("성공 : " + map.result); // updateResult > 0 성공
				} // End fn_success
			}) // End ajax
		}) // End modify_btn click event
	} // End fnModifyMemberInfo
	
	
</script>
	    
<script>


/* ---------------------------------------	fnHomeBtn()	------------------------------------------- */
	// 홈으로 가기
	function fnHomeBtn() {
		$('#home_btn').on('click', function(){
			if(confirm('홈으로 이동하시겠습니까?')) {
				location.href='/nearby/board/updateProfilePicture';
			}
		}) // End home_btn click event
	} // End fnHomeBtn


/* ---------------------------------------	fnResetBtn() ------------------------------------------- */
  // reset_btn 클릭시 msg 없애기
  function fnResetBtn(){
    $('#reset_btn').on('click',function(){
    	$('#id_check').text('');
    	$('#name_check').text('');
    	$('#phone_check').text('');
    })
   }
	// 생년월일 삽입
	function fnBirth(){
		let year = '';
		year +=  '<option value="year">년도</option>';
		for(let i=2007; i>=1907; i--){
		    year += '<option value="'+i+'">'+i+'</option>';
		}
		 $('#birthday').html(year);
		
		let month = '';
		month +=  '<option value="month">월</option>';
		for(let i=1; i<=9; i++){
		    month += '<option value="'+'0'+i+'">'+i+'</option>';
		}
		for(let i=10; i<=12; i++){
		    month += '<option value="'+i+'">'+i+'</option>';
		}
		 $('#month').html(month);
		 
		 let day ='';
		 day += '<option value="day">일</option>';
		 for(let i=1; i<=9; i++){
		     day += '<option value="'+'0'+i+'">'+i+'</option>';
		 }
		 for(let i=10; i<=31; i++){
		     day += '<option value="'+i+'">'+i+'</option>';
		 }
		  $('#day').html(day);	 
	}
</script>
</head>
<body>

 <!-- 레이아웃 header 삽입하기 -->
    <div class="container">
    	<p id='user_name_area'>${loginUser.name}님 페이지</p>
    	<div id="profile_area">
			<div id="profile_result">
				<div id="p_img" style="width:100%;height:100%;">
					<img src="/nearby/${loginUser.profile.path}/${loginUser.profile.pSaved}">
				</div>
			</div>
			<form id="profile_form">
				<input type="hidden" id="id" value="${loginUser.id}">
				<input type="file" id="file">
				<textarea rows="3" cols="25" placeholder="자신을 맘껏 표현해보세요" id="content" name="content">${loginUser.profile.content}</textarea>
			</form>
			<input type="button" value='사진변경' id="insert_btn" class="p_btn btns"> / 
			<input type="button" value='사진삭제' id="delete_btn" class="p_btn btns">
    	</div>
 
        <div class="join_form">
			<input type="hidden" value="${loginUser.mNo}" id="mNo" name="mNo">
               <!-- 이름 -->
               <div class="input_box">
                   <label for="name">이름</label>
                   <span class="space">
                    <input type="text" id="name" name="name">
                   </span>
                   <span id="name_check"></span>
               </div>

               <!-- 번호 -->
               <div class="tel_box">
                   <label for="phone">핸드폰 번호</label>
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
                   <label id="f" for="female" class="btns">여성</label>

                   <!-- 남성 -->
                   <input type="radio" name="gender" value="m" id="male" class="btns">
                   <label id="m"  for="male" class="btns">남성</label>

                   <!-- 선택 안 함 -->
                   <input type="radio" name="gender" value="n" id="n" class="btns">
                   <label id="n"  for="n" class="btns">선택안함</label>
               </div>

               <!-- 비밀번호 -->
               <div class="input_box">
                   <label for="find_pw_btn">비밀번호 수정</label>
                   <input type="button"  class="btn btns" id="find_pw_btn" value="비밀번호 변경 이동">
               </div>

               <div class="join_btn_wrap" id="join_btn_wrap">
                   <input type="button" id="modify_btn" class="btn btn-primary btns" value="수정완료">                
                   <input type="reset" value="다시작성" id="reset" class="reset btns">                
                   <input type="button" value="홈으로" id="home_btn" class="btns">                
               </div>                
        </div>
    </div>
</body>
</html>