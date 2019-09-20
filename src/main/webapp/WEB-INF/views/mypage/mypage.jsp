
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



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

#entry1 {
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

.label1:hover {
	background: lightyellow;
	color: black;
	cursor: pointer;
}

#paper {
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
	background: #bfbfbb;
	color: white;
}

#content21:hover {
	color: #F4A460;
	cursor: pointer;
}

#content22 {
	background: white;
	color: black;
	box-shadow: inset -1px 0px 9px 0px #c9c9c9;
}

#content22:hover {
	background: black;
	color: white;
	cursor: pointer;
}

#content201 {
	background: white;
	color: black;
	box-shadow: inset -1px 0px 9px 0px #c9c9c9;
}

#content201:hover {
	background: black;
	color: white;
	cursor: pointer;
}

#content202 {
	color: white;
}

#content202:hover {
	color: #F4A460;
	cursor: pointer;
}

#contentMenu1:hover {
	border-bottom: 1px dashed #F08080;
	cursor: pointer;
}

#contentMenu2 {
	margin-left: 220px;
}

#contentMenu3 {
	margin-left: 220px;
}

#contentMenu3:hover {
	border-bottom: 1px dashed #F08080;
	cursor: pointer;
}

#contentMenu4:hover {
	border-bottom: 1px dashed #F08080;
	cursor: pointer;
}

#contentMenu2:hover {
	border-bottom: 1px dashed #F08080;
	cursor: pointer;
}

.content22 {
	width: 31%;
	height: 30px;
	margin-left: 100px;
	text-align: center;
}

#sub1 {
	font-size: 20px;
	font-weight: border;
	width: 1100;
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
	margin-top: 5px;
	text-align: center;
	font-size: 17px;
	font-weight: bolder;
}

#row1 {
	width: 125%;
	height: 100%;
	margin-left: 50px;
	font-family: 'Nanum Gothic', sans-serif;
	"
}

.leftSide1 {
	margin-right: 20px;
}

.rightSide1 {
	padding-right: 10px;
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

#tableCategory2 {
	text-align: center;
	font-size: 15px;
	padding-top: 35px;
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

#lectureDate2 {
	font-size: 15px;
	text-align: center;
	font-weight: bolder;
	padding-top: 35px;
}

#lecturelist {
	font-size: 20px;
	border-right: 1px solid #f1f1f1;
	cursor: pointer;
}

#lecturelist:hover {
	background: #fdffe2;

}

#tr1 {
	border-bottom: 1px solid lightgray;
	margin-top: 50px;
	font-family: 'Nanum Gothic', sans-serif;
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

#classImage3 {
	border-right: 1px solid white;
	text-align: center;
	margin-left: 10px;
	padding-right: 30px;
}

.count1 {
	margin-top: 40px;
}

#membercontent1 {
	font-size: 17px;
	margin-left: 10px;
	margin-top: 25px;
}

#writeContent {
	width: 400px;
	font-size: 17px;
	margin-top: 25px;
	margin-left: 20px;
}

#classInsert {
	background-image: url("/resources/images/mypage/menu02.png");
	font-size: 20px;
	font_weight: bold;
	padding: 10px;
	box-shadow: 0 0 6px 0px black;
	text-shadow: 0px 0px 20px black;
	color: #232222;
	background-repeat: no-repeat
}

.tr3 {
	text-align: center;
	background: pink;
	box-shadow: 0px 0px 4px 1px #bdb7b7;
}

#classInsertMenu {
	width: 100%;
	text-align: right;
}

#tr1:hover {
	background-color: #fff9e8;
	box-shadow: inset 0 0 3px 1px #cec597;
	cursor: pointer;
}

#cashButton {
	margin-bottom: 10px;
	width: 100px;
	height: 50px;
	background-color: #ffbcbc;
	text-shadow: 0 0 0px black;
	box-shadow: 0 0 2px 0px black;
}

#title2 {
	border: 1px solid #f1f1f1
}

#productlist {
	font-size: 20px;
	cursor: pointer;
}

#productlist:hover {
	background: #fdffe2;
	
}
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&display=swap&subset=korean" rel="stylesheet">
</head>
<body>
	<c:import url="../common/header.jsp" />
	<div id="paper">
		<div class="container" id="enrty1">
			<div class="row" id="row1">
				<div id="leftSide1" class="leftSide1">
					<div id=memberImage1>
						<img src="${contextPath}/resources/images/member/${ profile.m_changed_name }" width="120px" height="120px">
					</div>
				</div>

				<div id="rightSide1" class="rightSide1">
					<div id="memberInformation">
						<h3>${ loginUser.m_name }님</h3>
						<label class="label1" id="update1" onclick="location.href='memberUpdate.do'">정보수정</label>
						<c:if test="${loginUser.m_grade eq '튜티' }">
							<label class="label1" id="insertTuter">튜터신청</label>
						</c:if>
            
						<c:url var="Apply" value="Apply.le"/>
						<c:if test="${loginUser.m_grade eq '튜터'}">
							<label class="label1" id="classInsertButton" onclick="location.href='${Apply}'">강의등록</label>

						</c:if>
						<label class="label1" id="logout" onclick="location.href='logout.do'">로그아웃</label>
					</div>
					<!-- memberInformation 끝 -->
				</div>

				<script>
               
            </script>


				<!--  rightSide1 끝 -->

				<div class="leftSide1" id="countImage">
					<div class="count1">
						<img src="${contextPath}/resources/images/mypage/menu01.png" width="40px" height="40px">
						<h4>수강목록 수</h4>
						<h5>${ lCount }개</h5>
					</div>
				</div>

				<div class="leftSide1" id="classImage">
					<div class="count1">
						<img src="${contextPath}/resources/images/mypage/menu02.png" width="40px" height="40px">
						<h4>찜한 강의 수</h4>
						<h5>${ nPayLcount }개</h5>
					</div>
				</div>

				<div class="leftSide1" id="classImage2">
					<div class="count1">
						<img src="${contextPath}/resources/images/mypage/menu03.png" width="40px" height="40px">
						<h4>찜한 상품 수</h4>
						<h5>${ nPayPcount }개</h5>
					</div>
				</div>




				<div class="leftSide1" id="membercontent1">
					<div id="name">
						<label>&nbsp;&nbsp;이름 </label>
					</div>
					<div id="nickName">
						<label>닉네임</label>
					</div>
					<div id="grade">
						<label>등급</label>
					</div>
					<div id="email">
						<label>이메일 </label>
					</div>
				</div>


				<div class="leftSide1" id="writeContent">
					<div id="wName">
						<label>${ loginUser.m_name } </label>
					</div>
					<div id="wphone">
						<label>${ loginUser.m_nickname }</label>
					</div>

					<div id="wGrade" style="margin-top: 5px;">
						<label>${ loginUser.m_grade }</label>
					</div>

					<div id="wemail">
						<label>${ loginUser.m_email }</label>
					</div>
				</div>
			</div>
			<!--  row1끝 -->
		</div>
		<!--  entry 끝 -->
	</div>
	<!--  paper끝 -->
	<br>
	<br>
	<br>

	<div id="paper2" style="height: auto;">
		<br>
		<div class="container" id="entry2"
			style="border: 1px solid lightgray;">
			<div class="row">
				<c:url var="lListView" value="mypage.do">
					<c:param name="cate" value="수강목록" />
					
				</c:url>

				<c:url var="tuterPage" value="mypage.do">
					<c:param name="cate" value="튜터" />
					
				</c:url>

				<c:url var="selectList" value="mypage.do">
					<c:param name="cate" value="강의찜목록" />
					
				</c:url>
				<c:url var="productList" value="mypage.do">
					<c:param name="cate" value="상품찜목록" />
					
				</c:url>

				<c:url var="productpayList" value="mypage.do">
					<c:param name="cate" value="productPay" />
					
				</c:url>

				<div id="content21" class="content21">수강생</div>
				<div id="content22" class="content21"
					<c:if test="${ loginUser.m_grade eq '튜티' }">onclick="NotTuterPage();"</c:if>
					<c:if test="${ loginUser.m_grade eq '튜터' }">onclick="location.href='${ tuterPage }'"</c:if>>튜터</div>
			</div>

			<div class="row" id="title2">
				<div class="content21" id="lecturelist" onclick="location.href='${ lListView }'" <c:if test="${ cate eq '수강목록'}">style="font-weight:bold; font-size:25px; color:red;" </c:if>>강의</div>
				<div class="content21" id="productlist" onclick="location.href='${ productList }'" <c:if test="${ cate eq '상품찜목록'}">style="font-weight:bold; font-size:25px; color:red;"</c:if>>상품</div>
			</div>
			<!--  row끝 -->

			<div class="row" id="sub1">
				<c:if test="${ cate eq '수강목록' || cate eq '강의찜목록' }">
					<div class="content22" onclick="location.href='${ lListView }'" id="contentMenu1" <c:if test="${ cate eq '수강목록' }">style="font-weight:bold; font-size:25px;"</c:if>>수강목록</div>
					<div class="content22" onclick="location.href='${ selectList }'" id="contentMenu3" <c:if test="${ cate eq '강의찜목록' }">style="font-weight:bold; font-size:25px"</c:if>>강의찜목록</div>
				</c:if>
				<c:if test="${ cate eq '상품찜목록' || cate eq 'productPay' }">
					<div class="content22" onclick="location.href='${ productList }'" id="contentMenu4" <c:if test="${ cate eq '상품찜목록' }">style="font-weight:bold; font-size:25px"</c:if>>상품찜목록</div>
					<div id="productPay" class="content22" onclick="location.href='${ productpayList }'" id="contentMenu2" <c:if test="${ cate eq 'productPay' }">style="font-weight:bold; font-size:25px"</c:if>>결제상품</div>
				</c:if>
			</div>
			<br> <br>

			<c:if test="${cate eq '수강목록'}">
				<div id="content23">
					<table>
						<tr class="tr3" style="text-align: center;">
							<th style="width: 150px;"><div class="title123">카테고리</div></th>
							<th style="width: 300px; height: 25px;">
								<div class="title123">강의이미지</div>
							</th>
							<th style="width: 600px;"><div class="title123">강의정보</div></th>
							<th style="width: 150px;"><div class="lDate" id="lDate1">신청날짜</div></th>
						</tr>

						<c:if test="${ empty lList }">

							<tr id="tr1">
								<td class="td1" colspan="4" style="text-align: center;"><h3>수강한 강의가 없습니다.</h3></td>
							</tr>
						</c:if>

						<c:forEach var="l" items="${ lList }">
							<tr id="tr1">
								<td class="td1" style="height: 100px;">
									<div id="tableCategory1">${ l.L_CATEGORY }</div> <input
									type="hidden" value="${ l.L_NUM }">
								</td>
								<td class="td1">
									<div id="image1"> 
										<img src="${contextPath}/resources/images/mypage/classtest2.jpg" width="150px" height="80px">
									</div>
								</td>
								<td>
									<div id="lectureTitle" style="text-align: left;">${ l.L_TITLE }</div>
									<!-- 제목 -->
									<div id="lectureContent" style="text-align: left;">${ l.L_OBJECT }
									</div>
									<div class="row" id="lecturebox1">
										<div id="left">
											<div id="lecturePrice">가격 :${ l.L_PRICE }</div>
										</div>
									</div>
								</td>
								<td><div id="lectureDate" class="lDate">${ l.PAY_DATE }</div></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</c:if>

			<!--  content23끝 -->
			<c:if test="${cate eq '강의찜목록' }">
				<div id="content25">
					<table class="table">

						<tr class="tr3" style="text-align: center;">
							<th style="width: 150px;"><div class="title123">카테고리</div></th>
							<th style="width: 300px; height: 25px;"><div class="title123">강의이미지</div></th>
							<th style="width: 600px;"><div class="title123">강의정보</div></th>
							<th style="width: 150px;"><div class="lDate" id="lDate1">강의방식</div></th>
						</tr>

						<c:if test="${ empty noPaylList}">
							<tr id="tr1">
								<td class="td1" colspan="4"><h3 style="text-align: center;">찜한 강의가 없습니다.</h3></td>
							</tr>
						</c:if>

						<c:forEach var="i" items="${ noPaylList }">
							<tr id="tr1" >
								<td class="td1" style="height: 100px;"><div id="tableCategory2">${ i.L_CATEGORY }</div></td>
								<td class="td1">
									<div id="image1">
										<img src="${contextPath}/resources/images/lecture/${i.L_CHANGED_NAME}" width="150px" height="80px">
									</div></td>
								<td>
									<div id="lectureTitle" style="text-align: left;">${ i.L_TITLE }</div>
									<!-- 제목 -->
									<div id="lectureContent" style="text-align: left;">${ i.L_OBJECT }
									</div>
									<div class="row" id="lecturebox1">
										<div id="left">
											<div id="teacherName">${ i.M_NICKNAME }</div>
										</div>
										<div id="right">
											<div id="lecturePrice">가격 : ${ i.L_PRICE }￦</div>
										</div>
									</div>
								</td>
								<td><div id="lectureDate2" class="lDate">${ i.L_SYSTEM }</div></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</c:if>
			<!--  content25 끝 -->

			<c:if test="${cate eq '상품찜목록'}">
				<div id="content26">
					<form action="product.pay" method="post">
						<table>
							<tr class="tr3" style="text-align: center;">
								<th style="width: 150px;"><div class="title123"></div>
								<th style="width: 200px;"><div class="title123">카테고리</div></th>
								<th style="width: 300px; height: 25px;"><div class="title123">상품이미지</div></th>
								<th style="width: 350px;"><div class="title123">상품명</div></th>
								<th style="width: 200px;"><div class="lDate" id="lDate1">상품가격</div></th>
								<th style="width: 150px;"><div class="lDate" id="lDate1">상품수량</div></th>
								<th style="width: 150px;"><div class="lDate" id="lDate1">총가격</div></th>
							</tr>
							<c:if test="${empty pList }">
								<td colspan="7" style="text-align: center"><h3>찜한 상품이 없습니다.</h3></td>
							</c:if>

							<c:forEach var="i" items="${ pList }" varStatus="status">
								<tr id="tr1">
									<td style="text-align: center"><input type="checkbox" value="${ i.P_NUM }" name="checkboxAll" id="checkProduct${ i.P_NUM }" onclick="check1(${ i.P_NUM });"	checked></td>
									<td class="td1" style="height: 100px;"><div id="tableCategory1">${ i.P_CATEGORY }</div></td>
									<td class="td1">
										<div id="image1">
											<img src="${contextPath}/resources/images/product/${i.P_CHANGED_NAME}" width="150px" height="80px">
										</div>
									</td>
									<td>
										<div id="lectureTitle" style="text-align: center;"> ${ i.P_NAME } / ${ i.P_OPTION } <input type="hidden" name="item" value="${ i.P_OPTION }"></div>
									</td>
									<td>
										<div id="lecturePrice" class="lDate" style="text-align: center;">${ i.po.p_optionPrice }</div>
										<input type="hidden" name="pricearr" id="price_hidden${ i.P_NUM }" value="${ i.po.p_optionPrice }">
										<input type="hidden" name="p_name" id="name_hidden" value="${ i.P_NAME }">
									</td>
									<td>
										<div id="lecturePrice" class="lDate" style="text-align: center; color: black; width: 150px;">
											<input type="button" name="plus" id="plus${ i.P_NUM }" value="+" onclick="add(${ i.P_NUM });">
											<input type="text" name="amount" style="width: 55px;" id="p_count${ i.P_NUM }" value="${ i.AMOUNT }" min="1" onchange="getTotal(${ i.P_NUM });">
											<input type="button" name="minus" id="minus${ i.P_NUM }" value="-" onclick="del(${ i.P_NUM });">
										</div>
									</td>
									<td style="text-align: center"><input type="text" id="sum${ i.P_NUM }" name="sum" value="${ i.po.p_optionPrice * i.AMOUNT }" readonly></td>
								</tr>
							</c:forEach>
							<tr>
								<td colspan="5"></td>
								<td style="text-align: center; font-size: 20px; font-weight: bold;">총 가격 :</td>
								<td style="text-align: center"><div id="totalPrice"></div></td>
							</tr>
						</table>
						<div id="cash" style="text-align: right;">
							<button type="submit" id="cashButton">결제하기</button>
						</div>
					</form>
				</div>
			</c:if>
			<!--  content26끝 -->
		<script>
			checkedSum();
			function add(p_num){
				$('#p_count'+p_num).val(Number($('#p_count'+p_num).val()) +1);
				getTotal(p_num);
			}
			function del(p_num){
				if($('#p_count'+p_num).val() >= 1) {
					$('#p_count'+p_num).val(Number($('#p_count'+p_num).val()) -1);
					getTotal(p_num);
				}
			}
			function getTotal(p_num){
				var amount = $('#p_count'+p_num).val();
				var price = $('#price_hidden'+p_num).val();
				var total = amount * price;
				$('#sum'+p_num).val(total);
				// 총 찜목록 상품 금액
				var sumArr = $('input[name=sum]');
				var totalPrice = 0;
				for(var i = 0 ; i < sumArr.length ; i ++){
					console.log(sumArr[i].value);
					totalPrice += Number(sumArr[i].value);
				}
				$('#totalPrice').text(totalPrice);
			}
      //체크
			function check1(p_num){
				var check = document.getElementById('checkProduct'+p_num);
				var totalPrice = $('#totalPrice').text();
				var price = $('#sum'+p_num).val();
				if($("input:checkbox[id='checkProduct"+p_num+"']").is(":checked") == true) {
					result = $("#checkProduct"+p_num).val();      
					checkedSum();
				} else {
					result = "";
					checkedSum();
				}
			}
			function checkedSum() {
				var sumPrice = 0;
				$('input:checkbox[name="checkboxAll"]').each(function() {
					if(this.checked){//checked 처리된 항목의 값
						sumPrice += Number(($('#sum'+$(this).val())).val());
					}
				});
				$('#totalPrice').text(sumPrice);
				total = $('#totalPrice').text(sumPrice);
				$('#totalPrice').append('<input value="'+sumPrice+'" name="total" type="hidden">');
			}
			function cash(){
				var check = document.getElementsByName("checkboxAll");
				var pcount = document.getElementsByName("p_count");
				var sum = document.getElementsByName("sum");
				total = 0;
				for (var i = 0; i < check.length; i++) {
					if (check[i].checked) {  	
					total += parseInt(sum[i].value); // 총가격
					var result = new Array(parseInt(check[i].value), parseInt(sum[i].value), parseInt(pcount[i].value)); // 상품번호, 총합, 수량
					console.log(result); 	
					}else{
					var result = new Array();
					var result = new Array(0, 0, 0); // 상품번호, 체크한거총합, 수량
					console.log(result);
					}
				}
			console.log(total);
          /* location href = 'searchAll.do?result='+result+'&total='+total; */
			}
		</script>
			<c:if test="${cate eq 'productPay'}">
				<div id="content26">
					<table>
						<tr class="tr3" style="text-align: center;">
							<th style="width: 200px;"><div class="title123">카테고리</div></th>
							<th style="width: 300px; height: 25px;"><div class="title123">상품이미지</div></th>
							<th style="width: 350px;"><div class="title123">상품명</div></th>
							<th style="width: 200px;"><div class="lDate" id="lDate1">상품가격</div></th>
							<th style="width: 225px;"><div class="lDate" id="lDate1">구매수량</div></th>
							<th style="width: 225px;"><div class="lDate" id="lDate1">총가격</div></th>
						</tr>

						<c:if test="${empty pList }">
							<td colspan="7" style="text-align: center"><h3>구매한 상품이 없습니다.</h3></td>
						</c:if>

						<c:forEach var="i" items="${ pList }">
							<tr id="tr1">
								<td class="td1" style="height: 100px;"><div id="tableCategory1">${ i.P_CATEGORY }</div></td>
								<td class="td1">
									<div id="image1">
										<img src="${contextPath}/resources/images/product/${i.P_CHANGED_NAME}" width="150px" height="80px">
									</div>
								</td>
								<td><div id="lectureTitle" style="text-align: center;">${ i.P_NAME }</div></td>
								<td>
									<div id="lecturePrice" class="lDate" style="text-align: center;">${ i.po.p_optionPrice }</div>
									<input type="hidden" id="price_hidden${ i.P_NUM }" value="${ i.P_PRICE }">
									<input type="hidden" id="name_hidden" value="${ i.P_NAME }">
								</td>
								<td>
									<div id="lecturePrice" class="lDate" style="text-align: center; color: black; width: 150px;">${ i.P_PAY_AMOUNT }</div>
								</td>
								<td style="text-align: center;">
									<div id="sum">${ i.po.p_optionPrice * i.P_PAY_AMOUNT }</div>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</c:if>
		</div>

		<!-- entry2 끝 -->
		<br> <br>
		<div id="pagging">
			<c:if test="${ pi.currentPage <= 1 }">[이전] &nbsp;</c:if>
			<c:if test="${ pi.currentPage > 1 }">
				<c:url var="before" value="mypage.do">
					<c:param name="cate" value="${ cate }" />
				
					<c:param name="page" value="${ pi.currentPage - 1 }" />
				</c:url>
				<a href="${ before }">[이전]</a> &nbsp;
            </c:if>
			<!-- 페이지 -->
			<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				<c:if test="${ p eq currentPage }">
					<font color="red" size="4"><b>[${ p }]</b></font>
				</c:if>

				<c:if test="${ p ne currentPage }">
					<c:url var="pagination" value="mypage.do">
						<c:param name="cate" value="${ cate }" />
					
						<c:param name="page" value="${ p }" />
						<!--  blist.do?page=1과 같음  -->
					</c:url>
					<a href="${ pagination }">${ p }</a> &nbsp;
               </c:if>
			</c:forEach>

			<!-- [다음] -->
			<c:if test="${ pi.currentPage >= pi.maxPage }">[다음]</c:if>
			<c:if test="${ pi.currentPage < pi.maxPage }">
				<c:url var="after" value="mypage.do">
					<c:param name="cate" value="${ cate }" />
				
					<c:param name="page" value="${ pi.currentPage + 1 }" />
				</c:url>
				<a href="${ after }">[다음]</a>
			</c:if>
		</div>


	</div>
	<!--  paper2 끝 -->

	<c:if test="${ cate eq '튜터' }">
		<script>
			$("#paper2").hide();
		</script>

		<div id="paper3">
			<br> <br>
			<div class="container" id="entry3"
				style="border: 1px solid lightgray;">
				<div class="row">
					<div id="content201" class="content21"
						onclick="location.href='${ lListView }'">수강생</div>
					<div id="content202" class="content21"
						<c:if test="${ cate eq '튜터' }">style="background: #bfbfbb;"</c:if>>튜터</div>
				</div>

				<!--  row끝 -->
				<div class="row" id="sub1">
					<div id="contentMenu5">
						<label>내 강의목록</label>
					</div>
					<c:url var="Apply" value="Apply.le"/>
					<div id="classInsertMenu">
						<button type="button" id="classInsert" onclick="location.href='${Apply}'">강의등록</button>
					</div>
				</div>
				<!-- sub1끝 -->
				<br> <br>

				<c:url var="tuterPage" value="mypage.do">
					<c:param name="cate" value="튜터" />
				</c:url>


				<div id="content27">
					<table>
						<tr class="tr3" style="text-align: center;">
							<th style="width: 150px;"><div class="title123">카테고리</div></th>
							<th style="width: 300px; height: 25px;"><div class="title123">강의이미지</div></th>
							<th style="width: 500px;"><div class="title123">강의정보</div></th>
							<th style="width: 200px;"><div class="lDate" id="lDate1">승낙여부</div></th>
							<th style="width: 150px;"><div class="lDate" id="lDate1">강의방식</div></th>
						</tr>


						<c:if test="${ empty tLectureList }">
							<td colspan="5" style="text-align: center; font-size: 20px;">등록한 강의가 없습니다.</td>
						</c:if>
						<c:forEach var="i" items="${ tLectureList }">
							<c:url var="lectureConfirmView" value="lectureConfirmView.le">
								<c:param name="l_num" value="${ i.L_NUM }"/>
							</c:url>
							<tr id="tr1" onclick="location.href='${lectureConfirmView}'">
								<td class="td1" style="height: 100px;"><div id="tableCategory1">${ i.L_CATEGORY }</div></td>
								<td class="td1">
									<div id="image1">
										<img src="${contextPath}/resources/images/lecture/${ i.L_CHANGED_NAME }" width="150px" height="80px">
									</div></td>
								<td>
									<div id="lectureTitle" style="text-align: left;">${ i.L_TITLE }</div>
									<!-- 제목 -->
									<div id="lectureContent" style="text-align: left;">${ i.L_OBJECT }</div>
									<div class="row" id="lecturebox1">
										<div id="right">
											<div id="lecturePrice" style="text-align: left;">&#8361;${ i.L_PRICE }</div>
										</div>
									</div>
								</td>
								<td><div id="lecturePrice" class="lDate" style="text-align: center; color: black;">${ i.L_CONFIRM }</div></td>
								<td><div id="lecturePrice" class="lDate" style="text-align: center; color: black">${ i.L_SYSTEM }</div></td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<!--  content27끝 -->
				<br>
			</div>
			<!--  entry3끝 -->
			<br>
		</div>
		<br>
		<!--  paper3끝 -->
		<div id="pagging">
			<c:if test="${ pi.currentPage <= 1 }">[이전] &nbsp;</c:if>
			<c:if test="${ pi.currentPage > 1 }">
				<c:url var="before" value="mypage.do">
					<c:param name="cate" value="${ cate }" />
				
					<c:param name="page" value="${ pi.currentPage - 1 }" />
				</c:url>
				<a href="${ before }">[이전]</a> &nbsp;
            </c:if>

			<!-- 페이지 -->
			<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				<c:if test="${ p eq currentPage }">
					<font color="red" size="4"><b>[${ p }]</b></font>
				</c:if>

				<c:if test="${ p ne currentPage }">
					<c:url var="pagination" value="mypage.do">
						<c:param name="cate" value="${ cate }" />
					
						<c:param name="page" value="${ p }" />
						<!--  blist.do?page=1과 같음  -->
					</c:url>
					<a href="${ pagination }">${ p }</a> &nbsp;
               </c:if>
			</c:forEach>

			<!-- [다음] -->
			<c:if test="${ pi.currentPage >= pi.maxPage }">[다음]</c:if>
			<c:if test="${ pi.currentPage < pi.maxPage }">
				<c:url var="after" value="mypage.do">
					<c:param name="cate" value="${ cate }" />
				
					<c:param name="page" value="${ pi.currentPage + 1 }" />
				</c:url>
				<a href="${ after }">[다음]</a>
			</c:if>
		</div>
	</c:if>
	<br>
	<br>



	<script>
      function tuterPage() {
         $("#paper2").hide();
         $("#paper3").css("display", "block");

      }

      function NotTuterPage() {

         var bool = confirm("아직 튜터가 아닙니다. 튜터 등록하시겠습니까?");
         if (bool == true) {
            location.href = "enterTutor.do";
         }
      }

      $("#insertTuter").click(function() {
         location.href = "##";
      })

      $("#content201").click(function() {
         $("#paper2").css("display", "block");
         $("#paper3").hide();
      });
   </script>




	<!-- -------footer------------------------------------------------------------------------------------------------------------- -->

	<c:import url="../common/footer.jsp" />

</body>
</html>




