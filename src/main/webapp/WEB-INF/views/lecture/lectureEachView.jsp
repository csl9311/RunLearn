<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의실 :</title>
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
</head>
<body>
	<%@ include file="/views/common/header.jsp"%>
	<div class="container">
		<h1>제 1회 : 집으로의 복귀 교통수단은 다양하다.</h1>
		<h6></h6>
		<div class="col-md-12">
			<div
				class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
				<div class="col-auto d-none d-lg-block">
					<img class="bd-placeholder-img" width="640" height="420"
						src='<%=request.getContextPath()%>/images/class/run.png'>
				</div>
				<div class="col p-4 d-flex flex-column position-static">
					<strong class="text-primary">제 1회</strong>
					<h3 class="mb-0">집으로의 복귀. 교통수단은 다양하다</h3>
					<br>
					<p class="card-text mb-auto">집으로 가는방법은 다양하다 무슨 방법들이 있을까? 꼭 자기차를
						탄다고 빠른것일까?</p>
					<button type="button" class="btn btn-primary">수업듣기</button>
				</div>
			</div>
		</div>
		<h6>　</h6>
		<h2>강의 설명</h2>
		<h6></h6>
		<div style="width: 100%;">
			강의설명이 들어갈 공간입니다<br>
			집으로 가는 방법에 대한 1회차 설명이 있을거구요<br>
			오리엔테이션이 들어갈거에요<br>
			그러해요.<br>
		</div>
		<h1></h1>
		<h2>강의 목록</h2>
		<h6></h6>
		<table class="table table-hover">
			<tr>
				<th style="width: 15%;">강의 회차</th>
				<th style="width: 60%;">강좌 명</th>
				<th style="width: 15%;">강좌 일</th>
				<th style="width: 10%;">강의듣기</th>
			</tr>
			<tr>
				<td>1</td>
				<td>집으로의 복귀. 교통수단은 다양하다</td>
				<td>2019-08-12</td>
				<td><button class="btn btn-sm btn-primary">듣기</button></td>
			</tr>
		</table>
	</div>

	<%@ include file="/views/common/footer.jsp"%>


</body>
</html>