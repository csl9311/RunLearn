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
<style>
.filebox label {
	display: inline-block;
	padding: .5em .75em;
	color: #999;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
}

.filebox input[type="file"] { /* 파일 필드 숨기기 */
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}
</style>
</head>
<c:import url="common/header.jsp" />
<body>
	<br>
	<br>
	<br>
	<br>
	<div class="contents center">
		<div class="row">
			<form action="${ contextPath }/product.insert" class="form" style="float: none; margin: 0 auto; width: 50vw;">

				<input type="hidden" value="판매자명">
				<input type='file' id="imgInp"/>
				<table class="table center">
					<tr id="images"></tr>
				</table>

				<table class="col-md-6 table center">
					<tr>
						<td>상품명</td>
						<td><input type="text" name="p_name"></td>
					</tr>
					<tr>
						<td>카테고리</td>
						<td><input type="text" name="p_category"></td>
					</tr>
					<tr>
						<td>가격</td>
						<td><input type="text" name="p_price"></td>
					</tr>
					<tr>
						<td>재고</td>
						<td><input type="text" name="p_stock"></td>
					</tr>
					<tr>
						<td><input type="button" class="btn" value="취소"></td>
						<td><input type="submit" class="btn" value="등록"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		function readURL(input) {
			if (input.files && input.files[0]) {
				var $images = $('#images');
				var reader = new FileReader();
				reader.onload = function(e) {
					$images.append('<td><img src="' + e.target.result + '" width="100vw" height="100vh"/></td>');
				}
				reader.readAsDataURL(input.files[0]);
			}
		}

		$("#imgInp").change(function() {
			$('#foo').css('display', 'inherit');
			readURL(this);
		});
	</script>
</body>
<c:import url="common/footer.jsp" />
</html>
