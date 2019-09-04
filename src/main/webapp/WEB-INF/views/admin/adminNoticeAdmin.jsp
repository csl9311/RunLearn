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
 <h2 class="w3-padding fontthick fonthotpink">관리자 게시글</h2><hr class="borderhotpink">
    <div class="w3-container">

  <div class="w3-bar w3-white w3-card">
    <button class="w3-bar-item  sidetab4menu w3-round hoverpink hotpink fontwhite" onclick="st4menu(event,'st4menu1')" style="min-width:150px; margin-left:5px;margin-right:5px;">공지사항</button>
    <button class="w3-bar-item  sidetab4menu w3-round hoverpink" onclick="st4menu(event,'st4menu2')" style="min-width:150px; margin-left:5px;margin-right:5px;">fna</button>
    
  </div>
  
  <div id="st4menu1" class="w3-container borderhotpink sidetab4menus animate-fading" style="border-top:white">
    <h3 class="fonthotpink" style="font-weight:bold">공지사항</h3>
    <button class="listbtn fontwhite" style="margin:5px;margin-right:20px;float:right;"onclick="location.href='adminBoardInsertView.do';">글 작성</button>
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

 

  
  <div id="st4menu2" class="w3-container borderhotpink sidetab4menus animate-fading" style="display:none;border-top:white">
      <h3 class="fonthotpink" style="font-weight:bold">자주묻는질문등 넣어도되고 빼도되고</h3>
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
function st4menu(evt, sidetab4menu) {
  var i, x, tablinks;
  x = document.getElementsByClassName("sidetab4menus");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("sidetab4menus");
  for (i = 0; i < x.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" hotpink fontwhite", "");
  }
  document.getElementById(sidetab4menu).style.display = "block";
  evt.currentTarget.className += " hotpink fontwhite";
}
</script>

</body>
</html>