<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" scope="application" />
<!DOCTYPE html>
<%-- <jsp:include page="../common/header.jsp" /> --%>
<html>
<head>
<meta charset="UTF-8">
<title>${ p.name }</title>
<link rel="stylesheet" href='${ contextPath }/css/product/product.css'>
</head>
<body>
<br>
<br>
<br>
	<div class="contents center">
		<div class="row">
<%-- 상품 이미지 --%>
			<div class="p_images" style="float:none; margin:0 auto">
				<div class="row">
					<img alt="메인이미지" src="${ contextPath }/images/product/sample.png" width="300px" height="200px">
				</div>
				<div class="row">
					<img alt="이미지" src="${ contextPath }/images/product/sample.png" width="50px" height="50px">
					<img alt="이미지" src="${ contextPath }/images/product/sample.png" width="50px" height="50px">
					<img alt="이미지" src="${ contextPath }/images/product/sample.png" width="50px" height="50px">
					<img alt="이미지" src="${ contextPath }/images/product/sample.png" width="50px" height="50px">
				</div>
			</div>
<%-- 상품 이미지 끝--%>
<br>
<br>
<br>
<br>
<%-- 상품 정보 --%>
			<form action="" method="post" style="float:none; margin:0 auto; width: 50vw;">
				<table class="table" id="p_info">
					<tr>
						<td>상품명</td>
						<td class="right"> ${ p.name }</td>
					</tr>
					
					<tr>
						<td>가격</td>
						<td class="right">${ p.price }</td>
					</tr>
					<tr>
						<td>판매자명</td>
						<td class="right">${ p.seller }</td>
					</tr>
					<tr>
						<td>옵션</td>
						<td class="right">
							<select id="option" name="option" onchange="choice();">
								<option>옵션1</option>
								<option>옵션2</option>
								<option>옵션3</option>
								<option>옵션4</option>
								<option>옵션5</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>배송비</td>
						<td class="right">${ p.delivery }</td>
					</tr>
					<tr>
						<td>총 가격</td>
						<td id="totalPrice" class="right"></td>
					</tr>
				</table>
				<button class="btn" onclick="addCart();">장바구니에 추가</button>
				<input class="btn" type="submit" value="바로구매">
			</form>
		</div>
<%-- onchange 스크립트 영역 --%>
		<div id="abcd"></div>
<%-- 상품 정보 끝 --%>
		<script type="text/javascript">
			/* p_info = table명 */
			var $p_info = $('#p_info');
			/* option = 옵션 선택 */
			var $option = $('#option');
			/* amount의 id 지정 */
			var i = 0;
			var $p_info = $('#p_info');
			
			/* 옵션 변경 시 */
		 	function choice() {
				/* selectedOption = 옵션 출력 영역 */
				var $selectedOption = $('#selectedOption'+i);
				var $pId = $('#pId'+i);
				var $script = $('#abcd');
				
		 		/* $selectedOption.css('display', 'table-row'); */
		 		$p_info.append(
		 			'<tr>'+
			 			'<td>'+
			 			'<input name="pId" type="hidden" id="pId'+i+'">'+
							'${ p.name }'+
						'</td>'+
			 			'<td class="right">'+
				 			'<input class="btn" type="button" value="-" id="del'+i+'">'+
				 			'<input name="amount" class="form-control" type="text" value="0" onchange="change();" id="amount'+i+'" style="display: inline-block; width: 80px;">' +
				 			'<input class="btn" type="button" value="+" id="add'+i+'">'+
			 			'</td>'+
		 			'</tr>' 
		 		);
		 		/* div에 script 추가 */
		 		$script.append(
		 			'<script>' + 
			 			'$("#del' + i + '").click(function(){'+
					 		'if($("#amount' + i +'").val()>1){'+
						 		'$("#amount' + i +'").val($("#amount' + i +'").val() - 1);'+
						 		'change();' +
					 		'}'+
					 	'});'+
					 	
						'$("#add' + i + '").click(function(){'+
					 		'$("#amount' + i +'").val($("#amount' + i +'").val()-(-1));'+
					 		'change();'+
					 	'});'+
		 			'<\/script>'
		 		);
		 		
		 		/* pId 들어가야 함 */
		 		$pId.val(i * 10);
		 		i++;
			};
		 	function change(){
		 		
		 	};
		 	function addCart(){
		 		
		 	}
		</script>
<br>
<br>
<br>
<br>
<br>
<br>
<%-- 상품 상세 이미지 --%>
		<div class="row">
			<div class="p_detailImg">
				<img alt="메인이미지" src="${ contextPath }/images/product/sample.png">
			</div>
		</div>
<%-- 상품 상세 이미지 끝 --%>
<br>
<br>
<br>
<br>
<br>
<br>
<%-- 리뷰 --%>	
		<div class="row">
			<div class="col-md-4">
				<table class="table">
					<tr>
						<td>이미지</td>
						<td>이미지</td>
						<td>작성자</td>
						<td>작성자</td>
						<td>작성일</td>
						<td>작성일</td>
						<td>내용</td>
						<td>내용</td>
					</tr>
				</table>
			</div>
		</div>
<%-- 리뷰 끝 --%>
	</div>
</body>
<%-- <jsp:include page="../common/footer.jsp" /> --%>
</html>