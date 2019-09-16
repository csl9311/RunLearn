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
	<!-- 아임포트 자바스크립트는 jQuery 기반으로 개발되었습니다 -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

	<script type="text/javascript">
		var p_num = ${map.p.p_num};
		var p_name = '${map.p.p_name}';
		var m_name = '${map.m.m_name}';
		var m_phone = '${map.m.m_phone}';
		var m_email = '${map.m.m_email}';
		var postnum = '${map.m.postnum}';
		var amount = ${map.amount};
		var total = ${map.total};
		var pay_method = 'card';
		
		
		$.ajax({
			url: "payment.save",
			data: {
				p_num:p_num,
				p_name:p_name,
				total:total,
				amount:amount,
				pay_method:pay_method,
				m_name:m_name,
				m_phone:m_phone,
				m_email:m_email,
				postnum:postnum
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
		});
		
		/* 
		var IMP = window.IMP; // 생략가능
		IMP.init('imp79905221'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

		//onclick, onload 등 원하는 이벤트에 호출합니다
		IMP.request_pay({
			pg : 'inicis', // version 1.1.0부터 지원.
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : p_name,
			amount : 100, // total
			buyer_email : m_email,
			buyer_name : m_name,
			buyer_tel : m_phone,
			buyer_addr : '서울특별시 강남구 삼성동',
			buyer_postcode : postnum
		}, function(rsp) {
			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				msg += '고유ID : ' + rsp.imp_uid;
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '결제 금액 : ' + rsp.paid_amount;
				msg += '카드 승인번호 : ' + rsp.apply_num;
				
				
				
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
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