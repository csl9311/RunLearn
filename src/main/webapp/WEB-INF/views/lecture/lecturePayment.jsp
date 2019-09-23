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
	<div style="height: 600px;">
	</div>
	<form id="auto" action="lecturePayment.save" method="post">
		<input id="l_num" type="hidden" name="l_num" value="${list.L_NUM}">
		<input id="l_title" type="hidden" name="l_title" value="${list.L_TITLE}">
		<input id="l_price" type="hidden" name="l_price" value="${list.L_PRICE}">
		
		<input id="m_id" type="hidden" name="m_id" value="${ m.m_id }">
		<input id="m_name" type="hidden" name="m_name" value="${ m.m_name }">
		<input id="m_email" type="hidden" name="m_email" value="${ m.m_email }">
		<input id="m_phone" type="hidden" name="m_phone" value="${ m.m_phone }">
		<input id="pay_method" type="hidden" name="pay_method" value="card">
	</form>
	<form id="fail" action="lecturePaymentFail.save" method="post">
	<input name="l_num" type="hidden" name="l_num" value="${list.L_NUM}">
	</form>
	<input type="hidden">
	<!-- 아임포트 자바스크립트는 jQuery 기반으로 개발되었습니다 -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script type="text/javascript">

		var l_num = $('#l_num').val();
		var l_title = $('#l_title').val();
		var l_price = $('#l_price').val();
		var m_id = $('#m_id').val();
		var m_name = $('#m_name').val();
		var m_email = $('#m_email').val();
		var m_phone = $('#m_phone').val();
		var pay_method = $('#pay_method').val();
		
		
		
		/* $.ajax({
			url: "lecturePayment.save",
			data: {
				l_num:l_num,
				l_title:l_title,
				l_price:l_price,
				m_id:m_id,
				pay_method:pay_method,
				m_name:m_name,
				m_phone:m_phone,
				m_email:m_email
			},
			type:"post",
			success: function(data){
				if(data == "success"){
					alert("완료");
				}
			},
			error : function(){
				alert(
					"error code : " + request.status + "\n" +
					"message : " + request.responseText + "\n" + 
					"error : " + errorData
				);
			}
		}); */
		/* $.ajax({
			url: "lecturePayment.save",
			data: {
				l_num:l_num,
				l_title:l_title,
				l_price:l_price,
				pay_method:pay_method,
				m_name:m_name,
				m_phone:m_phone,
				m_email:m_email
			},
			type:"post",
			success: function(data){
				if(data > 0){
					alert("결제성공");
				} else {
					alert("success : 결제실패?");
				}
			},
			error : function(){
				alert(
					"error code : " + request.status + "\n" +
					"message : " + request.responseText + "\n" + 
					"error : " + errorData
				);
			}
		}); */
		
		
		var IMP = window.IMP; // 생략가능
		IMP.init('imp79905221'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

		//onclick, onload 등 원하는 이벤트에 호출합니다
		IMP.request_pay({
			pg : 'inicis', // version 1.1.0부터 지원.
			pay_method : pay_method,
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : l_title,
			amount : 100, // total
			buyer_email : m_email,
			buyer_name : m_name,
			buyer_tel : m_phone
		}, function(rsp) {
			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				$('#auto').submit();
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
				$('#fail').submit();
			}
			alert(msg);
		});
	//TODO URLScheme정의하는 부분 추가
	</script>
	<br>
	<br>
	<br>
	<br>

</body>
<c:import url="../common/footer.jsp" />
</html>