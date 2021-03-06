# NearBy

**개발 : 2021.12 ~ 2022.01** <br>
**link : http://nearbyinc.cafe24.com/**
###### User Login Info
* User Id : test
* User Pw : aaaa1111!
###### Administrator Login Info
* admin Id : admin
* admin Pw : aaaa1111!

### 서비스 내용
👀 프로젝트 목표
* 게시글 작성시 입력되는 유저의 위치 데이터를 활용하여 교류하는 위치기반 **SNS**
* 위치 검색을 통해 유저의 주변 정보를 수집할 수 있다.

👀 사용 대상
**MZ 세대**
  * Millennials and Gen Z
  * 2000년대 중반에 태어난 Z세대를 아울러 MZ세대라고 한다.
  * 디지털에 친숙한 디지털 네이티브세대로 각종 정보기술에 능통한 세대.
  * 스스로 만족을 중요시하며 자기애가 강하고 가치관에 따라 돈과 시간을 아낌없이 투자한다.

### 🛠 기술 스택 및 툴
* HTML, CSS, JavaScript, JQuery, ajax
* Java, JSP, Oracle, MySql
* Tomcat, FileZila, Putty, HeidiSql, STS

### 💻개발 내용


<img src="https://s3.us-west-2.amazonaws.com/secure.notion-static.com/59540447-6001-4cf1-962f-4930e2df25f6/20220314_090339.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20220320%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20220320T045054Z&X-Amz-Expires=86400&X-Amz-Signature=00ef6b82c13998b1e20dbdb191466ca2eacc8702f4d139f2ae4852c230afcce1&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%2220220314_090339.png%22&x-id=GetObject" title="nearbyflow" />


#### 편리한 서비스 구현
* 좋아요, 팔로우, 댓글 기능을 추가하여 이용자간의 연결 최대화.
* 댓글(
[상세보기](https://github.com/SojeongYoony/NearBy/blob/master/NEARBY/src/main/webapp/WEB-INF/views/board/selectView.jsp), 
[모든글보기](https://github.com/SojeongYoony/NearBy/blob/master/NEARBY/src/main/webapp/WEB-INF/views/board/board.jsp)
), 
[개인정보수정](https://github.com/SojeongYoony/NearBy/blob/master/NEARBY/src/main/webapp/WEB-INF/views/member/mypage.jsp), 
[비밀번호 변경](https://github.com/SojeongYoony/NearBy/blob/master/NEARBY/src/main/webapp/WEB-INF/views/member/changePw.jsp) 등 일부 기능 ajax로 구현하여 페이지 변화 없이 즉각 반영

#### 서버 배포
* 배포 사이트의 DB 환경에 ORACLE이 포함되어 있지 않아 MySql Query로 변경하여 해결

#### Notion
* 혼자 개발하는 것이 아닌 **함께 공통된 기능을 개발**하는 것 <br>
  => 개발 시작 전, **notion**으로 일정정리.
* 추가로 **notion**을 통한 코드리뷰 진행 <br>
  => 코드의 질과 이해도 상승
  
### 💡성장경험
#### 협업과 소통
* 한 주의 시작에는 목표설정, 마지막에는 해결하지 못한 코드를 함께 보며 소통, 협업하는 시간을 가졌습니다.
* 일정 도구로는 notion, kakaoTalk을 이용하였으며, github을 통해 협업을 하였습니다.

#### 느낀점
* 팀 프로젝트는 혼자 하는 것이 아닌 **팀과 함께**하는 것으로 팀원들과 교류를 통해 **+@의 시너지를 내는 것**임을 깨달았습니다.
* 팀원의 의견에 귀 기울여 모두가 만족하는 결과를 만들어 낼 수 있도록 하며,<br>
  업무를 수행하는데 있어 적당한 고집은 강단있는 사람으로 비칠 수 있지만, 그것이 결코 아집이 되어서는 안된다는 것을 깨달았습니다.
  
#### 프로젝트를 수행하며 성장한 점
* 변수에 담긴 데이터의 다양한 활용
* 내장 함수의 활용
* JavaScript(jQuery)를 이용하여 상황에 적절한 CSS 적용

### 📌개선 및 아쉬웠던 점
* WebSocket 공부 후 채팅, 알림 서비스 구현
* 좋아요 클릭 시, 페이지 변동되는 점 개선
* 게시판 리스트 무한 스크롤 개선
* 일정 시기가 지나면 비밀번호 변경 알림 추가
* 비밀번호 변경 시, 예전 비밀번호는 사용하지 못 하도록 개선(보안 측면)
* 현재는 관리자 페이지 접근 권한이 admin 아이디로 한정되어 있음 <br>
-> user 테이블의 state column을 활용하여 해당 아이디에 관리자 옵션을 부여하는 형태로 하여 <br> 
   총괄 관리자(Super administrator) 아래 각 서비스를 관리할 수 있도록 옵션 부여 <br>
ex) 총괄 관리자 : 모든 권한 및 유저 아이디 관리자 옵션 부여 가능, <br>
    댓글 관리자 : 모든 댓글 삭제 가능 <br>
    게시글 관리자 : 모든 게시글 삭제 가능 <br>


### ⌨ 구현부 코드 보기

<table border="1">
<tbody>

<tr>
<td colspan="2">기능</td>
<td colspan="3">코드 링크</td>
</tr>

<tr>
<td rowspan="4">댓글</td>
<td>전체보기</td>
<td rowspan="3">
<a href="https://github.com/SojeongYoony/NearBy/blob/master/NEARBY/src/main/java/com/koreait/nearby/service/ReplyServiceImpl.java">
JAVA
</a>
</td>
<td>
<a href="https://github.com/SojeongYoony/NearBy/blob/master/NEARBY/src/main/webapp/WEB-INF/views/board/board.jsp">
JavaScript
</a>
</td>
<td rowspan="4">
<a href="https://github.com/SojeongYoony/NearBy/blob/master/NEARBY/src/main/resources/mybatis/mapper/reply.xml">
DB Query
</a>
</td>
</tr>

<tr>
<td>상세보기</td>
<td>
<a href="https://github.com/SojeongYoony/NearBy/blob/master/NEARBY/src/main/webapp/WEB-INF/views/board/selectView.jsp">
JavaScript
</a>
</td>
<tr>

<tr>
<td>페이징</td>
<td>
<a href="https://github.com/SojeongYoony/NearBy/blob/master/NEARBY/src/main/java/com/koreait/nearby/util/PageUtils.java">
JAVA
</a>
</td>
<td>JavaScript</td>
<tr>
<td rowspan="7">USER</td>
</tr>

<tr>
<td>정보수정</td>
<td rowspan="2">
<a href="https://github.com/SojeongYoony/NearBy/blob/master/NEARBY/src/main/java/com/koreait/nearby/service/MemberServiceImpl.java">
JAVA
</a>
</td>
<td rowspan="2">
<a href="https://github.com/SojeongYoony/NearBy/blob/master/NEARBY/src/main/webapp/WEB-INF/views/member/mypage.jsp">
JavaScript
</a>
</td>
<td rowspan="2">
<a href="https://github.com/SojeongYoony/NearBy/blob/master/NEARBY/src/main/resources/mybatis/mapper/member.xml">
DB Query
</a>
</td>
</tr>

<tr>
<td>회원탈퇴</td>
</tr>

<tr>
<td>프로필사진</td>
<td>
<a href="https://github.com/SojeongYoony/NearBy/blob/master/NEARBY/src/main/java/com/koreait/nearby/service/ProfileServiceImpl.java">
JAVA
</a>
</td>
<td>
<a href="https://github.com/SojeongYoony/NearBy/blob/master/NEARBY/src/main/webapp/WEB-INF/views/member/mypage.jsp">
JavaScript
</a>
</td>
<td>
<a href="https://github.com/SojeongYoony/NearBy/blob/master/NEARBY/src/main/resources/mybatis/mapper/profile.xml">
DB Query
</a>
</td>
</tr>

<tr>
<td>PW 수정</td>
<td>
<a href="https://github.com/SojeongYoony/NearBy/blob/master/NEARBY/src/main/java/com/koreait/nearby/service/MemberServiceImpl.java">
JAVA
</a>
</td>
<td>
<a href="https://github.com/SojeongYoony/NearBy/blob/master/NEARBY/src/main/webapp/WEB-INF/views/member/changePw.jsp">
JavaScript
</a>
</td>
<td>
<a href="https://github.com/SojeongYoony/NearBy/blob/master/NEARBY/src/main/resources/mybatis/mapper/member.xml">
DB Query
</a>
</td>
</tr>

<tr>
<td>세션확인</td>
<td>JAVA</td>
<td>
<a href="https://github.com/SojeongYoony/NearBy/blob/master/NEARBY/src/main/webapp/WEB-INF/views/layout/header.jsp">
JavaScript
</a>
</td>
<td>DB Query</td>
</tr>

</tbody>
</table>
