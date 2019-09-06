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
<c:url var="adminMain" value="adminMain.do"/>
<%-- <c:url var="adminUser" value="adminUsesr.do"/> --%>
<c:url var="adminPayManage" value="adminPayManage.do"/>
<c:url var="adminNoticeAdmin" value="adminNoticeAdmin.do"/>
<c:url var="adminNoticeUser" value="adminNoticeUser.do"/>
<c:url var="adminBoardDetailView" value="adminBoardDetailView.do"/>
<c:url var="adminBoardInsertView" value="adminBoardInsertView.do"/>
  <jsp:include page="../common/header.jsp"/>

<div class="sidebar w3-bar-block  w3-card" style="width:180px; margin-top:3px;">
  <h6 class="w3-bar-item fonthotpink" style="font-size:23px;">관리자페이지</h6>
  <hr>
  <button id="tablink1" class="w3-bar-item tablink hoverpink w3-round" onclick="location.href='adminMain.do';" style="width:175px">관리자 메인</button>
  <button id="tablink2" class="w3-bar-item tablink hoverpink w3-round hotpink fontwhite" onclick="location.href='adminUser.do';" style="width:175px">회원관리</button>
  <button id="tablink3" class="w3-bar-item tablink hoverpink w3-round" onclick="location.href='adminPayManage.do';" style="width:175px">결제관리</button>
  <button id="tablink4" class="w3-bar-item tablink hoverpink w3-round" onclick="location.href='adminNoticeAdmin.do';" style="width:175px">고객센터(관리자)</button>
  <button id="tablink5" class="w3-bar-item tablink hoverpink w3-round" onclick="location.href='adminNoticeUser.do';" style="width:175px">고객센터(요청)</button>
  <button id="tablink6" class="w3-bar-item tablink hoverpink w3-round" onclick="location.href='adminBoardDetailView.do';" style="width:175px">(작업용)게시판뷰</button>
  <button id="tablink8" class="w3-bar-item tablink hoverpink w3-round" onclick="location.href='adminBoardInsertForm.do';" style="width:175px">(작업용)게시판작성</button>
</div>

<div class="minh"style="margin-left:190px">

 <h2 class="w3-padding fontthick fonthotpink">회원관리</h2><hr class="borderhotpink">
    <div class="w3-container">

  <div class="w3-bar w3-white w3-card">
    <button class="w3-bar-item sidetab2menu w3-round hoverpink hotpink fontwhite" onclick="st2menu(event,'st2menu1');" style="min-width:150px; margin-left:5px;margin-right:5px;">모든회원</button>
    <button class="w3-bar-item sidetab2menu w3-round hoverpink" onclick="st2menu(event,'st2menu2');" style="min-width:150px; margin-left:5px;margin-right:5px;">튜티회원</button>
    <button class="w3-bar-item sidetab2menu w3-round hoverpink" onclick="st2menu(event,'st2menu3');" style="min-width:150px; margin-left:5px;margin-right:5px;">튜터회원조회</button>
    <button class="w3-bar-item sidetab2menu w3-round hoverpink" onclick="st2menu(event,'st2menu4');" style="min-width:150px; margin-left:5px;margin-right:5px;">튜터신청</button>
    <button class="w3-bar-item sidetab2menu w3-round hoverpink" onclick="st2menu(event,'st2menu5');" style="min-width:150px; margin-left:5px;margin-right:5px;">블랙회원관리</button>
  </div>
  
  <div id="st2menu1" class="w3-container borderhotpink sidetab2menus animate-fading" style="border-top:white">
    <h3 class="fonthotpink" style="font-weight:bold">모든회원</h3><span class="fonthotpink">${ pia.listCount }명의 회원이있습니다</span>
    <button class="listbtn fontwhite" style="margin:5px;margin-right:20px;float:right;">일단버튼</button>
    <table class="w3-table-all hoverTablePink" style="width:100%;">
  	<thead>
  	<tr class="fontwhite" style="background-color:#ff005a;">
 <!--  		<th style="width:auto;text-align:center;">회원번호</th> -->
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
  	<c:forEach var="a" items="${ userList }">
  		<tr>
			<td style="text-align:center;width:100px;">사진 넣을거임</td>
			<td style="text-align:center;"><input type="text" value="${ a.m_id }" style="text-align:center;background-color:rgba(0,0,0,0);border:rgba(0,0,0,0);width:100px;" readonly></td>
			<td style="text-align:center;"><input type="text" value="${ a.m_name }" class="${ a.m_id }A" style="text-align:center;background-color:rgba(0,0,0,0);border:rgba(0,0,0,0);width:100px;" readonly></td>
			<td style="text-align:center;"><input type="text" value="${ a.m_nickname }" class="${ a.m_id }A"style="text-align:center;background-color:rgba(0,0,0,0);border:rgba(0,0,0,0);width:100px;" readonly></td>
			<td style="text-align:center;"><input type="text" value="${ a.m_email }" class="${ a.m_id }A"style="text-align:center;background-color:rgba(0,0,0,0);border:rgba(0,0,0,0);width:100px;" readonly></td>
			<td style="text-align:center;"><input type="text" value="${ a.m_phone }" class="${ a.m_id }A"style="text-align:center;background-color:rgba(0,0,0,0);border:rgba(0,0,0,0);width:100px;" readonly></td>
			<td style="text-align:center;"><input type="text" value="${ a.m_create_date }"style="text-align:center;background-color:rgba(0,0,0,0);border:rgba(0,0,0,0);width:100px;"readonly></td>
			<td style="text-align:center;"><input type="text" value="${ a.m_modify_date }"style="text-align:center;background-color:rgba(0,0,0,0);border:rgba(0,0,0,0);width:100px;"readonly></td>
			<td style="text-align:center;"><input type="text" value="${ a.m_grade }" class="${ a.m_id }A"style="text-align:center;background-color:rgba(0,0,0,0);border:rgba(0,0,0,0);width:100px;" readonly></td>
			<td style="text-align:center;"><input type="text" value="${ a.m_status }" class="${ a.m_id }A"style="text-align:center;background-color:rgba(0,0,0,0);border:rgba(0,0,0,0);width:100px;" readonly></td>
			<td><input type="text" value="${ a.postnum }/${ a.g_address }/${ a.r_address }/${ a.d_address }" 
			class="${ a.m_id }" style="background-color:rgba(0,0,0,0);border:0.3px solid #ff005a;" readonly> </td>
			<td style="text-align:center;">
			<button type="button" class="listbtn fontwhite" onclick="SA('${ a.m_id }A');">수정</button></td>
			
		</tr>
		<script>
		function SA(qwe){
			
			$('.'+qwe).removeAttr('readonly');
			console.log(typeof(qwe));
			
			
		}
		</script>
		</c:forEach>
  	<!-- <tr>
  		<th style="text-align:center;">실험용</th>
  		<th>실험용</th>
  		<th style="text-align:center;">실험용</th>
  		<th style="text-align:center;">실험용</th>
  		<th style="text-align:center;">실험용</th>
  		<th style="text-align:center;">실험용</th>
  		<th style="text-align:center;"><button class="listbtn fontwhite">수정</button></th>
  	</tr> -->
  	</table>
    
  </div>
  
  <div id="st2menu2" class="w3-container borderhotpink sidetab2menus animate-fading" style="display:none;border-top:white">
    <h3 class="fonthotpink" style="font-weight:bold">튜티회원조회</h3><span class="fonthotpink">${ pitee.listCount }명의 튜티회원이있습니다</span>
    <button class="listbtn fontwhite" style="margin:5px;margin-right:20px;float:right;">일단버튼</button>
    <table class="w3-table-all hoverTablePink">
  	<thead>
  	<tr class="fontwhite" style="background-color:#ff005a;">
 <!--  		<th style="width:auto;text-align:center;">회원번호</th> -->
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
  	<c:forEach var="a" items="${ userList }">
  		<c:if test="${a.m_grade eq '튜티'}">
		<tr>
			<td style="text-align:center;width:100px;">사진 넣을거임</td>
			<td style="text-align:center;"><input type="text" value="${ a.m_id }" style="text-align:center;background-color:rgba(0,0,0,0);border:rgba(0,0,0,0);width:100px;" readonly></td>
			<td style="text-align:center;"><input type="text" value="${ a.m_name }" class="${ a.m_id }" style="text-align:center;background-color:rgba(0,0,0,0);border:rgba(0,0,0,0);width:100px;" readonly></td>
			<td style="text-align:center;"><input type="text" value="${ a.m_nickname }" class="${ a.m_id }"style="text-align:center;background-color:rgba(0,0,0,0);border:rgba(0,0,0,0);width:100px;" readonly></td>
			<td style="text-align:center;"><input type="text" value="${ a.m_email }" class="${ a.m_id }"style="text-align:center;background-color:rgba(0,0,0,0);border:rgba(0,0,0,0);width:100px;" readonly></td>
			<td style="text-align:center;"><input type="text" value="${ a.m_phone }" class="${ a.m_id }"style="text-align:center;background-color:rgba(0,0,0,0);border:rgba(0,0,0,0);width:100px;" readonly></td>
			<td style="text-align:center;"><input type="text" value="${ a.m_create_date }"style="text-align:center;background-color:rgba(0,0,0,0);border:rgba(0,0,0,0);width:100px;"readonly></td>
			<td style="text-align:center;"><input type="text" value="${ a.m_modify_date }"style="text-align:center;background-color:rgba(0,0,0,0);border:rgba(0,0,0,0);width:100px;"readonly></td>
			<td style="text-align:center;"><input type="text" value="${ a.m_grade }" class="${ a.m_id }"style="text-align:center;background-color:rgba(0,0,0,0);border:rgba(0,0,0,0);width:100px;" readonly></td>
			<td style="text-align:center;"><input type="text" value="${ a.m_status }" class="${ a.m_id }"style="text-align:center;background-color:rgba(0,0,0,0);border:rgba(0,0,0,0);width:100px;" readonly></td>
			<td><input type="text" value="${ a.postnum }/${ a.g_address }/${ a.r_address }/${ a.d_address }" 
			class="${ a.m_id }" style="background-color:rgba(0,0,0,0);border:0.3px solid #ff005a;" readonly> </td>
			<td style="text-align:center;"><button class="listbtn fontwhite" onclick="insert();">수정</button></td>
			
		</tr>
		<script>
	
		</script>
		</c:if>
		</c:forEach>
  	</table>
    
  </div>

  <div id="st2menu3" class="w3-container borderhotpink sidetab2menus animate-fading" style="display:none;border-top:white">

    <h3 class="fonthotpink" style="font-weight:bold">튜터회원조회 lecture조인 아코디언으로 해야 정확한 프로필 열람가능 할거같음</h3><span class="fonthotpink">${ pitor.listCount }명의 튜터회원이있습니다</span>
    <button class="listbtn fontwhite" style="margin:5px;margin-right:20px;float:right;">일단 버튼</button>
    <table class="w3-table-all hoverTablePink">
  	<thead>
  	<tr class="fontwhite" style="background-color:#ff005a;">
 <!--  		<th style="width:auto;text-align:center;">회원번호</th> -->
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
  	
  	<c:forEach var="a" items="${ userList }">
  		<c:if test="${a.m_grade eq '튜터'}">
		<tr>
			<td style="text-align:center;width:100px;">사진 넣을거임</td>
			<td style="text-align:center;"><input type="text" value="${ a.m_id }" style="text-align:center;background-color:rgba(0,0,0,0);border:rgba(0,0,0,0);width:100px;" readonly></td>
			<td style="text-align:center;"><input type="text" value="${ a.m_name }" class="${ a.m_id }" style="text-align:center;background-color:rgba(0,0,0,0);border:rgba(0,0,0,0);width:100px;" readonly></td>
			<td style="text-align:center;"><input type="text" value="${ a.m_nickname }" class="${ a.m_id }"style="text-align:center;background-color:rgba(0,0,0,0);border:rgba(0,0,0,0);width:100px;" readonly></td>
			<td style="text-align:center;"><input type="text" value="${ a.m_email }" class="${ a.m_id }"style="text-align:center;background-color:rgba(0,0,0,0);border:rgba(0,0,0,0);width:100px;" readonly></td>
			<td style="text-align:center;"><input type="text" value="${ a.m_phone }" class="${ a.m_id }"style="text-align:center;background-color:rgba(0,0,0,0);border:rgba(0,0,0,0);width:100px;" readonly></td>
			<td style="text-align:center;"><input type="text" value="${ a.m_create_date }"style="text-align:center;background-color:rgba(0,0,0,0);border:rgba(0,0,0,0);width:100px;"readonly></td>
			<td style="text-align:center;"><input type="text" value="${ a.m_modify_date }"style="text-align:center;background-color:rgba(0,0,0,0);border:rgba(0,0,0,0);width:100px;"readonly></td>
			<td style="text-align:center;"><input type="text" value="${ a.m_grade }" class="${ a.m_id }"style="text-align:center;background-color:rgba(0,0,0,0);border:rgba(0,0,0,0);width:100px;" readonly></td>
			<td style="text-align:center;"><input type="text" value="${ a.m_status }" class="${ a.m_id }"style="text-align:center;background-color:rgba(0,0,0,0);border:rgba(0,0,0,0);width:100px;" readonly></td>
			<td><input type="text" value="${ a.postnum }/${ a.g_address }/${ a.r_address }/${ a.d_address }" 
			class="${ a.m_id }" style="background-color:rgba(0,0,0,0);border:0.3px solid #ff005a;" readonly> </td>
			<td style="text-align:center;"><button class="listbtn fontwhite" onclick="${ a.m_id }">수정</button></td>
			
		</tr>
		<script>

		</script>
		</c:if>
		</c:forEach>
  	</table>
  </div>

  <div id="st2menu4" class="w3-container borderhotpink sidetab2menus animate-fading" style="display:none;border-top:white">
 
    <h3 class="fonthotpink" style="font-weight:bold">튜터신청 목록</h3><span class="fonthotpink">명이 신청하였습니다</span>
    <button class="listbtn fontwhite" style="margin:5px;margin-right:20px;float:right;">일단 버튼</button>
    <table class="w3-table-all hoverTablePink">
  	<thead>
  	<tr class="fontwhite" style="background-color:#ff005a;">
 <!--  		<th style="width:auto;text-align:center;">회원번호</th> -->
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
  	<c:forEach var="a" items="${ userList }">
  		<c:if test="${a.m_grade eq '튜티'}">
		<tr>
			
			<td style="text-align:center;width:100px;">사진 넣을거임</td>
			<td style="text-align:center;"><input type="text" value="${ a.m_id }" style="text-align:center;background-color:rgba(0,0,0,0);border:rgba(0,0,0,0);width:70px;" readonly></td>
			<td style="text-align:center;"><input type="text" value="${ a.m_name }" class="abc" style="text-align:center;background-color:rgba(0,0,0,0);border:rgba(0,0,0,0);width:70px;" readonly></td>
			<td style="text-align:center;"><input type="text" value="${ a.m_nickname }" class="${ a.m_id }"style="text-align:center;background-color:rgba(0,0,0,0);border:rgba(0,0,0,0);width:70px;" readonly></td>
			<td style="text-align:center;"><input type="text" value="${ a.m_email }" class="${ a.m_id }"style="text-align:center;background-color:rgba(0,0,0,0);border:rgba(0,0,0,0);width:70px;" readonly></td>
			<td style="text-align:center;"><input type="text" value="${ a.m_phone }" class="${ a.m_id }"style="text-align:center;background-color:rgba(0,0,0,0);border:rgba(0,0,0,0);width:70px;" readonly></td>
			<td style="text-align:center;"><input type="text" value="${ a.m_create_date }"style="text-align:center;background-color:rgba(0,0,0,0);border:rgba(0,0,0,0);width:70px;"readonly></td>
			<td style="text-align:center;"><input type="text" value="${ a.m_modify_date }"style="text-align:center;background-color:rgba(0,0,0,0);border:rgba(0,0,0,0);width:70px;"readonly></td>
			<td style="text-align:center;"><input type="text" value="${ a.m_grade }" class="${ a.m_id }"style="text-align:center;background-color:rgba(0,0,0,0);border:rgba(0,0,0,0);width:70px;" readonly></td>
			<td style="text-align:center;"><input type="text" value="${ a.m_status }" class="${ a.m_id }"style="text-align:center;background-color:rgba(0,0,0,0);border:rgba(0,0,0,0);width:70px;" readonly></td>
			<td><input type="text" value="${ a.postnum }/${ a.g_address }/${ a.r_address }/${ a.d_address }" 
			class="${ a.m_id }" style="background-color:rgba(0,0,0,0);border:0.3px solid #ff005a;" readonly> </td>
			<td style="text-align:center;"><button class="listbtn fontwhite" onclick="${ a.m_id }();">수정</button></td>
			
		</tr>
		<script>

		</script>
		</c:if>
		</c:forEach>
  	</table>
  </div>
  
  <div id="st2menu5" class="w3-container borderhotpink sidetab2menus animate-fading" style="display:none;border-top:white">

    <h3 class="fonthotpink" style="font-weight:bold">블랙회원관리 목록</h3><span class="fonthotpink">${ pib.listCount }명의 블랙회원이있습니다</span>
    <button class="listbtn fontwhite" style="margin:5px;margin-right:20px;float:right;">일단버튼</button>
    <table class="w3-table-all hoverTablePink">
  	<thead>
  	<tr class="fontwhite" style="background-color:#ff005a;">
 <!--  		<th style="width:auto;text-align:center;">회원번호</th> -->
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
 <c:forEach var="a" items="${ userList }">
  		<c:if test="${a.m_grade eq '튜티/블랙' or a.m_grade eq '튜터/블랙'}">
		<tr>
			<td style="text-align:center;width:100px;">사진 넣을거임</td>
			<td style="text-align:center;"><input type="text" value="${ a.m_id }" style="text-align:center;background-color:rgba(0,0,0,0);border:rgba(0,0,0,0);width:100px;" readonly></td>
			<td style="text-align:center;"><input type="text" value="${ a.m_name }" class="${ a.m_id }" style="text-align:center;background-color:rgba(0,0,0,0);border:rgba(0,0,0,0);width:100px;" readonly></td>
			<td style="text-align:center;"><input type="text" value="${ a.m_nickname }" class="${ a.m_id }"style="text-align:center;background-color:rgba(0,0,0,0);border:rgba(0,0,0,0);width:100px;" readonly></td>
			<td style="text-align:center;"><input type="text" value="${ a.m_email }" class="${ a.m_id }"style="text-align:center;background-color:rgba(0,0,0,0);border:rgba(0,0,0,0);width:100px;" readonly></td>
			<td style="text-align:center;"><input type="text" value="${ a.m_phone }" class="${ a.m_id }"style="text-align:center;background-color:rgba(0,0,0,0);border:rgba(0,0,0,0);width:100px;" readonly></td>
			<td style="text-align:center;"><input type="text" value="${ a.m_create_date }"style="text-align:center;background-color:rgba(0,0,0,0);border:rgba(0,0,0,0);width:100px;"readonly></td>
			<td style="text-align:center;"><input type="text" value="${ a.m_modify_date }"style="text-align:center;background-color:rgba(0,0,0,0);border:rgba(0,0,0,0);width:100px;"readonly></td>
			<td style="text-align:center;"><input type="text" value="${ a.m_grade }" class="${ a.m_id }"style="text-align:center;background-color:rgba(0,0,0,0);border:rgba(0,0,0,0);width:100px;" readonly></td>
			<td style="text-align:center;"><input type="text" value="${ a.m_status }" class="${ a.m_id }"style="text-align:center;background-color:rgba(0,0,0,0);border:rgba(0,0,0,0);width:100px;" readonly></td>
			<td><input type="text" value="${ a.postnum }/${ a.g_address }/${ a.r_address }/${ a.d_address }" 
			class="${ a.m_id }" style="background-color:rgba(0,0,0,0);border:0.3px solid #ff005a;" readonly> </td>
			<td style="text-align:center;"><button class="listbtn fontwhite" onclick="insert();">수정</button></td>
			
		</tr>
		<script>
	
		</script>
		</c:if>
		</c:forEach>
  	</table>
  </div>
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
   <jsp:include page="../common/footer.jsp"/>
</body>
</html>