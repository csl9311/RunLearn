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
  <input type="button" value="---->홈으로" class="w3-bar-item tablink hoverpink w3-round" onclick="location.href='adminToHome.do';">
  <hr>
  <input type="hidden" name="i" value="${ i }">
  <button id="tablink1" class="w3-bar-item tablink hoverpink w3-round  hotpink fontwhite" onclick="location.href='adminMain.do';" style="width:175px">관리자 메인</button>
  <button id="tablink2" class="w3-bar-item tablink hoverpink w3-round" onclick="location.href='adminUser.do';" style="width:175px">회원관리</button>
  <button id="tablink3" class="w3-bar-item tablink hoverpink w3-round" onclick="location.href='adminPayManage.do';" style="width:175px">결제관리</button>
  <button id="tablink4" class="w3-bar-item tablink hoverpink w3-round" onclick="location.href='adminNoticeAdmin.do';" style="width:175px">고객센터</button>

</div>

<div class="minh"style="margin-left:190px"><!--관리자 페이지 주화면영역  -->
<!-- 관리자 메인 -->
  <div id="sideTabs1" class="w3-container sideTabs animate-fading">
    <h2 class="w3-padding fontthick fonthotpink">관리자 메인</h2><hr class="borderhotpink">
    <!-- 관리자 메인 임시  -->
    <div style="width:1100px;height:1100px;border-right:2px solid #ff005a;float:left;">
    <div id="adminmain1" class="borderhotpinkthick mainBorderRa" style="width:450px;height:450px;margin: 30px;float:left; text-align: left;">
    <span class="fonthotpink" style="margin:15px;margin-top:20px;font-size:20px;">회원 관리</span>
    <button  class=" ligt-pink borderhotpink w3-round-large hoverpink fonthotpink mainMoreBtn" onclick="location.href='adminUser.do';">more</button>
    <hr class="borderhotpink" style="margin-top:5px;width:90%;margin-left:5%;margin-right:5%;">
    	<table class="w3-table-all hoverTablePink">
  	<thead>
  	<tr class="fontwhite mainlistfont" style="background-color:#ff005a;">
  		<th style="width:15%;">회원번호</th>
  		<th style="width:45%;text-align:center;">글제목</th>
  		<th style="width:15%;">카테고리</th>
  		<th style="width:15%;">작성자</th>
  		<th style="width:15%;">시간</th>
  	</tr>
  	</thead>
  	<tr>
  		<th>실험용</th>
  		<th>실험용</th>
  		<th>실험용</th>
  		<th>실험용</th>
  		<th>실험용</th>
  	</tr>
  	</table>
    </div>
  	<div id="adminmain2" class="borderhotpinkthick mainBorderRa" style="width:450px;height:450px;margin: 30px;float:left; text-align: left;">
    <span class="fonthotpink" style="margin:15px;margin-top:20px;font-size:20px;">결제 관리</span>
    <button  class=" ligt-pink borderhotpink w3-round-large hoverpink fonthotpink mainMoreBtn"  onclick="location.href='adminPayManage.do';">more</button>
 	<hr class="borderhotpink" style="margin-top:5px;width:90%;margin-left:5%;margin-right:5%;">
 		<table class="w3-table-all hoverTablePink">
  	<thead>
  	<tr class="fontwhite mainlistfont" style="background-color:#ff005a;">
  		<th style="width:15%;">글번호</th>
  		<th style="width:45%;text-align:center;">글제목</th>
  		<th style="width:15%;">카테고리</th>
  		<th style="width:15%;">작성자</th>
  		<th style="width:15%;">시간</th>
  	</tr>
  	</thead>
  	<tr>
  		<th>실험용</th>
  		<th>실험용</th>
  		<th>실험용</th>

  		<th>실험용</th>
  		<th>실험용</th>
  	</tr>
  	</table>
  	</div>	
  	<div id="adminmain3" class="borderhotpinkthick mainBorderRa" style="width:450px;height:450px;margin: 30px;float:left; text-align: left;">
    <span class="fonthotpink" style="margin:15px;margin-top:20px;font-size:20px;">고겍센터(관리자)</span>
    <button  class=" ligt-pink borderhotpink w3-round-large hoverpink fonthotpink mainMoreBtn"  onclick="location.href='adminNoticeAdmin.do';">more</button>
   <hr class="borderhotpink" style="margin-top:5px;width:90%;margin-left:5%;margin-right:5%;">
   	<table class="w3-table-all hoverTablePink">
  	<thead>
  	<tr class="fontwhite mainlistfont" style="background-color:#ff005a;">
  		<th style="width:15%;">글번호</th>
  		<th style="width:45%;text-align:center;">글제목</th>
  		<th style="width:15%;">카테고리</th>
  		<th style="width:15%;">작성자</th>
  		<th style="width:15%;">시간</th>
  	</tr>
  	</thead>
  	<tr>
  		<th>실험용</th>
  		<th>실험용</th>
  		<th>실험용</th>
  		<th>실험용</th>
  		<th>실험용</th>
  	</tr>
  	</table>
  	</div>
  	<div id="adminmain4" class="borderhotpinkthick mainBorderRa" style="width:450px;height:450px;margin: 30px;float:left; text-align: left;">
   	<span class="fonthotpink" style="margin:15px;margin-top:20px;font-size:20px;">고객센터(요청)</span>
    <button  class=" ligt-pink borderhotpink w3-round-large hoverpink fonthotpink mainMoreBtn"  onclick="location.href='adminNoticeUser.do';">more</button>
    <hr class="borderhotpink" style="margin-top:5px;width:90%;margin-left:5%;margin-right:5%;">
    	<table class="w3-table-all hoverTablePink">
  	<thead>
  	<tr class="fontwhite mainlistfont" style="background-color:#ff005a;">
  		<th style="width:15%;">글번호</th>
  		<th style="width:45%;text-align:center;">글제목</th>
  		<th style="width:15%;">카테고리</th>
  		<th style="width:15%;">작성자</th>
  		<th style="width:15%;">시간</th>
  	</tr>
  	</thead>
  	<tr>
  		<th>실험용</th>
  		<th>실험용</th>
  		<th>실험용</th>
  		<th>실험용</th>
  		<th>실험용</th>
  	</tr>
  	</table>
  	</div>
    </div>
    <div class="borderhotpinkthick mainBorderRa" style="width:500px;min-height: 1000px;margin-left: 1150px;"> 여유 있으면 통계 같은거 넣자!</div>
  </div>
</div><!-- /관리자 페이지 주화면 -->
</body>
</html>