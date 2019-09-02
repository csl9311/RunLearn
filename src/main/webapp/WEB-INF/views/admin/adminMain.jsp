<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
table{margin-bottom:10px;}
.fontthick{font-weight: 500;}
.fonthotpink{color:#ff005a;}
.hotpink{background-color:#ff005a; !important}
.borderhotpink{border: 1px solid #ff005a;}
.borderhotpinkthick{border: 4px solid #ff005a;}
.fontwhite{color:white;font:bold;}
.ligt-pink{background-color:#F8E0EC; !important}
.hoverpink:hover{background-color:#F5A9BC; color:white;!important}
.tablink{margin:2px; border:0.1px solid #ff005a;}
.marginbtn{margin:2px; border:0.1px solid #ff005a; }
.animate-fading{animation:opac 0.8s }
.minh{min-height:900px;}
.sidebar{height:95%;width:200px;background-color:#fff;position:absolute!important;z-index:1;overflow:auto;display:block!important}
.mainMoreBtn{font-size:17px;float:right; margin:3px;margin-right:10px; height:25px;width:60px;vertical-align:center; font-weight:bold; !impotant}
.mainBorderRa{border-radius:10px;}
.hoverTablePink tr:hover{background-color:#ff005a; color:white; opacity:0.7; !important}
.hoverTablePink tr>button:{background-color:black; color:white;}
.listbtn{border-radius:4px;background-color:gray;font-color:white;font-weight:bold;border:0px; width:80px; height:25px;}
.listbtn:hover{background-color:#3B0B17;}
.mainlistfont{font-size:10px;}
.mainlistfont>th>tr{font-size:5px;}
/* 버튼 글씨체 알 맞게 적용할것  */

/* 스크롤바 */
.scroll::-webkit-scrollbar-track
{
	-webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
	border-radius: 10px;
	background-color: #F8E0EC;
}

.scroll::-webkit-scrollbar
{
	width: 12px;
	background-color: #ff005a;
}

.scroll::-webkit-scrollbar-thumb
{
	border-radius: 10px;
	-webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3);
	background-color: #D62929;
}
</style>
<!-- 읽어주세요
w3 css 기반에 제가 몇개 추개해서 구성하였습니다
클래스나 아이디 이름뒤에 붙은 숫자는 왼쪽 st가 sidetab의 순번 뒤의 menu가 그sidetab에 해당하는 메뉴 순번입니다



 -->
</head>
<body class="scroll">
   <jsp:include page="../common/header.jsp"/>

<div class="sidebar w3-bar-block  w3-card" style="width:150px; margin-top:3px;">
  <h5 class="w3-bar-item fonthotpink" style="font-size:25px;">관리자페이지</h5>
  <hr>
  <button class="w3-bar-item tablink hoverpink w3-round" onclick="sideTab(event, 'sideTabs1')" style="width:147px">관리자 메인</button>
  <button class="w3-bar-item tablink hoverpink w3-round" onclick="sideTab(event, 'sideTabs2')" style="width:147px">회원관리</button>
  <button class="w3-bar-item tablink hoverpink w3-round" onclick="sideTab(event, 'sideTabs3')" style="width:147px">결제관리</button>
  <button class="w3-bar-item tablink hoverpink w3-round" onclick="sideTab(event, 'sideTabs4')" style="width:147px">게시글관리</button>
  <button class="w3-bar-item tablink hoverpink w3-round" onclick="sideTab(event, 'sideTabs5')" style="width:147px">질문/건의사항</button>
  <button class="w3-bar-item tablink hoverpink w3-round" onclick="sideTab(event, 'sideTabs6')" style="width:147px">(작업용)게시판뷰</button>
  <button class="w3-bar-item tablink hoverpink w3-round" onclick="sideTab(event, 'sideTabs7')" style="width:147px">(작업용)목록리스트</button>
  <button class="w3-bar-item tablink hoverpink w3-round" onclick="sideTab(event, 'sideTabs8')" style="width:147px">(작업용)게시판작성</button>
</div>

<div class="minh"style="margin-left:160px">
<!--   <div class="w3-padding">관리자페이지입니다 관리자가 아니시면 홈으로가주세요</div> -->
<!-- 관리자 메인 -->
  <div id="sideTabs1" class="w3-container sideTabs animate-fading">
    <h2 class="w3-padding fontthick fonthotpink">관리자 메인</h2><hr class="borderhotpink">
    
    <!-- 관리자 메인 임시  -->
    <div style="width:1100px;height:1100px;border-right:2px solid #ff005a;float:left;">
    <div id="adminmain1" class="borderhotpinkthick mainBorderRa" style="width:450px;height:450px;margin: 30px;float:left; text-align: left;">
    <span class="fonthotpink" style="margin:15px;margin-top:20px;font-size:20px;">회원 관리</span>
    <button  class=" ligt-pink borderhotpink w3-round-large hoverpink fonthotpink mainMoreBtn" onclick="moreBtn(event, 'sideTabs2','mainMoreBtn2')">more</button>
    <hr class="borderhotpink" style="margin-top:5px;width:90%;margin-left:5%;margin-right:5%;">
    	내	용
    
    </div>
  	<div id="adminmain2" class="borderhotpinkthick mainBorderRa" style="width:450px;height:450px;margin: 30px;float:left; text-align: left;">
    <span class="fonthotpink" style="margin:15px;margin-top:20px;font-size:20px;">결제 관리</span>
    <button  class=" ligt-pink borderhotpink w3-round-large hoverpink fonthotpink mainMoreBtn"  onclick="moreBtn(event, 'sideTabs3','mainMoreBtn3')">more</button>
 	<hr class="borderhotpink" style="margin-top:5px;width:90%;margin-left:5%;margin-right:5%;">
 		내	용
 	
  	</div>	
  	
  	<div id="adminmain3" class="borderhotpinkthick mainBorderRa" style="width:450px;height:450px;margin: 30px;float:left; text-align: left;">
    <span class="fonthotpink" style="margin:15px;margin-top:20px;font-size:20px;">게시글 관리</span>
    <button  class=" ligt-pink borderhotpink w3-round-large hoverpink fonthotpink mainMoreBtn"  onclick="moreBtn(event, 'sideTabs4','mainMoreBtn4')">more</button>
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
   	<span class="fonthotpink" style="margin:15px;margin-top:20px;font-size:20px;">질문/건의사항</span>
    <button  class=" ligt-pink borderhotpink w3-round-large hoverpink fonthotpink mainMoreBtn"  onclick="moreBtn(event, 'sideTabs5','mainMoreBtn5')">more</button>
    <hr class="borderhotpink" style="margin-top:5px;width:90%;margin-left:5%;margin-right:5%;">
    	내	용
    
  	</div>
    </div>
    
    <div class="borderhotpinkthick mainBorderRa" style="width:500px;min-height: 1000px;margin-left: 1150px;"> 여유 있으면 통계 같은거 넣자!</div>
  </div>
<!--/관리자 메인 ----------------------------------------------------------------------------------------------------->
<!-- /회원관리 -------------------------------------------------------------------------------------------------------->
  <div id="sideTabs2" class="w3-container sideTabs animate-fading" style="display:none;">
    <h2 class="w3-padding fontthick fonthotpink">회원관리</h2><hr class="borderhotpink">
    <div class="w3-container">

  <div class="w3-bar w3-white w3-card">
    <button class="w3-bar-item sidetab2menu w3-round hoverpink hotpink fontwhite" onclick="st2menu(event,'st2menu1')" style="min-width:150px; margin-left:5px;margin-right:5px;">튜티회원</button>
    <button class="w3-bar-item sidetab2menu w3-round hoverpink" onclick="st2menu(event,'st2menu2')" style="min-width:150px; margin-left:5px;margin-right:5px;">튜터회원조회</button>
    <button class="w3-bar-item sidetab2menu w3-round hoverpink" onclick="st2menu(event,'st2menu3')" style="min-width:150px; margin-left:5px;margin-right:5px;">튜터신청</button>
    <button class="w3-bar-item sidetab2menu w3-round hoverpink" onclick="st2menu(event,'st2menu4')" style="min-width:150px; margin-left:5px;margin-right:5px;">블랙회원관리</button>
  </div>
  
  <div id="st2menu1" class="w3-container borderhotpink sidetab2menus animate-fading" style="border-top:white">
    <h3 class="fonthotpink" style="font-weight:bold">튜티회원조회</h3>
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

  <div id="st2menu2" class="w3-container borderhotpink sidetab2menus animate-fading" style="display:none;border-top:white">

    <h3 class="fonthotpink" style="font-weight:bold">튜터회원조회</h3>
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

  <div id="st2menu3" class="w3-container borderhotpink sidetab2menus animate-fading" style="display:none;border-top:white">
 
    <h3 class="fonthotpink" style="font-weight:bold">튜터신청 목록</h3>
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
  
  <div id="st2menu4" class="w3-container borderhotpink sidetab2menus animate-fading" style="display:none;border-top:white">

    <h3 class="fonthotpink" style="font-weight:bold">블랙회원관리 목록</h3>
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
   


  </div>
<!-- /회원관리 ------------------------------------------------------------------------------------------------------------->
<!-- 결제관리 --------------------------------------------------------------------------------------------------------------->
  <div id="sideTabs3" class="w3-container sideTabs animate-fading" style="display:none">
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
  
<!-- /결제관리----------------------------------------------------------------------------------------------------------- -->
<!-- 게시글관리----------------------------------------------------------------------------------------------------------- -->
    <div id="sideTabs4" class="w3-container sideTabs animate-fading" style="display:none">
    <h2 class="w3-padding fontthick fonthotpink">게시글관리</h2><hr class="borderhotpink">
    <div class="w3-container">

  <div class="w3-bar w3-white w3-card">
    <button class="w3-bar-item  sidetab4menu w3-round hoverpink hotpink fontwhite" onclick="st4menu(event,'st4menu1')" style="min-width:150px; margin-left:5px;margin-right:5px;">공지사항</button>
    <button class="w3-bar-item  sidetab4menu w3-round hoverpink" onclick="st4menu(event,'st4menu2')" style="min-width:150px; margin-left:5px;margin-right:5px;">메뉴2</button>
    <button class="w3-bar-item  sidetab4menu w3-round hoverpink" onclick="st4menu(event,'st4menu3')" style="min-width:150px; margin-left:5px;margin-right:5px;">신고글 관리</button>
  </div>
  
  <div id="st4menu1" class="w3-container borderhotpink sidetab4menus animate-fading" style="border-top:white">
    <h3 class="fonthotpink" style="font-weight:bold">공지사항</h3>
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

  <div id="st4menu2" class="w3-container borderhotpink sidetab4menus animate-fading" style="display:none;border-top:white">
   <h3 class="fonthotpink" style="font-weight:bold">아직 못정함</h3>
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

  <div id="st4menu3" class="w3-container borderhotpink sidetab4menus animate-fading" style="display:none;border-top:white">
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
</div>

<script>
function st4menu(evt, sidetab4menu) {
  var i, x, tablinks;
  x = document.getElementsByClassName("sidetab4menus");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("sidetab4menu");
  for (i = 0; i < x.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" hotpink fontwhite", "");
  }
  document.getElementById(sidetab4menu).style.display = "block";
  evt.currentTarget.className += " hotpink fontwhite";
}
</script>


  </div>
<!-- /게시글관리------------------------------------------------------------------------------------------------- -->

<!-- 질문/ 건의 사항------------------------------------------------------------------------------------------ -->
 <div id="sideTabs5" class="w3-container sideTabs animate-fading" style="display:none">
    <h2 class="w3-padding fontthick fonthotpink">게시글관리</h2><hr class="borderhotpink">
    <div class="w3-container">

  <div class="w3-bar w3-white w3-card">
    <button class="w3-bar-item  sidetab6menu w3-round hoverpink hotpink fontwhite" onclick="st6menu(event,'st6menu1')" style="min-width:150px; margin-left:5px;margin-right:5px;">질문 게시판</button>
    <button class="w3-bar-item  sidetab6menu w3-round hoverpink" onclick="st6menu(event,'st6menu2')" style="min-width:150px; margin-left:5px;margin-right:5px;">건의 게시판</button>
    <button class="w3-bar-item  sidetab6menu w3-round hoverpink" onclick="st6menu(event,'st6menu3')" style="min-width:150px; margin-left:5px;margin-right:5px;">fna</button>
  </div>
  
  <div id="st6menu1" class="w3-container borderhotpink sidetab6menus animate-fading" style="border-top:white">
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

  <div id="st6menu2" class="w3-container borderhotpink sidetab6menus animate-fading" style="display:none;border-top:white">
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

  <div id="st6menu3" class="w3-container borderhotpink sidetab6menus animate-fading" style="display:none;border-top:white">
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
</div>
<!-- (작업용)게시판------------------------------------------------------------------------------------------- -->
<div id="sideTabs6" class="w3-container sideTabs animate-fading"style="display:none">
 <h2 class="w3-padding fontthick fonthotpink">마더뷰</h2><hr class="borderhotpink">
    <div class="w3-container minh" style="margin-left:160px;" ><!-- 틀 -->
    
    <div class="borderhotpinkthick" style="width:1300px;min-height:200px;border-radius:10px;opacity:0.8; margin-bottom:10px;"><!--게시글 작성자 날짜 등등  -->
     	<h3 class="fonthotpink" style="opacity:0.4; margin-left:30px; margin-top:10px;">카테고리 부분입니다</h3>
     	<div style="float:left;width:70%;"><!-- 제목부분 -->
     	<h2 class="fonthotpink" style="font-weight:bold;margin-left:30px;margin-right:7px;">제목 작성하는 부분입니다 폰트도 적용할예정</h2><hr class="borderhotpink" style="margin-top:-10px;width:70%;margin-left:5%;margin-right:5%;">
     	</div>
     	<div style="width:29%;float:left;"><!-- 조회수 부분 -->
     	<h3 style="text-align:right;color:#FA5882;margin-right:30px;">조회수 부분입니다</h3>
     	</div>
     	<br>
     	<h4 style="opacity:2.0;padding-top:40px;">작성자 부분입니다</h4>
     	<h6 style="color:#FA5882;margin-left:30px;font-size:40px;">날짜 부분입니다</h6>
   	</div>
    
    <div  class="borderhotpink"style=";width:1300px;min-height:900px;border-radius:15px;" ><!-- 게시글 내용 -->
    	<div style="margin:10px;font-size:20px;">
    	(임시글)
타공 제품을 새로운 타공 제품으로 바꾸는 경우에도 구멍이 안생긴다고 장담할 수 없어요. 사이즈는 규격화 되어 일치하는 제품들이 많지만, 고정을 위한 나사 구멍은 각기 다를 수 있거든요. 

미리 정확한 나사 구멍 위치까지 파악하긴 어려우니, 타공 도어락을 설치할 경우는 구멍이 생길 수 있음을 반드시 염두에 두고 진행해주세요!
    
TIP. 도어락 설치, 집주인과 디테일한 커뮤니케이션 하기
간혹 떼면 원상복구가 안된다는 것을 트집잡아, 세입자가 달았던 도어락을 두고 가라고 억지 쓰는 경우도 있다고 해요. 

그러니 설치부터 원상복구에 이르는 모든 디테일을 미리 체크하는 것이 필수! 아래의 리스트를 토대로 집주인과 커뮤니케이션을 위한 디테일을 정해보세요. 
 None
  
집주인이 인수하는 경우는 사실상 집주인이 해주는 것과 비슷한 상황이에요. 다만 제품을 고르고 설치하는 과정을 세입자가 하기 때문에, 나중에 가서 '아니 무슨 40만원 짜리를 달았어? 그거 다 못줘!' 할 수도 있어요. 그러니 사전에 정확한 모델과 가격을 얘기하며 조율하는 것이 좋답니다!

None
안전하게 살기 위한 기본, 도어락! 위에서 알려드린 노하우대로 무타공 도어락을 설치하거나, 집주인과 디테일한 커뮤니케이션으로 보증금 걱정 없는 도어락 설치에 성공하시길 바랄게요 🙏

도어락을 설치하기 전에 현관문 리폼을 계획하고 있다면 아래 콘텐츠도 꼭 읽어보세요. 현관문 리폼할 때 드는 비용을 알려드려요 😄(임시글)
(임시글)
타공 제품을 새로운 타공 제품으로 바꾸는 경우에도 구멍이 안생긴다고 장담할 수 없어요. 사이즈는 규격화 되어 일치하는 제품들이 많지만, 고정을 위한 나사 구멍은 각기 다를 수 있거든요. 

미리 정확한 나사 구멍 위치까지 파악하긴 어려우니, 타공 도어락을 설치할 경우는 구멍이 생길 수 있음을 반드시 염두에 두고 진행해주세요!
    
TIP. 도어락 설치, 집주인과 디테일한 커뮤니케이션 하기
간혹 떼면 원상복구가 안된다는 것을 트집잡아, 세입자가 달았던 도어락을 두고 가라고 억지 쓰는 경우도 있다고 해요. 

그러니 설치부터 원상복구에 이르는 모든 디테일을 미리 체크하는 것이 필수! 아래의 리스트를 토대로 집주인과 커뮤니케이션을 위한 디테일을 정해보세요. 
 None
  
집주인이 인수하는 경우는 사실상 집주인이 해주는 것과 비슷한 상황이에요. 다만 제품을 고르고 설치하는 과정을 세입자가 하기 때문에, 나중에 가서 '아니 무슨 40만원 짜리를 달았어? 그거 다 못줘!' 할 수도 있어요. 그러니 사전에 정확한 모델과 가격을 얘기하며 조율하는 것이 좋답니다!

None
안전하게 살기 위한 기본, 도어락! 위에서 알려드린 노하우대로 무타공 도어락을 설치하거나, 집주인과 디테일한 커뮤니케이션으로 보증금 걱정 없는 도어락 설치에 성공하시길 바랄게요 🙏

도어락을 설치하기 전에 현관문 리폼을 계획하고 있다면 아래 콘텐츠도 꼭 읽어보세요. 현관문 리폼할 때 드는 비용을 알려드려요 😄(임시글)
    	
    	
    	</div>
    	
    </div>
      <button class=" ligt-pink  borderhotpink w3-round-large hoverpink fonthotpink" style="float:right;margin-right:250px;margin-top:20px;border:white;width:200px;height:50px;font-size:30px;">삭제</button>
        <button class=" ligt-pink  borderhotpink w3-round-large hoverpink fonthotpink" style="float:right;margin-right:50px;margin-top:20px;border:white;width:200px;height:50px;font-size:30px;">수정</button>
    <div><!-- 댓글 -->
    
    </div>
     	
    
    </div>
</div>
<!-- /(작업용)게시판------------------------------------------------------------------------------------------ -->
<!--  (작업용)리스트----------------------------------------------------------------------------------------------->
<div id="sideTabs7" class="w3-container sideTabs animate-fading"style="display:none">
 <h2 class="w3-padding fontthick fonthotpink">마더리스트</h2><hr class="borderhotpink">
    <div class="w3-container borderhotpink">
    <h4>글관련</h4>
    <!-- 마더리스트  -->
  	<table class="w3-table-all hoverTablePink">
  	<thead>
  	<tr class="fontwhite" style="background-color:#ff005a;">
  		<th style="width:5%;">글번호</th>
  		<th style="width:60%;text-align:center;">글제목</th>
  		<th style="width:5%;">작성자</th>
  		<th style="width:5%;">조회수</th>
  		<th style="width:5%;">댓글수</th>
  		<th style="width:20%;">시간</th>
  	</tr>
  	</thead>
  	<tr>
  		<th>실험용</th>
  		<th>실험용</th>
  		<th>실험용</th>
  		<th>실험용</th>
  		<th>실험용</th>
  		<th>실험용</th>
  	</tr>
  	</table>
  	<!-- /마더 리스트 -->
  	<hr>
  	<h6></h6>
 
  	<table>
  	<thead>
  	<tr>
  		<th>글번호</th>
  		<th>글제목</th>
  		<th>작성자</th>
  		<th>조회수</th>
  		<th></th>
  		<th>시간</th>
  	</tr>
 	</thead>
  	</table>
  	
  	 <hr>
  	<table>
  	<thead>
  	<tr>
  		<th>글번호</th>
  		<th>글제목</th>
  		<th>작성자</th>
  		<th>조회수</th>
  		<th></th>
  		<th>시간</th>
  	</tr>
  	</thead>
  	</table>
  	
  	
  	<h6>회원 관련</h6>
  	 <hr>
  	 <h6>튜티</h6>
  	<table>
  	<thead>
  	<tr>
  		<th>회원프로필이미지</th>
  		<th>아이디</th>
  		<th>이름</th>
  		<th>이메일</th>
  		<th>전화번호</th>
  		<th>가입일</th>
  		<th>정보수정일</th>
  		<th>등급</th>
  		<th></th>
  		<th>우편주소</th>
  		<th>우편주소</th>
  		<th>도로명주소</th>
  		<th>탈퇴여부</th>
  		<th>수정</th>
  		
  	</tr>
  	</thead>
  	</table>
  	
  	<h6>튜터</h6>
  	 <hr>
  	<table>
  	<thead>
  	<tr>
  		<th>회원프로필이미지</th>
  		<th>아이디</th>
  		<th>이름</th>
  		<th>카테고리</th>
  		<th>이메일</th>
  		<th>전화번호</th>
  		<th>가입일</th>
  		<th>정보수정일</th>
  		<th>등급</th>
  		<th>우편주소</th>
  		<th>우편주소</th>
  		<th>도로명주소</th>
  		<th>탈퇴여부</th>
  		<th>수정</th>
  	</tr>
  	</thead>
  	</table>
  
    </div>
</div>
<!-- /(작업용)리스트--------------------------------------------------------------------------------------------- -->
<!-- (작업용)게시판 작성 ------------------------------------------------------------------------------------------->
<div id="sideTabs8" class="w3-container sideTabs animate-fading"style="display:none">
 <h2 class="w3-padding fontthick fonthotpink">마더뷰</h2><hr class="borderhotpink">
    <div class="w3-container minh" style="margin-left:160px;" ><!-- 틀 -->
    
    <div class="borderhotpinkthick" style="width:1300px;min-height:200px;border-radius:10px;opacity:0.8; margin-bottom:10px;"><!--게시글 날짜 표시할것  -->
     	<h3 class="fonthotpink" style="opacity:0.4; margin-left:30px; margin-top:10px;">
			해당 카테고리에서 작성할때 카테고리가 표시됩니다 예) 질문 > 건의 사항
     	</h3>
     	
     	
     	<div style="float:left;width:100%;"><!-- 제목부분 -->
     	<label class="fonthotpink" style=";margin-left:50px;font-size:20px;">제목 : </label><input type="text" class="fonthotpink" style="width:500px;height:35px;font-weight:bold;margin-right:15px;border:white;padding-bottom:-50px;z-index:4;font-size:20px;border-bottom:3px solid #ff005a; "/>
     <!-- 	<hr class="borderhotpink" style="width:70%;margin-left:5%;margin-right:5%;z-index:3;"> -->
     	</div>

     	<br>
     	<h4 style="opacity:2.0;padding-top:40px;float:right;margin-right:30px;">작성자 부분입니다</h4>
     	<h6 style="color:#FA5882;margin-left:30px;"><input type="date" id="currentDate" style="border:white;font-size:40px;margin-top:60px" readonly/></h6><!-- 날짜 -->
   	</div>
    	
    <div  class="borderhotpink"style=";width:1300px;min-height:900px;border-radius:15px;" ><!-- 게시글 내용 -->
    	<div style="margin:10px;font-size:20px;">

    	<textArea style="margin-left:15px;width:1250px;min-height:900px;border:0.3px solid gray;" placeholder="내용을 입력해주세요">
    		
    	</textArea>
    	
    	</div>
    	
    </div>
    <button class=" ligt-pink  borderhotpink w3-round-large hoverpink fonthotpink" style="float:right;margin-right:250px;margin-top:20px;border:white;width:200px;height:50px;font-size:30px;">작성하기</button>

     	
    
    </div>
</div>
<script>
document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);;
</script>
<!--  /(작업용)게시판 작성---------------------------------------------------------------------------------------------->
<script>
function st6menu(evt, sidetab6menu) {
  var i, x, tablinks;
  x = document.getElementsByClassName("sidetab6menus");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("sidetab6menu");
  for (i = 0; i < x.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" hotpink fontwhite", "");
  }
  document.getElementById(sidetab6menu).style.display = "block";
  evt.currentTarget.className += " hotpink fontwhite";
}
</script>


<!-- /질문/ 건의사항------------------------------------------------------------------------------------------ -->
</div>

<script>
/*왼쪽 사이드텝 펑션  */
function sideTab(evt, sideTab) {
  var i, x, tablinks;
  x = document.getElementsByClassName("sideTabs");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < x.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" hotpink fontwhite", ""); 
    
  }
  document.getElementById(sideTab).style.display = "block";
  evt.currentTarget.className += " hotpink fontwhite";

}
function moreBtn(evt, sideTab, mainMoreBtn) {
	  var i, x, tablinks;
	  x = document.getElementsByClassName("sideTabs");
	  for (i = 0; i < x.length; i++) {
	    x[i].style.display = "none";
	  }
	  tablinks = document.getElementsByClassName("tablink");
	  for (i = 0; i < x.length; i++) {
	    tablinks[i].className = tablinks[i].className.replace(" hotpink fontwhite", ""); 

	  }
	  document.getElementById(sideTab).style.display = "block";
	  sideTab.className += " hotpink fontwhite";

	}
</script>












   <jsp:include page="../common/footer.jsp"/>
</body>
</html>