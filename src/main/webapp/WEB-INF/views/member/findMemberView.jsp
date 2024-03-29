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

.imageArea{margin-bottom: 50px;}

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

.radiob{
	cursor: pointer;
	font-size: 16.5px;
}

.mcontent{
	width:702px;
	height: auto;
	margin: 50px auto 50px auto;
	text-align: center;
	padding: 30px 100px 30px 100px;
	border: 1px solid #ffc7c7;
}

.find{text-align: left;}
.sub-text{
	font-size: 13px;
	color: #b3b3b3;
}
.index{margin-left: 20px;}

.col1{
	width: 200px;
	display: inline;
	float: left;
	padding-right: 100px;
	margin-top: 5px;
}
.col2{padding: 0;}
.space{height: 10px;}
.text-field{width: 170px;}
.sub-btn{
	margin-left: 10px;
	padding: 4px 10px;
    font-size: 12px;
    border-radius: 3px;
    background-color:#ff005a;
}
::placeholder {
	font-size: 11px;
	text-align:left;
}
.btn-r{
	background-color:#ff005a;
}

.error{background-color: #f5a2a2;}

</style>
</head>

<body>
<div class="wrap">
	<!-- 아이디 찾기 -->
	<div class="row justify-content-md-center">
	<div class="imageArea justify-context-md-cneter"><img src="${contextPath}/resources/images/common/logo_2.png"></div>
		<div class="btn-group btn-group-toggle" data-toggle="buttons">
			<label class="btn-r btn btn-danger btn-lg active" id="idfb"onclick="ich();">
				<input type="radio" name="jb-radio" id="jb-radio-1"> 아이디 찾기
			</label>
			<label class="btn btn-danger btn-lg" id="pwfb" onclick="pch();">
				<input type="radio" name="jb-radio" id="jb-radio-2"> 비밀번호 찾기
			</label>
		</div>
		<div id="idf">
		<div class="mcontent">
			<div class="find">
				<label class="radiob"><input type="radio" name="search" id="pp" checked>휴대폰 인증으로 찾기</label>
				<form name="form1" id="form1" method="post" action="findmemberid.do">
					<div class="index" id="ipf">
						<p class="sub-text">회원 가입에 사용한 휴대폰 번호와 일치해야 합니다.</p>
						<div class="col1">이름</div><div class="col2"><input type="text" name="m_name" class="text-field"><input type="hidden" name="typecheck" value="00"></div>
						<div class="space"></div>
						<div class="col1">휴대폰 번호</div><div class="col2"><input type="text" name="m_phone" onkeyup="inputPhoneNumber(this);" maxlength="13" class="text-field"><span><button type="button" onclick="checkphone(this);" class="sub-btn btn btn-danger">인증번호전송</button></span></div>
						<div class="space"></div>
						<div class="col1"></div><div class="col2"><input type="text" name="pcheckNum" class="text-field" placeholder=" 인증번호 4자리 숫자 입력"></div>
					</div>
				</form>
			</div>
			<hr>
			<div class="find">
				<label class="radiob"><input type="radio" name="search" id="ep">이메일 인증으로 찾기</label>
				<form name="form2" id="form2" method="post" action="findmemberid.do">
					<div class="index" id="ief">
						<p class="sub-text">회원 가입에 사용한 이메일 주소와 일치해야 합니다.</p>
						<div class="col1">이름</div><div class="col2"><input type="text" name="m_name" class="text-field"><input type="hidden" name="typecheck" value="01"></div>
						<div class="space"></div>
						<div class="col1">이메일</div><div class="col2"><input type="text" name="m_email" class="text-field"><span><button type="button" onclick="checkphone(this);" class="sub-btn btn btn-danger">인증번호전송</button></span></div>
						<div class="space"></div>
						<div class="col1"></div><div class="col2"><input type="text" name="pcheckNum" class="text-field" placeholder=" 인증번호 4자리 숫자 입력"></div>
					</div>
				</form>
			</div>
		</div>
		<button onclick="submit1();" class="btn btn-primary btn-lg">다음</button>
		</div>
		<!-- 비밀번호 찾기 -->
		<div id="pwf">
		<div class="mcontent">
			<div class="find">
				<label class="radiob"><input type="radio" name="search2" id="pp2" checked>휴대폰 인증으로 찾기</label>
				<form name="form3" id="form3" method="post" action="pwFind.do">
					<div class="index" id="ppf">
						<p class="sub-text">회원 가입에 사용한 휴대폰 번호와 일치해야 합니다.</p>
						<div class="col1">아이디</div><div class="col2"><input type="text" name="m_id" class="text-field"><input type="hidden" name="typecheck" value="1"></div>
						<div class="space"></div>
						<div class="col1">이름</div><div class="col2"><input type="text" name="m_name" class="text-field"></div>
						<div class="space"></div>
						<div class="col1">휴대폰 번호</div><div class="col2"><input type="text" name="m_phone" onkeyup="inputPhoneNumber(this);" maxlength="13" class="text-field"><span><button type="button" onclick="checkphone(this);" class="sub-btn btn btn-danger">인증번호전송</button></span></div>
						<div class="space"></div>
						<div class="col1"></div><div class="col2"><input type="text" name="pcheckNum" class="text-field" placeholder=" 인증번호 4자리 숫자 입력"></div>
					</div>
				</form>
			</div>
			<hr>
			<div class="find">
				<label class="radiob"><input type="radio" name="search2" id="ep2">이메일 인증으로 찾기</label>
				<form name="form4" id="form4" method="post" action="pwFind.do">
					<div class="index" id="pef">
						<p class="sub-text">회원 가입에 사용한 이메일 주소와 일치해야 합니다.</p>
						<div class="col1">아이디</div><div class="col2"><input type="text" name="m_id" class="text-field"><input type="hidden" name="typecheck" value="02"></div>
						<div class="space"></div>
						<div class="col1">이름</div><div class="col2"><input type="text" name="m_name" class="text-field"></div>
						<div class="space"></div>
						<div class="col1">이메일</div><div class="col2"><input type="text" name="m_email" class="text-field"><span><button type="button" onclick="checkphone(this);" class="sub-btn btn btn-danger">인증번호전송</button></span></div>
						<div class="space"></div>
						<div class="col1"></div><div class="col2"><input type="text" name="pcheckNum" class="text-field" placeholder=" 인증번호 4자리 숫자 입력"></div>
					</div>
				</form>
			</div>
		</div>
		<button onclick="submit2();" class="btn btn-primary btn-lg">다음</button>
		</div>
	</div>
</div>
<script>
	var op = true;
	
	var ido = true;
	var pwo = false;
	
	$("#pwf").hide();
	$("#ief").hide();
	$("#pef").hide();
	
	/* 화면 표시 */
	function ich(){
		$("#pwf").hide();
		$("#idf").show();
		ido = true;
		pwo = false;
		op = true;
	}
	function pch(){
		$("#pwf").show();
		$("#idf").hide();
		ido = false;
		pwo = true;
		op = false;
	}
	/* 인증 방법 선택 스크립트 */
	/* 아이디 찾기  */
	$("input:radio[name=search]").click(function(){
		if($("#pp").is(":checked") == false){
			$("#ipf").hide();
			$("#ief").show();
		} else {
			$("#ipf").show();
			$("#ief").hide();
		}
	});
	
	/* 패스워드 찾기 */
	$("input:radio[name=search2]").click(function(){
		if($("#pp2").is(":checked") == false){
			$("#ppf").hide();
			$("#pef").show();
		} else {
			$("#ppf").show();
			$("#pef").hide();
		}
	});
	
	/* 전화번호 양식 스크립트 */
	function inputPhoneNumber(obj) {		
	    var number = obj.value.replace(/[^0-9]/g, "");
	    var phone = "";
	    
	    if(number.length < 4) {
	        return number;
	    } else if(number.length < 7) {
	        phone += number.substr(0, 3);
	        phone += "-";
	        phone += number.substr(3);
	    } else if(number.length < 11) {
	        phone += number.substr(0, 3);
	        phone += "-";
	        phone += number.substr(3, 3);
	        phone += "-";
	        phone += number.substr(6);
	    } else {
	        phone += number.substr(0, 3);
	        phone += "-";
	        phone += number.substr(3, 4);
	        phone += "-";
	        phone += number.substr(7);
	    }
	    obj.value = phone;
	}
	
	/* 인증 스크립트 */
	function checkphone(e){
		var m_name = $(e).closest(".index").children('.col2').children('input:text[name=m_name]').val();
		var m_id = $(e).closest(".index").children('.col2').children('input:text[name=m_id]').val();
		var m_email = $(e).closest(".index").children('.col2').children('input:text[name=m_email]').val();
		var m_phone = $(e).closest(".index").children('.col2').children('input:text[name=m_phone]').val();
		var typecheck = $(e).closest(".index").children('.col2').children('input:hidden[name=typecheck]').val();
		console.log($(e).closest(".index").children('.col2').children('input:text[name=m_email]').val());
		if(ido == false){
			$.ajax({
				url: "checkPhone.do",
				data: {m_phone: m_phone,
					   m_name: m_name,
					   m_id: m_id,
					   m_email: m_email,
					   typecheck: typecheck},
				success: function(data){
					if(data.isUsable == false){
						alert("인증번호가 전송되었습니다.");
					} else {
						alert("없는 회원입니다.");
					}
				}, error: function(jqxhr, textStatus, errorThrown){
					console.log("ajax 처리 실패");
					console.log(jqxhr);
					console.log(textStatus);
					console.log(errorThrown);
				}
			});
		} else {
			$.ajax({
				url: "checkPhone.do",
				data: {m_phone: m_phone,
					   m_name: m_name,
					   m_email: m_email,
					   typecheck: typecheck},
				success: function(data){
					if(data.isUsable == false){
						alert("인증번호가 전송되었습니다.");
					} else {
						alert("없는 회원입니다.");
					}
				}, error: function(jqxhr, textStatus, errorThrown){
					console.log("ajax 처리 실패");
					console.log(jqxhr);
					console.log(textStatus);
					console.log(errorThrown);
				}
			});
		}
	}
	
	
	/* submit 처리(아이디 찾기) */ 
	function submit1(){
		var num1 = $("#ipf").children('.col2').children('input:text[name=pcheckNum]').val();
		var num2 = $("#ief").children('.col2').children('input:text[name=pcheckNum]').val();
		form1 = document.form1;
		form2 = document.form2;
		
		if($("#pp").is(":checked") == true && ido == true) {
			if(num1 == ""){
				alert("인증번호를 입력해주세요.");
				return;
			}
			$.ajax({
				url: "checkNum.do",
				data: {num: num1},
				success: function(data){
					if(data.isUsable == true){
						form1.submit();
					} else {
						alert("인증번호를 확인해주세요.");
					}
				}, error: function(jqxhr, textStatus, errorThrown){
					console.log("ajax 처리 실패");
					console.log(jqxhr);
					console.log(textStatus);
					console.log(errorThrown);
				}
			});
		} else {
			if(num2 == ""){
				alert("인증번호를 입력해주세요.");
				return;
			}
			$.ajax({
				url: "checkNum.do",
				data: {num: num2},
				success: function(data){
					if(data.isUsable == true){
						form2.submit();
					} else {
						alert("인증번호를 확인해주세요.");
					}
				}, error: function(jqxhr, textStatus, errorThrown){
					console.log("ajax 처리 실패");
					console.log(jqxhr);
					console.log(textStatus);
					console.log(errorThrown);
				}
			});
		}
	}
	
	/* submit 처리(비밀번호 찾기) */
	function submit2(){
		var num1 = $("#ppf").children('.col2').children('input:text[name=pcheckNum]').val();
		var num2 = $("#pef").children('.col2').children('input:text[name=pcheckNum]').val();
		form3 = document.form3;
		form4 = document.form4;
		
		if($("#pp2").is(":checked") == true && pwo == true) {
			$.ajax({
				url: "checkNum.do",
				data: {num: num1},
				success: function(data){
					if(data.isUsable == true){
						form3.submit();
					} else {
						alert("인증번호를 확인해주세요.");
					}
				}, error: function(jqxhr, textStatus, errorThrown){
					console.log("ajax 처리 실패");
					console.log(jqxhr);
					console.log(textStatus);
					console.log(errorThrown);
				}
			});
		} else {
			$.ajax({
				url: "checkNum.do",
				data: {num: num2},
				success: function(data){
					if(data.isUsable == true){
						form4.submit();
					} else {
						alert("인증번호를 확인해주세요.");
					}
				}, error: function(jqxhr, textStatus, errorThrown){
					console.log("ajax 처리 실패");
					console.log(jqxhr);
					console.log(textStatus);
					console.log(errorThrown);
				}
			});
		}
	}
</script>
</body>
</html>
<c:import url="../common/footer.jsp" />
