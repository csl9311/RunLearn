<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<title>만취남녀 - 아이디/비밀번호 찾기</title>
<style>
.wrap{
	text-align: center;
	padding : 100px, 0px, 100px, 0px;
}
.content{
	width:500px;
	height: auto;
	margin-left: auto;
	margin-right: auto;
}
.content > h2{
	padding-top : 180px;
}
.selectm{
	background-color: #fff;
	color: rgb(255,0,0);
	border: 1px solid red;
}
</style>
</head>
<c:import url="../common/header.jsp"/>
<body>
<div class="wrap">
	<div class="row justify-content-md-center">
	<h2>아이디 / 비밀번호 찾기</h2>
		<div class="btn-group btn-group-toggle" data-toggle="buttons">
		  <label class="btn btn-secondary active">
		    <input type="radio" name="options" id="option1" autocomplete="off" checked> Active
		  </label>
		  <label class="btn btn-secondary">
		    <input type="radio" name="options" id="option2" autocomplete="off"> Radio
		  </label>
		  <label class="btn btn-secondary">
		    <input type="radio" name="options" id="option3" autocomplete="off"> Radio
		  </label>
		</div>
	</div>
</div>
</body>
<c:import url="../common/footer.jsp" />
</html>
