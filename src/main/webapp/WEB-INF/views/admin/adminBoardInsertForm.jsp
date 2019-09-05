<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href='${ contextPath }/resources/css/admin/admin.css'>

</head>
<body>
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
</body>
</html>