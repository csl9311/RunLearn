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
	margin-bottom: 50px;
}
.content{
	width:500px;
	height: auto;
	margin-left: auto;
	margin-right: auto;
}

.content > h3{text-align: left;}

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

.sharp {border-radius:0;}

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

.mcontent{
	width:702px;
	height: auto;
	margin: 50px auto 50px auto;
	text-align: center;
	padding: 30px 100px 30px 100px;
	border: 1px solid #ffc7c7;
}

.sub-text{
	font-size: 13px;
	color: #b3b3b3;
}

#profileImg {
width:100px; height:100px;
border-radius:75px;
text-align:center;
margin:0 auto;
font-size:12px; color:#fff;
vertical-align:middle;
overflow:hidden;
background-size: contain;
background-repeat: no-repeat;
background-size:100%;
padding: auto;
}
.nickarea{
	text-align:center;
	line-height: 100px;
	color: #000;
}



</style>
</head>

<body>
<div class="wrap">
	<!-- 아이디 찾기 -->
	<div class="row justify-content-md-center">
	<h3>아이디 찾기</h3>
	<form action="pwFind.do" method="post">
		<div class="mcontent">
			<div class="find">
				<p>입력한 정보와 일치하는 아이디입니다.</p>
				<hr>
				<div id="profileImg" style="background-image: url(${contextPath}/resources/images/member/${member_img.m_changed_name});"><div class="nickarea"> ${ member.m_nickname}</div></div><h3>${ member.m_id}</h3>
				<input type="hidden" name="m_id" value="${ member.m_id}">
			</div>
		</div>
	
		<button type="button" onclick="main();" class="btn btn-primary btn-lg">메인으로</button>
		<button class="btn btn-primary btn-lg">비밀번호찾기</button>
	</form>
	</div>
</div>
<script>
	function main(){
		location.href='${contextPath}';
	}
</script>
</body>
</html>
<c:import url="../common/footer.jsp" />
