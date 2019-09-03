<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	.centerDetailBack {
		height: 500px;
		margin-top: 60px;
		background: pink;
	}
</style>
</head>
<body>
	<c:import url="../common/header.jsp"/>
	
	<div class="container centerDetailBack">
		<div class="row">
			<h3 style="background: lightblue;">${ b_category }</h3>
			<div class="col-md">
				
			</div>
			<div class="x-100"></div>
		</div>
	</div>
	
	<c:import url="../common/footer.jsp"/>
</body>
</html>