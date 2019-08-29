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
}
</style>
</head>

<body>
	<c:import url="common/header.jsp"/>
	<div id="main" style="height: 40px;"></div>
	<div class="container">
		<div style="margin-left: 100px; width: 1000px; height: 1000px;">
			<h1>집으로 도망치는 빠르고 쉬운 방법</h1>
			<img src="${contextPath}/resources/images/lecture/run.png" style="width:100%;">
			<h6>　</h6>
			<div style="width:100%">
			<div id="Cintro" style="height: 60px;"></div>
			<div class="row" style="margin-bottom: 10px;">
			<div class="col-sm-2" style="border-bottom: 0px;" align="center"><a href="#Cintro">강의소개</a></div>
			<div class="col-sm-2" align="center"><a href="#Tintro">강사소개</a></div>
			<div class="col-sm-2" align="center"><a href="#curr">커리큘럼</a></div>
			<div class="col-sm-2" align="center"><a href="#target">강의목표</a></div>
			<div class="col-sm-2" align="center"><a href="#address">강의실 주소</a></div>
			<div class="col-sm-2" align="center"><a href="">강의평</a></div>
			</div>
			<div class="col-sm-12">
			　<br>
				<img src="${contextPath}/resources/images/lecture/runC.jpg" style="width:100%;">
			</div>
			<div class="col-sm-12">
			<div id="Tintro" style="height: 60px;"></div>
			<div class="row" style="margin-bottom: 10px;">
			<div class="col-sm-2" align="center"><a href="#Cintro">강의소개</a></div>
			<div class="col-sm-2" style="border-bottom: 0px;" align="center"><a href="#Tintro">강사소개</a></div>
			<div class="col-sm-2" align="center"><a href="#curr">커리큘럼</a></div>
			<div class="col-sm-2" align="center"><a href="#target">강의목표</a></div>
			<div class="col-sm-2" align="center"><a href="#address">강의실 주소</a></div>
			<div class="col-sm-2" align="center"><a href="#reply">강의평</a></div>
			</div>
			</div>
			<div class="col-sm-12">
			　<br>
				<img src="${contextPath}/resources/images/lecture/user.png" style="height:100px;"><br>
				<label style="font-size: 15pt; font-weight: bold;">강사명 : 미시다 김</label><br>
				
				<label style="font-size: 12pt; font-weight: bold;">연혁</label><br>
				1999년 첫 탈출 시도<br>
				2000년 두 번째 탈출 시도<br>
				2002년 집에 도착<br>
			</div>
			<div class="col-sm-12">
			<div id="curr" style="height: 60px;"></div>
			<div class="row" style="margin-bottom: 10px;">
			<div class="col-sm-2" align="center"><a href="#Cintro">강의소개</a></div>
			<div class="col-sm-2" align="center"><a href="#Tintro">강사소개</a></div>
			<div class="col-sm-2" style="border-bottom: 0px;" align="center"><a href="#curr">커리큘럼</a></div>
			<div class="col-sm-2" align="center"><a href="#target">강의목표</a></div>
			<div class="col-sm-2" align="center"><a href="#address">강의실 주소</a></div>
			<div class="col-sm-2" align="center"><a href="#reply">강의평</a></div>
			</div>
			</div>
			<div class="col-sm-12">
				<table class="table table-bordered table-hover">
					<tr>
						<th style="width:15%;">강의 회차</th>
						<th style="width:65%;">강좌 명</th>
						<th style="width:20%;">강좌 일</th>
					</tr>
					<tr>
						<td style="width:10%;">1</td>
						<td style="width:65%;">집으로의 복귀. 교통수단은 다양하다</td>
						<td style="width:20%;">2019-08-12</td>
					</tr>
				</table>
			</div>
			<div class="col-sm-12">
			<div id="target" style="height: 60px;"></div>
			<div class="row" style="margin-bottom: 10px;">
			<div class="col-sm-2" align="center"><a href="#Cintro">강의소개</a></div>
			<div class="col-sm-2" align="center"><a href="#Tintro">강사소개</a></div>
			<div class="col-sm-2" align="center"><a href="#curr">커리큘럼</a></div>
			<div class="col-sm-2" style="border-bottom: 0px;" align="center"><a href="#target">강의목표</a></div>
			<div class="col-sm-2" align="center"><a href="#address">강의실 주소</a></div>
			<div class="col-sm-2" align="center"><a href="#reply">강의평</a></div>
			</div>
			</div>
			<div class="col-sm-12">
			　<br>
				집으로 빠른 복귀를 하기 위한 강의입니다. 집돌이 집순이들의 필수요소라고 할수 있습니다.
			</div>
			<div class="col-sm-12">
			<div id="address" style="height: 60px;"></div>
			<div class="row" style="margin-bottom: 10px;">
			<div class="col-sm-2" align="center"><a href="#Cintro">강의소개</a></div>
			<div class="col-sm-2" align="center"><a href="#Tintro">강사소개</a></div>
			<div class="col-sm-2" align="center"><a href="#curr">커리큘럼</a></div>
			<div class="col-sm-2" align="center"><a href="#target">강의목표</a></div>
			<div class="col-sm-2" style="border-right: 1px solid black; border-bottom: 0px;" align="center"><a href="#address">강의실 주소</a></div>
			<div class="col-sm-2" align="center"><a href="#reply">강의평</a></div>
			</div>
			</div>
			<div class="col-sm-12">
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
			</div>
			<div class="col-sm-12">
			<div id="reply" style="height: 40px;"></div>
			<div class="row" style="margin-bottom: 10px;">
			<div class="col-sm-2" align="center"><a href="#Cintro">강의소개</a></div>
			<div class="col-sm-2" align="center"><a href="#Tintro">강사소개</a></div>
			<div class="col-sm-2" align="center"><a href="#curr">커리큘럼</a></div>
			<div class="col-sm-2" align="center"><a href="#target">강의목표</a></div>
			<div class="col-sm-2" align="center"><a href="#address">강의실 주소</a></div>
			<div class="col-sm-2" align="center" style="border-bottom: 0px;"><a href="#reply">강의평</a></div>
			</div>
			</div>
		</div>
		</div>
		</div>


	<div id="followquick" class="container">
		<ul class="list-group mb-3" style="padding-top: 10px">
			<li
				class="list-group-item d-flex justify-content-between lh-condensed">
				
				<div>
				
					<h5 class="my-0"><a href="#main">강의명</a></h5>
				
					<br>
					<small class="my-0">집으로 도망치는 빠르고 쉬운 방법</small>
				
				</div>
				
			</li>
		</ul>
		
		<ul class="list-group mb-3">
			<li class="list-group-item">
				<div>
					<h5 class="my-0">카테고리</h5>
					<br>
					<h6 class="my-0">#생활기술</h6>
				</div>
			</li>
		</ul>
		<ul class="list-group mb-3">
			<li class="list-group-item">
				
				<div>
					<h5 class="my-0"><a href="#Tintro">강사명 : 미시다김</a></h5>
					<br>
					<div align="center">
					<img src="${contextPath}/resources/images/lecture/user.png" style="height:100px;">
					</div>
				</div>
				
			</li>
		</ul>
		<ul class="list-group mb-3">
			<li class="list-group-item">
				
				<div>
					<h5 class="my-0"><a href="#target">강의 목표</a></h5>
					<br>
					<h6 class="my-0">집으로 돌아가는 최단거리를 계산하는 방법을 연구 실행</h6>
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
	<c:import url="common/footer.jsp"/>
</body>
</html>