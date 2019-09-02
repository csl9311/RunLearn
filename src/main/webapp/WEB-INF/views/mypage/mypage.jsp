<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.kh.runLearn.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	java.sql.Date time = new java.sql.Date(new java.util.Date().getTime());
	HttpSession session2 = request.getSession();
	Member loginUser = new Member("nakcom05a","12345", "김수민", "고석민123", "nakcom05a@naver.com", "010-9177-9509", time, time, "T", "Y", "10415", "서울특별시", "성동구 독서당로 62길 43", "2동802호");
	
	String grade = "";
	if(loginUser.getM_grade().equals("U")){
		grade = "(일반회원)";
	}else{
		grade = "(튜터)";
	}
	loginUser.setM_grade(grade);
	
	session2.setAttribute("loginUser", loginUser);
	
	

	
%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}
@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
#enrty1 {
	height: 200px;
	padding-top: 10px;
	padding-bottom: 10px;
	color: black;
}
#content1 {
	margin-right: 20px;
	width: 10%;
	height: 100%;
	margin-top: 10px;

}
#image11 {
	width: 100%;
	height: 100%;
}
.label1 {
	border: 1px solid white;
	margin-top: 10px;
	margin-left: 5px;
	
	
}
.label1:hover{
	background:lightyellow;
	color:black;
	cursor:pointer;

}
#paper{
	background-image: url("${contextPath}/resources/images/mypage/background.jpeg");

}
.content21 {
	height: 70px;
	width: 50%;
	text-align: center;
	font-weight: bold;
	padding-top: 25px;
	font-size: 17px;
}
#content21 {
	background: black;
	color: white;
}
#content22 {
	background: white;
}
#content201 {
	background: white;
}
#content202 {
	background: black;
	color: white;
}
#contentMenu1 {
	border-right: 2px solid #f8f9fa;
}
#contentMenu3 {
	border-right: 2px solid #f8f9fa;
}
.content22 {
	width: 31%;
	height: 100%;
	margin-left: 10px;
	text-align: center;
}
#sub1 {
	font-size: 20px;
	font-weight: border;
	margin-left: 15px;
	width: 100%;
	height: auto;
	padding: 20px;
	border-bottom: 2px solid #f8f9fa;
}
#content23 {
	
	margin: 0 20px;
	height: auto;
}
#content23 table {
	margin-bottom: 50px;
}
#content23 table th {
	padding: 15px;
}
#content23 table td {
	padding: 20px;
}
#content25 {
	display:none;
	margin: 0 20px;
	height: auto;
}
#content25 table {
	margin-bottom: 50px;
}
#content25 table th {
	padding: 15px;
}
#content25 table td {
	padding: 20px;
}
#content26 {
	display:none;
	margin: 0 20px;
	height: auto;
}
#content26 table {
	margin-bottom: 50px;
}
#content26 table th {
	padding: 15px;
}
#content26 table td {
	padding: 20px;
}
#footer {
	width: 100%;
	height: 100%;
}
.content31 {
	width: 12.5%;
	height: 100%;
}
#content33 {
	margin-left: 20px;
}
.content32 {
	width: 15%;
	height: 100%;
}
#grade {
	margin-top:5px;
	text-align: center;
	font-size: 17px;
	font-weight: bolder;
}
#paper3 {
	display: none;
}
#row1 {
	width: 125%;
	height: 100%;
	margin-left: 50px;
	font-family: 'Nanum Gothic', sans-serif;"
}
.leftSide1 {
	margin-right: 20px;
}
.rightSide1 {
	padding-right:10px;
	width: 13%;
	margin-left: 20px;
	border-right: 1px solid white;
}
.title123 {
	text-align: center;
	font-size: 16px;
}

#tableCategory1 {
	text-align: center;
	font-size: 15px;
}
#image1 {
	margin: 5px;
	text-align: center;
}
#left {
	line-height: 30px;
	text-align: center;
}
#teacherName {
	font-weight: bolder;
	font-size: 15px;
}
#lecturePrice {
	font-weight: bolder;
	font-size: 15px;
	font-family: 'Nanum Gothic', sans-serif;
	color: red;
}
#right12 {
	line-height: 30px;
	text-align: left;
	margin-left: 5px;
	width: 40%;
}
#lecturePriceItem {
	font-weight: bolder;
	font-size: 15px;
	color: red;
}
#right {
	line-height: 30px;
	text-align: center;
	margin-left: 5px;
	width: 40%;
}
#lectureTitle {
	text-align: center;
	font-size: 20px;
	font-weight: bolder;
}
#lectureContent {
	margin-left: 5px;
	font-size: 13px;
	width: 95%;
}
#lecturebox1 {
	height: 30px;
	margin-left: 0px;
	margin-top: 5px;
	width: 100%;
}
#lectureDate {
	font-size: 15px;
	text-align: center;
	font-weight: bolder
}
#tr1 {
	border-bottom: 1px solid lightgray;
	margin-top: 50px;
}
.td1 {
	border-right: 1px solid white;
}
#lDate1 {
	text-align: center;
	font-size: 16px;
}
.lDate {
	padding-left: 10px;
}
#contentMenu5 {
	font-size: 20px;
	width: 100%;
	height: 100%;
	text-align: center;
}
#pagging {
	text-align: center;
	margin-bottom: 50px;
}
#content27 {	
	margin: 0 20px;
	height: auto;
}
#content27 table {
	margin-bottom: 50px;
}
#content27 table th {
	padding: 15px;
}
#content27 table td {
	padding: 20px;
}
#answer1 {
	text-align: center;
	font-size: 30px;
}
#pagging2 {
	margin-left: 575px;
	margin-bottom: 20px;
}
#memberImage1 {
	margin-top: 20px;
}
#memberInformation {
	margin-top: 20px;
}
#countImage {
	margin-left: 15px;
	text-align: center;
}
#classImage {
	text-align: center;
	margin-left: 10px;
}
#classImage2 {
	border-right: 1px solid white;
	text-align: center;
	margin-left: 10px;
	padding-right: 30px;
}
.count1 {
	margin-top: 40px;
}
#membercontent1 {
	font-size: 15px;
	margin-left: 10;
	margin-top: 10px;
}
#writeContent {
	width: 400px;
	font-size: 15px;
	margin-top: 10px;
	margin-left: 20px;
}





</style>


<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
  <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&display=swap&subset=korean" rel="stylesheet">
</head>
<body>



	<c:import url="common/header.jsp" />



	<div id="paper">
		<div class="container" id="enrty1">
			<div class="row" id="row1">
				<div id="leftSide1" class="leftSide1">
					<div id=memberImage1>
						<img src="${contextPath}/resources/images/mypage/image11.jpg" width="120px" height="120px">
						<div id="grade">${ loginUser.m_grade }</div>
					</div>
				</div>

				<div id="rightSide1" class="rightSide1">
					<div id="memberInformation">
						<h3>${ loginUser.m_name } 님</h3>
						<label class="label1" id="update1" onclick="location.href='memberUpdate.do'">정보수정</label> <label
							class="label1" id="insertTuter">튜터신청</label> <label
							class="label1" id="logout">로그아웃</label>
					</div>
					<!-- memberInformation 끝 -->
				</div>
				<!--  rightSide1 끝 -->

				<div class="leftSide1" id="countImage">
					<div class="count1">
						<img src="${contextPath}/resources/images/mypage/menu01.png" width="40px" height="40px">
						<h4>신청수업 수</h4>
						<h5>0권</h5>
					</div>
				</div>

				<div class="leftSide1" id="classImage">
					<div class="count1">
						<img src="${contextPath}/resources/images/mypage/menu02.png" width="40px" height="40px">
						<h4>찜한 강의 수</h4>
						<h5>0권</h5>
					</div>
				</div>


				<div class="leftSide1" id="classImage2">
					<div class="count1">
						<img src="${contextPath}/resources/images/mypage/menu03.png" width="40px" height="40px">
						<h4>찜한 상품 수</h4>
						<h5>0개</h5>
					</div>
				</div>

				<div class="LeftSide1" id="membercontent1">
					<div id="name">
						<label>이름 </label>
					</div>
					<div id="phone">
						<label>핸드폰번호</label>
					</div>
					<div id="email">
						<label>이메일 </label>
					</div>
					<div id="address1">
						<label>우편번호</label>
					</div>
					<div id="address2">
						<label>지번주소</label>
					</div>
					<div id="address3">
						<label>상세주소</label>
					</div>
				</div>

				<div class="leftSide1" id="writeContent">
					<div id="wName">
						<label>${ loginUser.m_name } </label>
					</div>
					<div id="wphone">
						<label>${ loginUser.m_phone }</label>
					</div>
					<div id="wemail">
						<label>${ loginUser.m_email }</label>
					</div>
					<div id="waddress1">
						<label>${ loginUser.postnum }</label>
					</div>
					<div id="waddress2">
						<label>${ loginUser.g_address} ${ loginUser.r_address }</label>
					</div>
					<div id="waddress3">
						<label>${ loginUser.d_address }</label>
					</div>


				</div>





			</div>
			<!--  row1끝 -->




		</div>
		<!--  entry 끝 -->
	</div>
	<!--  paper끝 -->





	<div id="paper2" style="height: auto;">
		<br>
		<div class="container" id="entry2"
			style="border: 1px solid lightgray;">
			<div class="row">
				<div id="content21" class="content21">수강생</div>
				<div id="content22" class="content21">튜터</div>
			</div>
			<!--  row끝 -->

			<div class="row" id="sub1">
				<div class="content22" id="contentMenu1">수강목록</div>
				<div class="content22" id="contentMenu3">강의찜목록</div>
				<div class="content22" id="contentMenu4">상품찜목록</div>
			</div>

			<br>
			<br>

			<div id="content23">
				<table>
					<tr style="text-align: center; background: #f8deff;">
						<th style="width: 150px;"><div class="title123">카테고리</div></th>
						<th style="width: 300px; height: 25px;"><div class="title123">강의이미지</div></th>
						<th style="width: 600px;"><div class="title123">강의정보</div></th>
						<th style="width: 150px;"><div class="lDate" id="lDate1">신청날짜</div></th>
					</tr>

					
				<c:forEach var="i" begin="1" end="5">
					<tr id="tr1">
						<td class="td1" style="height: 100px;"><div
								id="tableCategory1">카테고리</div></td>
						<td class="td1"><div id="image1">
								<img src="${contextPath}/resources/images/mypage/classtest2.jpg" width="150px" height="80px">
							</div></td>
						<td>
							<div id="lectureTitle" style="text-align: left;">결과물 퀄리티
								미쳤다!!!포샵 일러 클래스!!!</div> <!-- 제목 -->
							<div id="lectureContent" style="text-align: left;">시간이 없다면
								! 3시간 만에 박살 내는 일러스트레이터 기초 1:1시간이 없다면 ! 3시간 만에 박살 내는 일러스트레이터 기초
								1:1</div>
							<div class="row" id="lecturebox1">
								<div id="left">

									<div id="teacherName">강사 : 고석민</div>

								</div>

								<div id="right">
									<div id="lecturePrice">가격 : 5000￦</div>
								</div>
							</div>
						</td>
						<td><div id="lectureDate" class="lDate">2019-08-29</div></td>
					</tr>
				</c:forEach>
				</table>
			</div>
			<!--  content23끝 -->

			<div id="content25">
				<table>
					<tr style="text-align: center; background: #f8deff;">
						<th style="width: 150px;"><div class="title123">카테고리</div></th>
						<th style="width: 300px; height: 25px;"><div class="title123">강의이미지</div></th>
						<th style="width: 600px;"><div class="title123">강의정보</div></th>
						<th style="width: 150px;"><div class="lDate" id="lDate1">신청날짜</div></th>
					</tr>

				<c:forEach var="i" begin="1" end="5">
					<tr id="tr1">
						<td class="td1" style="height: 100px;"><div
								id="tableCategory1">카테고리</div></td>
						<td class="td1"><div id="image1">
								<img src="${contextPath}/resources/images/mypage/classtest1.jpg" width="150px" height="80px">
							</div></td>
						<td>
							<div id="lectureTitle" style="text-align: left;">JAVA프레임워크
								개발자 양성 과정</div> <!-- 제목 -->
							<div id="lectureContent" style="text-align: left;">
								프레임워크!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
								</div>
							<div class="row" id="lecturebox1">
								<div id="left">

									<div id="teacherName">강사 : 고석민</div>

								</div>

								<div id="right">
									<div id="lecturePrice">가격 : 5000￦</div>
								</div>
							</div>
						</td>
						<td><div id="lectureDate" class="lDate">2019-08-29</div></td>
					</tr>
				</c:forEach>	
				</table>
			</div>
			<!--  content25 끝 -->

			<div id="content26">
				<table>
					<tr style="text-align: center; background: #f8deff;">
						<th style="width: 150px;"><div class="title123">카테고리</div></th>
						<th style="width: 300px; height: 25px;"><div class="title123">상품이미지</div></th>
						<th style="width: 350px;"><div class="title123">상품명</div></th>
						<th style="width: 200px;"><div class="lDate" id="lDate1">상품가격</div></th>
						<th style="width: 150px;"><div class="lDate" id="lDate1">상품수량</div></th>
					</tr>

				<c:forEach var="i" begin="1" end="5">
					<tr id="tr1">
						<td class="td1" style="height: 100px;"><div
								id="tableCategory1">디자인</div></td>
						<td class="td1"><div id="image1">
								<img src="${contextPath}/resources/images/mypage/testitem1.jpg" width="150px" height="80px">
							</div></td>
						<td>
							<div id="lectureTitle" style="text-align: center;">모나미</div> <!-- 제목 -->
<!-- 							<div id="lectureContent" style="text-align: left;">시간이 없다면
								! 3시간 만에 박살 내는 일러스트레이터 기초 1:1시간이 없다면 ! 3시간 만에 박살 내는 일러스트레이터 기초
								1:1</div>
							<div class="row" id="lecturebox1">
								<div id="right">
									<div id="lecturePrice">가격 : 1000원</div>
								</div>
							</div>
							
-->
						</td>
						<td><div id="lecturePrice" class="lDate" style="text-align:center;" >1000￦</div></td>
						<td><div id="lecturePrice" class="lDate" style="text-align:center; color:black">5개</div></td>
					</tr>
				</c:forEach>
					
				
				</table>
			</div>
			<!--  content26끝 -->
			<div id="pagging">[이전] [다음]</div>
		</div>
		<!-- entry2 끝 -->
		<br>
		<br>
	</div>
	<!--  paper2 끝 -->


	<div id="paper3" style="background-color: #e3e3e3">
		<br>
		<br>
		<div class="container" id="entry3" style="background-color: white;">
			<div class="row">
				<div id="content201" class="content21">수강생</div>
				<div id="content202" class="content21">튜터</div>
			</div>
			<!--  row끝 -->

			<div class="row" id="sub1">
				<div id="contentMenu5">내 강의목록</div>
			</div>
			<!-- sub1끝 -->
			<br>
			<br>

			<div id="content27">
				<table>
					<tr style="text-align: center; background: #f8deff;">
						<th style="width: 150px;"><div class="title123">카테고리</div></th>
						<th style="width: 300px; height: 25px;"><div class="title123">강의이미지</div></th>
						<th style="width: 500px;"><div class="title123">강의정보</div></th>
						<th style="width: 200px;"><div class="lDate" id="lDate1">수강생 수</div></th>
						<th style="width: 150px;"><div class="lDate" id="lDate1">승낙여부</div></th>
					</tr>

				<c:forEach var="i" begin="1" end="5">
					<tr id="tr1">
						<td class="td1" style="height: 100px;"><div
								id="tableCategory1">디자인</div></td>
						<td class="td1"><div id="image1">
								<img src="${contextPath}/resources/images/mypage/testitem1.jpg" width="150px" height="80px">
							</div></td>
						<td>
							<div id="lectureTitle" style="text-align: left;">JAVA프레임워크 개발자 양성 과정</div> <!-- 제목 -->
							<div id="lectureContent" style="text-align: left;">시간이 없다면
								! 3시간 만에 박살 내는 일러스트레이터 기초 1:1시간이 없다면 ! 3시간 만에 박살 내는 일러스트레이터 기초
								1:1</div>
							<div class="row" id="lecturebox1">
								<div id="right">
									<div id="lecturePrice" style="text-align:left;">가격 : 1000원</div>
								</div>
							</div>
							

						</td>
						<td><div id="lecturePrice" class="lDate" style="text-align:center; color:black;" >5명</div></td>
						<td><div id="lecturePrice" class="lDate" style="text-align:center; color:black">◎</div></td>
					</tr>
				</c:forEach>
					
				
				</table>
			</div>
			<!--  content27끝 -->
			<div id="pagging2">[이전] [다음]</div>
			<!--  pagging2 끝 -->
		</div>
		<!--  entry3끝 -->

	</div>
	<!--  paper3끝 -->
	<script>
		$("#content22").click(function() {
			var bool = confirm("튜터 등록하시겠습니까?");
			if (bool == true) {
				location.href = "tuterInsert.jsp";
			} else {
				$("#paper2").css("display", "none");
				$("#paper3").css("display", "block");
			}
		}), $("#content22").hover(function() {
			$(this).css("background", "gray");
			$(this).css("color", "white");
		}, function() {
			$(this).css("background", "white");
			$(this).css("color", "black");
		});

		$("#content21").click(function() {
			$("#paper2").css("display", "block");
			$("#paper3").css("display", "none");
		}), $("#content21").hover(function() {
			$(this).css("background", "gray");
			$(this).css("color", "white");
		}, function() {
			$(this).css("background", "black");
			$(this).css("color", "white");
		});

		$("#contentMenu1").click(function() {
			$("#content23").css("display", "block");
			$("#content25").css("display", "none");
			$("#content26").css("display", "none");
		}), $("#contentMenu1").hover(function() {
			$(this).css("border-bottom", "1px solid black");
			$(this).css("cursor", "pointer");
		}, function() {
			$(this).css("border-bottom", "1px solid white");
		});

		$("#contentMenu3").click(function() {
			$("#content25").css("display", "block");
			$("#content23").css("display", "none");
			$("#content26").css("display", "none");
		}), $("#contentMenu3").hover(function() {
			$(this).css("border-bottom", "1px solid black");
			$(this).css("cursor", "pointer");
		}, function() {
			$(this).css("border-bottom", "1px solid white");
		});

		$("#contentMenu4").click(function() {
			$("#content26").css("display", "block");
			$("#content23").css("display", "none");
			$("#content25").css("display", "none");
		}), $("#contentMenu4").hover(function() {
			$(this).css("border-bottom", "1px solid black");
			$(this).css("cursor", "pointer");
		}, function() {
			$(this).css("border-bottom", "1px solid white");
		});

	

		$("#insertTuter").click(function() {
			location.href = "##";
		})

		$("#logout").click(function() {
			location.href = "##";
		})

		$("#content201").click(function() {
			$("#paper2").css("display", "block");
			$("#paper3").css("display", "none");
		}), $("#content201").hover(function() {
			$(this).css("background", "gray");
			$(this).css("color", "white");
		}, function() {
			$(this).css("background", "white");
			$(this).css("color", "black");
		});

		$("#content202").click(function() {
			$("#paper2").css("display", "block");
			$("#paper3").css("display", "none");
		}), $("#content202").hover(function() {
			$(this).css("background", "gray");
			$(this).css("color", "white");
		}, function() {
			$(this).css("background", "black");
			$(this).css("color", "white");
		});
	</script>




	<!-- -------footer------------------------------------------------------------------------------------------------------------- -->

	<c:import url="common/footer.jsp" />





















</body>
</html>