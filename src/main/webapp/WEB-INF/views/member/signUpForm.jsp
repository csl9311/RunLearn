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
	width: 450px;
	height: 200px;
}

.acenter{
	text-align:center;
	padding-top: 50px;
}

.text-muted{
	padding-left: 10px;
	font-size: 14px;
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

.pnc{
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
	<div class="py-5 text-center">사진
		<h4 class="header">회원가입</h4>
	</div>

	<div class="row justify-content-md-center">
		<div class="dd col-md-auto mx-auto">
			<hr>
			<form action="minsert.do" method="post" name="form" enctype="Multipart/form-data">
				<div class="form-group">
					<p class="title-f"><em class="color-red">* </em>아이디</p>
					<input type="text" class="form-control" id="m_id" name="m_id" placeholder="아이디">
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
					<input type="text" class="form-control" id="email" name="m_email" placeholder="email333@naver.com"> 
					<span id="np" class="fontA"></span>
				</div>
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
							data: {m_phone: m_phone},
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
            <input type="checkbox" id="checkall">
	            <label>
	           		이용약관 전체동의
	            </label>
            </div>
            <hr>
        	<div>
            <input type="checkbox" class="chk" name="chk" id="chk1">
           	<a data-toggle="modal" data-target="#exampleModalCenter"><label class="clickm">이용약관 필수 동의</label></a>
            </div>
			<div>
            <input type="checkbox" class="chk" name="chk" id="chk2">
           	<a data-toggle="modal" data-target="#exampleModalCenter2"><label class="clickm">개인정보 취급방침 필수 동의</label></a>
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
			     		 ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ
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
			     	 ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ
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
					alert("휴대전화 인증을 완료해주세요.")
				} else if(postNum == "" || daddress == "") {
					alert("주소를 입력해주세요.");
					$("#sample4_detailAddress").focus();
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