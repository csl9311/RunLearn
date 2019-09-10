<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" scope="application" />
<!DOCTYPE html>
<c:import url="../common/header.jsp"/>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href='${ contextPath }/resources/css/product/product.css'>
</head>
<body>
<br>
<br>
<br>
	<div class="contents center">
		<div class="row">
<%-- 상품 이미지 --%>
			<div class="p_images center">
				<div class="row">
					<c:forEach var="p" items="${ list }">
						<c:if test="${ p.P_FILE_LEVEL+0 == 0 }">
							<div class="col-md-3 center">
								<img class="img-responsive center" alt="썸네일" src="${ contextPath }/resources/images/product/${ p.P_CHANGED_NAME }">
							</div>
						</c:if>
						<c:if test="${ p.P_FILE_LEVEL+0 == 1 }">
							<div class="row">
								<div class="col-md-3 center">
									<img class="img-responsive center" alt="상세이미지" src="${ contextPath }/resources/images/product/${ p.P_CHANGED_NAME }">
								</div>
							</div>
						</c:if>
					</c:forEach>
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
						<td class="right"> ${ list.get(0).P_NAME }</td>
					</tr>
					
					<tr>
						<td>기본가격(￦)</td>
						<td class="right">${ list.get(0).P_PRICE }</td>
					</tr>
					<tr>
						<td>판매자명</td>
						<td class="right">${ list.get(0).M_ID }</td>
					</tr>
					<tr>
						<td>옵션</td>
						<td class="right">
							<input id="item" type="text" name="productOption" list="datalist" onchange="choice();" placeholder="옵션을 선택해주세요.">
		                    <datalist id="datalist" style="text-align: center;">
			                    <c:forEach items="${ poList }" var="po">
									<option value="${ po.p_option }" id="${ po.p_option }">${ po.p_optionPrice }원</option>
								</c:forEach>
		                    </datalist>
						</td>
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
			/* amount의 id 지정 */
			var i = 0;
			var $item = $('#item');
			/* 옵션 변경 시 */
		 	function choice() {
				var $p_num = $('#p_num'+i);
				var $script = $('#abcd');
				
				var won = $('#'+$item.val()).text();
				var price = Number(won.substring(0, won.length-1));
				
				var $totalTr = $('#totalTr');
				$totalTr.remove();
				// 테이블에 내용 추가
		 		$p_info.append(
		 			'<tr>'+
			 			'<td>'+ $item.val() + '</td>'+
			 			'<td class="right">'+
				 			'<input class="btn" type="button" value="-" id="del'+i+'">'+
				 			'<input name="amount" class="form-control" type="text" value="1" onchange="change();" id="amount'+i+'" style="display: inline-block; text-align: center; width: 80px;">' +
				 			'<input class="btn" type="button" value="+" id="add'+i+'">'+
			 			'</td>'+
		 			'</tr>' + 
		 			'<tr id="totalTr">' + 
		 				'<td>총 금액</td>'+
		 				'<td class="right">' +
		 					'<input id="total" type="text" value="' + price +'" readonly>원' + 
		 				'</td>' + 
		 			'</tr>'
		 		);
		 		/* div에 script 추가 */
		 		$script.append(
		 			'<script>' + 
			 			'$("#del' + i + '").click(function(){'+
					 		'if($("#amount' + i +'").val()>1){'+
						 		'$("#amount' + i +'").val($("#amount' + i +'").val() - 1);'+
						 		'del(' + i + ');' +
					 		'}'+
					 	'});'+
					 	
						'$("#add' + i + '").click(function(){'+
					 		'$("#amount' + i +'").val($("#amount' + i +'").val()-(-1));'+
					 		'add(' + i + ');'+
					 	'});'+
		 			'<\/script>'
		 		);
		 		
				$item.val('');
		 		i++;
			};
		 	function add(i){
		 		var $total = $('#total');
		 		var amount = Number($('#amount'+ i).val());
		 		var price = Number($total.val()) / (amount-1);
		 		var total = price * amount;
		 		
		 		console.log(price);
		 		$total.val('0');
		 		console.log(amount);
		 		$total.val(total);
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
				<img class="img-responsive center" alt="메인이미지" src="${ contextPath }/resources/images/product/test1.png">
			</div>
		</div>
<%-- 상품 상세 이미지 끝 --%>
<br>
<br>
<br>
<br>
<br>
<br>
		
		<!-- 라이브리 시티 설치 코드 -->
		<div id="lv-container" data-id="city" data-uid="MTAyMC80NjIxOS8yMjczMA==" class="center" style="width: 80vw;">
		   <script type="text/javascript">
		   (function(d, s) {
		      var j, e = d.getElementsByTagName(s)[0];
		
		      if (typeof LivereTower === 'function') { return; }
		
		      j = d.createElement(s);
		      j.src = 'https://cdn-city.livere.com/js/embed.dist.js';
		      j.async = true;
		
		      e.parentNode.insertBefore(j, e);
		   })(document, 'script');
		   </script>
			<noscript> 라이브리 댓글 작성을 위해 JavaScript를 활성화 해주세요</noscript>
			<div class="row center">
				<button type="button" class="btn" onclick="deleteAd();">광고 지우기</button>
			</div>
			<script>
				function deleteAd(){
					var $ad = $('#taboola-livere');
					$ad.remove();
				}
			</script>
		</div>
		<!-- 시티 설치 코드 끝 -->
	</div>
</body>
<c:import url="../common/footer.jsp"/>
</html>