<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<!-- <script type="text/javascript"
	src="resources/js/jquery-3.4.1.min.js"></script> --><!-- js 오류 날시  -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href='${ contextPath }/resources/css/admin/admin.css'>

<!-- 읽어주세요
w3 css 기반에 제가 몇개 추개해서 구성하였습니다
클래스나 아이디 이름뒤에 붙은 숫자는 왼쪽 st가 sidetab의 순번 뒤의 menu가 그sidetab에 해당하는 메뉴 순번입니다
 -->
</head>
<%-- <c:url var="adminMain" value="adminMain.do"/> --%>
<c:url var="adminUser" value="adminUsesr.do"/>
<c:url var="adminPayManage" value="adminPayManage.do"/>
<c:url var="adminNoticeAdmin" value="adminNoticeAdmin.do"/>
<c:url var="adminNoticeUser" value="adminNoticeUser.do"/>
<c:url var="adminBoardDetailView" value="adminBoardDetailView.do"/>
<c:url var="adminBoardInsertView" value="adminBoardInsertView.do"/>

<body class="scroll">

<div class="sidebar w3-bar-block  w3-card" style="width:180px; margin-top:3px;">
  <h6 class="w3-bar-item fonthotpink" style="font-size:23px;">관리자페이지</h6>
  <input type="button" value="홈으로(로그아웃)" class="w3-bar-item tablink hoverpink w3-round" onclick="location.href='logout.do';">
  <hr>
  <input type="hidden" name="i" value="${ i }">
  <button id="tablink1" class="w3-bar-item tablink hoverpink w3-round  hotpink fontwhite" onclick="location.href='adminMain.do';" style="width:175px">관리자 메인</button>
  <button id="tablink2" class="w3-bar-item tablink hoverpink w3-round" onclick="location.href='adminUser.do';" style="width:175px">회원관리</button>
  <button id="tablink3" class="w3-bar-item tablink hoverpink w3-round" onclick="location.href='adminPayManage.do';" style="width:175px">강의신청</button>
  <button id="tablink4" class="w3-bar-item tablink hoverpink w3-round" onclick="location.href='adminNoticeAdmin.do';" style="width:175px">고객센터</button>

</div>

<div class="minh"style="margin-left:190px"><!--관리자 페이지 주화면영역  -->
<!-- 관리자 메인 -->
  <div id="sideTabs1" class="w3-container sideTabs animate-fading">
    <h2 class="w3-padding fontthick fonthotpink">관리자 메인</h2><hr class="borderhotpink">
    <!-- 관리자 메인 임시  -->
    <div style="width:1100px;height:1100px;float:left;margin-left:300px;">
    <div id="adminmain1" class="borderhotpinkthick mainBorderRa" style="width:450px;min-height:700px;margin: 30px;float:left; text-align: left;">
  <h3 class="fonthotpink">유저 통계</h3>
    
    
    
    <h3 class="fonthotpink">전체회원 : ${ pia.listCount } </h3><br>
    <h3 class="fonthotpink">튜티회원 : ${ pitee.listCount } </h3><br>
    <h3 class="fonthotpink">튜터회원 : ${ pitor.listCount } </h3><br>
    <h3 class="fonthotpink">블랙회원 : ${ pib.listCount } </h3><br>
    <h3 class="fonthotpink">상태 'N' 회원 : ${ pil.listCount } </h3><br>
    <h3 class="fonthotpink">관리자 수 : ${ piad.listCount }</h3><br>
     <h3 class="fonthotpink">오늘 가입한 유저 수 : ${ createUserCount }</h3><br>
      <h3 class="fonthotpink">오늘 정보수정한 유저 수 : ${ modifyUserCount }</h3><br>
  	
    </div>
  	<div id="adminmain2" class="borderhotpinkthick mainBorderRa" style="width:450px;;min-height:700px;margin: 30px;float:left; text-align: left;">
    <h3 class="fonthotpink">글 통계</h3>
    
    
    
    <h3 class="fonthotpink">모든글 수: ${ bla.listCount } </h3><br>
    <h3 class="fonthotpink">공지사항 글 수 : ${ pitee.listCount } </h3><br>
    <h3 class="fonthotpink">질문 수: ${ pitor.listCount } </h3><br>
    <h3 class="fonthotpink"> 건의 수: ${ pib.listCount } </h3><br>
    <h3 class="fonthotpink">신고글 수: ${ pil.listCount } </h3><br>
    
    <h3 class="fonthotpink">강의 신청수: ${ lpi.listCount } </h3><br>
  	</div>	
  	
  
    </div>

  </div>
</div><!-- /관리자 페이지 주화면 -->
</body>
</html>