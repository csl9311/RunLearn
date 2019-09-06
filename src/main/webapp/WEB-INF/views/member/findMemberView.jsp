<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:import url="../common/header.jsp"/>
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
	padding-top: 50px;
}
.content{
	width:500px;
	height: auto;
	margin-left: auto;
	margin-right: auto;
}

.content > h3{
	text-align: left;
}

.selectm{
	background-color: #fff;
	color: rgb(255,0,0);
	border: 1px solid red;
}
.btn {
  display: inline-block;
  padding: 6px 12px;
  margin-bottom: 0;
  font-size: 14px;
  font-weight: normal;
  line-height: 1.42857143;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  cursor: pointer;
  -webkit-user-select: none;
     -moz-user-select: none;
      -ms-user-select: none;
          user-select: none;
  background-image: none;
  border: 1px solid transparent;
  border-radius: 4px;
  padding: 10px 16px;
}
  
.btn-lg {
  font-size: 18px;
  line-height: 1.33;
  border-radius: 6px;
}

.btn-primary {
  color: #fff;
  background-color: #428bca;
  border-color: #357ebd;
}
.btn-outline-primary {
  color: #357ebd;
  background-color: #fff;
  border-color: #428bca;
}

.btn-primary:hover,
.btn-primary:focus,
.btn-primary:active,
.btn-primary.active,
.open .dropdown-toggle.btn-primary {
  color: #fff;
  background-color: #3276b1;
  border-color: #285e8e;
}

.btn-outline-primary:hover,
.btn-outline-primary:focus,
.btn-outline-primary:active,
.btn-outline-primary.active,
.open .dropdown-toggle.btn-outline-primary {
  color: #fff;
  background-color: #3276b1;
  border-color: #285e8e;
}

.sharp {
  border-radius:0;
}

.btn {
    padding: 14px 24px;
    border: 0 none;
    font-weight: 700;
    letter-spacing: 1px;
    text-transform: uppercase;
}
.btn:focus, .btn:active:focus, .btn.active:focus {
    outline: 0 none;
}

.btn-primary {
    background: #0099cc;
    color: #ffffff;
}
.btn-primary:hover, .btn-primary:focus, .btn-primary:active, .btn-primary.active, .open > .dropdown-toggle.btn-primary {
    background: #33a6cc;
}
.btn-primary:active, .btn-primary.active {
    background: #007299;
    box-shadow: none;
}

.radiob{
	cursor: pointer;
	font-size: 16.5px;
}

.mcontent{
	width:600px;
	height: auto;
	margin: 50px auto 100px auto;
	text-align: center;
	padding: 30px 100px 30px 100px;
	border: 1px solid #ffc7c7;
}

.find{
	text-align: left;
}
.sub-text{
	font-size: 13px;
	color: #b3b3b3;
	
}

.index{
	margin-left: 20px;
}

.col1{
	width: 200px;
	display: inline;
	float: left;
	padding-right: 100px;
	margin-top: 5px;
}
.col2{
	padding: 0;
}
.space{
	height: 10px;
}
.text-field{width: 170px;}
</style>
</head>

<body>
<div class="wrap">

	
	<div class="row justify-content-md-center">
	<h3>아이디 / 비밀번호 찾기</h3>
		<div class="btn-group btn-group-toggle" data-toggle="buttons">
			<label class="btn btn-danger btn-lg active" id="idf">
				<input type="radio" name="jb-radio" id="jb-radio-1"> 아이디 찾기
			</label>
			<label class="btn btn-danger btn-lg" id="pwf">
				<input type="radio" name="jb-radio" id="jb-radio-2"> 비밀번호 찾기
			</label>
		</div>
		<div class="mcontent">
			<div class="find">
				<label class="radiob"><input type="radio" name="search">휴대폰 인증으로 찾기</label>
				<div class="index">
					<p class="sub-text">회원 가입에 사용한 휴대폰 번호와 일치해야 합니다.</p>
					<div class="col1">이름</div><div class="col2"><input type="text" class="text-field"></div>
					<div class="space"></div>
					<div class="col1">휴대폰 번호</div><div class="col2"><input type="text" class="text-field"></div>
					<div class="space"></div>
					<div class="col1"></div><div class="col2"><input type="text" class="text-field" placeholder="인증번호 4자리 숫자 입력"></div>
				</div>
			</div>
			<hr>
			<div class="find">
				<label class="radiob"><input type="radio" name="search">이메일 인증으로 찾기</label>
				<div class="index">
					<p class="sub-text">회원 가입에 사용한 이메일 주소와 일치해야 합니다.</p>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
<c:import url="../common/footer.jsp" />
