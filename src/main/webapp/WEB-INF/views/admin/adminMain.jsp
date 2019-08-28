
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
.fontthick{font-weight: 500;}
.fonthotpink{color:#ff005a;}
.hotpink{background-color:#ff005a; !important}
.borderhotpink{border: 1px solid #ff005a;}
.borderhotpinkthick{border: 4px solid #ff005a;}
.fontwhite{color:white;font:bold;}
.ligt-pink{background-color:#F8E0EC; !important}
.hoverpink:hover{background-color:#F5A9BC; color:white;!important}
.tablink{margin:2px; border:0.1px solid #ff005a; }
.marginbtn{margin:2px; border:0.1px solid #ff005a; }
.animate-fading{animation:opac 0.8s }
.minh{min-height:900px;}
.sidebar{height:100%;width:200px;background-color:#fff;position:absolute!important;z-index:1;overflow:auto;display:block!important}

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

<div class="sidebar w3-bar-block  w3-card" style="width:150px;">
  <h5 class="w3-bar-item fonthotpink" style="font-size:25px;">관리목록</h5>
  <hr>
  <button class="w3-bar-item tablink hoverpink w3-round" onclick="sideTab(event, 'sideTabs1')" style="width:147px">관리자 메인</button>
  <button class="w3-bar-item tablink hoverpink w3-round" onclick="sideTab(event, 'sideTabs2')" style="width:147px">회원관리</button>
  <button class="w3-bar-item tablink hoverpink w3-round" onclick="sideTab(event, 'sideTabs3')" style="width:147px">결제관리</button>
  <button class="w3-bar-item tablink hoverpink w3-round" onclick="sideTab(event, 'sideTabs4')" style="width:147px">게시글관리</button>
  <button class="w3-bar-item tablink hoverpink w3-round" onclick="sideTab(event, 'sideTabs5')" style="width:147px">질문/건의사항</button>
</div>

<div class="minh"style="margin-left:160px">
<!--   <div class="w3-padding">관리자페이지입니다 관리자가 아니시면 홈으로가주세요</div> -->
<!-- 관리자 메인 -->
  <div id="sideTabs1" class="w3-container sideTabs animate-fading">
    <h2 class="w3-padding fontthick fonthotpink">관리자 메인</h2><hr class="borderhotpink">
    
    <div id="adminmain1" class="borderhotpinkthick" style="width:650px;height:650px;margin: 30px;float:left; text-align: center;">
    <h3>임시1</h3>
    </div>
  	<div id="adminmain2" class="borderhotpinkthick" style="width:650px;height:650px;margin: 30px;float:left; text-align: center;">
  	 <h3>임시2</h3>	
  	</div>	
  	<div id="adminmain3" class="borderhotpinkthick" style="width:650px;height:650px;margin: 30px;float:left; text-align: center;">
  	 <h3>임시3</h3>
  	</div>
  	<div id="adminmain4" class="borderhotpinkthick" style="width:650px;height:650px;margin: 30px;float:left; text-align: center;">
  	 <h3>임시4</h3>
  	</div>
    
  </div>
<!--/관리자 메인 ----------------------------------------------------------------------------------------------------->
<!-- /회원관리 -------------------------------------------------------------------------------------------------------->
  <div id="sideTabs2" class="w3-container sideTabs animate-fading" style="display:none;">
    <h2 class="w3-padding fontthick fonthotpink">회원관리</h2><hr class="borderhotpink">
    <div class="w3-container">

  <div class="w3-bar w3-white w3-card">
    <button class="w3-bar-item  sidetab2menu w3-round hoverpink hotpink fontwhite" onclick="st2menu(event,'st2menu1')" style="min-width:150px; margin-left:5px;margin-right:5px;">튜티회원</button>
    <button class="w3-bar-item  sidetab2menu w3-round hoverpink" onclick="st2menu(event,'st2menu2')" style="min-width:150px; margin-left:5px;margin-right:5px;">튜터회원조회</button>
    <button class="w3-bar-item  sidetab2menu w3-round hoverpink" onclick="st2menu(event,'st2menu3')" style="min-width:150px; margin-left:5px;margin-right:5px;">튜터신청</button>
    <button class="w3-bar-item  sidetab2menu w3-round hoverpink" onclick="st2menu(event,'st2menu4')" style="min-width:150px; margin-left:5px;margin-right:5px;">블랙회원관리</button>
  </div>
  
  <div id="st2menu1" class="w3-container borderhotpink sidetab2menus" style="border-top:white">
    <h2>튜티회원조회</h2>
  </div>

  <div id="st2menu2" class="w3-container borderhotpink sidetab2menus" style="display:none;border-top:white">
    <h2>튜터회원조회</h2>
  </div>

  <div id="st2menu3" class="w3-container borderhotpink sidetab2menus" style="display:none;border-top:white">
    <h2>튜터신청 목록</h2>
  </div>
  
  <div id="st2menu4" class="w3-container borderhotpink sidetab2menus" style="display:none;border-top:white">
    <h2>블랙회원관리</h2>
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
    <button class="w3-bar-item  sidetab3menu w3-round hoverpink hotpink fontwhite" onclick="st3menu(event,'st3menu1')" style="min-width:150px; margin-left:5px;margin-right:5px;">메뉴1</button>
    <button class="w3-bar-item  sidetab3menu w3-round hoverpink" onclick="st3menu(event,'st3menu2')" style="min-width:150px; margin-left:5px;margin-right:5px;">메뉴2</button>
    <button class="w3-bar-item  sidetab3menu w3-round hoverpink" onclick="st3menu(event,'st3menu3')" style="min-width:150px; margin-left:5px;margin-right:5px;">메뉴3</button>
  </div>
  
  <div id="st3menu1" class="w3-container borderhotpink sidetab3menus">
    <h2>상품</h2>
  </div>

  <div id="st3menu2" class="w3-container borderhotpink sidetab3menus" style="display:none">
    <h2>강의</h2>
  </div>

  <div id="st3menu3" class="w3-container borderhotpink sidetab3menus" style="display:none">
    <h2>3번째 탭은 없엘것</h2>
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
    <button class="w3-bar-item  sidetab4menu w3-round hoverpink hotpink fontwhite" onclick="st4menu(event,'st4menu1')" style="min-width:150px; margin-left:5px;margin-right:5px;">메뉴1</button>
    <button class="w3-bar-item  sidetab4menu w3-round hoverpink" onclick="st4menu(event,'st4menu2')" style="min-width:150px; margin-left:5px;margin-right:5px;">메뉴2</button>
    <button class="w3-bar-item  sidetab4menu w3-round hoverpink" onclick="st4menu(event,'st4menu3')" style="min-width:150px; margin-left:5px;margin-right:5px;">신고글 관리</button>
  </div>
  
  <div id="st4menu1" class="w3-container borderhotpink sidetab4menus" style="border-top:white">
    <h2>게시가로텝1</h2>
  </div>

  <div id="st4menu2" class="w3-container borderhotpink sidetab4menus" style="display:none;border-top:white">
    <h2>게시가로텝2</h2>
  </div>

  <div id="st4menu3" class="w3-container borderhotpink sidetab4menus" style="display:none;border-top:white">
    <h2>게시가로텝3</h2>
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
  
  <div id="st6menu1" class="w3-container borderhotpink sidetab6menus" style="border-top:white">
    <h2>질문게시판은 튜티사용자 튜터사용자둘로 나눌것?</h2>
    
    
  </div>

  <div id="st6menu2" class="w3-container borderhotpink sidetab6menus" style="display:none;border-top:white">
    <h2>건의도 튜티사용자 튜터사용자 나눌것</h2>
    
    
  </div>

  <div id="st6menu3" class="w3-container borderhotpink sidetab6menus" style="display:none;border-top:white">
    <h2>자주묻는질문등 넣어도되고 빼도되고</h2>
    
    
  </div>
</div>
</div>

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
</script>













</body>
</html>