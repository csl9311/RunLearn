<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	cursor:pointer;
	background-color: lightgray;
}
.row .col-sm-2{
	height: 30px;
	border: 1px solid black;
	background-color: silver;
	color: black;
	
}
.row .col-sm-2:hover{
	background-color: snow;
	color:black;
	cursor:pointer;
	
}
</style>
</head>

<body>
	<%@ include file="/views/common/header.jsp"%>
	<div class="container" id="main">
		<div
			style="margin-left: 100px; width: 1000px; height: 1000px;">
			<h1>집으로 도망치는 빠르고 쉬운 방법</h1>
			<img src="<%= request.getContextPath()%>/images/class/run.png" style="width:100%;">
			<h6>　</h6>
			<div style="width:100%">
			<div class="row" id="Cintro">
			<div class="col-sm-2" style="border-bottom: 0px;"><a href="#Cintro">강의소개</a></div>
			<div class="col-sm-2"><a href="#Tintro">강사소개</a></div>
			<div class="col-sm-2"><a href="#curr">커리큘럼</a></div>
			<div class="col-sm-2"><a href="#target">강의목표</a></div>
			<div class="col-sm-2"><a href="#address">강의실 주소</a></div>
			<div class="col-sm-2"><a href="">강의평</a></div>
			</div>
			<div class="col-sm-12">
			　<br>
				<img src="<%= request.getContextPath()%>/images/class/runC.jpg" style="width:100%;">
			</div>
			　
			<div class="row" id="Tintro">
			<div class="col-sm-2"><a href="#Cintro">강의소개</a></div>
			<div class="col-sm-2" style="border-bottom: 0px;"><a href="#Tintro">강사소개</a></div>
			<div class="col-sm-2"><a href="#curr">커리큘럼</a></div>
			<div class="col-sm-2"><a href="#target">강의목표</a></div>
			<div class="col-sm-2"><a href="#address">강의실 주소</a></div>
			<div class="col-sm-2"><a href="#reply">강의평</a></div>
			</div>
			<div class="col-sm-12">
			　<br>
				<img src="<%= request.getContextPath()%>/images/class/user.png" style="height:100px;">
				강사명 : 미시다 김<br>
				
				연혁<br>
				1999년 첫 탈출 시도<br>
				2000년 두 번째 탈출 시도<br>
				2002년 집에 도착<br>
			</div>
			　
			<div class="row" id="curr">
			<div class="col-sm-2"><a href="#Cintro">강의소개</a></div>
			<div class="col-sm-2"><a href="#Tintro">강사소개</a></div>
			<div class="col-sm-2" style="border-bottom: 0px;"><a href="#curr">커리큘럼</a></div>
			<div class="col-sm-2"><a href="#target">강의목표</a></div>
			<div class="col-sm-2"><a href="#address">강의실 주소</a></div>
			<div class="col-sm-2"><a href="#reply">강의평</a></div>
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
			　
			<div class="row" id="target">
			<div class="col-sm-2"><a href="#Cintro">강의소개</a></div>
			<div class="col-sm-2"><a href="#Tintro">강사소개</a></div>
			<div class="col-sm-2"><a href="#curr">커리큘럼</a></div>
			<div class="col-sm-2" style="border-bottom: 0px;"><a href="#target">강의목표</a></div>
			<div class="col-sm-2"><a href="#address">강의실 주소</a></div>
			<div class="col-sm-2"><a href="#reply">강의평</a></div>
			</div>
			<div class="col-sm-12">
			　<br>
				집으로 빠른 복귀를 하기 위한 강의입니다. 집돌이 집순이들의 필수요소라고 할수 있습니다.
			
			</div>
			　
			<div class="row" id="address">
			<div class="col-sm-2"><a href="#Cintro">강의소개</a></div>
			<div class="col-sm-2"><a href="#Tintro">강사소개</a></div>
			<div class="col-sm-2"><a href="#curr">커리큘럼</a></div>
			<div class="col-sm-2"><a href="#target">강의목표</a></div>
			<div class="col-sm-2" style="border-right: 1px solid black; border-bottom: 0px;"><a href="#address">강의실 주소</a></div>
			<div class="col-sm-2"><a href="#reply">강의평</a></div>
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
			　
			<div class="row" id="reply">
			<div class="col-sm-2"><a href="#Cintro">강의소개</a></div>
			<div class="col-sm-2"><a href="#Tintro">강사소개</a></div>
			<div class="col-sm-2"><a href="#curr">커리큘럼</a></div>
			<div class="col-sm-2"><a href="#target">강의목표</a></div>
			<div class="col-sm-2"><a href="#address">강의실 주소</a></div>
			<div class="col-sm-2" style="border-bottom: 0px;"><a href="#reply">강의평</a></div>
			</div>
			<div class="col-sm-12">
			　
			<table class="table table-striped table-hover table-bordered">
				<tr>
				<th width="10%">댓글번호</th>
				<th width="60%">댓글 내용</th>
				<th width="15%">댓글 작성자</th>
				<th width="15%">댓글 입력일</th>
				</tr>
				<tr>
				<td>1</td>
				<td>집가는 시간이 많이 줄어들었습니다.</td>
				<td>mr.k</td>
				<td>2019-08-13</td>
				</tr>
				<tr>
				<td>2</td>
				<td>더 빨리 집에 가고싶어요</td>
				<td>ms.l</td>
				<td>2019-08-13</td>
				</tr>
				<tr>
				<td>3</td>
				<td>연구하다 더 피곤해졌어요</td>
				<td>Zip.zip</td>
				<td>2019-08-13</td>
				</tr>
				
			</table>
			</div>
			</div>
			</div>
		</div>
	</div>


	<div id="followquick" class="container">
		<ul class="list-group mb-3" style="padding-top: 10px">
			<li
				class="list-group-item d-flex justify-content-between lh-condensed">
				<a href="#main">
				<div>
				
					<h5 class="my-0">강의명</h5>
				
					<br>
					<small class="my-0">집으로 도망치는 빠르고 쉬운 방법</small>
				
				</div>
				</a>
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
				<a href="#Tintro">
				<div>
					<h5 class="my-0">강사명 : 미시다김</h5>
					<br>
					<div align="center">
					<img src="<%= request.getContextPath()%>/images/class/user.png" style="height:100px;">
					</div>
				</div>
				</a>
			</li>
		</ul>
		<ul class="list-group mb-3">
			<li class="list-group-item">
				<a href="#target">
				<div>
					<h5 class="my-0">강의 목표</h5>
					<br>
					<h6 class="my-0">집으로 돌아가는 최단거리를 계산하는 방법을 연구 실행</h6>
				</div>
				</a>
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
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>