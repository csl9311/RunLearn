<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" scope="application" />
<!DOCTYPE html>
<c:import url="../common/header.jsp" />
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href='${ contextPath }/resources/css/product/product.css'>
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
					</c:forEach>
				</div>
			</div>
			<%-- 상품 이미지 끝--%>
			<br> <br> <br> <br>
			<%-- 상품 정보 --%>
			<form action="product.pay" method="post" style="float: none; margin: 0 auto; width: 50vw;" onsubmit="return check();">
				<input type="hidden" value="${ loginUser }">
				<input type="hidden" name="m_id" value="${ loginUser.m_id }">
				<input type="hidden" name="m_name" value="${ loginUser.m_name }">
				<input type="hidden" name="m_nickname" value="${ loginUser.m_nickname }">
				<input type="hidden" name="m_email" value="${ loginUser.m_email }">
				<input type="hidden" name="m_phone" value="${ loginUser.m_phone }">
				<input type="hidden" name="postnum" value="${ loginUser.postnum }">
				<input type="hidden" name="g_address" value="${ loginUser.g_address }">
				<input type="hidden" name="r_address" value="${ loginUser.r_address }">
				<input type="hidden" name="d_address" value="${ loginUser.d_address }">

				<input type="hidden" name="p_num" value="${ list.get(0).P_NUM }">
				<input type="hidden" name="p_status" value="${ list.get(0).P_STATUS }">
				<table class="table" id="p_info">
					<tr>
						<td>상품명</td>
						<td class="right">
							${ list.get(0).P_NAME }
							<input type="hidden" name="p_name" value="${ list.get(0).P_NAME }">
						</td>
					</tr>

					<tr>
						<td>기본가격(￦)</td>
						<td class="right">
							${ list.get(0).P_PRICE }원
							<input type="hidden" name="p_price" value="${ list.get(0).P_PRICE }">
						</td>
					</tr>
					<tr>
						<td>판매자명</td>
						<td class="right">
							${ list.get(0).M_ID }
							<input type="hidden" name="m_id" value="${ list.get(0).M_ID }">
						</td>
					</tr>
					<c:if test="${ poList.size() ne 0}">
						<tr>
							<td>옵션</td>
							<td class="right">
								<input id="item" type="text" name="productOption" list="datalist" onchange="choice();" placeholder="옵션 선택">
								<datalist id="datalist" style="text-align: center;">
									<c:forEach items="${ poList }" var="po">
										<option id="${ po.p_option }" value="${ po.p_option }">${ po.p_optionPrice }원</option>
									</c:forEach>
								</datalist>
							</td>
						</tr>
						<tr id="totalTr">
							<td>총 금액</td>
							<td class="right">
								<input id="total" name="total" class="center" type="text" placeholder="옵션을 선택해주세요." readonly>
							</td>
						</tr>
					</c:if>
					<c:if test="${ poList.size() eq 0}">
						<tr>
							<td>수량</td>
							<td class="right">
								<input id="del" class="btn" type="button" value="-">
								<input id="amount" name="amount" class="form-control" type="text" value="1" onchange="getTotal();" style="display: inline-block; text-align: center; width: 80px;">
								<input id="add" class="btn" type="button" value="+"> <br>
								<input name="priceArr" type="hidden" value="${ list.get(0).P_PRICE }">
							</td>
						</tr>
						<tr id="totalTr">
							<td>총 금액</td>
							<td class="right">
								<input id="total" name="total" class="center" type="text" placeholder="수량을 선택해주세요." readonly>
							</td>
						</tr>


						<script>
							$("#del").click(function() {
								if ($("#amount").val() > 1) {
									$("#amount").val($("#amount").val() - 1);
									getTotal();
								}
							});

							$("#add").click(function() {
								$("#amount").val($("#amount").val() - (-1));
								getTotal();
							});
						</script>
					</c:if>
				</table>
				<c:if test="${ list.get(0).M_ID eq loginUser.m_id  }">
					<button type="button" class="btn" onclick="updateProduct();">상품정보 수정</button>
				</c:if>
				<button type="button" class="btn" onclick="addCart();">장바구니에 추가</button>
				<input class="btn" type="submit" value="바로구매">
			</form>
		</div>

		<div class="p_images center">
			<div class="row">
				<c:forEach var="p" items="${ list }">
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
				var $p_num = $('#p_num' + i);
				var $script = $('#abcd');

				var won = $('#' + $item.val()).text();
				var price = Number(won.substring(0, won.length - 1));

				var $totalTr = $('#totalTr');
				$totalTr.remove();
				// 테이블에 내용 추가

				$p_info.append(
					'<tr>' +
					'<td>' + $item.val() + '<input type="hidden" name="item" value="' + $item.val() + '"><br> 1 / ' + price + '원</td>' +
					'<td class="right">' +
						'<input class="btn" type="button" value="-" id="del'+i+'">' +
						'<input name="amount" class="form-control" type="text" value="1" onchange="getTotal();" id="amount' + i + '" style="display: inline-block; text-align: center; width: 80px;">' +
						'<input class="btn" type="button" value="+" id="add'+i+'"><br>' +
						'<input name="priceArr" type="hidden" value='+price+'>' +
					'</td>' +
					'</tr>' +
					'<tr id="totalTr">' +
						'<td>총 금액</td>' +
						'<td class="right">' +
							'<input id="total" name="total" class="center" type="text" placeholder="수량을 선택해주세요." readonly>' +
						'</td>' +
					'</tr>'
				);
				getTotal();
				/* div에 script 추가 */
				$script.append(
					'<script>' +
					'$("#del' + i + '").click(function(){' +
						'if($("#amount' + i + '").val()>1){' +
							'$("#amount' + i + '").val($("#amount' + i + '").val() - 1);' +
							'getTotal();' +
						'}' +
					'});' + 
					'$("#add' + i + '").click(function(){' +
						'$("#amount' + i + '").val($("#amount' + i + '").val()-(-1));' +
						'getTotal();' +
						'});'
					+ '<\/script>'
				);

				$item.val('');
				i++;
			};
			function getTotal() {
				// 입력 될 영역
				var $total = $('#total');
				// 연산에 필요한 배열
				var amountArr = $('input:text[name=amount]');
				var priceArr = $('input:hidden[name=priceArr]');
				var total = 0;
				// 연산
				for (var index = 0; index < amountArr.length; index++) {
					total += amountArr[index].value * priceArr[index].value;
				}
				// 값 대입
				$total.val(total);
			};

			function addCart() {
				location.href = "";
			}
			
			function updateProduct(){
				location.href = "update.product?p_num=${ list.get(0).P_NUM }";
			}
			
			function check(){
				var user = '${sessionScope.loginUser.m_id}';
				var $total = $('#total');
				// 구매 버튼 클릭 시 로그인 안되어있다면 로그인 유도
				if(user == '') {
					alert("로그인 후 이용해주세요.");
					$('#loginM').parent().children('a').trigger('click');
					return false;
				// 옵션 미선택시 선택 유도
				} else if ($total.val() == 0 || $total.val() == '') {
					alert("옵션을 선택해주세요.");
					return false;
				}
			}
			
		</script>
		<br> <br> <br> <br> <br> <br>
		<%-- 라이브리 시티 설치 코드 --%>
		<div id="lv-container" data-id="city" data-uid="MTAyMC80NjIxOS8yMjczMA==" class="center" style="width: 80vw;">
			<script type="text/javascript">
				(function(d, s) {
					var j, e = d.getElementsByTagName(s)[0];

					if (typeof LivereTower === 'function') {
						return;
					}

					j = d.createElement(s);
					j.src = 'https://cdn-city.livere.com/js/embed.dist.js';
					j.async = true;

					e.parentNode.insertBefore(j, e);
				})(document, 'script');
			</script>
			<noscript>라이브리 댓글 작성을 위해 JavaScript를 활성화 해주세요</noscript>
			<%-- 
			<div class="row center">
				<button type="button" class="btn" onclick="deleteAd();">광고 지우기</button>
			</div>
			<script>
				function deleteAd(){
					var $ad = $('#taboola-livere');
					$ad.remove();
				}
			</script>
			 --%>
		</div>
		<%-- 시티 설치 코드 끝 --%>
	</div>
</body>
<c:import url="../common/footer.jsp" />
</html>