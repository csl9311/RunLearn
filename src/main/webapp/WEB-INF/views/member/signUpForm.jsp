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

.btn span.glyphicon {    			
	opacity: 0;				
}
.btn.active span.glyphicon {				
	opacity: 1;				
}
.clickm{
	cursor: pointer;
}

.scrolldiv{
	overflow-y: scroll;
	width: auto;
	height: 500px;
	font-size:13px;
}

.acenter{
	text-align:center;
	padding-top: 50px;
}

.text-muted{
	padding-left: 10px;
	font-size: 14px;
}

.text-muted2{
	color: #6c757d;
	padding-left: 10px;
	font-size: 11px;
}

.idc{
	color: #b5b5b5;
	font-size: 14px;
}

.pc{
	padding-left: 10px;
	color: #6c757d;
	font-size: 14px;
}
.nt{
	padding-left: 10px;
	color: #6c757d;
	font-size: 14px;
}

.nc{
	padding-left: 10px;
	color: #6c757d;
	font-size: 14px;
}

.mt{
	padding-left: 10px;
	color: #6c757d;
	font-size: 14px;
}

.mc{
	padding-left: 10px;
	color: #6c757d;
	font-size: 14px;
}

.pnc{
	padding-left: 10px;
	color: #6c757d;
	font-size: 14px;
}

.imageArea{margin-bottom: 50px;}

span.ok{color: green;}
span.error1{color: red}
span.error2{color: red}
span.error3{color: red}
span.suc{color: green;}
span.suc1{color: green;}

.scrolldiv h4{font-size:18px;}
.scrolldiv p{font-size:13px;}

.modal-dialog{max-width:1000px !important;}
</style>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>

<div class="wrap" >
	<div class="py-5 text-center"><div class="imageArea justify-context-md-cneter"><img src="${contextPath}/resources/images/common/logo_2.png"></div>
		<h4 class="header">회원가입</h4>
	</div>

	<div class="row justify-content-md-center">
		<div class="dd col-md-auto mx-auto">
			<hr>
			<form action="minsert.do" method="post" name="form" enctype="Multipart/form-data">
				<div class="form-group">
					<p class="title-f"><em class="color-red">* </em>아이디</p>
					<input type="text" class="form-control" id="m_id" name="m_id" placeholder="아이디">
					<input type="hidden" name="typecheck" id="typecheck" value="0">
					<input type="hidden" id="check1" value="0">
					<span id="idp"class="fontA"></span>
					<span class="text-muted">5~20자의 영문자, 숫자를 입력해주세요 </span>
					<span class="idc ok">사용 가능한 아이디입니다.</span>
					<span class="idc error1">5~20자의 영문자, 숫자만 사용가능합니다.</span>
					<span class="idc error2">사용중인 아이디입니다.</span>
					<span class="idc error3">필수 정보입니다.</span>
				</div>
					<script>
						var m_id = $('#m_id');
						
						$(".idc").hide();
						$("#m_id").blur(function(){
							var check =/^[a-zA-Z0-9]{5,19}$/g;
							if(m_id.val().length == 0){
								$(".text-muted").hide();
								$(".idc").hide();
								$(".idc.error3").show();
								return;
							} if(!check.test(m_id.val())){
								$(".idc").hide();
								$(".idc.error1").show();
								$(".text-muted").hide();
								$("#check1").val(0);							
								return;										
							} else {
								$(".idc").hide();
								$("#check1").val(1);
							}
							$.ajax({
								url: "checkId.do",
								data: {id: m_id.val()},
								success: function(data){
									if(data.isUsable == true){
										$(".text-muted").hide();
										$(".idc").hide();
										$(".idc.ok").show();
										$("#check1").val(1);
									} else {
										$(".idc.ok").hide();
										$(".text-muted").hide();
										$(".idc.error2").show();											
										$("#check1").val(0)
									}
								}, error: function(jqxhr, textStatus, errorThrown){
									console.log("ajax 처리 실패");
									console.log(jqxhr);
									console.log(textStatus);
									console.log(errorThrown);
								}
							});
						});

						
					</script>
				<div class="form-group">
					<p class="title-f"><em class="color-red">* </em>비밀번호</p>
					<input type="password" class="form-control" id="m_pw" name="m_pw" placeholder="비밀번호">
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
					<script>
						$(".pc.error1").hide();
						$(".pc.error2").hide();
						$(".pc.error3").hide();
						$(".pc.suc").hide();
						$(".pc.suc1").hide();
						
						var regPw = /^.*(?=^.{6,}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
						
						var pwUsable = false;
						var pwUsable1 = false;
						
						
						$("#m_pw").on("keyup", function() {
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
							var pw = $("#m_pw").val();
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
					</script>
				<div class="form-group">
					<p class="title-f"><em class="color-red">* </em>이름</p>
					<input type="text" class="form-control" id="m_name" name="m_name" placeholder="이름"> 
					<span id="np" class="fontA"></span>
				</div>
				<div class="form-group">
					<p class="title-f"><em class="color-red">* </em>닉네임</p>
					<input type="text" class="form-control" id="m_nickname" name="m_nickname" placeholder="닉네임">
					<input type="hidden" id="check3" value="0">
					<span id="idp"class="fontA"></span>
					<span class="nt">3~10자의 영문자, 숫자를 입력해주세요 </span>
					<span class="nc ok">사용 가능한 닉네임입니다.</span>
					<span class="nc error1">2~10자의 한글,영문자, 숫자만 사용가능합니다.</span>
					<span class="nc error2">사용중인 닉네임입니다.</span>
					<span class="nc error3">필수 정보입니다.</span>
				</div>
					<script>
						var m_nickname = $('#m_nickname');
						
						$(".nc").hide();
						$("#m_nickname").blur(function(){
							var check1 =/^[가-힣a-zA-Z0-9]{2,10}$/g;
							if(m_nickname.val().length == 0){
								$(".nt").hide();
								$(".nc").hide();
								$(".nc.error3").show();
								return;
							} if(!check1.test(m_nickname.val())){
								$(".nc").hide();
								$(".nc.error1").show();
								$(".nt").hide();
								$("#check3").val(0);							
								return;										
							} else {
								$(".nc").hide();
								$("#check3").val(1);
							}
							$.ajax({
								url: "checkNick.do",
								data: {nick: m_nickname.val()},
								success: function(data){
									if(data.isUsable == true){
										$(".nt").hide();
										$(".nc").hide();
										$(".nc.ok").show();
										$("#check3").val(1);
									} else {
										$(".nc.ok").hide();
										$(".nt").hide();
										$(".nc.error2").show();											
										$("#check3").val(0)
									}
								}, error: function(jqxhr, textStatus, errorThrown){
									console.log("ajax 처리 실패");
									console.log(jqxhr);
									console.log(textStatus);
									console.log(errorThrown);
								}
							});
						});

						
					</script>
				<div class="form-group">
					<p class="title-f"><em class="color-red">* </em>이메일</p>
					<input type="text" class="form-control" id="m_email" name="m_email" placeholder="email333@naver.com">
					<input type="hidden" id="check4" value="0">
					<span id="mp" class="fontA"></span>
					<span class="mt">아이디, 비밀번호 찾기에 사용됩니다. </span>
					<span class="mc ok">사용 가능한 이메일입니다.</span>
					<span class="mc error1">올바른 이메일 주소를 입력해주세요.</span>
					<span class="mc error2">사용중인 이메일입니다.</span>
					<span class="mc error3">필수 정보입니다.</span>
				</div>
				
				<script>
				var m_email = $('#m_email');
				
				$(".mc").hide();
				$("#m_email").blur(function(){
					var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-z]([-_.]?[0-9a-z])*.[a-z]{2,3}$/;
					if(m_email.val().length == 0){
						$(".mt").hide();
						$(".mc").hide();
						$(".mc.error3").show();
						return;
					} if(!regExp.test(m_email.val())){
						$(".mc").hide();
						$(".mc.error1").show();
						$(".mt").hide();
						$("#check4").val(0);							
						return;										
					} else {
						$(".mc").hide();
						$("#check4").val(1);
					}
					$.ajax({
						url: "checkEmailo.do",
						data: {m_email: m_email.val()},
						success: function(data){
							if(data.isUsable == true){
								$(".mt").hide();
								$(".mc").hide();
								$(".mc.ok").show();
								$("#check4").val(1);
							} else {
								$(".mc.ok").hide();
								$(".mt").hide();
								$(".mc.error2").show();											
								$("#check4").val(0)
							}
						}, error: function(jqxhr, textStatus, errorThrown){
							console.log("ajax 처리 실패");
							console.log(jqxhr);
							console.log(textStatus);
							console.log(errorThrown);
						}
					});
				});
				</script>
				
				<p class="title-f"><em class="color-red">* </em>전화번호</p>
				<div class="input-group mb-2">
					<input type="text" class="form-control" name="m_phone" id="phoneNum" onKeyup="inputPhoneNumber(this);" maxlength="13" placeholder="010-1234-5678" aria-describedby="button-addon2">
						<div class="input-group-append">
		   		 			<button class="btn btn-outline-secondary" type="button" id="button-addon2" onclick="checkPhone();">인증</button>
		  				</div>
					<span id="pp" class="fontA"></span>
				</div>
				<div class="input-group mb-2" id="pcheck">
					<input type="text" class="form-control" id="cCode" name="cCode" aria-describedby="button-addon2">
						<div class="input-group-append">
		   		 			<button class="btn btn-outline-secondary" type="button" id="button-addon3" onclick="checkPhone2();">제출</button>
		  				</div>
					<span id="pp" class="fontA"></span>
				</div>
				<span class="pnc suc">인증 완료되었습니다.</span>
				<span class="pnc error1">인증 번호를 확인해주세요.</span>
				<input type="hidden" id="checkr" value="0">
				<script>
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
					
					
					
					$("#pcheck").hide();
					$("#phoneNum").blur(function(){
						
					});

					$(".pnc.suc").hide();
					$(".pnc.error1").hide();
					
					var regExp = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
					function checkPhone(){
						var m_phone = $("#phoneNum").val();
						var m_name = $("#m_name").val();
						var typecheck = $("#typecheck").val();
						
						if(!regExp.test($("#phoneNum").val())){
							alert("올바른 전화번호 형태가 아닙니다.");
							return;
						}
						if(m_phone == ""){
							alert("전화번호를 입력해주세요!");
							return;
						} else if(m_name == ""){
							alert("이름을 입력해주세요!");
							return;
						}
						$.ajax({
							url: "checkPhone.do",
							data: {m_phone: m_phone,
								   m_name: m_name,
								   typecheck: typecheck},
							success: function(data){
								if(data.isUsable == true){
									$("#pcheck").show();
									alert("인증번호가 전송되었습니다.");
									$('#button-addon2').attr('disabled','disabled');
								} else {
									alert("가입되어있는 회원입니다.");
								}
							}, error: function(jqxhr, textStatus, errorThrown){
								console.log("ajax 처리 실패");
								console.log(jqxhr);
								console.log(textStatus);
								console.log(errorThrown);
							}
						});
					}
					function checkPhone2(){
						var cnum = $("#cCode").val()
						$.ajax({
							url: "checkNum.do",
							data: {num: cnum},
							success: function(data){
								if(data.isUsable == true){
									$(".pnc").hide();
									$(".pnc.suc").show();
									$("#checkr").prop("value", "1");
									$('#button-addon3').attr('disabled','disabled');
								} else {
									$(".pnc").hide();
									$(".pnc.error1").show();
								}
							}, error: function(jqxhr, textStatus, errorThrown){
								console.log("ajax 처리 실패");
								console.log(jqxhr);
								console.log(textStatus);
								console.log(errorThrown);
							}
						});
					}
				</script>
				
				
			<p class="title-f">프로필 사진</p>
			<div class="input-group mb-2">
			<input type="file" name="profileImg" id="profileImg">
			</div>
			<p class="title-f"><em class="color-red">* </em>주소</p>
			<div class="input-group mb-2" style="width:50%;">
			<input type="text" id="sample4_postcode" name="postnum" class="form-control" placeholder="우편번호" readonly>
			<input type="button" onclick="sample4_execDaumPostcode()" class="form-control" value="우편번호 찾기"><br>
			</div>
			<div class="input-group mb-2">
			<div style="margin-right: 5px;">
			<input type="text" id="sample4_roadAddress" class="form-control" name="r_address" placeholder="도로명주소" readonly>
			</div>
			<div>
			<input type="text" id="sample4_jibunAddress" class="form-control" name="g_address" placeholder="지번주소" readonly>
			</div>
			</div>
			<div class="input-group">
			<span id="guide" style="color:#999;display:none"></span>
			<input type="text" id="sample4_detailAddress" class="form-control" name="d_address" placeholder="상세주소">
			</div>
			<input type="hidden" id="sample4_extraAddress" class="form-control" placeholder="참고항목">
				
			<!-- 주소 api -->	
			<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
			
			<script>
			    function sample4_execDaumPostcode() {
			        new daum.Postcode({
			            oncomplete: function(data) {
			                var roadAddr = data.roadAddress; 
			                var extraRoadAddr = ''; 
			
			                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
			                    extraRoadAddr += data.bname;
			                }
			                if(data.buildingName !== '' && data.apartment === 'Y'){
			                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			                }
			                if(extraRoadAddr !== ''){
			                    extraRoadAddr = ' (' + extraRoadAddr + ')';
			                }
			
			                document.getElementById('sample4_postcode').value = data.zonecode;
			                document.getElementById("sample4_roadAddress").value = roadAddr;
			                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
			                
			                if(roadAddr !== ''){
			                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
			                } else {
			                    document.getElementById("sample4_extraAddress").value = '';
			                }
			
			                var guideTextBox = document.getElementById("guide");
			                if(data.autoRoadAddress) {
			                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
			                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
			                    guideTextBox.style.display = 'block';
			
			                } else if(data.autoJibunAddress) {
			                    var expJibunAddr = data.autoJibunAddress;
			                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
			                    guideTextBox.style.display = 'block';
			                } else {
			                    guideTextBox.innerHTML = '';
			                    guideTextBox.style.display = 'none';
			                }
			            }
			        }).open();
			    }
			</script>
				
				
			<hr>
			<div>
	            <label class="clickm"><input type="checkbox" id="checkall">이용약관 전체동의</label>
            </div>
            <hr>
        	<div>
            <input type="checkbox" class="chk" name="chk" id="chk1">
           	<a data-toggle="modal" data-target="#exampleModalCenter"><label class="clickm">이용약관 필수 동의<span class="text-muted2">[클릭하여 내용보기]</span></label></a>
            </div>
			<div>
            <input type="checkbox" class="chk" name="chk" id="chk2">
           	<a data-toggle="modal" data-target="#exampleModalCenter2"><label class="clickm">개인정보 취급방침 필수 동의<span class="text-muted2">[클릭하여 내용보기]</span></label></a>
            </div>
			<!-- 약관 모달 -->
			<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLongTitle">서비스 이용약관</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			      	<div class="scrolldiv">
						 <h3>제1장 총칙</h3><br><br>
						 
						<h4>제1조 (목적)</h4>
						
						<p>이 약관은 만취남녀(이하 당사)가 제공하는 수업 연결 서비스를 이용함에 있어 당사와 이용자의 권리, 의무 및 책임사항을 규정합니다. 이를 통하여 당사와 이용자는 알아야 할 사항을 숙지, 상호 신뢰의 증진을 목적으로 합니다.</p>
						
						
						<h4>제2조 (약관의 효력 및 변경)</h4>
						
						<p>가. 이 약관은 만취남녀 사이트에 회원으로 등록, 조회 등 서비스 이용 순간부터 효력이 발생됩니다.</p>
						
						<p>나. 당사에서는 서비스 이용 수수료 등을 포함하여 각종 약관을 어느 시기에나 변경할 권리를 갖고 있으며 사전 고지 없이 이 약관들의 내용을 변경할 수 있습니다. 변경된 약관은 홈페이지 공지, 회원가입 시 공지 또는 전자우편 등의 기타 방법으로 공지함으로써 효력이 발생됩니다. 당사는 또한 “마지막 수정일”의 날짜를 약관의 가장 상단에 나타낼 것입니다. 이는 서비스 이용약관 뿐만 아니라, 결제서비스약관, 환불규정, 개인정보보호정책 약관 모두가 해당됩니다.</p>
						
						<p>다. 기존 회원들은 당사가 변경된 약관의 수정사항을 홈페이지, 어플리케이션 또는 이메일 등의 방법을 통해 공지한 경우, 웹사이트, 어플리케이션 또는 서비스를 지속적으로 이용할 경우에 변경 사항에 대해 동의 한 것으로 간주합니다. 만일 수정 약관에 대해 동의하지 않는 경우에는 사이트와 서비스 이용을 즉시 중단 하거나 탈퇴함으로써 약관의 내용을 거부할 수 있습니다.</p>
						
						
						<h4>제3조 (약관 외 사항의 처리)</h4>
						
						<p>본 약관과 개인정보취급방침에 명시되지 않은 사항에 대해서는 관련 법령 및 회사가 정한 서비스 이용 안내에 따릅니다.</p>
						
						
						<h4>제4조 (용어의 정리)</h4>
						
						<p>이 약관에서 사용하는 주요한 용어의 정의는 다음과 같습니다.</p>
						
						<p>가. 수강생 : 튜터를 구하기 위해 당사의 약관에 동의하고 수강생 양식에 따라 등록한 자.</p>
						
						<p>나. 튜터 : 수강생을 구하기 위해 당사의 약관에 동의하고 튜터 양식에 따라 등록한 자.</p>
						
						<p>다. 수강생과 튜터가 처음 진행하는 1시간 수업에서 최소 20분간의 OT를 필수로 진행하여야 합니다. 1회 수업은 1시간만 포함하며 이후 진행된 시간은 추가 수업으로 간주됩니다.</p>
						
						
						<h4>제5조 (중개서비스의 성질과 목적)</h4>
						
						<p>중개서비스는 회사가 회원 각자의 자기결정에 의하여 회원 상호간에 수업의 거래가 이루어질 수 있도록 사이버 거래장소(marketplace)를 온라인으로 제공하는 것이며, 만취남녀 안전결제서비스는 회원 상호간에 수업의 매매에 있어서 안전하고 편리하게 결제가 이루어질 수 있는 수단을 제공하는 것입니다. 회사는 단지 회원간 거래의 안전성 및 신뢰성을 증진시키는 도구만을 제공합니다. 회원간에 성립된 거래와 관련된 책임은 거래당사자인 회원들 스스로가 부담하여야 합니다.</p>
						
						
						
						<br><br><h3>제2장 회원정보의 보호</h3><br><br>
						
						
						<h4>제6조 (회원정보의 수집과 보호)</h4>
						
						<p>이 약관에서 사용하는 주요한 용어의 정의는 다음과 같습니다.</p>
						
						<p>가. 회사는 이용계약을 위하여 회원이 제공한 정보 외에도 수집목적 또는 이용목적 등을 밝혀 회원으로부터 필요한 정보를 수집·이용할 수 있습니다. 이 경우, 회사는 회원으로부터 정보수집·이용에 대한 동의를 받습니다. 회사는 개인정보의 수집·이용·제공에 관한 회원의 동의 거절 시 제한되는 서비스를 구체적으로 명시합니다.</p>
						
						<p>나. 회사가 정보수집·이용을 위하여 회원의 동의를 받는 경우, 회사는 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항(제공받는 자, 제공목적, 제공 정보의 내용)을 미리 명시하거나 고지합니다. 회원은 정보제공에 동의하더라도 언제든지 그 동의를 철회할 수 있습니다.</p>
						
						<p>다. 회원은 회사에게 정보를 사실대로 제공하여야 합니다. 회사는 회원이 이 약관 제8조 가항에 따라 제공한 정보의 정확성을 확인하기 위하여 관련법령이 허용하는 범위 내에서 증빙 자료의 제공을 요청할 수 있고, 회원이 정당한 사유 없이 증빙자료를 제공하지 않는 경우 회사는 서비스의 이용을 제한하거나 이용계약을 해지할 수 있습니다.</p>
						
						<p>라. 회사는 계정, 성명 등 서비스화면을 통하여 공개되는 정보를 제외하고는 회사가 수집한 회원정보를 정보수집 시에 밝힌 수집목적, 이용목적, 원활한 서비스의 제공 및 제공서비스의 확대 외의 용도로 사용하거나 제3자에게 제공하지 않습니다. 회사는 정보수집 시에 밝힌 이용목적 이외에 새로운 이용목적이 발생한 경우 또는 제3자에게 제공하는 경우에는 이용∙제공 단계에서 당해 회원에게 그 목적을 고지하고 동의를 받습니다, 다만, 관련 법령에 달리 정함이 있는 경우에는 예외로 합니다.</p>
						
						<p>마. 회사의 개인정보 관리책임자 및 연락처는 만취남녀 사이트에서 별도로 공개하는 개인정보취급방침에서 공지합니다.</p>
						
						<p>바. 회원은 언제든지 자신에 관한 정보를 열람할 수 있고, 회사 또는 정보관리책임자에게 잘못된 정보에 대한 정정을 요청할 수 있습니다. 회사는 회원으로부터 정보정정의 요청이 있는 경우 그 오류를 정정하거나 정정하지 못하는 사유를 회원에게 통지하는 등 필요한 조치를 취할 때까지 당해 정보를 이용하지 않습니다. 다만, 다른 법률에 따라 개인정보의 제공을 요청 받은 경우에는 그러하지 아니합니다.</p>
						
						<p>사. 회사는 회원정보의 보호를 위하여 관리자를 최소한으로 한정하며, 회사의 고의 또는 과실로 인하여 회원정보가 분실, 도난, 유출, 변조되거나 위법하게 제3자에게 제공된 경우에는 그로 인한 회원의 손해에 대하여 모든 책임을 부담합니다.</p>
						
						<p>아. 이용계약이 종료된 경우, 회사는 당해 회원의 정보를 파기하는 것을 원칙으로 합니다. 다만, 아래의 경우에는 회원정보를 보관합니다. 이 경우 회사는 보관하고 있는 회원정보를 그 보관의 목적으로만 이용합니다.</p>
						
						<p>1) 상법, 전자상거래 등에서의 소비자보호에 관한 법률 등 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다.</p>
						
						<p>2) 비방이나 허위사실 유포 등으로 타인에게 피해를 입힌 경우, 지적재산권 침해상품 판매 또는 기타 인터넷 사기행위 등으로부터 회원과 회사를 보호하고 법적 절차에 따른 수사 협조를 위한 목적 등으로 회사는 이용계약 종료 후 2개월간 물품거래내역이 존재하는 회원의 계정, 성명 또는 상호, 연락처, 그 외 제공받은 개인정보, 해지 및 회원자격정지 관련정보 등 필요한 정보를 보관합니다.</p>
						
						<p>3) 기타 정보수집에 관한 동의를 받을 때 보유기간을 명시한 경우에는 그 보유기간까지 회원정보를 보관합니다.</p>
						
						
						<p>자. 회사가 제3자에게 회원의 개인정보를 제공할 필요가 있는 경우 회사는 실제 구매신청 시(수강생) 또는 수업등록 시(튜터), 제공되는 개인정보 항목, 제공받는 자, 제공받는 자의 개인정보 이용목적 및 보유·이용기간 등을 명시하여 회원의 동의를 받고, 개인정보의 수집·취급·관리 등을 위탁하는 경우에는 위탁 업무의 내용 및 수탁사의 명칭 등에 관한 사항을 서면, 전자우편, 모사전송, 전화 또는 홈페이지를 통해 미리 회원에게 고지하여 동의를 받거나 개인정보취급방침에 포함하여 만취남녀 사이트에 공개합니다.</p>
						
						<p>차. 회사는 회원정보의 보호와 관리에 관한 개인정보취급방침을 회원과 회사의 서비스를 이용하고자 하는 자가 알 수 있도록 만취남녀 사이트에 공개합니다.</p>
						
						
						
						<br><br><h3>제3장 중개서비스의 이용</h3><br><br>
						
						
						<h4>제7조 (중개서비스의 종류 및 이용)</h4>
						
						<p>가. 회사가 제공하는 중개서비스는 일반거래, 합의거래 등이 있습니다. 중개서비스의 종류와 내용은 회사의 정책에 따라 추가, 변경될 수 있습니다.</p>
						
						<p>나. 회사는 중개서비스의 종류에 따라 각 매매의 특성, 절차 및 결제방법에 대한 사항을 서비스화면을 통하여 공지합니다. 회원은 회사가 공지한 각 매매에 관한 사항을 사전에 충분히 이해하고 중개서비스를 이용하여야 합니다.</p>
						
						<p>다. 회원은 페이스북 계정, 이메일(e-mail)과 비밀번호를 통하여 회사가 제공하는 중개서비스에 접속할 수 있고, 동 서비스를 이용하여 수업을 판매하거나 구매할 수 있습니다. 다만, 각 카테고리 별로 회사가 지정하는 중개서비스에 대해서는 튜터가 될 수 있는 자격요건이 설정될 수 있습니다. 회사는 이러한 이용제한사항을 해당 서비스화면에서 공지합니다.</p>
						
						<p>라. 회원이 중개서비스를 통하여 판매 또는 구매하는 경우, 반드시 회사가 마련한 만취남녀 안전결제서비스를 통하여 거래를 완료하여야 합니다. 회사는 회원 간의 직거래로 인하여 발생한 문제에 대하여 책임지지 않습니다. 또한 직거래 신고가 접수 될 경우 사이트 이용자는 서비스 이용에 제한을 받을 수 있습니다.</p>
						
						
						<h4>제8조 (중개서비스의 종류 및 이용)</h4>
						
						<p>가. 회사는 중개서비스를 통한 거래의 안전성과 신뢰성을 위하여 이 약관에서 정한 바에 따라 회원자격을 정지하거나 서비스의 이용 제한, 기타 필요한 조치를 취할 수 있습니다. 회사가 회원자격을 정지하거나 판매/구매서비스의 이용제한, 기타 필요한 조치를 취할 경우 회사는 이 약관에 특별한 규정이 없는 한 사전에 회원에게 유선 또는 메일(e-mail), 기타의 방법을 통하여 통보하며, 회원의 연락이 두절되거나 긴급을 요하는 것과 같이 부득이한 경우 선 조치 후 사후 통보할 수 있습니다. 정지된 회원은 중개서비스를 이용할 수 없으며, 중개서비스의 이용이 제한된 회원은 판매/구매관리 서비스를 포함한 모든 서비스를 이용할 수 없습니다.</p>
						
						<p>나. 회원자격의 정지와 중개서비스의 이용제한.</p>
						
						<p>1) 불법홍보 또는 회사 서버에 무리를 주는 행위로 인한 회원자격정지</p>
						
						<p>회사는 타 사이트 등에서 만취남녀 서비스를 이용한 불법적 홍보행위, 회사 서버에 무리를 주는 행위의 적발 시 이용 제한을 진행할 수 있습니다. 아래 기준을 따르되, 위반 정도에 따라 회사는 기준보다 높은 제한을 할 수 있습니다.</p>
						
						<p>적발 횟수에 따른 제한의 내용</p>
						
						<p>1회 경고</p>
						
						<p>2회 30일 이용정지</p>
						
						<p>3회 회원자격의 영구정지</p>
						
						<p>2) 부당한 구매행위, 불법카드거래 또는 매매부적합수업의 등록행위</p>
						
						<p>회사는 허위거래, 매매조작행위 등 매매진행을 방해하는 부당한 구매행위, 불법카드거래행위, 매매부적합수업의 등록행위, 불법통신과금서비스 이용행위에 대하여 회원자격을 정지하거나 중개서비스 이용을 제한할 수 있습니다. 다만, 튜터의 경과실에 의해 회원자격의 정지 또는 중개서비스의 이용제한 사유가 발생하는 경우에는 회사는 1회 사전 경고를 하여 튜터가 자진 시정을 할 수 있는 기회를 제공할 수 있습니다.</p>
						
						<p>3) 장기휴면회원의 경우: 회사는 튜터 회원이 60일 이상 로그인 하지 않은 경우 등록한 수업을 중단처리 할 수 있고 회원이 1년 이상 로그인을 하지 않은 경우에는 ‘정보통신망 이용촉진 및 정보보호 등에 관한 법률’ 제 29조 2항에 따라 자동 탈퇴 및 개인정보를 파기합니다. 단, 판매/구매이력이 있는 회원의 자동탈퇴 및 개인정보 보관, 파기는 개인정보취급방침에 따른 별도 규정에 의하여 관리합니다.</p>
						
						<p>4) 금지행위</p>
						
						<p>① 허위 정보 입력 금지</p>
						<p>허위 정보 입력 금지란 수업에 대한 허위 정보를 입력하는 행위를 말합니다. 이로 인해 수강생의 피해나 클레임이 발생할 경우, 회사는 판매제한, 수업등록 가능개수 제한 등의 페널티를 부여할 수 있습니다.</p>
						
						<p>② 이용정책 위반 시</p>
						<p>튜터와 수강생이 취소, 환불 절차 등 이용정책 위반 및 수업 후 무응답 등 수업에 상호에게 해가 되는 행동을 끼쳤거나 이로 인한 클레임이 발생하였을 경우, 회사는 아래의 규정에 따라 조치를 할 수 있습니다.</p>
						
						<p>(1) 부당 수업 거부</p>
						
						<p>1차: 부당 수업 거부에 대한 경고 및 개선요청</p>
						
						<p>2차: 해당 수업 등록 중지</p>
						
						<p>3차: 전 수업 등록 중지 및 신규 수업 등록제한 (부당 수업 거부 횟수는 3개월간 유효하며, 3개월 후에 삭제 처리됩니다.)</p>
						
						<p>(2) 임의 취소/임의 환불</p>
						
						<p>1차: 1차 경고 조치 및 해당 수업 선택사항 조정이나 일시 등록 중단 조치(경중에 따라 수업 등록 제한)</p>
						
						<p>2차: 2차 경고 조치 및 신규 수업 등록제한</p>
						
						<p>3차: 3차 경고 조치 및 정산중지</p>
						
						<p>③ 연락두절</p>
						
						<p>연락두절 연락두절이란 튜터가 회원가입 시 기재한 유선 또는 메일(e-mail)등 기타의 방법을 통하여 회사가 연락을 시도하였음에도 불구하고 일체의 응대가 진행되지 않는 상태를 말합니다. 튜터는 정상적인 수업 활동이 불가한 상태 또는 이와 같은 상태가 예상되는 경우 이를 즉시 회사에 통보하여야 하며 정상적인 수업이 불가한 상태 또는 이와 같은 상태가 예상되는 경우 전자상거래 등에서의 소비자보호에 관한 법률 등 관련법에 따른 취소, 환불, A/S 등의 신속한 처리를 위하여 최선의 노력을 다하여야 합니다. 튜터의 연락두절로 인한 클레임이 발생하였을 경우, 회사는 아래의 규정에 따라 조치할 수 있습니다.</p>
						
						<p>연락두절 1차 : 1차 경고 및 개선요청</p>
						
						<p>연락두절 2차 : 1차 경고 후 24시간 이상 일체의 응대가 진행되지 않는 상태를 연락두절 2차라 칭함. 연락두절 2차의 경우 취할 수 있는 조치는 2차 경고, 직권으로 환불처리 및 해당 튜터의 전 수업 등록 중지, 신규수업 등록제한</p>
						
						<p>연락두절 3차 : 2차 경고 후 24시간 이상 일체의 응대가 진행되지 않는 상태를 연락두절 3차라 칭함. 연락두절 3차의 경우 취할 수 있는 조치는 정산 중지 및 이용계약 해지</p>
						
						<p>※ 1차 경고 후 3개월 내에 연락두절 상태가 재발될 경우, 경고 없이 바로 연락두절 2차 조치를 취할 수 있습니다. 2차 경고 후 3개월 내에 연락두절 상태가 재발될 경우, 경고 없이 바로 연락두절 3차 조치를 취할 수 있습니다.</p>
						
						<p>④ 수강생의 문의 처리 지연(미처리) 및 불만족</p>
						
						<p>튜터는 수강생의 문의(거래 메세지, 연락가능번호 등을 통한)를 신속하고 성실히 처리해야 합니다. 회사는 일정기한 내 튜터의 답변의 처리 유무에 따라 처리율을 판단하고, 튜터 답변의 수강생 만족도를 조사하여 수강생 답변 만족도를 판단할 수 있습니다. 수강생 문의에 대한 튜터의 처리율 및 만족도가 저조한 경우 회사는 아래의 규정에 따라 조치할 수 있습니다.</p>
						
						<p>1차 수강생 문의 처리 지연 및 불만족 : 경고 및 개선요청</p>
						
						<p>2차 수강생 문의 처리 지연 및 불만족 : 해당 수업 등록 중지 및 개별 CS 가이드</p>
						
						<p>3차 수강생 문의 처리 지연 및 불만족 : 전 수업 등록 중지 및 신규 수업 등록제한</p>
						
						
						<p>5) 추가 계정을 통한 수업 등록</p>
						
						<p>회원이 추가 (개인)계정을 사용하여 최초 가입 계정과 동일한 대분류 카테고리 내에 수업 등록을 하는 경우, 회사는 회원에게 회원자격 정지, 수업 등록 제한, 등록 수업 노출 순위(이하 “인기도”) 감점, 수업 등록 가능개수 제한 등의 페널티를 부과할 수 있습니다.</p>
						
						<p>6) 기타 위법·부당행위</p>
						
						<p>회사는 회원이 다음 각 목의 하나에 해당하는 경우 회원자격을 정지하거나 서비스 제공을 거부 또는 제한할 수 있으며, 그 밖에 법령준수, 타인의 권리보호, 사이트의 안전 확보 등을 위하여 필요한 법적 조치를 취할 수 있습니다.</p>
						
						<p>① 회사의 만취남녀 사이트, 시스템, 서비스를 스팸정보 전송 또는 악성코드 프로그램 유포, 타인계정 도용 등 범죄 또는 불법행위에 이용한 경우</p>
						
						<p>② 수업 이행 또는 수업료를 송금해야 하는 경우에 무단으로 잠적/ 회피 하는 경우</p>
						
						<p>③ 거래이행을 위한 수강생 또는 회사로부터의 연락 회피나 제재 회피 등 부정한 목적으로 회원정보의 수정을 거부하거나 해태한 경우</p>
						
						<p>④ 게시판(예시: 블로그) 등을 통하여 불법정보를 유통하거나 유통을 시도한 경우</p>
						
						<p>⑤ 만취남녀 사이트정보, 데이터를 정당한 권한 없이 스스로 또는 제3자를 통하여 복사, 퍼가기, 스크래핑 하거나 기타의 방법으로 상업적으로 이용한 경우</p>
						
						<p>⑥ 회원이 제공한 정보 또는 그에 관한 증빙자료가 허위이거나 회사가 요청하는 증빙자료를 제공하지 않는 경우</p>
						
						<p>⑦ 수출 관리 법령과 게시된 규칙, 제한을 위반하여 만취남녀의 웹/앱 서비스 및 관련 툴을 수출 또는 재수출하는 경우</p>
						
						<p>⑧ 만취남녀 서비스에 관련된 정보나 소프트웨어를 상업화하는 경우</p>
						
						<p>⑨ 회원이 다른 회원의 개인정보를 무단수집 하거나 마케팅 등 수집 목적 외로 이용하는 경우</p>
						
						<p>⑩ 회원이 다른 회원의 개인정보를 무단으로 제3자에게 제공하거나 관련법령 또는 회사의 개인정보취급방침을 위배하여 다른 회원의 개인정보가 침해된 경우</p>
						
						<p>⑪ 만취남녀메세지 또는 거래메세지를 이용한 대화, 구매평가의 내용 중 욕설, 비방 혹은 명예를 훼손하는 내용을 작성하는 경우</p>
						
						<p>⑫ 그 외 약관 또는 법령에 위반되거나 타인의 권리를 침해하는 행위가 있거나 그러한 위법·부당한 행위가 있는 것으로 의심될 만한 상당한 이유가 있는 경우</p>
						
						
						<p>제9조 (대리 및 보증의 부인)</p>
						
						<p>가. 회사는 통신판매중개자로서 회원 상호간의 거래를 위한 온라인 거래장소(marketplace)를 제공할 뿐이므로 수업을 제공하거나 구매하고자 하는 회원을 대리하지 않습니다. 또한, 회사의 어떠한 행위도 튜터 또는 수강생을 대리하는 행위로 간주되지 않습니다.</p>
						
						<p>나. 회사는 중개서비스를 통하여 이루어지는 회원간의 판매 및 구매와 관련하여 판매의사 또는 구매의사의 존부 및 진정성, 등록물품의 품질, 완전성, 안전성, 적법성 및 타인의 권리에 대한 비 침해성, 회원이 입력하는 정보 및 그 정보를 통하여 링크된 URL에 게재된 자료의 진실성 등 일체에 대하여 보증하지 아니하며, 이와 관련한 일체의 위험과 책임은 해당 회원이 부담해야 합니다.</p>
						
						<p>다. 회사는 회원이 게재하는 수업설명 등의 제반 정보를 통제하거나 제한하지 않습니다. 다만, 회사는 회원이 게재한 정보의 내용이 타인의 명예, 권리를 침해하거나 법규정을 위반한다고 판단하는 경우에는 이를 삭제할 수 있고, 수업취소, 수업중지, 기타 필요한 조치를 취할 수 있습니다.</p>
						
						
						<p>제10조 (만취남녀 안전결제서비스)</p>
						
						<p>가. 회사는 중개서비스를 제공하는 과정에서 첫 회 1시간 분의 시범 강의비 또는 전체금액 결제에 대한 대금 수취, 보관 및 환불로 이루어지는 에스크로 방식의 만취남녀 안전결제서비스를 제공합니다. 이러한 만취남녀 안전결제서비스는 중개서비스를 통하여 이루어지는 회원 상호간의 거래의 안전성과 신뢰성을 도모하고 수강생을 보호하기 위한 목적에서 제공하는 장치이므로 회사가 만취남녀 안전결제서비스를 통하여 튜터 또는 수강생을 대리, 대행하거나 그 이행을 보조하는 것은 아닙니다.</p>
						
						<p>나. 회사가 제공하는 만취남녀 안전결제서비스는 기본적인 중개서비스에 포함됩니다. 회원이 첫1시간 수업료 거래 또는 전체금액 결제에서 만취남녀 안전결제서비스를 통하지 않는 직거래를 유도하는 경우, 회사는 주문취소, 판매중지 등 기타 필요한 조치를 취할 수 있습니다.</p>
						
						<p>다. 만취남녀 안전결제서비스의 일환으로 이루어지는 대금보관으로 인하여 회사가 취득하는 이자 등은 서비스 제공의 대가이므로 회원은 회사에 대하여 이자 등의 반환을 청구할 수 없고, 대금 송금(실시간계좌이체, 가상계좌 등)으로 인하여 발생하는 수수료는 대금을 송금하는 회원이 부담하여야 합니다.</p>
						
						<p>라. 회사가 제공하는 만취남녀 안전결제서비스를 이용하지 않은 거래 또는 만취남녀 안전결제서비스가 포괄하는 수업의 내용들이 종결된 거래의 경우 해당 거래와 관련하여 발생한 모든 사항은 튜터와 수강생이 상호협의를 통해 해결하여야 합니다.</p>
						
						<p>마. 튜터는 회사가 제공하는 서비스를 이용함에 있어서 만취남녀 안전결제서비스의 이용과 그 규칙에 동의하여야 합니다.</p>
						
						<p>바. 회사가 제공하는 만취남녀 안전결제서비스를 오용, 악용함으로써 사회질서, 미풍양속을 침해하거나 침해할 우려가 있다고 판단되는 경우 또는 회사가 만취남녀 안전결제서비스를 제공하지 못할 상황 또는 사유가 발생하는 경우 회사는 수업 판매를 제한할 수 있습니다.</p>
						
						
						<p>제11조 (튜터의 의무)</p>
						
						<p>가. 튜터는 이 약관과 회사가 서비스화면을 통하여 미리 공지하는 개별약관이 정하는 절차에 따라 신원정보의 제공, 수업의 등록, 거래진행 과정의 관리, 수강생에 대한 수업이행, 또는 환불 등의 사후처리를 수행하여야 합니다.</p>
						
						<p>나. 튜터는 회원의 질문에 성실히 응해야 합니다.</p>
						
						<p>다. 회사 및 튜터는 수강생의 행위가 허위 또는 불법 결제에 해당하는 경우 및 신속한 거래관계의 확정 또는 거래안전을 위하여 필요한 경우, 그 밖의 정당한 사유가 있는 경우 거래를 취소할 수 있습니다. 다만, 튜터가 예상치 못한 수업불능 등으로 정상적 거래이행이 곤란하여 거래를 취소하는 경우에는 지체 없이 수강생에 대한 통지, 환급(에 필요한 조치) 등 관계법령이 정한 조치를 취하여야 합니다.</p>
						
						<p>라. 튜터는 수강생의 승인요청을 거절하는 경우, 24시간 이내 거절의사와 함께 불가사유를 수강생에게 전달하여야 합니다.</p>
						
						<p>마. 튜터의 등록은 튜터 등록 서비스 화면상의 등록 양식에 따라야 하며, 수업등록양식에 어긋난 등록이나 허위등록의 경우에는 해당 수업을 삭제, 취소하거나 중개를 하지 않을 수 있으며, 이에 따른 모든 책임은 해당 튜터가 부담하여야 합니다.</p>
						
						<p>바. 튜터는 수업등록 시 불법적인 거래를 유도하는 문구 및 수강생의 정당한 권리(수업 시작 24시간 전 환불, 첫 수업에서의 OT 포함)를 제한하거나, 허위 또는 기타 법령이나 약관에 위배되는 내용(문구, 사진 또는 설명을 포함)을 등록해서는 아니 되며, 스스로 또는 다른 회원을 통하여 고의로 구매평가, 수업횟수 등을 조작하거나 기타 판매가장등록 등 중개서비스의 안전성과 신뢰성을 해하는 부정한 행위를 하여서도 안됩니다. 이를 위반한 경우 회사는 관련 회원이나 해당 거래에 대하여 거래취소, 수업중지 및 기타 필요한 조치를 취할 수 있습니다.</p>
						
						<p>사. 튜터는 회사의 명칭, 로고 및 회원의 회원등급 표시를 회사가 정한 목적 이외의 목적으로 임의로 사용하거나 지정된 곳 이외의 장소에 표시하여서는 안되며, 이러한 행위로 인하여 회사 또는 타 회원에게 피해가 발생한 경우 이에 대하여 일체의 법적 책임을 부담하여야 합니다.</p>
						
						<p>아. 튜터는 회사의 만취남녀 사이트에서의 거래와 관련하여 전자상거래 등에서의 소비자보호에 관한 법률 등 관계법령에서 명시한 자료를 보관하여야 합니다.</p>
						
						<p>자. 튜터는 자신의 튜터 정보란에 회사가 정하는 절차에 따라 인증 받은 휴대폰 번호를 대표번호로서 설정하고 항상 최신 정보로서 유지하여야 합니다. 또한, 대표번호 변경 시 새로이 인증을 받아야 합니다. 튜터가 본 항의 의무를 이행하지 않을 경우 회사는 이행 완료 시까지 해당 튜터의 수업 등록과 편집을 제한할 수 있습니다.</p>
						
						<p>차. 튜터는 통신판매중개 의뢰 및 그와 관련한 계약이행 과정에서 알게 된 튜터 등 다른 회원의 개인정보를 법률, 이 약관 또는 회사의 개인정보취급방침에서 정한 목적 외의 용도로 사용할 수 없으며, 이를 위반할 경우, 모든 법적 책임을 지고 자신의 노력과 비용으로 회사를 면책시켜야 하고 회원자격이 정지 또는 박탈될 수 있습니다.</p>
						
						<p>카. 회사의 고의 또는 과실과 무관하게, 특정 튜터가 관계하고 있는 다른 회원 또는 제3자의 개인정보가 침해된 경우, 회사는 그에 대하여 책임을 지지 않습니다.</p>
						
						<p>타. 신청한 수강생에 대한 의무를 다합니다.</p>
						
						<p>1) 튜터는 모든 수업에 있어 성심과 성의를 다하여 수강생을 지도해야 합니다.</p>
						
						<p>2) 튜터는 수강생의 사전 동의 없이 수업에 관한 조건(수업횟수, 수업료, 시간 등)을 일방적으로 변경할 수 없으며, 수강생이 동의하지 않는경우 수령한 수업료를 모두 환불해야합니다.</p>
						
						<p>3) 튜터는 자신의 신상정보가 변경되었을 경우, 즉시 자신의 회원정보를 수정하여야 합니다.</p>
						
						<p>4) 튜터는 서비스와 관련하여 다음 사항을 해서는 안됩니다.</p>
						
						<p>① 다른 이용자의 계정을 부정 사용하는 행위</p>
						
						<p>② 다른 이용자의 개인정보를 수집, 저장하는 행위</p>
						
						<p>③ 회사 직원, 운영자 등을 포함한 타인을 사칭하는 행위</p>
						
						<p>④ 서비스의 운영에 지장을 주거나 줄 우려가 있는 일체의 행위</p>
						
						<p>⑤ 본 약관을 포함하여 기타 당사가 정한 규정 또는 이용조건을 위반하는 행위</p>
						
						<p>⑥ 객관적으로 범죄와 결부된다고 판단되는 행위</p>
						
						<p>⑦ 당사와 수강생과의 협의 없이 제 3자를 과외수업에 대리 참석시키는 행위</p>
						
						<p>⑧ 기타 관계법령에 위배되는 행위</p>
						
						<p>파. 튜터가 성실히 수업을 이행하지 않거나 일방적으로 계약을 파기할 경우, 당사는 관계법령에 의해 선생님을 고소, 고발 조치 및 회원 자격박탈 등을 취할 수 있으며, 해당 튜터는 이에 대한 모든 법적 책임을 감수합니다. 또한, 수강생의 수업 전문성에 대한 의문제기, 수업에 대한 불충분한 준비, 지각 및 무단 연락두절에 대하여 신고 건수에 따라 다음과 같은 삼진아웃 조항을 적용합니다.</p>
						
						<p>① 2건 이상의 수강생 신고 접수 시: 경고조치 및 2주간 수업 추천 노출도 0으로 표기</p>
						
						<p>② 3건 신고 접수 시: 14일간 신고 내용에 대해 튜터의 수업 페이지와 프로필에 표기</p>
						
						<p>③ 4건 신고 접수 시: 잠정적 영구 수업 중단 조치</p>
						
						
						<p>하. 튜터의 계정 공유 및 계정 재판매, 유/무상 양도 등을 금지합니다. 금지된 행위를 한 회원은 당사의 개인정보 불법유출, 영업방해 및 이미지 훼손에 대한 손해배상을 해야 하며, 계정은 사전통보 없이 강제로 자격 박탈 처리됩니다.</p>
						
						
						<h4>제12조 (튜터의 등록 및 수정)</h4>
						
						<p>가. 등록자격</p>
						
						<p>튜터는 약관에 따라 수업을 등록할 수 있습니다. 다만, 회사는 소비자보호 및 서비스 수준 유지를 위해 일부 카테고리 수업의 경우 수업을 등록할 수 있는 튜터의 자격을 제한할 수 있습니다.</p>
						
						<p>1) 튜터는 수업의 등록 시 수강생이 수업에 대한 정보를 확인할 수 있도록 다음과 같은 사항을 정확하게 기재하여야 하며, 회사가 승인하지 아니한 시스템을 통하여 회사 정보통신망에 무단 접속하여 자동으로 등록하는 방법으로 수업을 등록할 수 없습니다. 회사는 수업검색의 효율성, 시스템에 걸리는 부하 등을 고려하여 튜터에 대한 사전 통지로써 튜터 1인당 수업 등록 건수를 제한할 수 있습니다. 튜터가 회사의 수업 등록건수 제한조치에 반하여 수업등록을 한 경우 회사는 등록된 수업을 중지하거나 삭제 할 수 있고 위반횟수 및 수준에 따라 해당 수업을 등록한 의 회원자격을 정지하거나 서비스 이용을 제한할 수 있습니다.</p>
						
						<p>① 수업료</p>
						
						<p>튜터는 등록하고자 하는 수업료를 명확히 기재하여야 합니다. 수업료는 시간 당/회 및 전체 커리큘럼의 총 횟 수를 입력하여 설정할 수 있습니다.</p>
						
						<p>② 수업의 상세정보</p>
						
						<p>수업에 대한 상세정보는 사실대로 명확하게 기재하여야 합니다. 허위 또는 과장 정보를 기재한 경우, 모순되는 내용의 정보가 기재되어 있는 경우, 이 약관에 반하는 거래조건이 기재된 경우 회사는 해당 수업을 취소하거나 중지 시킬 수 있습니다. 이 경우, 취소 또는 중지된 수업에 관한 판매서비스수수료는 환불되지 않으며, 중개의 취소 또는 중지로 인한 모든 위험과 책임은 수업을 등록한 해당 회원이 부담해야 합니다. 수업이 취소되거나 중지되면, 회사는 전화 또는 메일(e-mail) 등의 방법을 통하여 해당 튜터와 수강생에게 그러한 사실을 통지합니다.</p>
						
						<p>③ 추가 정보</p>
						
						<p>(1) 튜터는 수업 등록 시 튜터가 수업정보제공고시에 따른 정보를 입력하지 않거나, 수업 등록 후 변경된 수업정보제공고시에 따라 정보를 수정, 보완하지 않는 경우 회사는 제15조 나. 7에 따라 회원자격의 정지, 서비스 제공 거부•제한 등 필요한 조치를 취할 수 있습니다.</p>
						
						<p>(2) 튜터는 등록 수업에 특별한 거래조건이 있거나, 추가수업, 장소 및 장비 대여비용 등 추가되는 비용이 있는 경우, 이를 수강생이 알 수 있도록 명확하게 기재하여야 합니다. 다만, 이러한 특별한 거래조건은 수강생의 정당한 권리를 제한하거나 이 약관을 위반하거나 기타 회사가 미리 정한 거래조건에 위배되어서는 안됩니다.</p>
						
						<p>(3) 수업은 등록 이후에도 수정이 가능합니다. 일신의 문제로 인하여 수업이 불가능한 사유가 있는 경우에는 만취남녀 앱에서 운영중지를 하거나 고객센터에게 이 사실을 알림으로써 일시적으로 수업을 중지할 수 있습니다. 수정되거나 추가된 내용이 수강생에게 불리한 경우 수정 이전에 수업을 신청한 수강생에게는 추가 내용 등록 전의 내용이 적용됩니다.</p>
						
						<p>(4) 튜터는 수업 등록을 함에 있어서 저작권, 초상권 등 제3자의 권리를 침해해서는 안 됩니다. 튜터가 등록한 수업정보는 판매 활성화를 위하여 회사가 제휴한 사이트와 다른 회원의 블로그 등에 노출될 수 있습니다. 다만, 다른 회원의 블로그 등에의 노출은 다른 회원이 회사가 정한 이용규칙에 동의하고 회사가 허용한 방식으로 공유 하는 경우에만 가능합니다.</p>
						
						<p>(5) 튜터가 튜터 본인의 계정 또는 다른 회원의 계정을 이용하여 수업 및 거래조건이 실질적으로 동일한 수업 ("동일 수업")을 둘 이상 중복하여 등록 할 수 없습니다. 이에 위반한 수업 등록에 대해 회사는 수업검색의 효율성 제고 등을 위해 일정한 절차를 거쳐 중복 등록된 수업을 등록중단 또는 삭제 처리 할 수 있고 위반 횟수 및 수준에 따라 해당 수업을 등록한 튜터의 회원자격을 정지 또는 서비스 이용을 제한하거나 추천도를 감점할 수 있습니다.</p>
						
						<p>(6) 튜터는 튜터 등록 및 수업 등록, 수정시에 튜터의 개인정보 보호, 타인의 튜터정보 악용사례 방지 및 수강생의 안전한 거래를 보장하기 위한 만취남녀 시스템이 허용하지 않는 범위의 연락처를 기입할 수 없습니다. 튜터와 수강생들의 개인정보 권리를 보호하고 만취남녀 시스템의 권리 보장을 통하지 않은 개인간 거래를 방지하기 위하여 전화번호(유선/무선), 이메일 연락처, 메신저, SNS ID등 연락처의 기재를 금합니다. 튜터 수업 상세 페이지뿐만 아니라 리뷰, 이미지/영상, 문의란 등 다른 게시판 또한 연락처를 기재 할 수 없으며 이를 위반할 시에 회사에서는 해당 문구 및 내용을 숨김 또는 삭제 처리 할 수 있고 위반 횟수 및 수준에 따라 해당 수업을 등록한 튜터의 회원자격을 정지 또는 서비스 이용을 제한 할 수 있습니다.</p>
						
						
						<h4>제13조 (수강생의 권리)</h4>
						
						<p>가. 수강생은 자신의 개인 신상정보를 보호 받을 권리가 있습니다.</p>
						
						<p>나. 수강생은 자신의 조건에 적합한 튜터를 직접 검색하고 수업을 신청할 수 있습니다.</p>
						
						<p>다. 수강생은 튜터의 개인적인 사유로 수업이 중단된 경우, 지급한 수업료 전부에 대한 금액을 튜터에게 환불 받을 수 있습니다.</p>
						
						
						<h4>제14조 (수강생의 의무)</h4>
						
						<p>가. 수강생은 관계법령, 본 약관의 규정, 이용안내 및 서비스 상에 공지한 주의사항, 당사가 통지한 사항을 준수해야 하며, 기타 회사의 업무에 방해되는 행위를 해서는 안됩니다.</p>
						
						<p>나. 수강생은 튜터의 사전 동의 없이 수업에 관한 조건(수업횟수, 수업료, 시간 등)을 일방적으로 변경할 수 없습니다.</p>
						
						<p>다. 수강생은 자신의 신상정보가 변경되었을 경우, 즉시 자신의 회원정보를 수정하여야 합니다.</p>
						
						<p>라. 튜터에게 수강생이 불쾌한 언어 사용 및 행동, 수업과 관련없는 요청/ 이상 행동에 대한 신고가 접수되는 경우 당사는 수강생에게 다음과 같은 조치를 취합니다. 단, 중대한 범죄와 관련될 수 있는 사항으로 판단되는 경우, 민/형사상 소송을 제기할 수 있으며 당사는 즉시 회원자격의 영구 탈퇴 조치를 진행할 수 있습니다.</p>
						
						<p>1) 1건 신고 접수 시: 당사에서 상황에 대해 파악한 후, 경고조치</p>
						
						<p>2건 신고 접수 시: 튜터가 확인할 수 있도록 수강생이 수강 신청한 수업신청서에 게시 및 표기</p>
						
						<p>3건 신고 접수 시: 회원 자격의 영구 정지</p>
						
						
						<h4>제15조 (당사의 권리)</h4>
						
						<p>가. 당사는 수업 연결의 신뢰도를 제고하기 위해, 튜터로부터 학생증, 재학/졸업 증명서, 주민등록증에 준하는 신분증 제출을 요구할 수 있습니다.</p>
						
						<p>나. 제 1항과 같은 목적으로 당사의 사이트에서 튜터에게 온라인상 본인인증 절차를 밟도록 할 수 있으며, 튜터는 이에 응해야 합니다.</p>
						
						<p>다. 당사는 다음과 같은 회원의 자격을 예고 없이 박탈할 수 있습니다.</p>
						
						<p>(1) 회원의 개인신상정보가 사실과 다를 경우</p>
						
						<p>(2) 가입된 정보와 실제 이용자가 다를 경우</p>
						
						<p>(3) 사이트에서 취득한 회원정보를 양도하거나 중개에 이용할 경우</p>
						
						<p>(4) 본 약관을 준수하지 않아 3회의 경고조치 이후에도 시정되지 않을 경우</p>
						
						<p>①1회 약관 위반에 대한 통보 및 시정조치 알림</p>
						
						<p>②2회 경고 조치 알림</p>
						
						<p>③ 3회 30일 회원 자격 정지</p>
						
						<p>(5) 환불 기간이 끝난 이후 튜터/수강생의 개인적인 사유로 생기는 환불 분쟁의 경우, 만취남녀 측에서는 별도의 개입과 판단 대신 약관에 명시된 환불 규정 원칙을 적용합니다.</p>
						
						<p>라. 만취남녀에서 자체 제작한 모든 컨텐츠 (사진, 영상, 웹, 뉴스 등)의 본 저작권은 제작자인 만취남녀에게 있으며, 제작한 컨텐츠들은 만취남녀의 서면동의 없이 무단배포 및 수정을 금지합니다. 허가 되지 않은 행위는 저작권 침해로 간주되며 만취남녀에서 엄격한 법적 조치를 취할 수 있습니다.</p>
						
						
						<h4>제16조 (수강생의 권리)</h4>
						
						<p>가. 당사는 본 약관 및 관계법령에 따라 본 서비스를 실시하여야 하며, 다음 각 호의 사유가 발생한 경우를 제외하고 계속적, 안정적으로 서비스를 제공하기 위해 최선의 노력을 다합니다.</p>
						
						<p>① 서비스용 설비의 보수, 정기점검 또는 공사로 인한 부득이한 경우</p>
						
						<p>② 전기통신사업법에 규정된 기간통신사업자가 전기통신 서비스를 중지한 경우</p>
						
						<p>③ 전시, 사변, 천재지변 또는 이에 준하는 국가비상사태가 발생하거나 발생할 우려가 있는 경우</p>
						
						<p>④ 설비장애 또는 이용 폭주 등으로 인하여 서비스 이용에 지장이 있는 경우</p>
						
						<p>나. 당사는 회원의 정보를 철저히 보안 유지하며, 서비스를 운영하거나 개선하는 용도로만 사용하고, 이외의 목적으로 타 기관 및 개인에게 제공하지 않습니다. 단. 다음 각 호에 해당하는 경우에는 그렇지 않습니다.</p>
						
						<p>① 관계법령에 의해 수사상의 목적으로 관계기관으로부터 요청이 있는 경우</p>
						
						<p>② 정보통신윤리위원회의 요청이 있는 경우</p>
						
						<p>③ 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우</p>
						
						
						<h4>제17조 (수업료 결제)</h4>
						
						<p>가. 수강생은 만취남녀의 안전결제서비스에 따라 결제하여야 하고, 회사는 입금정보와 환불정보를 회사에서 제공하는 양식에 따라 이용자들에게 내역을 제공합니다. 실시간 계좌이체 및 가상계좌 입금방법으로 대금을 입금하는 경우 결제금액의 오입금으로 인한 모든 위험과 책임은 수강생이 부담하여야 하고, 회사는 이에 대하여 책임을 지지 않습니다.</p>
						
						<p>나. 수강생은 신용카드로 대금을 결제할 수 있습니다. 단, 해외카드를 이용한 결제는 불가능합니다. 회사는 수강생이 제공한 회원정보가 신용카드의 명의인과 다른 경우 신용카드 결제를 거부하거나 취소할 수 있습니다. 다만, 법인카드의 경우 법인인증 확인절차를 거쳐 사용할 수 있습니다.</p>
						
						<p>다. 수업 내 다양한 커리큘럼을 기입해두고 하나의 수업료로만 결제하여 추가 결제를 받는 경우 맞춤결제 기능을 활용하여야 합니다. 즉, 기본 수업료로 설정한 금액 대신 추가 금액이 발생하는 경우에, 튜터는 수업 소개서와 실시간 톡으로 결제 전 관련 내용을 수강생에게 정확히 고지해야합니다.</p>
						
						<p>라. 수강생은 결제금액의 전부 또는 일부를 보유하고 있는 만취남녀 포인트를 사용하여 결제할 수 있습니다. 이 경우, 서비스화면의 주문정보 선택란에 사용할 포인트 결제액을 기입하고, 차액만큼만 허용된 결제방법으로 결제하면 됩니다.</p>
						
						
						<h4>제18조 (구매확정 및 수익금)</h4>
						
						<p>가. (2회차 이상의 클래스) 수강생은 최초 1시간의 수업을 가져본 후, 수정/ 취소 요청을 하지않고 수업을 지속하는 경우, 첫 결제 대금은 만취남녀 측으로 귀속 됩니다. 단, 첫 수업을 시작하기 24시간 이전에 취소요청을 하는 경우에는 결제대금이 100% 환불됩니다. 만일 첫 수업시작까지 24시간 이내에 취소 의사를 밝히거나 첫 수업 진행 후 환불을 요청하더라도 첫 수업료로 결제한 1시간의 금액은 환불 받을 수 없으며 시범강의비 명목으로 튜터에게 귀속됩니다. 마찬가지로 전체 결제를 진행한 경우에는 등록된 커리큘럼의 1시간 수업료가 차감된 금액이 환불 됩니다.</p>
						
						<p>나. (원데이클래스) 수강생이 수업을 완전히 들은 경우 또는 취소 의사를 밝히지 않고 예정된 수업 일정이 지난 경우 결제 금액은 만취남녀으로 귀속됩니다. 단, 수업을 시작하기 24시간 이전에 취소요청을 하는 경우에는 결제대금이 100% 환불됩니다. 만일 24시간 이내에 취소 의사를 밝히는 경우에는 등록된 커리큘럼의 1시간 수업료가 차감된 금액이 환불 됩니다.</p>
						
						<p>다. 수강생이 수업을 신청하는 경우, 요청한 시각으로부터 향후 12시간 이내에 안내된 만취남녀의 계좌로 첫 1시간 수업료를 카드 또는 무통장 결제하여야 합니다. 2회차 수업을 진행 이후에는 환불 요청이 있을 시에도, 만취남녀에 결제된 1시간 수업료(명목 수수료)는 환불되지 않습니다. 회사는 거래 내역, 수수료 세금계산서 발행내역, 수익금 출금내역 요청 시에 요청자에게 공개합니다. 다만, 회사는 이 약관 제11조 마. 항의 수업등록양식에 어긋난 등록, 허위등록, 판매가장등록, 신용카드결제시스템 또는 통신 과금 시스템만을 이용하기 위한 수업등록 여부를 확인하기 위하여 최고 60일까지 출금을 보류할 수 있습니다. 이 경우, 튜터가 수업에 관한 거래사실 증빙서류를 회사에 제공하는 때에는 확인 후 송금처리를 합니다.</p>
						
						<p>라. 튜터는 수업등록 시 회사 및 수강생으로부터 수익금을 수취할 계좌를 지정하여야 하며, 회사가 정하는 기준에 내에서 계좌를 변경할 수 있습니다. 튜터가 지정한 입금계좌의 예금주는 튜터와 동일인(개인회원의 경우 가입자 본인 명의)임을 원칙으로 합니다. 튜터가 지정한 입금계좌의 예금주가 튜터 가입정보와 상이한 경우 송금에 불이익을 받을 수 있으며, 해당 조건에 맞는 계좌 관련 서류증빙이 완료될 때까지 대금의 송금을 보류할 수 있습니다.</p>
						
						<p>마. 첫 수업 진행 이전 취소 가능 기간은 60일 입니다. 수강생이 입금한 날짜로부터 60일 이내에 환불, 수업교환 등의 의사를 표시하지 않고 수업의 진행여부를 최종 확정을 지연하는 경우 61일째 되는 날 자동 최종확정 처리가 되어 튜터의 계좌로 수익금이 예치됩니다. 다만 튜터와 수강생의 요청 시(긴급한 개인적 용무 등) 최종확정 기간은 연장될 수 있습니다.</p>
						
						<p>바. 튜터는 회사에 대한 수업대금채권이 있을 경우 타인에게 양도할 수 없습니다.</p>
						
						<p>사. (VOD클래스의 경우) VOD클래스는 결제 하는 순간 구매 확정이 완료됩니다.</p>
						
						
						<h4>제19조 (환불)</h4>
						
						<p>1. 2회차 이상의 클래스</p>
						
						<p>가. 첫 수업을 시작하기 24시간 이전에 취소요청을 하는 경우에는 결제대금이 100% 환불됩니다. 단, 튜터에게 먼저 취소,환불 의사를 유선,SMS등의 수단으로 통보한 후에 환불 접수가 가능합니다.</p>
						
						<p>나. 만일 첫 수업시작까지 24시간 이내에 취소 의사를 밝히거나 첫 수업 진행 후 환불을 요청하더라도 첫 수업료로 결제한 1시간의 금액은 환불 받을 수 없으며 시범강의비 명목으로 튜터에게 귀속됩니다. 마찬가지로 전체 결제를 진행한 경우에는 등록된 커리큘럼의 1시간 수업료가 차감된 금액이 환불 됩니다.</p>
						
						<p>다. 튜터와 수강생 양측은 1회 수업 후 수업을 지속하기로 결정한 이후임에도 수강생의 사정으로 수업을 중단해야 하는 경우에 한해 다음과 같은 환불 규정을 적용 합니다.</p>
						
						<p>① 튜터는 전체 등록 커리큘럼의 50%에 해당하는 시간을 진행하기 이전에는, 진행된 과외 기간을 제외한 나머지 기간에 대한 금액을 수강생에게 환불하여야 합니다.</p>
						
						<p>② 튜터는 전체 등록 커리큘럼의 50%에 해당하는 시간을 진행한 경우에는, 진행되지 않은 잔여 기간과 상관없이 환불의 의무를 지지 않습니다.</p>
						
						<p>③ 단, 튜터의 판단 하에 수강생에게 금액을 개인적으로 환불 조치 하는 것은 가능하며 이에 대해서는 만취남녀 측에서 관여하지 않습니다.</p>
						
						<p>④ 수강생이 튜터에게 문제가 있다고 판단하여 수업 진행 및 환불을 요청하는 경우, 만취남녀 측에서는 개입할 수 있으며 이에 대한 사유 확인과 수업 과정상에 문제는 없었는지 여부를 확인 합니다. 즉, 수업 진행상의 불쾌감 조성, 준비 소홀, 협박, 폭행, 추행, 불법적인 회유 등의 튜터의 의무에 맞지 않는 행위를 확인하여, 해당 사실이 발견되는 형사 고발 및 법적인 조치를 가할 수 있습니다. 또한, 튜터의 회원자격을 정지 또는 서비스 이용을 제한하는 조치를 취할 수 있습니다.</p>
						
						<p>⑤ 약관에 규정된 회사의 만취남녀안전결제서비스가 종료된 후 수업의 환불 등과 관련하여 튜터와 수강생 사이에 분쟁 등이 발생한 경우 원칙상 관련 당사자간에 해결을 우선시하며, 상호 합의 이후 회사는 이에 대한 책임을 보증하지 않습니다.</p>
						
						
						<p>라. 튜터 개인의 사정으로 인해 수업을 중단해야 하는 경우는 다음과 같습니다.</p>
						
						<p>① 커리큘럼이 남아 있음에도 불구하고, 수업을 중단하는 경우 그 시기와 상관없이 튜터는 수업료로 받은 모든 금액을 튜터에게 환불 하여야 합니다.</p>
						
						<p>② 1시간 분의 선 결제 수수료는 환불되지 않습니다.</p>
						
						<p>③ 튜터의 개인 사정은 건강상의 이유, 취직, 외국으로의 유학 등 모든 사항에 대해 예외를 두지 않습니다.</p>
						
						<p>④ 단, 튜터가 수강생에게 문제가 있다고 판단하여 수업 진행 및 환불을 거부하는 경우, 만취남녀 측에서는 개입할 수 있으며 이에 대한 사유 확인과 수업 과정상에 문제는 없었는지 여부를 확인 합니다. 즉, 수업 진행상의 불쾌감 조성, 협박, 폭행, 추행, 불법적인 회유 등의 범죄에 준하는 행위를 확인하여, 해당 사실이 발견되는 즉시 형사 고발 및 법적인 조치를 가할 수 있습니다. 또한, 수강생의 회원자격을 정지 또는 서비스 이용을 제한하는 조치를 취할 수 있습니다.</p>
						
						<p>⑤ 튜터와 수강생간의 협의 하에 수강생이 남은 수업 분의 수업료만 튜터분에게 환불 조치 해드리는 것은 가능하며, 이에 대해서는 만취남녀 측에서 관여하지 않습니다 다. 튜터의 귀책 사유로 다수의 수강생의 취소 및 환불요청이 발생하는 경우, 또는 동일 중분류 카테고리 내 타 수업보다 환불요청이 현저히 높은 경우 회사는 튜터의 등록 제한, 인기도 감소 등의 페널티를 부과할 수 있습니다.</p>
						
						
						<p>2. 원데이 클래스의 경우</p>
						
						<p>가. 수업을 시작하기 24시간 이전에 취소요청을 하는 경우에는 결제대금이 100% 환불됩니다. 만일 수업 시작 24시간 이내에 취소 의사를 밝히는 경우에는 등록된 커리큘럼의 1시간 수업료가 차감된 금액이 환불 됩니다.</p>
						
						<p>나. 수업을 들었거나 예정된 수업 일정이 지난 경우, 결제 금액은 전액 환불되지 않습니다.</p>
						
						<p>다. 수업 등록 페이지 및 상호 합의/조정한 커리큘럼 전체의 수업을 튜터가 이행한 경우, 다음과 같은 환불 규정을 적용 합니다.</p>
						
						<p>① 튜터는 커리큘럼 상의 수업을 이행 했으므로 환불이 불가능 합니다.</p>
						
						<p>② 단, 수업 상 문제가 있었다고 판단될 시, 상호 합의 하에 수강생에게 금액을 개인적으로 환불 조치 하는 것은 가능하며 이에 대해서는 만취남녀 측에서 관여하지 않습니다.</p>
						
						<p>③ 만일, 수강생이 튜터에게 문제가 있다고 판단하여 수업 진행 및 환불을 요청하는 경우, 만취남녀 측에서는 개입할 수 있으며 이에 대한 사유 확인과 수업 과정상에 문제는 없었는지 여부를 확인 합니다. 즉, 수업 진행상의 불쾌감 조성, 준비 소홀, 협박, 폭행, 추행, 불법적인 회유 등의 튜터의 의무에 맞지 않는 행위를 확인하여, 해당 사실이 발견되는 경우 형사 고발 및 법적인 조치를 가할 수 있습니다. 또한, 튜터의 회원자격을 정지 또는 서비스 이용을 제한하는 조치를 취할 수 있습니다.</p>
						
						<p>④ 약관에 규정된 회사의 만취남녀안전결제서비스가 종료된 후 수업의 환불 등과 관련하여 튜터와 수강생 사이에 분쟁 등이 발생한 경우 원칙상 관련 당사자간에 해결을 우선시하며, 상호 합의 이후 회사는 이에 대한 책임을 보증하지 않습니다.</p>
						
						
						<p>3. VOD 클래스의 경우</p>
						
						<p>가. VOD클래스의 경우 컨텐츠 수업내용의 불만족에 의한 사유로는 환불이 불가합니다.</p>
						
						<p>나. 수업을 결제 후, 3일 이내에 영상이 정상적으로 출력되지 않는 경우, 만취남녀의 기술팀이 동시에 해당 문제점을 확인하며 만취남녀 플랫폼에 중대한 문제가 있다고 판단되는 경우 전액 환불 됩니다. 만취남녀의 기술팀이 직접 수강생분과 온라인, 오프라인으로 연결하여 문제점을 확인합니다.</p>
						
						<p>다. 시스템 오류에 대한 거짓된 정보에 의한 환불 사유 요구는 민사처벌의 대상이 될 수 있습니다.</p>
						
						
						<h4>제20조 (면책조항)</h4>
						
						<p>가. 당사는 수강생과 튜터의 독립적이고 자발적인 의사에 따라 수업을 신청, 협의, 결정할 수 있도록 사전에 동의한 정보와 방식으로 중개업무를 하고 있습니다. 만취남녀은 회원이 등록한 정보에 대한 사실의 정확성과 신뢰성을 확보하기 위해 학력 인증, 신분증 인증, 경력 인증에 대해 정확히 인증 자료를 확보하고 이를 서비스 내에 표시합니다. 이에 대한 허위 정보 보증은 만취남녀에게 책임이 있으며 만취남녀의 허위 신분증과 자격증을 보증한 경우 만취남녀의 귀책으로 간주합니다. 다만 국가공인 자격증과 같이 명확히 시기와 보증번호 등을 확인할 수 없는, 인성, 업무 경험 등과 같은 정성적인 부분에 대한 정보에 대한 보증을 하지 않습니다. 따라서 이로 인해 발생하는 정신적인 피해 및 손해 등에 대해서는 책임을 지지 않습니다.</p>
						
						<p>나. 당사는 수강생과 튜터와의 수업방식, 결제방식, 환불 규정들은 만취남녀의 각 약관 규정들을 따르나, 상호간의 협의 사항이 있는 경우에는 규정이 면칙 될 수 있도록 우선순위를 두고 있습니다. 또한 약관과 다르게 수업을 진행한다는 상호 협의가 있는 경우 이로 인해 발생하는 분쟁과 관련한 책임은 당사자들이 지며, 당사는 당사의 고의 또는 중과실이 없는 한 책임이 없습니다.</p>
						
						<p>다. 당사는 천재지변 또는 이에 준하는 불가항력으로 인해 서비스를 제공할 수 없는 경우에는 서비스 제공에 관한 책임이 면제됩니다. 또한 서비스 제공의 지연이나 서비스를 제공하지 못하거나 또는 고객정보가 유출된 경우 당사의 고의 또는 과실이 없는 한 책임을 지지 않습니다.</p>
						
						<p>라. 당사는 이용자의 귀책사유로 인해 서비스 이용의 장애가 발생한 경우에는 당사의 고의 또는 중과실이 없는 한 당사의 책임은 면제됩니다.</p>
						
						<p>마. 본 약관의 규정을 위반함으로 인해 회사에 손해가 발생하는 경우, 이 약관을 위반한 이용자는 회사에 발생되는 손해를 배상할 책임이 있습니다. 또한 회사가 약관을 위반한 이용자로 인해 제3자에게 손해를 배상한 경우 배상 청구 할 수 있습니다.</p>
						
						
						<h4>제21조 (회원자격의 박탈)</h4>
						
						<p>가. 다음 각 호에 해당하는 경우 사전 통보 없이 강제탈퇴 하거나, 이용을 중지할 수 있습니다.</p>
						
						<p>① 공공질서 및 미풍양속에 반하는 경우</p>
						
						<p>② 범죄적 행위에 관련되는 경우</p>
						
						<p>③ 국익 또는 사회적 공익을 저해할 목적으로 서비스 이용을 계획 또는 실행할 경우</p>
						
						<p>④ 타인의 계정 및 비밀번호를 도용한 경우</p>
						
						<p>⑤ 타인의 명예를 손상시키거나 불이익을 주는 경우</p>
						
						<p>⑥ 같은 사용자가 다른 계정으로 이중 등록을 한 경우</p>
						
						<p>⑦ 회사 직원 및 운영자 등을 포함한 타인을 사칭하기 위해 등록을 한 경우</p>
						
						<p>⑧ 서비스에 위해를 가하는 등 건전한 이용을 저해하는 경우</p>
						
						<p>⑨ 기타 관련 법령이나 회사가 정한 이용조건에 위배되는 경우</p>
						
						<p>나. 튜터가 수업을 이행하지 않고 일방적으로 계약을 파기하고 수강생에게 수업료를 환불하지 않을 경우, 당사는 해당 선생님의 회원자격을 박탈함과 동시에 관계법령에 의해 튜터를 고소, 고발하는 등의 조치를 취할 수 있으며, 피해자가 고소, 고발 조치를 취한 경우 당사는 적극 협조합니다.</p>
						
						<p>다. 만취남녀 사이트는 수강생과 튜터 간의 수업 연결 및 만취남녀의 서비스를 제공받기 위한 모 목적으로만 이용이 가능하며, 사교육 기관이 수강생을 모집하거나 광고 등에 상업적으로 이용할 경우 예고 없이 회원자격을 박탈합니다.</p>
						
						<p>라. 타인에게 계정 공유, 기타 상업 및 비상업적으로 서비스 이용 시 회원등록 취소 및 강제탈퇴 처리되며, 당사의 운영상의 영업방해 및 이미지 훼손에 대한 손해배상과 개인정보 무단수집에 대한 모든 민/형사적 책임을 집니다.</p>
						
						
						<h4>제22조 (분쟁의 해결)</h4>
						
						<p>가. 당사와 이용자는 서비스와 관련하여 발생한 분쟁을 원만하게 해결하기 위해 서로 필요한 노력을 해야 합니다. 나. 제 1항의 규정에도 불구하고, 동 분쟁으로 인해 소송이 제기될 경우 소송은 상호 합의 하에 정한 소재 법원으로 합니다. 상호 합의점이 도출되지 않는 경우, 민사상에서 정하는 관할 법원으로 합니다.</p>
						
						
						<p>부칙</p>
						
						<p>이용약관 내용 추가, 삭제 및 수정이 있을 시에는 개정일로부터 7일전, 회원의 권리 의무에 중대한 영향을 미치는 중요한 사항의 변경인 경우에는 30일 전에 만취남녀사이트 공지사항, 이메일등을 통해 고지합니다.</p>
						
						공고일자 : 2019년 09월 21일<br>
						시행일자 : 2019년 09월 24일
									     	 </div>
									      </div>
									      <div class="modal-footer">
									        <button type="button" class="btn btn-outline-primary" data-dismiss="modal" id="cbChecked1">동의</button>
									      </div>
									    </div>
									  </div>
									</div>
									<!-- 개인정보 취급 방침 -->
									<div class="modal fade" id="exampleModalCenter2" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
									  <div class="modal-dialog modal-dialog-centered" role="document">
									    <div class="modal-content">
									      <div class="modal-header">
									        <h5 class="modal-title" id="exampleModalLongTitle">개인정보 취급방침</h5>
									        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
									          <span aria-hidden="true">&times;</span>
									        </button>
									      </div>
									      <div class="modal-body">
									      <div class="scrolldiv">
						<p>만취남녀(이하 “회사”)는 회사가 운영하는 인터넷 사이트를 이용하는 이용자님들의 개인정보를 매우 중요하게 생각하며 아래와 같은 개인 정보취급방침을 가지고 있습니다. 이 개인정보취급방침은 개인정보와 관련한 법령 또는 지침의 변경이 있는 경우 갱신되고, 정책의 변화에 따라 달라질 수 있으니 이용자께서는 만취남녀를 방문 시 수시로 확인하여 주시기 바랍니다. 회사의 개인정보취급방침은 다음과 같은 내용을 담고 있습니다.</p>
						
						<p>회사는 이용자에게 본인확인, 결제 서비스, 다양하고 편리한 인터넷 서비스를 제공하기 위하여 아래의 방법을 통해 개인정보를 수집하고 있습니다.</p>
						
						
						<p>가. 개인정보 수집항목</p>
						
						- 성명, 출생년도, 지역, 성별, 비밀번호, 휴대전화번호, E-Mail, 계좌번호
						
						<p>나. 서비스 이용과정 및 사업 처리과정에서 수집될 수 있는 개인정보의 범위</p>
						
						- 서비스 이용기록, 접속 로그, 쿠키, 접속IP정보, 결제기록, 이용정지 기록
						
						<p>다. 개인정보의 수집방법</p>
						
						- 회사는 이용자가 사이트 가입시 개인정보보호정책과 이용약관의 각각의 내용에 대해 ‘동의’ 또는 ‘동의하지 않는다’버튼
						  을 클릭할 수 있는 절차를 마련하여, ‘동의’버튼을 클릭한 경우 개인정보 수집에 대해 동의한 것으로 봅니다.
						
						<p>라. 허위 정보 입력 시 회사의 조치</p>
						
						- 고객은 자신의 정보에 대해 정확성 및 적법성을 보장해야 합니다. 만약 이를 위반하여 타인의 정보를 도용하는 등 각종 방법으로 허위 정보를 입력할 경우 회사는 해당
						  고객을 관계법령에 따라 신고 할 수 있으며 강제 탈퇴를 시킬 수도 있습니다.
						
						
						
						<p>[목차]</p>
						
						0. 개인정보 수집에 대한 동의<br>
						1. 개인정보의 수집 및 이용 목적<br>
						2. 개인정보의 보유 및 이용기간<br>
						3. 개인정보의 파기절차 및 방법<br>
						4. 개인정보의 제3자 제공 및 공유<br>
						5. 개인정보의 처리 위탁<br>
						6. 회원의 권리와 그 행사방법<br>
						7. 회원의 의무<br>
						8. 링크사이트<br>
						9. 개인정보 자동수집 장치(쿠키 등)의 설치, 운영 및 그 거부에 관한 사항<br>
						10.개인정보의 기술적/관리적 보호 대책<br>
						11. 개인정보보호책임자<br>
						12. 개인정보처리방침의 개정과 그 공지<br>
						
						
						
						<p>0. 개인정보 수집에 대한 동의</p>
						
						<p>회사는 이용자들이 회사의 개인정보 취급방침 또는 이용약관의 내용에 대하여 「동의」버튼 또는 「취소」버튼을 클릭할 수 있는 절차를 마련하여, 「동의」버튼을 클릭하면 개인정보 수집에 대해 동의한 것으로 봅니다.</p>
						
						
						<p>1. 개인정보 수집 및 이용 목적</p>
						
						<p>"개인정보"라 함은 생존하는 개인에 관한 정보로, 성명, 이메일 주소, 전화번호 등 개인을 식별할 수 있는 정보를 말합니다. 대부분의 만취남녀 서비스는 별도의 사용자 등록 없이 언제든지 볼 수 있습니다. 그러나 회사는 회원서비스(이벤트 생성과 같이 현재 제공 중이거나 향후 제공될 로그인 기반의 서비스)등을 통하여 이용자들에게 맞춤식 서비스를 비롯한 보다 더 향상된 양질의 서비스를 제공하기 위하여 이용자 개인의 정보를 수집하고 있습니다. 회사는 이용자의 사전 동의 없이는 이용자의 개인 정보를 공개하지 않으며, 수집된 정보는 아래와 같이 이용하고 있습니다.</p>
						
						<p>첫째, 이용자들의 개인정보를 기반으로 보다 더 유용한 서비스를 개발할 수 있습니다. 회사는 신규 서비스개발이나 콘텐츠의 확충 시에 기존 이용자들이 회사에 제공한 개인정보를 바탕으로 개발해야 할 서비스의 우선 순위를 보다 더 효율적으로 정하고, 회사는 이용자들이 필요로 할 콘텐츠를 합리적으로 선택하여 제공할 수 있습니다.</p>
						
						<p>둘째, 회사가 제공하는 각종 정보 및 서비스 등은 대부분 무료입니다. 회사는 이러한 무료 서비스를 제공하기 위해 광고를 유치할 수 있으며 이때 이용자들에 대한 정확한 개인정보를 바탕으로 각 서비스나 메뉴 등에 적절하게 광고와 내용들을 전달할 수 있습니다. 회사는 광고주들로부터 광고를 받아 광고주들이 대상으로 하려는 이용자의 유형에 맞게 광고를 보여줄 뿐, 광고주들에게는 절대로 이용자들의 개인정보를 보여주거나 제공하지 않습니다.</p>
						
						<p>셋째, 회사가 제공하는 서비스의 원활한 이용을 위하여 회원은 적법한 동의절차를 거쳐 SNS 업체가 연결을 위한 정보를 회사에 제공하도록 할 수 있습니다. 회사는 연결된 SNS를 원활한 서비스 제공을 위해 사용자에게서 권한이 허락된 범위 안에서 이를 활용할 수 있으며, 허락되지 않은 범위에 대해서는 절대 활용하지 않습니다. 서비스 이용을 위하여 회원으로부터 추가적인 권한의 요청을 필요로 할 경우, 각 SNS의 인증서비스를 통하여 이에 대한 사전 동의를 반드시 구할 것입니다.</p>
						
						<p>넷째, 회원구분에 따라서 다음의 목적을 위해서 회원정보를 수집, 이용하고 있습니다.</p>
						
						<p>가. 모든 회원공통</p>
						
						필수 : 성명, 출생년도, 직업, 지역, 관심재능, 성별, 비밀번호, 휴대전화번호, E-Mail<br>
						선택 : 이용정보 - 홈페이지, SNS 정보 (페이스북, 네이버 등), 계좌번호<br>
						
						<p>나. 튜터 (개인)</p>
						
						필수 : 결제 정산용 계좌번호, E-MAIL, 휴대전화<br>
						
						<p>다. 수강생 회원</p>
						
						필수 : 정산정보 - 환불에 필요한 계좌번호(환불시)<br>
						기타 : 튜터가 추가로 요구하는 정보<br>
						
						
						<p>다섯째, 기타 이용과정이나 사업처리 과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.</p>
						<p>  -서비스 이용기록, 접속 로그, 쿠키, 접속IP 정보, 결제기록 : 부정 이용 방지, 비인가 사용 방지 등</p>
						
						<p>여섯째, 회원님의 기본적 인권 침해의 우려가 있는 민감정보(범죄경력, 유전정보 등)를 수집하지 않습니다.</p>
						
						<p>일곱째, 회원님이 제공하신 모든 정보는 상기 목적에 필요한 용도 이외로는 사용되지 않으며, 수집정보의 범위나 사용목적, 용도가 변경될 시에는 반드시 회원님들께 사전동의를 구할 것 입니다.</p>
						
						<p>위 정보는 가입 당시 정보만 아니라 정보수정으로 변경된 정보를 포함 합니다.</p>
						
						
						<p>2. 개인정보의 보유 및 이용기간</p>
						
						<p>회사는 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 개인정보를 지체 없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존 합니다.</p>
						
						- 보존 항목 : 쿠키, 세션<br>
						- 보존 근거 : 회사의 서비스이용약관 및 개인정보취급방침에 동의<br>
						- 보존 기간 : 로그아웃 시 삭제<br>
						  그리고 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 아래와 같이 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다.<br>
						- 보존 항목 : 이름, E-MAIL, 휴대전화번호, 비밀번호, 이용정보, 정산정보<br>
						- 보존 근거 : 회사의 서비스이용약관 및 개인정보취급방침에 동의<br>
						- 보존 기간: 회원으로서의 자격을 유지하는 동안<br>
						
						<p>[기타]</p>
						
						<p>1) 계약 또는 청약철회 등에 관한 기록</p>
						  - 보존근거 : 전자상거래 등에서의 소비자보호에 관한 법률<br>
						  - 보존기간: 5년<br>
						  (수업 신청 정보는 계약 정보에 해당 합니다. )<br>
						
						<p>2) 대금결제 및 재화 등의 공급에 관한 기록</p>
						  - 보존근거 : 전자상거래 등에서의 소비자보호에 관한 법률<br>
						  - 보존기간 : 5년<br>
						
						<p>3) 소비자의 불만 또는 분쟁처리에 관한 기록</p>
						  - 보존근거 : 전자상거래등에서의 소비자보호에 관한 법률<br>
						  - 보존기간 : 3년<br>
						
						<p>4) 웹사이트 방문기록</p>
						  -보존근거 : 통신비밀보호법<br>
						  -보존기간 : 3개월<br>
						
						
						<p>3. 개인정보의 파기절차 및 방법</p>
						
						<p>회원님의 개인정보는 원칙적으로 개인정보의 수집 및 이용목적이 달성되면 지체 없이 파기합니다.</p>
						
						<p>가. 파기절차</p>
						  - 회원님이 회원가입 등을 위해 입력한 정보는 목적이 달성된 후 별도의DB로 옮겨져(종이의 경우 별도의 서류함) 내부 방침 및 기타 관련 법령에 의한 정보보호
						  사유에 따라(보유 및 이용기간 참조) 일정 기간 저장된 후 파기됩니다.<br>
						  - 별도DB로 옮겨진 개인정보는 법률에 의한 경우를 제외하고는 다른 목적으로 이용되지 않습니다.<br>
						
						<p>나. 파기방법</p>
						  - 종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다.<br>
						  - 전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.<br>
						
						
						<p>4. 개인정보의 제3자 제공 및 공유</p>
						
						<p>가. 회사는 회원님의 개인정보를 제1조에서 고지한 범위 내에서 사용하며, 회원님의 사전 동의 없이는 동 범위를 초과하여 이용하거나 원칙적으로 이용자의 개인정보를 제3자에게 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.</p>
						- 이용자들이 사전에 공개 또는 제3자 제공에 동의한 경우<br>
						- 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우<br>
						
						<p>나. 회사가 제공하는 서비스를 통하여 주문 및 결제가 이루어진 경우 상담 등 거래 당사자간 원활한 의사소통과 배송 및 모임 등 거래이행을 위하여 관련된 정보를 필요한 범위 내에서 거래 당사자에게 제공합니다.</p>
						
						
						<p>5. 개인정보의 처리 위탁</p>
						
						<p>회사는 서비스 향상을 위해서 아래와 같이 개인정보를 위탁하고 있으며, 관계 법령에 따라 위탁계약 시 개인정보가 안전하게 관리될 수 있도록 필요한 사항을 규정하고 있습니다. 현재 회사의 개인정보 위탁처리 기관 및 위탁업무 내용은 다음과 같습니다.</p>
						
						수탁자	위탁업무	개인정보의 보유 및 이용기간<br>
						나이스정보통신㈜	전자결제대행	회원탈퇴 시 혹은 위탁계약 종료시 까지<br>
						바다정보	SMS 발송	회원탈퇴 시 혹은 위탁계약 종료시 까지<br>
						
						
						<p>6. 회원의 권리와 그 행사방법</p>
						
						<p>가. 회원님은 언제든지 등록되어 있는 본인의 개인정보를 조회하거나 수정할 수 있으며 회원 탈퇴 절차를 통하여 개인정보 이용에 대한 동의 등을 철회할 수 있습니다.</p>
						
						<p>나. 개인정보의 조회/수정을 위해서는 사이트의 [마이페이지]내의 [회원정보수정] 항목에서 확인 가능하며, 가입 해지(동의철회)는 만취남녀센터로 연락하면 회사에서 요청사항에 대해 처리합니다. 이 외에도 회사의 개인정보 보호책임자에게 서면, 전화 또는 이메일로 연락하여 열람/수정/탈퇴를 요청하실 수 있습니다.</p>
						
						<p>다. 회원님이 개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까지 당해 개인정보를 이용 또는 제공하지 않습니다. 회사는 회원님의 요청에 의해 해지 또는 삭제된 개인정보는 제2조에 명시된 바에 따라 처리하고 그 외의 용도로 열람 또는 이용할 수 없도록 처리하고 있습니다.</p>
						
						
						<p>7. 회원의 의무</p>
						
						<p>가. 회원님의 개인정보를 최신의 상태로 정확하게 입력하시기 바랍니다. 회원님의 부정확한 정보입력으로 발생하는 문제의 책임은 회원님 자신에게 있으며, 타인의 주민등록번호 등 개인정보를 도용하여 서비스 이용 시 회원자격 상실과 함께 주민등록법에 의거하여 처벌될 수 있습니다.</p>
						
						<p>나. 회원님은 개인정보를 보호받을 권리와 함께 스스로를 보호하고 타인의 정보를 침해하지 않을 의무도 가지고 있습니다. 아이디, 비밀번호를 포함한 회원님의 개인정보가 유출되지 않도록 조심하시고 게시물을 포함한 타인의 개인정보를 훼손하지 않도록 유의해 주십시오.</p>
						
						<p>다. 회원님은 『정보통신망이용촉진및정보보호등에관한법률』, 개인정보보호법, 주민등록법 등 기타 개인정보에 관한 법률을 준수하여야 합니다.</p>
						
						
						<p>8. 링크사이트</p>
						
						<p>회사는 회원님께 다른 회사의 웹사이트 또는 자료에 대한 링크를 제공할 수 있습니다. 이 경우 회사는 외부웹사이트 및 자료에 대한 아무런 통제권이 없으므로 그로부터 제공받는 서비스나 자료의 유용성에 대해 책임질 수 없으며 보증할 수 없습니다. 회사가 포함하고 있는 링크를 통하여 타 웹사이트의 페이지로 옮겨갈 경우 해당 웹사이트의 개인정보처리방침은 회사와 무관하므로 새로 방문한 웹사이트의 정책을 검토해보시기 바랍니다.</p>
						
						
						<p>9. 개인정보 자동수집 장치(쿠키 등)의 설치, 운영 및 그 거부에 관한 사항</p>
						
						<p>가. 쿠키 사용</p>
						
						<p>회사는 회원님들에게 보다 적절하고 유용한 서비스를 제공하기 위하여 회원님의 정보를 수시로 저장하고 불러오는 ‘쿠키(cookie)’를 사용합니다. 쿠키란 회사의 웹사이트를 운영하는데 이용되는 서버가 회원님의 컴퓨터로 전송하는 아주 작은 텍스트 파일로서 회원님의 컴퓨터 하드디스크에 저장됩니다. 회원님께서는 쿠키의 사용여부에 대하여 선택하실 수 있습니다. 단, 쿠키를 사용하지 않아 생기는 서비스 사용의 문제 및 제한은 회사가 책임 지지 않습니다.</p>
						
						<p>나. 쿠키 설정 거부 방법</p>
						
						<p>회원님은 사용하시는 웹 브라우저의 옵션을 설정함으로써 모든 쿠키를 허용하거나 쿠키를 저장할 때마다 확인을 거치거나, 모든 쿠키의 저장을 거부할 수 있습니다. 단, 쿠키의 저장을 거부할 경우 로그인이 필요한 일부 서비스의 이용에 제한이 생길 수 있음을 양지하시기 바랍니다.</p>
						
						- 쿠키 설치 허용 여부를 지정하는 방법(Internet Explorer의 경우)
						
						<p>1) [도구] 메뉴에서[인터넷 옵션]을 선택</p>
						
						<p>2) [개인정보]를 클릭</p>
						
						<p>3) [고급]을 클릭</p>
						
						<p>4) 쿠키 허용여부를 선택</p>
						
						
						<p>10. 개인정보의 기술적/관리적 보호 대책</p>
						
						<p>회사는 회원님의 개인정보를 보호하기 위하여 다음과 같은 보호 대책을 시행하고 있습니다.</p>
						
						<p>가. 비밀번호의 암호화</p>
						
						<p>회원님의 비밀번호는 암호화되어 저장 및 관리되고 있습니다. 비밀번호는 오직 회원 본인만이 알 수 있으며 개인정보를 확인 및 변경할 경우에도 비밀번호를 알고 있는 본인에 의해서만 가능합니다. 따라서 회원님의 비밀번호가 타인에게 알려지지 않도록 각별히 주의하시기 바랍니다.</p>
						
						<p>나. 해킹 및 컴퓨터 바이러스 등에 대비</p>
						
						<p>회사는 해킹이나 컴퓨터 바이러스에 의하여 회원님들의 개인정보가 유출되거나 훼손되는 것을 막기 위하여 필요한 보안조치를 이용하고 있으며, 더욱 향상된 보안조치를 확보할 수 있도록 가능한 모든 기술적 방법을 구비하기 위하여 노력하고 있습니다.</p>
						
						<p>다. 개인정보 처리자의 제한 및 교육 회사는 개인정보를 처리하는 직원을 최소한으로 제한하고 있으며, 관련 직원들에 대한 교육을 수시로 실시하여 본 방침의 이행 및 준수여부를 확인하고 있습니다.</p>
						
						
						<p>11. 개인정보보호책임자</p>
						
						<p>회원님의 개인정보를 보호하고 개인정보와 관련된 불만 등을 처리하기 위하여 회사는 고객서비스담당 부서 및 개인정보보호책임자를 두고 있습니다. 회원님의 개인정보와 관련한 문의사항은 아래의 고객서비스담당 부서 또는 개인정보보호책임자에게 연락하여 주시기 바랍니다.</p>
						
						<p>□ 고객서비스담당 부서: 만취남녀센터</p>
						
						<p>전화번호: 02-454-4544</p>
						
						<p>이메일: info@iei.or.kr</p>
						
						<p>□ 개인정보보호책임자 성명: 최성락</p>
						
						<p>소속/직위: 기획 이사</p>
						
						<p>전화번호: 02-546-4455</p>
						
						<p>이메일: soomin33333@gmail.com</p>
						
						<p>기타 개인정보침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다.</p>
						1. 개인분쟁조정위원회(www.1336.or.kr/1336)<br>
						2. 정보보호마크인증위원회(www.eprivacy.or.kr/02-580-0533~4)<br>
						3. 대검찰청 인터넷범죄수사센터(icic.sppo.go.kr/02-3480-3600)<br>
						4. 경찰청 사이버테러대응센터(www.ctrc.go.kr/02-392-0330)<br>
						
						
						<p>12. 개인정보처리방침의 개정과 그 공지</p>
						
						<p>본 방침은 2018년 09월 21일부터 시행됩니다. 본 개인정보 처리방침이 변경될 경우 회사는 변경 내용을 그 시행일 7일 전부터 사이트를 통하여 공지할 예정입니다.</p>
						
						
						<p>부칙</p>
						
						이용약관 내용 추가, 삭제 및 수정이 있을 시에는 개정 최소 7일 전부터 만취남녀 사이트의 공지사항을 통해 고지합니다.<br>
						사전에 공지가 없었을 경우 공지일자(공고일자)로부터 7일 후부터 효력이 발생합니다.<br>
						<br>
						공고일자 : 2019년 9월 21일<br>
						시행일자 : 2018년 9월 24일<br>
			      </div>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-outline-primary" id="cbChecked2" data-dismiss="modal">동의</button>
			      </div>
			    </div>
			  </div>
			</div>
			 <!-- 체크박스 스크립트 -->
            <script>
            $(document).ready(function(){
			    $("#checkall").click(function(){
			        if($("#checkall").is(":checked")){
			            $(".chk").prop("checked", true);
			        } else {
			            $(".chk").prop("checked", false);
			        }
			    });
				$(".chk").click(function(){
					if($("input[name='chk']:checked").length == 2){
				    	$("#checkall").prop("checked", true);
				    } else {
				    	$("#checkall").prop("checked", false);
				    }
				});
				
				$("#cbChecked1").click(function(){
					$("#chk1").prop("checked", true);
					if($("input[name='chk']:checked").length == 2){
				    	$("#checkall").prop("checked", true);
				    } 
				});
				
				$("#cbChecked2").click(function(){
					$("#chk2").prop("checked", true);
					if($("input[name='chk']:checked").length == 2){
				    	$("#checkall").prop("checked", true);
				    } 
				});
			});
			</script>
			<hr>
			<div class="acenter">
			<button type="button" onclick="signUp();" class="btn btn-outline-primary">가입하기</button>
			<button type="button" class="btn btn-outline-danger" onclick="reset();">취소하기</button>
			</div>
			<script>
			function signUp(){
				Form = document.form;
				var name = $("#m_name").val();
				var email = $("#email").val();
				var phone = $("#phone").val();
				var postNum = $("#sample4_postcode").val();
				var daddress = $("#sample4_detailAddress").val();
				if($("#check1").val() == 0){
					alert("아이디를 확인해주세요.");
					$("#m_id").focus();
					return false;
				} else if ($("#check2").val() == 0) {
					alert("비밀번호를 확인해주세요.");
					$("#m_pw").focus();
					return false;
				} else if(name == "") {
					alert("이름을 입력해주세요.");
					$("#m_name").focus();
					return false;
				} else if(email == "") {
					alert("이메일을 입력해주세요.");
					$("#eamil").focus();
					return false;
				} else if(phone == "") {
					alert("전화번호를 입력해주세요.");
					$("#phone").focus();
					return false;
				} else if($("#checkr").val() == 0) {
					alert("휴대전화 인증을 완료해주세요.");
					return false;
				} else if(postNum == "" || daddress == "") {
					alert("주소를 입력해주세요.");
					$("#sample4_detailAddress").focus();
					return false;
				} else if($("#check3").val() == 0) {
					alert("이메일을 확인해주세요");
					return false;
				} else if($("input[name='chk']:checked").length < 2) {
					alert("모든 약관에 동의해주세요.");
					$("#checkall").focus();
					return false;
				} else {
					$(Form).submit();
					window.parent.location.href='${contextPath}';
				}
			}
			</script>
			</form>
		</div>
	</div>
</div>
</body>
</html>