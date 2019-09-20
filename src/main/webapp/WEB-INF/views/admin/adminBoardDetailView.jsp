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
<c:url var="adminPayManage" value="adminPayManage.do"/>
<c:url var="adminNoticeAdmin" value="adminNoticeAdmin.do"/>
<c:url var="adminNoticeUser" value="adminNoticeUser.do"/>
<%-- <c:url var="adminBoardDetailView" value="adminBoardDetailView.do"/> --%>
<c:url var="adminBoardInsertView" value="adminBoardInsertView.do"/>

<div class="sidebar w3-bar-block  w3-card" style="width:180px; margin-top:3px;">
  <h6 class="w3-bar-item fonthotpink" style="font-size:23px;">관리자페이지</h6>
   <input type="button" value="---->홈으로" class="w3-bar-item tablink hoverpink w3-round" onclick="location.href='adminToHome.do';">
  <hr>
  <button id="tablink1" class="w3-bar-item tablink hoverpink w3-round" onclick="location.href='adminMain.do';" style="width:175px">관리자 메인</button>
  <button id="tablink2" class="w3-bar-item tablink hoverpink w3-round" onclick="location.href='adminUser.do';" style="width:175px">회원관리</button>
  <button id="tablink3" class="w3-bar-item tablink hoverpink w3-round" onclick="location.href='adminPayManage.do';" style="width:175px">결제관리</button>
  <button id="tablink4" class="w3-bar-item tablink hoverpink w3-round" onclick="location.href='adminNoticeAdmin.do';" style="width:175px">고객센터</button>
</div>

<div class="minh"style="margin-left:190px">
<h2 class="w3-padding fontthick fonthotpink">마더뷰</h2><hr class="borderhotpink">
    <div class="w3-container minh" style="margin-left:160px;" ><!-- 틀 -->
    
    <div class="borderhotpinkthick" style="width:1300px;min-height:200px;border-radius:10px;opacity:0.8; margin-bottom:10px;"><!--게시글 작성자 날짜 등등  -->
     	<h3 class="fonthotpink" style="opacity:0.4; margin-left:30px; margin-top:10px;">${board.b_category } > ${board.b_subcategory }</h3>
     	<h3 style="text-align:right;color:#FA5882;margin-right:30px;">조회수 : ${board.b_count }</h3> 
     	<h2 class="fonthotpink" style="font-weight:bold;margin-left:30px;margin-right:7px;">제목 : ${board.b_title }</h2><hr class="borderhotpink" style="margin-top:-10px;width:70%;margin-left:5%;margin-right:5%;">
     	<br>
     	<h4 style="opacity:2.0;padding-top:0px;float:right;margin-right:40px;">작성자  : ${board.m_id }</h4>
     	<h6 style="color:#FA5882;margin-left:30px;font-size:40px;">${board.b_reg_date }</h6>
   	</div>
    
    <div  class="borderhotpink"style=";width:1300px;min-height:900px;border-radius:15px;" ><!-- 게시글 내용 -->
    	<div style="margin-top:20px;margin-left:30px;margin-right:30px;font-size:20px;">
    	${board.b_content }
    	
    	
    	</div>
    	
    </div>
      <button class=" ligt-pink  borderhotpink w3-round-large hoverpink fonthotpink" style="float:right;margin-right:250px;margin-top:20px;border:white;width:200px;height:50px;font-size:30px;">삭제</button>
        <button class=" ligt-pink  borderhotpink w3-round-large hoverpink fonthotpink" style="float:right;margin-right:50px;margin-top:20px;border:white;width:200px;height:50px;font-size:30px;">수정</button>
    <div><!-- 댓글 -->
    
    </div>
     	
    
    </div>
    </div>
</body>
</html>