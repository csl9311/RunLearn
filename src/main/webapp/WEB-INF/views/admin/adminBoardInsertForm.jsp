<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href='${ contextPath }/resources/css/admin/admin.css'>

</head>
<body>
<c:url var="adminMain" value="adminMain.do"/>
<c:url var="adminUser" value="adminUsesr.do"/>
<c:url var="adminPayManage" value="adminPayManage.do"/>
<c:url var="adminNoticeAdmin" value="adminNoticeAdmin.do"/>
<c:url var="adminNoticeUser" value="adminNoticeUser.do"/>
<c:url var="adminBoardDetailView" value="adminBoardDetailView.do"/>
<%-- <c:url var="adminBoardInsertView" value="adminBoardInsertView.do"/> --%>
  <jsp:include page="../common/header.jsp"/>

<div class="sidebar w3-bar-block  w3-card" style="width:180px; margin-top:3px;">
  <h6 class="w3-bar-item fonthotpink" style="font-size:23px;">관리자페이지</h6>
  <hr>
  <button id="tablink1" class="w3-bar-item tablink hoverpink w3-round" onclick="location.href='adminMain.do';" style="width:175px">관리자 메인</button>
  <button id="tablink2" class="w3-bar-item tablink hoverpink w3-round" onclick="location.href='adminUser.do';" style="width:175px">회원관리</button>
  <button id="tablink3" class="w3-bar-item tablink hoverpink w3-round" onclick="location.href='adminPayManage.do';" style="width:175px">결제관리</button>
  <button id="tablink4" class="w3-bar-item tablink hoverpink w3-round" onclick="location.href='adminNoticeAdmin.do';" style="width:175px">고객센터(관리자)</button>
  <button id="tablink5" class="w3-bar-item tablink hoverpink w3-round" onclick="location.href='adminNoticeUser.do';" style="width:175px">고객센터(요청)</button>
  <button id="tablink6" class="w3-bar-item tablink hoverpink w3-round" onclick="location.href='adminBoardDetailView.do';" style="width:175px">(작업용)게시판뷰</button>
  <button id="tablink8" class="w3-bar-item tablink hoverpink w3-round hotpink fontwhite" onclick="location.href='adminBoardInsertForm.do';" style="width:175px">(작업용)게시판작성</button>
</div>

<div class="minh"style="margin-left:190px">
	<h2 class="w3-padding fontthick fonthotpink">마더뷰</h2>
	<hr class="borderhotpink">
	<form action="adminboardinsert.do" method="post"
		enctype="Multipart/form-data">
		<div class="w3-container minh" style="margin-left: 160px;">
			<!-- 틀 -->

			<div class="borderhotpinkthick"
				style="width: 1300px; min-height: 200px; border-radius: 10px; opacity: 0.8; margin-bottom: 10px;">
				<!--게시글 날짜 표시할것  -->
				<h3 class="fonthotpink"
					style="opacity: 0.4; margin-left: 30px; margin-top: 10px;">해당
					카테고리에서 작성할때 카테고리가 표시됩니다 예) 질문 > 건의 사항</h3>


				<div style="float: left; width: 100%;">
					<!-- 제목부분 -->
					<label class="fonthotpink"
						style="margin-left: 50px; font-size: 30px;">제목 : </label><input
						type="text" name="adminBoardTitle" class="fonthotpink"
						style="width: 800px; height: 40px; font-weight: bold; margin-right: 15px; border: white; padding-bottom: -50px; z-index: 4; font-size: 20px; border-bottom: 3px solid #ff005a;" />
					<!-- 	<hr class="borderhotpink" style="width:70%;margin-left:5%;margin-right:5%;z-index:3;"> -->
				</div>

				<br>
				<h4
					style="opacity: 2.0; padding-top: 40px; float: right; margin-right: 30px;">작성자
					부분입니다</h4>
				<h6 style="color: #FA5882; margin-left: 30px;"><label style="font-size:36px;">날짜 : </label>
					<input type="date" id="currentDate"
						style="border: white; font-size: 40px; margin-top: 60px" readonly />
				</h6>
				<!-- 날짜 -->
			</div>

			<div class="borderhotpink"
				style="width: 1300px; min-height: 900px; border-radius: 15px;">
				<!-- 게시글 내용 -->
				<div style="margin: 10px; font-size: 20px;">

					<textArea
						style="margin-left: 15px; width: 1250px; min-height: 900px; border: 0.3px solid gray;"
						placeholder="내용을 입력해주세요" name="adminBoardContent"></textArea>


				</div>

			</div>
			<button
				class=" ligt-pink  borderhotpink w3-round-large hoverpink fonthotpink"
				style="float: right; margin-right: 250px; margin-top: 20px; border: white; width: 200px; height: 50px; font-size: 30px;">작성하기</button>



		</div>
	</form>
	<script>
		document.getElementById('currentDate').value = new Date().toISOString()
				.substring(0, 10);
	</script>
	</div>
	   <jsp:include page="../common/footer.jsp"/>
</body>
</html>