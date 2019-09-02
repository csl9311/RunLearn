<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script type="text/javascript"
	src="resources/js/jquery-3.4.1.min.js"></script> --><!-- js 오류 날시  -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href='${ contextPath }/resources/css/admin/admin.css'>
<!-- <style>
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
</style> -->
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
  <button id="tablink1" class="w3-bar-item tablink hoverpink w3-round" onclick="sideTab(event, 'sideTabs1', 'tablink1')" style="width:147px">관리자 메인</button>
  <button id="tablink2" class="w3-bar-item tablink hoverpink w3-round" onclick="sideTab(event, 'sideTabs2', 'tablink2')" style="width:147px">회원관리</button>
  <button id="tablink3" class="w3-bar-item tablink hoverpink w3-round" onclick="sideTab(event, 'sideTabs3', 'tablink3')" style="width:147px">결제관리</button>
  <button id="tablink4" class="w3-bar-item tablink hoverpink w3-round" onclick="sideTab(event, 'sideTabs4', 'tablink4')" style="width:147px">게시글관리</button>
  <button id="tablink5" class="w3-bar-item tablink hoverpink w3-round" onclick="sideTab(event, 'sideTabs5', 'tablink5')" style="width:147px">질문/건의사항</button>
  <button id="tablink6" class="w3-bar-item tablink hoverpink w3-round" onclick="sideTab(event, 'sideTabs6', 'tablink6')" style="width:147px">(작업용)게시판뷰</button>
  <button id="tablink7" class="w3-bar-item tablink hoverpink w3-round" onclick="sideTab(event, 'sideTabs7', 'tablink7')" style="width:147px">강의신청</button>
  <button id="tablink8" class="w3-bar-item tablink hoverpink w3-round" onclick="sideTab(event, 'sideTabs8', 'tablink8')" style="width:147px">(작업용)게시판작성</button>
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
    <button  class=" ligt-pink borderhotpink w3-round-large hoverpink fonthotpink mainMoreBtn" onclick="sideTab(event, 'sideTabs2','tablink2')">more</button>
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
    <button  class=" ligt-pink borderhotpink w3-round-large hoverpink fonthotpink mainMoreBtn"  onclick="sideTab(event, 'sideTabs3','tablink3')">more</button>
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
    <span class="fonthotpink" style="margin:15px;margin-top:20px;font-size:20px;">게시글 관리</span>
    <button  class=" ligt-pink borderhotpink w3-round-large hoverpink fonthotpink mainMoreBtn"  onclick="sideTab(event, 'sideTabs4','tablink4')">more</button>
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
    <button  class=" ligt-pink borderhotpink w3-round-large hoverpink fonthotpink mainMoreBtn"  onclick="sideTab(event, 'sideTabs5','tablink5')">more</button>
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

    <h3 class="fonthotpink" style="font-weight:bold">튜터회원조회 lecture조인 아코디언으로 해야 정확한 프로필 열람가능 할거같음</h3>
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

  <div id="st2menu3" class="w3-container borderhotpink sidetab2menus animate-fading" style="display:none;border-top:white">
 
    <h3 class="fonthotpink" style="font-weight:bold">튜터신청 목록</h3>
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
  
  <div id="st2menu4" class="w3-container borderhotpink sidetab2menus animate-fading" style="display:none;border-top:white">

    <h3 class="fonthotpink" style="font-weight:bold">블랙회원관리 목록</h3>
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
  tablinks = document.getElementsByClassName("sidetab4menus");
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
 
<c:import url="admin/adminBoardIDetailView.jsp"/>

</div>
<!-- /(작업용)게시판------------------------------------------------------------------------------------------ -->
<!--  강의 신청----------------------------------------------------------------------------------------------->
<div id="sideTabs7" class="w3-container sideTabs animate-fading"style="display:none">
 <h2 class="w3-padding fontthick fonthotpink">강의 신청</h2><hr class="borderhotpink">
    <div class="w3-container">

  
  
  <div id="st7menu" class="w3-container borderhotpink sidetab4menus animate-fading" >
  
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



 </div>
</div>
<!-- /강의신청--------------------------------------------------------------------------------------------- -->
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
function sideTab(evt, sideTab, tablink) {
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
  document.getElementById(tablink).className += " hotpink fontwhite";
/*   evt.currentTarget.className += " hotpink fontwhite"; */

}
/* function moreBtn(evt, sideTab, tablink) {
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
	  document.getElementById(tablink).className += " hotpink fontwhite";
	  evt.currentTarget.className += " hotpink fontwhite";

	} */
</script>












   <jsp:include page="../common/footer.jsp"/>
</body>
</html>