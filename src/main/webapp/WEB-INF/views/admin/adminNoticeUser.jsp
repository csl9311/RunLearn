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
<body>
    <h2 class="w3-padding fontthick fonthotpink">고객센터</h2><hr class="borderhotpink">
    <div class="w3-container">

  <div class="w3-bar w3-white w3-card">
    <button class="w3-bar-item  sidetab5menu w3-round hoverpink hotpink fontwhite" onclick="st5menu(event,'st5menu1')" style="min-width:150px; margin-left:5px;margin-right:5px;">강의신청</button>
    <button class="w3-bar-item  sidetab5menu w3-round hoverpink" onclick="st5menu(event,'st5menu2')" style="min-width:150px; margin-left:5px;margin-right:5px;">질문 게시판</button>
    <button class="w3-bar-item  sidetab5menu w3-round hoverpink" onclick="st5menu(event,'st5menu3')" style="min-width:150px; margin-left:5px;margin-right:5px;">건의 게시판</button>
        <button class="w3-bar-item  sidetab5menu w3-round hoverpink" onclick="st5menu(event,'st5menu4')" style="min-width:150px; margin-left:5px;margin-right:5px;">신고글</button>

  </div>
  <div id="st5menu1" class="w3-container borderhotpink sidetab5menus animate-fading" style="border-top:white">
  	  <h3 class="fonthotpink" style="font-weight:bold">강의신청</h3>
    <button class="listbtn fontwhite" style="width:200px;margin:5px;margin-right:20px;float:right;">수정해야함</button>
    <table class="w3-table-all hoverTablePink">
  	<thead>
  	<tr class="fontwhite" style="background-color:#ff005a;">
  		<th style="width:auto;text-align:center;">신청번호</th>
  		<th style="width:60%;text-align:center;">신청제목</th>
  		<th style="width:auto;text-align:center;">작성자</th>
  		<th style="width:auto;text-align:center;">카테고리</th>
  		<th style="width:auto;text-align:center;">신청한강의 상태</th>
  		<th style="width:auto;text-align:center;">작성시간</th>
  		<th style="width:auto;text-align:center;">수정시간</th>
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
  	
  	</tr>
  	</table>
  	
  </div>
  
  <div id="st5menu2" class="w3-container borderhotpink sidetab5menus animate-fading" style="display:none;border-top:white">
      <h3 class="fonthotpink" style="font-weight:bold">작성자의 종류를 통해 닉네임 색상을 정하자</h3>
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

  <div id="st5menu3" class="w3-container borderhotpink sidetab5menus animate-fading" style="display:none;border-top:white">
      <h3 class="fonthotpink" style="font-weight:bold">건의도 튜티 튜터 닉네임 색상을 정해서 하자</h3>
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
  <div id="st5menu4" class="w3-container borderhotpink sidetab5menus animate-fading" style="display:none;border-top:white">
    <h3 class="fonthotpink" style="font-weight:bold">신고글 관리</h3>
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
<script>
function st5menu(evt, sidetab5menu) {
  var i, x, tablinks;
  x = document.getElementsByClassName("sidetab5menus");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("sidetab5menu");
  for (i = 0; i < x.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" hotpink fontwhite", "");
  }
  document.getElementById(sidetab5menu).style.display = "block";
  evt.currentTarget.className += " hotpink fontwhite";
}
</script>
  
</div>
</body>
</html>