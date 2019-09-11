<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:import url="../common/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

.color-red{
	color: #dd5850;
	font-size:18px;
}

.pc{
	padding-left: 10px;
	color: #6c757d;
	font-size: 14px;
}

span.ok{color: green;}
span.error1{color: red}
span.error2{color: red}
span.error3{color: red}
span.suc{color: green;}
span.suc1{color: green;}

.sub-text{
	font-size: 13px;
	color: #b3b3b3;
}
.find{
	text-align:left;
	font-size: 21px;
}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


</head>
<body>
<div class="wrap">
	<!-- 아이디 찾기 -->
	<div class="row justify-content-md-center">
	<h3>비밀번호 찾기</h3>
	<form name="form" action="pwChange.do" method="post">
		<div class="mcontent">
			<div class="find">
				<p>비밀번호 변경.</p>
				<hr>
				<p class="sub-text">변경할 비밀번호를 입력해주세요</p>
				<div class="form-group">
					<input type="password" class="form-control" id="m_pw1" name="m_pw" placeholder="비밀번호">
					<input type="hidden" name="m_id" value="${ member.m_id }">
					<span id="pwp" class="fontA"></span>
					<span class="pc">6자리 영문자와 숫자, 특수문자가 1회이상 사용하여야합니다.</span>
					<span class="pc error1">6자리 이상의 비밀번호를 입력해주세요.</span>
					<span class="pc error2">영문과 숫자, 특수문자가 각 1회 이상 사용되어야합니다.</span>
					<span class="pc suc">사용 가능합니다.</span>
				</div>
				<div class="form-group">
					<input type="password" class="form-control" id="m_pwc" name="pwCheck"  placeholder="비밀번호 확인">
					<input type="hidden" id="check2" value="0"> 
					<span id="pwcp" class="fontA"></span>
					<span class="pc error3">비밀번호를 확인해주세요!</span>
					<span class="pc suc1">일치합니다.</span>
				</div>
			</div>
		</div>
		<button onclick="change();" class="btn btn-primary btn-lg">변경하기</button>
	</form>
	</div>
</div>
<script>
	$(".pc.error1").hide();
	$(".pc.error2").hide();
	$(".pc.error3").hide();
	$(".pc.suc").hide();
	$(".pc.suc1").hide();
	
	var regPw = /^.*(?=^.{6,}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	
	var pwUsable = false;
	var pwUsable1 = false;
	
	
	$("#m_pw1").on("keyup", function() {
		var pw = $(this).val();
		var pwc = $("#m_pwc").val();
	    if (pw.length < 6) {
	      	$(".pc").hide();
		    $(".pc.error1").show();
		    pwUsable = false;
	    } else if (!regPw.test(pw)) {
	    	$(".pc").hide();
			$(".pc.error2").show();
		    pwUsable = false;
	    } else {
	    	$(".pc").hide();
			$(".pc.suc").show();
			pwUsable = true;
		}
	    if(pwc.length != 0 && pw != pwc){
	    	pwUsable1 = false;
	    }
	    if(pwUsable == true && pwUsable1 == true){
	    	$("#check2").val(1);
	    	alert("ㅇㅇ");
		} else {
			$("#check2").val(0);
		}
	});
	$("#m_pwc").blur(function(){
		var pwc= $(this).val();
		var pw = $("#m_pw1").val();
		if(pw != pwc){
		    $(".pc.error3").show();
		    return;
		} else if(pwUsable == false) {
			$(".pc.error3").show();
			return;
		} else {
			$(".pc").hide();
			$(".pc.suc1").show();
			pwUsable1 = true;
			console.log(pwUsable1)
		}
		if(pwUsable == true && pwUsable1 == true){
			$("#check2").val(1);
		} else {
			$("#check2").val(0);
		}
	});
	function change(){
		Form = document.form;
		if($("#check2").val() == 0) {
			alert("비밀번호를 확인해주세요.");
			$("#m_pw1").focus();
			return false;
		} else {
			$(Form).submit();
		}
	}
</script>
</body>
</html>
<c:import url="../common/footer.jsp" />