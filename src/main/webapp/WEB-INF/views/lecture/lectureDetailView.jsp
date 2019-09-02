<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 상세</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
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

<style> 
.floating {
	position: fixed;
	right: 50%;
	top: 260px;
	margin-right: 480px;
	text-align: center;
	width: 200px;
	height: 600px;
	background-color: aliceblue;
	color: black;
}

#followquick {
	position: absolute;
	top: 160px;
	right: 50%;
	margin-right: 480px;
	width: 200px;
	min-height: 600px;
	background-color: aliceblue;
	color: black;
	margin-top: 100px;
}
#followquick li:hover{
	background-color: lightgray;
}
.row .col-sm-2{
	height: 30px;
	border: 1px solid black;
	background-color: silver;
	color: black;
	font-size: 12px;
	font-weight : 20px;
	
}
.row .col-sm-2:hover{
	background-color: snow;
	color:black;
}
.row .col-sm-2 a:hover{
	cursor:pointer;
}
</style>
</head>

<body>
	<c:import url="../common/header.jsp" />
	<div id="main" style="height: 40px;"></div>
	<div class="container">
		<div style="margin-left: 100px; width: 1000px; height: 1000px;">
			<h1>${ list.L_TITLE }</h1>
			<img src="${contextPath}/resources/images/lecture/${ im_list.get(0).L_CHANGED_NAME }" style="width:100%;">
			<h6>　</h6>
			<div style="width:100%">
			<div id="Cintro" style="height: 60px;"></div>
			<div class="col-sm-12">
			<div class="row" style="margin-bottom: 10px;">
			<div class="col-sm-2" style="border-bottom: 0px;" align="center" onclick="location.href='#Cintro'">강의소개</div>
			<div class="col-sm-2" align="center" onclick="location.href='#Tintro'">강사소개</div>
			<div class="col-sm-2" align="center" onclick="location.href='#curr'">커리큘럼</div>
			<div class="col-sm-2" align="center" onclick="location.href='#target'">강의목표</div>
			<div class="col-sm-2" align="center" onclick="location.href='#address'">강의실 주소</div>
			<div class="col-sm-2" align="center" onclick="location.href='#reply'">강의평</div>
			</div>
			</div>
			<div class="col-sm-12">
			<br>
			<c:if test="${ ic_list ne null }">
				<c:forEach var="i" begin="0" end="${ ic_list.size()-1 }" step="1">
					<img src="${contextPath}/resources/images/lecture/${ ic_list.get(i).L_CHANGED_NAME }" style="width:100%;">
				</c:forEach>
			</c:if>
			</div>
			<div class="col-sm-12">
			<div id="Tintro" style="height: 60px;"></div>
			<div class="row" style="margin-bottom: 10px;">
			<div class="col-sm-2" align="center" onclick="location.href='#Cintro'">강의소개</div>
			<div class="col-sm-2" style="border-bottom: 0px;" align="center" onclick="location.href='#Tintro'">강사소개</div>
			<div class="col-sm-2" align="center" onclick="location.href='#curr'">커리큘럼</div>
			<div class="col-sm-2" align="center" onclick="location.href='#target'">강의목표</div>
			<div class="col-sm-2" align="center" onclick="location.href='#address'">강의실 주소</div>
			<div class="col-sm-2" align="center" onclick="location.href='#reply'">강의평</div>
			</div>
			</div>
			<div class="col-sm-12">
			<br>
				<img src="${contextPath}/resources/images/lecture/${ list.M_CHANGED_NAME }" style="height:100px;"><br>
				<label style="font-size: 15pt; font-weight: bold;">강사명 : 미시다 김</label><br>
				
				<label style="font-size: 12pt; font-weight: bold;">연혁</label><br>
				1999년 첫 탈출 시도<br>
				2000년 두 번째 탈출 시도<br>
				2002년 집에 도착<br>
			</div>
			<div class="col-sm-12">
			<div id="curr" style="height: 60px;"></div>
			<div class="row" style="margin-bottom: 10px;">
			<div class="col-sm-2" align="center" onclick="location.href='#Cintro'">강의소개</div>
			<div class="col-sm-2" align="center" onclick="location.href='#Tintro'">강사소개</div>
			<div class="col-sm-2" style="border-bottom: 0px;" align="center" onclick="location.href='#curr'">커리큘럼</div>
			<div class="col-sm-2" align="center" onclick="location.href='#target'">강의목표</div>
			<div class="col-sm-2" align="center" onclick="location.href='#address'">강의실 주소</div>
			<div class="col-sm-2" align="center" onclick="location.href='#reply'">강의평</div>
			</div>
			</div>
			<div class="col-sm-12">
			<c:if test="${ ir_list ne null }">
				<c:forEach var="j" begin="0" end="${ ir_list.size()-1 }" step="1">
					<img src="${contextPath}/resources/images/lecture/${ ir_list.get(j).L_CHANGED_NAME }" style="width:100%;">
				</c:forEach>
			</c:if>
			</div>
			<div class="col-sm-12">
			<div id="target" style="height: 60px;"></div>
			<div class="row" style="margin-bottom: 10px;">
			<div class="col-sm-2" align="center" onclick="location.href='#Cintro'">강의소개</div>
			<div class="col-sm-2" align="center" onclick="location.href='#Tintro'">강사소개</div>
			<div class="col-sm-2" align="center" onclick="location.href='#curr'">커리큘럼</div>
			<div class="col-sm-2" style="border-bottom: 0px;" align="center" onclick="location.href='#target'">강의목표</div>
			<div class="col-sm-2" align="center" onclick="location.href='#address'">강의실 주소</div>
			<div class="col-sm-2" align="center" onclick="location.href='#reply'">강의평</div>
			</div>
			</div>
			<div class="col-sm-12">
			　<br>
				${ list.L_OBJECT }
			</div>
			<div class="col-sm-12">
			<div id="address" style="height: 60px;"></div>
			<div class="row" style="margin-bottom: 10px;">
			<div class="col-sm-2" align="center" onclick="location.href='#Cintro'">강의소개</div>
			<div class="col-sm-2" align="center" onclick="location.href='#Tintro'">강사소개</div>
			<div class="col-sm-2" align="center" onclick="location.href='#curr'">커리큘럼</div>
			<div class="col-sm-2" align="center" onclick="location.href='#target'">강의목표</div>
			<div class="col-sm-2" style="border-right: 1px solid black; border-bottom: 0px;" align="center" onclick="location.href='#address'">강의실 주소</div>
			<div class="col-sm-2" align="center" onclick="location.href='#reply'">강의평</div>
			</div>
			</div>
			<div class="col-sm-12">
				<c:if test="${ list.L_SYSTEM eq 0 }">
					<label>이 강의는 온라인 강의이므로 위치정보를 지원하지 않습니다.</label>
				</c:if>
				<c:if test="${ list.L_SYSTEM eq 1 }">
					<div id="mapC">
					<div id="map" style="width:100%;height:350px;"></div>
					
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c7cf7462e708fa6699765139ddbccfb5"></script>
					<script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					    mapOption = { 
					        center: new kakao.maps.LatLng(37.49956, 127.03390), // 지도의 중심좌표
					        level: 3 // 지도의 확대 레벨
					    };
					
					// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
					var map = new kakao.maps.Map(mapContainer, mapOption); 
					</script>
				</div>
				</c:if>
			</div>
			<div class="col-sm-12">
			<div id="reply" style="height: 40px;"></div>
			<div class="row" style="margin-bottom: 10px;">
			<div class="col-sm-2" align="center" onclick="location.href='#Cintro'">강의소개</div>
			<div class="col-sm-2" align="center" onclick="location.href='#Tintro'">강사소개</div>
			<div class="col-sm-2" align="center" onclick="location.href='#curr'">커리큘럼</div>
			<div class="col-sm-2" align="center" onclick="location.href='#target'">강의목표</div>
			<div class="col-sm-2" align="center" onclick="location.href='#address'">강의실 주소</div>
			<div class="col-sm-2" align="center" style="border-bottom: 0px;" onclick="location.href='#reply'">강의평</div>
			</div>
			</div>
		</div>
		</div>
		</div>
	<div id="followquick" class="container">
		<ul class="list-group mb-3" style="padding-top: 10px">
			<li	class="list-group-item d-flex justify-content-between lh-condensed" onclick="location.href='#main'">
				<div>
					<h5 class="my-0">강의명</h5>
					<br>
					<small class="my-0">${ list.L_TITLE }</small>
				</div>
			</li>
		</ul>
		
		<ul class="list-group mb-3">
			<li class="list-group-item">
				<div>
					<h5 class="my-0">카테고리</h5>
					<br>
					<h6 class="my-0">${ list.L_CATEGORY }</h6>
				</div>
			</li>
		</ul>
		<ul class="list-group mb-3">
			<li class="list-group-item" onclick="location.href='#Tintro'">
				
				<div>
					<h5 class="my-0">강사명 : ${ list.M_NAME }</h5>
					<br>
					<div align="center">
					<img src="${contextPath}/resources/images/lecture/${ list.M_CHANGED_NAME }" style="height:100px;">
					</div>
				</div>
				
			</li>
		</ul>
		<ul class="list-group mb-3">
			<li class="list-group-item" onclick="location.href='#target'">
				
				<div>
					<h5 class="my-0">강의 목표</h5>
					<br>
					<h6 class="my-0">${ list.L_OBJECT }</h6>
				</div>
				
			</li>
		</ul>
		<ul class="list-group mb-3">
			<li class="list-group-item">
				<div>
					<h5 class="my-0">강의 기간</h5>
					<br>
					<h6 class="my-0">2019-08-13</h6>
					<h6>~</h6>
					<h6 class="my-0">2019-08-16</h6>
				</div>
			</li>
		</ul>
		
		<div class="btn-group" style="text-align: center; margin-top: 10px; margin-bottom: 10px;">
			<div class="btn btn-primary">결제하기
			</div>
			<div class="btn btn-secondary">찜에추가
			</div>
			<c:url var="LEMainView" value="lectureEachMainView.le">
				<c:param name="l_num" value="${ list.L_NUM }"/>
				<c:param name="l_each_num" value="1"/>
			</c:url>
			<div class="btn btn-secondary" onclick="location.href='${ LEMainView }'">강의보기
			</div>
		</div>
	</div>
	<script>
		$(window).scroll(function() {
			var scrollTop = $(document).scrollTop();
			if (scrollTop < 160) {
				scrollTop = 160;
			}
			$("#followquick").stop();
			$("#followquick").animate({
				"top" : scrollTop
			});
		});
	</script>
	<!--  -->
	<c:import url="../common/footer.jsp" />
</body>
</html>