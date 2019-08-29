<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<style>
.fontA{
	color:#c20000;
	font-size:13px;
}
.wrap {
	padding: 100px 0px 100px 0px;
	
}
.wrap .row .dd{
	width: 500px;
	margin: auto;
}
.title-f{
	font-size:16px;
}
.color-red{
	color: #dd5850;
	font-size:18px;
}
.btn .btn-check{
	
}
.btn-group  {
	width: 5px;
	hieght: 5px;
	
}
.btn span.glyphicon {    			
	opacity: 0;				
}
.btn.active span.glyphicon {				
	opacity: 1;				
}

</style>
<meta charset="UTF-8">

<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
</head>
<body>
<%-- <jsp:include page="../common/header.jsp" /> --%>
<div class="wrap">
	<div class="py-5 text-center">사진
		<h4 class="header">회원가입</h4>
	</div>

	<div class="row justify-content-md-center">
		<div class="dd col-md-auto mx-auto">
			<hr>
			<form action="" method="post">
				<div class="form-group">
					<p class="title-f"><em class="color-red">* </em>아이디</p>
					<input type="text" class="form-control" name="userId" placeholder="아이디">
					<span id="idp"class="fontA"></span>
				</div>
				<div class="form-group">
					<p class="title-f"><em class="color-red">* </em>비밀번호</p>
					<input type="password" class="form-control" name="userPwd" placeholder="비밀번호">
					<span id="pwp" class="fontA"></span>
				</div>
				<div class="form-group">
					<input type="password" class="form-control" name="userPwdCheck"  placeholder="비밀번호 확인">
					<span id="pwcp" class="fontA"></span>
				</div>
				<div class="form-group">
					<p class="title-f"><em class="color-red">* </em>이름</p>
					<input type="text" class="form-control" name="userName" placeholder="이름"> 
					<span id="np" class="fontA"></span>
				</div>
				<p class="title-f"><em class="color-red">* </em>전화번호</p>
				<div class="input-group mb-2">
					<input type="text" class="form-control" name="userPhone" placeholder="010-1234-5678" aria-describedby="button-addon2">
						<div class="input-group-append">
		   		 			<button class="btn btn-outline-secondary" type="button" id="button-addon2">Button</button>
		  				</div>
					<span id="pp" class="fontA"></span>
				</div>
			
			<hr>
			<div class="btn-group" data-toggle="buttons">
				<label class="btn btn-success">
					<input type="checkbox" autocomplete="off">
					<span class="glyphicon glyphicon-ok"></span>
				</label>
			</div>
			이용약관 필수 동의
			<br>
			<br>
			<div class="btn-group" data-toggle="buttons">
				<label class="btn btn-success">
					<input type="checkbox" autocomplete="off">
					<span class="glyphicon glyphicon-ok"></span>
				</label>
			</div>
			개인정보 취급방침 필수 동의
			<hr>
			<button type="button" onclick="submit();">가입하기</button>
			<button type="button" onclick="reset();">취소하기</button>
			</form>
		</div>
	</div>
</div>
<%-- <jsp:include page="../common/footer.jsp" /> --%>
</body>
</html>