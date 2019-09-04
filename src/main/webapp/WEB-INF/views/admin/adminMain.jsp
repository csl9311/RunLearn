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

<!-- 읽어주세요
w3 css 기반에 제가 몇개 추개해서 구성하였습니다
클래스나 아이디 이름뒤에 붙은 숫자는 왼쪽 st가 sidetab의 순번 뒤의 menu가 그sidetab에 해당하는 메뉴 순번입니다
 -->
</head>
<body class="scroll">
   <jsp:include page="../common/header.jsp"/>

<div class="sidebar w3-bar-block  w3-card" style="width:180px; margin-top:3px;">
  <h6 class="w3-bar-item fonthotpink" style="font-size:23px;">관리자페이지</h6>
  <hr>
  <button id="tablink1" class="w3-bar-item tablink hoverpink w3-round" onclick="sideTab(event, 'sideTabs1', 'tablink1')" style="width:175px">관리자 메인</button>
  <button id="tablink2" class="w3-bar-item tablink hoverpink w3-round" onclick="sideTab(event, 'sideTabs2', 'tablink2')" style="width:175px">회원관리</button>
  <button id="tablink3" class="w3-bar-item tablink hoverpink w3-round" onclick="sideTab(event, 'sideTabs3', 'tablink3')" style="width:175px">결제관리</button>
  <button id="tablink4" class="w3-bar-item tablink hoverpink w3-round" onclick="sideTab(event, 'sideTabs4', 'tablink4')" style="width:175px">고객센터(관리자)</button>
  <button id="tablink5" class="w3-bar-item tablink hoverpink w3-round" onclick="sideTab(event, 'sideTabs5', 'tablink5')" style="width:175px">고객센터(요청)</button>
  <button id="tablink6" class="w3-bar-item tablink hoverpink w3-round" onclick="sideTab(event, 'sideTabs6', 'tablink6')" style="width:175px">(작업용)게시판뷰</button>
  <button id="tablink8" class="w3-bar-item tablink hoverpink w3-round" onclick="sideTab(event, 'sideTabs8', 'tablink8')" style="width:175px">(작업용)게시판작성</button>
</div>

<div class="minh"style="margin-left:190px"><!--관리자 페이지 주화면영역  -->
<!--   <div class="w3-padding">관리자페이지입니다 관리자가 아니시면 홈으로가주세요</div> -->
<!-- 관리자 메인 -->
						<!-- 	<iframe src="https://daum.net" style="width:100%;height:1000px;border:white;"></iframe> -->
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
    <span class="fonthotpink" style="margin:15px;margin-top:20px;font-size:20px;">고겍센터(관리자)</span>
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
   	<span class="fonthotpink" style="margin:15px;margin-top:20px;font-size:20px;">고객센터(요청)</span>
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
<!--/관리자 메인 -------------------------------------------------------------------------------------------->

<!-- /회원관리 ---------------------------------------------------------------------------------------------->
  <div id="sideTabs2" class="w3-container sideTabs animate-fading" style="display:none;">
   <c:import url="admin/adminUser.jsp"/>
  </div>
<!-- /회원관리 ----------------------------------------------------------------------------------------------->

<!-- 결제관리 ------------------------------------------------------------------------------------------------>
  <div id="sideTabs3" class="w3-container sideTabs animate-fading" style="display:none">
  <c:import url="admin/adminPayManage.jsp"/>
  </div>
<!-- /결제관리------------------------------------------------------------------------------------------------>

<!-- 고객센터 관리자-------------------------------------------------------------------------------------------->
    <div id="sideTabs4" class="w3-container sideTabs animate-fading" style="display:none">
   <c:import url="admin/adminNoticeAdmin.jsp"/>
  </div>
<!-- /고객센터 관리자------------------------------------------------------------------------------------------->

<!-- 고객센터 유저--------------------------------------------------------------------------------------------->
 <div id="sideTabs5" class="w3-container sideTabs animate-fading" style="display:none">
<c:import url="admin/adminNoticeUser.jsp"/>
</div>
<!-- /고객센터 유저 -------------------------------------------------------------------------------------------->

<!-- (작업용)게시판-------------------------------------------------------------------------------------------->
<div id="sideTabs6" class="w3-container sideTabs animate-fading"style="display:none">
 
<c:import url="admin/adminBoardIDetailView.jsp"/>

</div>
<!-- /(작업용)게시판------------------------------------------------------------------------------------------->

<!-- (작업용)게시판 작성 ---------------------------------------------------------------------------------------->
<div id="sideTabs8" class="w3-container sideTabs animate-fading"style="display:none">
<c:import url="admin/adminBoardInsertForm.jsp"/>
 
</div>

<!--  /(작업용)게시판 작성---------------------------------------------------------------------------------------->


</div><!-- /관리자 페이지 주화면 -->


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