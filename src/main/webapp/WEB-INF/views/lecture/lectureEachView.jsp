<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<c:import url="../common/header.jsp" />
	<div class="container">
		<h1>${ etc.L_TITLE }</h1>
		<h6>　</h6>
		<h2>${ l_each.l_each_name }</h2>
		<h4>　</h4>
		<h2>강의 설명</h2>
		<h6></h6>
		<div style="width: 100%;">
			${ l_each.l_each_content }
		</div>
		
		<c:if test="${ !list.isEmpty() }">
		<h2>강의 목록</h2>
		<table class="table table-hover">
			<tr>
				<th style="width: 15%;">강의 회차</th>
				<th style="width: 75%;">강좌 명</th>
				<th style="width: 10%;">강의듣기</th>
			</tr>
			<c:forEach var="i" begin="0" end="${ list.size()-1 }" step="1">
			<c:url var="mediaView" value="lectureMediaView.le">
				<c:param name="l_each_num" value="${ l_each.l_each_num }"/>
			</c:url>
			<tr>
				<td>${ i+1 }</td>
				<td>${ list.get(i).L_EACH_NAME }</td>
				<td><button class="btn btn-sm btn-primary" onclick="location.href='${ mediaView }'">듣기</button></td>
			</tr>
			</c:forEach>
		</table>
		</c:if>
		
	</div>

	<c:import url="../common/footer.jsp" />


</body>
</html>