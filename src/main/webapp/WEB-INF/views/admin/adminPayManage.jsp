<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href='${ contextPath }/resources/css/admin/admin.css'>
</head>
<body>
<c:url var="adminMain" value="adminMain.do"/>
<c:url var="adminUser" value="adminUsesr.do"/>
<%-- <c:url var="adminPayManage" value="adminPayManage.do"/> --%>
<c:url var="adminNoticeAdmin" value="adminNoticeAdmin.do"/>
<c:url var="adminNoticeUser" value="adminNoticeUser.do"/>
<c:url var="adminBoardDetailView" value="adminBoardDetailView.do"/>
<c:url var="adminBoardInsertView" value="adminBoardInsertView.do"/>

<div class="sidebar w3-bar-block  w3-card" style="width:180px; margin-top:3px;">
  <h6 class="w3-bar-item fonthotpink" style="font-size:23px;">관리자페이지</h6>
 <input type="button" value="---->홈으로" class="w3-bar-item tablink hoverpink w3-round" onclick="location.href='adminToHome.do';">  <hr>
  <button id="tablink1" class="w3-bar-item tablink hoverpink w3-round" onclick="location.href='adminMain.do';" style="width:175px">관리자 메인</button>
  <button id="tablink2" class="w3-bar-item tablink hoverpink w3-round" onclick="location.href='adminUser.do';" style="width:175px">회원관리</button>
  <button id="tablink3" class="w3-bar-item tablink hoverpink w3-round hotpink fontwhite" onclick="location.href='adminPayManage.do';" style="width:175px">결제관리</button>
  <button id="tablink4" class="w3-bar-item tablink hoverpink w3-round" onclick="location.href='adminNoticeAdmin.do';" style="width:175px">고객센터</button>

</div>

<div class="minh"style="margin-left:190px">
  <h2 class="w3-padding fontthick fonthotpink">결제관리</h2><hr class="borderhotpink">
 <div class="w3-container">

  <div class="w3-bar w3-white w3-card">
    <button class="w3-bar-item  sidetab3menu w3-round hoverpink hotpink fontwhite" onclick="st3menu(event,'st3menu1')" style="min-width:150px; margin-left:5px;margin-right:5px;">상품</button>
    <button class="w3-bar-item  sidetab3menu w3-round hoverpink" onclick="st3menu(event,'st3menu2')" style="min-width:150px; margin-left:5px;margin-right:5px;">강의</button>
   
  </div>
  
  <div id="st3menu1" class="w3-container borderhotpink sidetab3menus animate-fading">

     <h3 class="fonthotpink" style="font-weight:bold">상품</h3>
    <button class="listbtn fontwhite" style="margin:5px;margin-right:20px;float:right;">글 작성</button>
    <table class="w3-table-all hoverTablePink">
  	<thead>
  	<tr class="fontwhite" style="background-color:#ff005a;">
  		<th style="width:5%;text-align:center;">글번호</th>
  		<th style="width:60%;text-align:center;">글제목</th>
  		<th style="width:5%;text-align:center;">작성자</th>
  		<th style="width:5%;text-align:center;">조회수</th>
  		<th style="width:5%;text-align:center;">댓글수</th>
  		<th style="width:10%;text-align:center;">작성시간</th>
  		<th style="width:10%;text-align:center;">작성시간</th>
  	</tr>
  	</thead>
  	<tr>
  		<th style="text-align:center;">실험용</th>
  		<th>실험용</th>
  		<th style="text-align:center;">실험용</th>
  		<th style="text-align:center;">실험용</th>
  		<th style="text-align:center;">실험용</th>
  		<th style="text-align:center;">실험용</th>
  		<th style="text-align:center;"><button class="listbtn fontwhite">수정</button></th>
  	</tr>
  	</table>
  </div>

  <div id="st3menu2" class="w3-container borderhotpink sidetab3menus animate-fading" style="display:none">
   <h3 class="fonthotpink" style="font-weight:bold">강의</h3>
    <button class="listbtn fontwhite" style="margin:5px;margin-right:20px;float:right;">글 작성</button>
    <table class="w3-table-all hoverTablePink">
  	<thead>
  	<tr class="fontwhite" style="background-color:#ff005a;">
  		<th style="width:5%;text-align:center;">글번호</th>
  		<th style="width:60%;text-align:center;">글제목</th>
  		<th style="width:5%;text-align:center;">작성자</th>
  		<th style="width:5%;text-align:center;">조회수</th>
  		<th style="width:5%;text-align:center;">댓글수</th>
  		<th style="width:10%;text-align:center;">작성시간</th>
  		<th style="width:10%;text-align:center;">작성시간</th>
  	</tr>
  	</thead>
  	<tr>
  		<th style="text-align:center;">실험용</th>
  		<th>실험용</th>
  		<th style="text-align:center;">실험용</th>
  		<th style="text-align:center;">실험용</th>
  		<th style="text-align:center;">실험용</th>
  		<th style="text-align:center;">실험용</th>
  		<th style="text-align:center;"><button class="listbtn fontwhite">수정</button></th>
  	</tr>
  	</table>
    
  </div>
  </div>
  <script>
function st3menu(evt, sidetab3menu) {
  var i, x, tablinks;
  x = document.getElementsByClassName("sidetab3menus");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("sidetab3menu");
  for (i = 0; i < x.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" hotpink fontwhite", "");
  }
  document.getElementById(sidetab3menu).style.display = "block";
  evt.currentTarget.className += " hotpink fontwhite";
}
</script>
</div>
</body>
</html>