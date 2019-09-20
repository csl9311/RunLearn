<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath"
	value="${pageContext.request.contextPath}/resources/css"
	scope="application" />
<!DOCTYPE html>
<html>
<head>
<style>


</style>
<meta charset="UTF-8">
<link rel="stylesheet" href='${ contextPath }/product/product.css'>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>
<c:import url="../common/header.jsp" />
<body>

	
	<div style="height:50vh;">
		<div class="content center">
			<div class="row">
				<form id="auto" action="payment.save" method="post">
					
					<div>
						<input type="radio" name="method" value="basicAddress" checked><label>기존 주소 사용</label>
					</div>
					
					<div>
						<input type="radio" name="method" value="newAddress"><label>새로운 주소 등록</label>
						<div id="newAddress" style="display:none;" >
							<table class="table">
								<tr>
									<td style="text-align: right; width: 45vw;"><label>우편번호 : </label></td>
									<td style="text-align: left; width: 55vw;">
										<input type="text" id="sample4_postcode" placeholder="우편번호" name="postnum" onclick="btnClick();" value="${ map.m.postnum }">
										<input id="findBtn" type="button" class="btn" onclick="sample4_execDaumPostcode();" value="우편번호 찾기">
									</td>
								</tr>
								<tr>
									<td style="text-align: right"><label>지번주소 : </label></td>
									<td style="text-align: left"><input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="g_address" onclick="btnClick();" value="${ map.m.g_address }" style="width: 40%;"></td>
								</tr>
								<tr>
									<td style="text-align: right"><label>도로명주소 : </label></td>
									<td style="text-align: left"><input type="text" id="sample4_jibunAddress" placeholder="지번주소" name="r_address" onclick="btnClick();" value="${ map.m.r_address }" style="width: 40%;"></td>
								</tr>
								<tr>
									<td style="text-align: right"><label>상세주소 : </label></td>
									<td style="text-align: left">
										<input type="text" id="sample4_detailAddress" placeholder="상세주소" name="d_address" value="${ map.m.d_address }" style="width: 40%;">
										<span id="guide" style="color: #999; display: none"></span>
									</td>
								</tr>
							</table>
						</div>
						
						
					</div>
					
					<br>
					
					<input id="p_num" type="hidden" name="p_num" value="${ map.p.p_num }">
					<input id="p_name" type="hidden" name="p_name" value="${ map.p.p_name }">
					<input id="m_id" type="hidden" name="m_id" value="${ map.m.m_id }">
					<input id="m_name" type="hidden" name="m_name" value="${ map.m.m_name }">
					<input id="m_email" type="hidden" name="m_email" value="${ map.m.m_email }">
					<input id="m_phone" type="hidden" name="m_phone" value="${ map.m.m_phone }">
					<input id="postnum" type="hidden" name="postnum" value="${ map.m.postnum }">
					<input id="g_address" type="hidden" name="g_address" value="${ map.m.g_address }">
					<input id="r_address" type="hidden" name="r_address" value="${ map.m.r_address }">
					<input id="d_address" type="hidden" name="d_address" value="${ map.m.d_address }">
					
					<c:forEach items="${ map.item }" var="item" varStatus="i">
						<input id="item${i.index}" type="hidden" name="item" value="${ item }">
					</c:forEach>
					<c:forEach items="${ map.amount }" var="item" varStatus="i">
						<input id="amount${i.index}" type="hidden" name="amount" value="${ item }">
					</c:forEach>
					<c:forEach items="${ map.price }" var="item" varStatus="i">
						<input id="price${i.index}" type="hidden" name="price" value="${ item }">
					</c:forEach>
					<input id="total" type="hidden" name="total" value="${ map.total }">
					<input id="pay_method" type="hidden" name="pay_method" value="card">
					
					<button class="btn" type="button" onclick="history.go(-1);">취소</button>
					<button class="btn" type="button" onclick="pay();">새로운 주소로 결제</button>
					
				</form>
			</div>
		</div>
	</div>
	<script>
	    function sample4_execDaumPostcode() {
	        new daum.Postcode({
	           oncomplete : function(data) {
	              // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	              // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	              // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	              var roadAddr = data.roadAddress; // 도로명 주소 변수
	              var extraRoadAddr = ''; // 참고 항목 변수
	
	              // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	              // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	              if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
	                 extraRoadAddr += data.bname;
	              }
	              // 건물명이 있고, 공동주택일 경우 추가한다.
	              if (data.buildingName !== '' && data.apartment === 'Y') {
	                 extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	              }
	              // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	              if (extraRoadAddr !== '') {
	                 extraRoadAddr = ' (' + extraRoadAddr + ')';
	              }
	
	              // 우편번호와 주소 정보를 해당 필드에 넣는다.
	              document.getElementById('sample4_postcode').value = data.zonecode;
	              document.getElementById("sample4_roadAddress").value = roadAddr;
	              document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
	
	              // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
	
	              var guideTextBox = document.getElementById("guide");
	              // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	              if (data.autoRoadAddress) {
	                 var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                 guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
	                 guideTextBox.style.display = 'block';
	
	              } else if (data.autoJibunAddress) {
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
		
		
		function btnClick() {
			$('#findBtn').trigger('click');
		}

		
		
	</script>
	<!-- 아임포트 자바스크립트는 jQuery 기반으로 개발되었습니다 -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	
	<script type="text/javascript">
	
		var p_name = $('#p_name').val();
	
		var m_name = $('#m_name').val();
		var m_email = $('#m_email').val();
		var m_phone = $('#m_phone').val();
		var postnum = $('#postnum').val();
		var r_address = $('#r_address').val();
		var d_address = $('#d_address').val();
		var buyer_addr = r_address + ' / ' + d_address;
		var amount = $('#amount').val();
		var total = $('#total').val();
		var pay_method = $('#pay_method').val();

		$('input[name=method]').click(function(){
			var radio = $('input[name=method]');
			for(var i = 0 ; i < radio.length; i++){
				if(radio[i].checked){
					if(radio[i].value == 'basicAddress'){
						postnum = $('#postnum').val();
						r_address = $('#r_address').val();
						d_address = $('#d_address').val();
						buyer_addr = r_address + ' / ' + d_address;
					} else if (radio[i].value == 'newAddress'){
						$('#newAddress').css('display', 'inherit');
						
						postnum = $("#sample4_postcode").val();
						r_address = $("#sample4_roadAddress").val();
						d_address = $("#sample4_detailAddress").val();
						buyer_addr = r_address + ' / ' + d_address;
					}
				}
			}
		});
	
		
		
		
		
		var IMP = window.IMP; // 생략가능
		IMP.init('imp79905221'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		function pay() {
			
			//onclick, onload 등 원하는 이벤트에 호출합니다
			IMP.request_pay({
				pg : 'inicis', // version 1.1.0부터 지원.
				pay_method : pay_method,
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : p_name,
				amount : 100, // total
				buyer_email : m_email,
				buyer_name : m_name,
				buyer_tel : m_phone,
				buyer_addr : r_address + ' / ' + d_address,
				buyer_postcode : postnum

			}, function(rsp) {
				if (rsp.success) {
					$('#auto').submit();
					var msg = '결제가 완료되었습니다.';
					msg += '고유ID : ' + rsp.imp_uid;
					msg += '상점 거래ID : ' + rsp.merchant_uid;
					msg += '결제 금액 : ' + rsp.paid_amount;
					msg += '카드 승인번호 : ' + rsp.apply_num;
	
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
					setTimeout(function(){
						history.go(-3);
					},3000);
				}
				alert(msg);
			});
		}

	//TODO URLScheme정의하는 부분 추가
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	</script>
	<br>
	<br>
	<br>
	<br>

</body>
<c:import url="../common/footer.jsp" />
</html>