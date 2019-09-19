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
	<input type="hidden">
	<!-- 아임포트 자바스크립트는 jQuery 기반으로 개발되었습니다 -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script type="text/javascript">
		/* var p_num = ${map.p.p_num};
		var p_name = '${map.p.p_name}';
		var m_name = '${map.m.m_name}';
		var m_phone = '${map.m.m_phone}';
		var m_email = '${map.m.m_email}';
		var postnum = '${map.m.postnum}';
		var amount = ${map.amount};
		var total = ${map.total};
		var pay_method = 'card'; */
		
		var l_num = ${list.L_NUM};
		var l_title = '${list.L_TITLE}';
		var l_price = ${list.L_PRICE};
		var m_id = '${ m.m_id }';
		var m_name = '${m.m_name}';
		var m_phone = '${m.m_phone}';
		var m_email = '${m.m_email}';
		var pay_method = 'card';
		
		
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
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : p_name,
			amount : l_price, // total
			buyer_email : '${m.m_email}',
			buyer_name : '${m.m_name}',
			buyer_tel : '${m.m_phone}',
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