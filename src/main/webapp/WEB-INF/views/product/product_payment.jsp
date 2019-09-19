<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath"
	value="${pageContext.request.contextPath}/resources/css"
	scope="application" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href='${ contextPath }/product/product.css'>
</head>
<c:import url="../common/header.jsp" />
<body>
	<div style="height:50vh;">
		<div class="content center">
			<div class="row">
				<div>
					<input type="radio" name="method" value="basicAddress" checked><label>기존 주소 사용</label>
				</div>
				<div>
					<input type="radio" name="method" value="newAddress"><label>새로운 주소 등록</label>
				</div>
			</div>
		</div>
	</div>
	<script>
		$('input[name=method]').click(function(){
			var radio = $('input[name=method]');
			for(var i = 0 ; i < radio.length; i++){
				if(radio[i].checked){
					if(radio[i].value == 'basicAddress'){
						
					} else if {
						
					}
				}
			}
		});
		
	</script>
	<form id="auto" action="payment.save" method="post">
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
	</form>
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

		/* var IMP = window.IMP; // 생략가능
		IMP.init('imp79905221'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

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
			buyer_addr : r_address,
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
		}); */

	//TODO URLScheme정의하는 부분 추가
	</script>
	<br>
	<br>
	<br>
	<br>

</body>
<c:import url="../common/footer.jsp" />
</html>