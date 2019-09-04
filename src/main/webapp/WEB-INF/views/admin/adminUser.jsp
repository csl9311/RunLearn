<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href='${ contextPath }/resources/css/admin/admin.css'>
</head>
<body>

 <h2 class="w3-padding fontthick fonthotpink">회원관리</h2><hr class="borderhotpink">
    <div class="w3-container">

  <div class="w3-bar w3-white w3-card">
    <button class="w3-bar-item sidetab2menu w3-round hoverpink hotpink fontwhite" onclick="st2menu(event,'st2menu1')" style="min-width:150px; margin-left:5px;margin-right:5px;">모든회원</button>
    <button class="w3-bar-item sidetab2menu w3-round hoverpink" onclick="st2menu(event,'st2menu2')" style="min-width:150px; margin-left:5px;margin-right:5px;">튜티회원</button>
    <button class="w3-bar-item sidetab2menu w3-round hoverpink" onclick="st2menu(event,'st2menu3')" style="min-width:150px; margin-left:5px;margin-right:5px;">튜터회원조회</button>
    <button class="w3-bar-item sidetab2menu w3-round hoverpink" onclick="st2menu(event,'st2menu4')" style="min-width:150px; margin-left:5px;margin-right:5px;">튜터신청</button>
    <button class="w3-bar-item sidetab2menu w3-round hoverpink" onclick="st2menu(event,'st2menu5')" style="min-width:150px; margin-left:5px;margin-right:5px;">블랙회원관리</button>
  </div>
  
  <div id="st2menu1" class="w3-container borderhotpink sidetab2menus animate-fading" style="border-top:white">
    <h3 class="fonthotpink" style="font-weight:bold">모든회원</h3><span class="fonthotpink">명의 회원이있습니다</span>
    <button class="listbtn fontwhite" style="margin:5px;margin-right:20px;float:right;">일단버튼</button>
    <table class="w3-table-all hoverTablePink">
  	<thead>
  	<tr class="fontwhite" style="background-color:#ff005a;">
  		<th style="width:auto;text-align:center;">회원번호</th>
  		<th style="width:auto;text-align:center;">회원 사진</th>
  		
  		<th style="width:auto;text-align:center;">아이디</th>
  		<th style="width:auto;text-align:center;">이름</th>
  		<th style="width:auto;text-align:center;">닉네임</th>
  		<th style="width:auto;text-align:center;">이메일</th>
  		<th style="width:auto;text-align:center;">전화번호</th>
  		<th style="width:auto;text-align:center;">가입일</th>
  		<th style="width:auto;text-align:center;">정보수정일</th>  		
  		<th style="width:auto;text-align:center;">등급</th>
  		<th style="width:auto;text-align:center;">상태</th>
  		<th style="width:auto;text-align:center;">주소</th> 
  		<th style="width:auto;text-align:center;">수정</th>
  		
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
  
  <div id="st2menu2" class="w3-container borderhotpink sidetab2menus animate-fading" style="display:none;border-top:white">
    <h3 class="fonthotpink" style="font-weight:bold">튜티회원조회</h3><span class="fonthotpink">명의 튜티회원이있습니다</span>
    <button class="listbtn fontwhite" style="margin:5px;margin-right:20px;float:right;">일단버튼</button>
    <table class="w3-table-all hoverTablePink">
  	<thead>
  	<tr class="fontwhite" style="background-color:#ff005a;">
  		<th style="width:auto;text-align:center;">회원번호</th>
  		<th style="width:auto;text-align:center;">회원 사진</th>
  		
  		<th style="width:auto;text-align:center;">아이디</th>
  		<th style="width:auto;text-align:center;">이름</th>
  		<th style="width:auto;text-align:center;">닉네임</th>
  		<th style="width:auto;text-align:center;">이메일</th>
  		<th style="width:auto;text-align:center;">전화번호</th>
  		<th style="width:auto;text-align:center;">가입일</th>
  		<th style="width:auto;text-align:center;">정보수정일</th>  		
  		<th style="width:auto;text-align:center;">등급</th>
  		<th style="width:auto;text-align:center;">상태</th>
  		<th style="width:auto;text-align:center;">주소</th> 
  		<th style="width:auto;text-align:center;">수정</th>
  		
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

  <div id="st2menu3" class="w3-container borderhotpink sidetab2menus animate-fading" style="display:none;border-top:white">

    <h3 class="fonthotpink" style="font-weight:bold">튜터회원조회 lecture조인 아코디언으로 해야 정확한 프로필 열람가능 할거같음</h3><span class="fonthotpink">명의 튜터회원이있습니다</span>
    <button class="listbtn fontwhite" style="margin:5px;margin-right:20px;float:right;">일단 버튼</button>
    <table class="w3-table-all hoverTablePink">
  	<thead>
  	<tr class="fontwhite" style="background-color:#ff005a;">
  		<th style="width:auto;text-align:center;">회원번호</th>
  		<th style="width:auto;text-align:center;">회원 사진</th>
  		<th style="width:auto;text-align:center;">이이디</th>
  		<th style="width:auto;text-align:center;">이름</th>
  		<th style="width:auto;text-align:center;">닉네임</th>
  		<th style="width:auto;text-align:center;">이메일</th>
  		<th style="width:auto;text-align:center;">전화번호</th>
  		<th style="width:auto;text-align:center;">가입일</th>
  		<th style="width:auto;text-align:center;">정보수정일</th>  		
  		<th style="width:auto;text-align:center;">등급</th>
  		<th style="width:auto;text-align:center;">상태</th>
  		<th style="width:auto;text-align:center;">주소</th>
  		<th style="width:auto;text-align:center;">수정</th>
  	</tr>
  	</thead>
  	<tr>
  		<th style="text-align:center;">실험용</th>
  		<th style="text-align:center;">실험용</th>
  		<th style="text-align:center;">실험용</th>
  		<th style="text-align:center;">실험용</th>
  		<th style="text-align:center;">실험용</th>
  		<th style="text-align:center;">실험용</th>
  		<th style="text-align:center;">실험용</th>
  		<th style="text-align:center;">실험용</th>
  		<th style="text-align:center;">실험용</th>
  		<th style="text-align:center;">실험용</th>
  		<th style="text-align:center;">실험용</th>
  		<th style="text-align:center;">실험용</th>
  		
  		<th style="text-align:center;"><button class="listbtn fontwhite">수정</button></th>
  	</tr>
  	</table>
  </div>

  <div id="st2menu4" class="w3-container borderhotpink sidetab2menus animate-fading" style="display:none;border-top:white">
 
    <h3 class="fonthotpink" style="font-weight:bold">튜터신청 목록</h3><span class="fonthotpink">명이 신청하였습니다</span>
    <button class="listbtn fontwhite" style="margin:5px;margin-right:20px;float:right;">일단 버튼</button>
    <table class="w3-table-all hoverTablePink">
  	<thead>
  	<tr class="fontwhite" style="background-color:#ff005a;">
  		<th style="width:auto;text-align:center;">회원번호</th>
  		<th style="width:auto;text-align:center;">회원 사진</th>
  		
  		<th style="width:auto;text-align:center;">아이디</th>
  		<th style="width:auto;text-align:center;">이름</th>
  		<th style="width:auto;text-align:center;">닉네임</th>
  		<th style="width:auto;text-align:center;">이메일</th>
  		<th style="width:auto;text-align:center;">전화번호</th>
  		<th style="width:auto;text-align:center;">가입일</th>
  		<th style="width:auto;text-align:center;">정보수정일</th>  		
  		<th style="width:auto;text-align:center;">등급</th>
  		<th style="width:auto;text-align:center;">상태</th>
  		<th style="width:auto;text-align:center;">주소</th>
  		<th style="width:auto;text-align:center;">수정</th>
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
  
  <div id="st2menu5" class="w3-container borderhotpink sidetab2menus animate-fading" style="display:none;border-top:white">

    <h3 class="fonthotpink" style="font-weight:bold">블랙회원관리 목록</h3><span class="fonthotpink">명의 블랙회원이있습니다</span>
    <button class="listbtn fontwhite" style="margin:5px;margin-right:20px;float:right;">일단버튼</button>
    <table class="w3-table-all hoverTablePink">
  	<thead>
  	<tr class="fontwhite" style="background-color:#ff005a;">
  		<th style="width:auto;text-align:center;">회원번호</th>
  		<th style="width:auto;text-align:center;">아이디</th>
  		<th style="width:20%;text-align:center;">블랙사유</th>
  		<th style="width:auto;text-align:center;">이름</th>
  		<th style="width:auto;text-align:center;">닉네임</th>
  		<th style="width:auto;text-align:center;">이메일</th>
  		<th style="width:auto;text-align:center;">전화번호</th>
  		<th style="width:auto;text-align:center;">가입일</th>
  		<th style="width:auto;text-align:center;">블랙변경일</th>  		
  		<th style="width:auto;text-align:center;">등급</th>
  		<th style="width:auto;text-align:center;">상태</th>
  		<th style="width:auto;text-align:center;">수정</th>
  	</tr>
  	</thead>
  	<tr>
  		<th style="text-align:center;">실험용</th>
		<th style="text-align:center;">실험용</th>
  		<th style="text-align:center;">실험용</th>
  		<th style="text-align:center;">실험용</th>
  		<th style="text-align:center;">실험용</th>
  		<th style="text-align:center;">실험용</th>
  		<th style="text-align:center;">실험용</th>
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
function st2menu(evt, sidetab2menu) {
  var i, x, tablinks;
  x = document.getElementsByClassName("sidetab2menus");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("sidetab2menu");
  for (i = 0; i < x.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" hotpink fontwhite", "");
  }
  document.getElementById(sidetab2menu).style.display = "block";
  evt.currentTarget.className += " hotpink fontwhite";
}
</script>
</body>
</html>