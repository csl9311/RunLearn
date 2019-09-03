<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href='${ contextPath }/resources/css/product/product.css'>
<style>
</style>
</head>
<c:import url="../common/header.jsp" />
<body>
	<br>
	<br>
	<br>
	<br>
	<div class="contents center">
		<div class="row">
			<%-- 첨부파일 등록을 위해 Multipart/form-data encType 지정  --%>
			<form action="insert.product" class="form" method="post" enctype="Multipart/form-data" style="float: none; margin: 0 auto; width: 50vw;">
				<input type="hidden" name="m_id" value="판매자명">
				
				<div class="row">
					<label>썸네일</label>
					<input type="file" id="thumbInp" style="margin: auto;"/>
					<div id="thumbnail"></div>
				</div>
				
				<div class="row">
					<label>상세 이미지</label>
					<input type="file" id="imgInp" style="margin: auto;"/>
					<!-- <table id="imgArea" class="table center" ></table> -->
					<br>
					<div id="imgArea"></div>
				</div>
				
				<table id="productDetail"class="col-md-6 table center">
					<tr>
						<td>상품명</td>
						<td><input type="text" name="p_name"></td>
					</tr>
					<tr>
						<td>카테고리</td>
						<td><input type="text" name="p_category"></td>
					</tr>
					<tr id="price">
						<td>가격</td>
						<td><input type="text" name="p_category"></td>
					</tr>
					<tr id="stock">
						<td>재고</td>
						<td><input type="text" name="p_category"></td>
					</tr>
					<tr>
						<td>옵션유무</td>
						<td>
							<input id="optionO" type="radio" name="option" value="O"><label>있음</label>
							<input id="optionX" type="radio" name="option" value="X"><label>없음</label>
						</td>
					</tr>
				</table>
				<table class="col-md-6 table center">
					<tr>
						<td></td>
						<td>
							<input type="button" class="btn" value="취소">
							<input type="submit" class="btn" value="등록">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<script type="text/javascript">

		$("#imgInp").change(function() {
			readURL(this);
		});
		
		
<%-- 이미지 미리보기,  --%>
		var i = 0;
		function readURL(input) {
			if (input.files && input.files[0]) {
				var $imgArea = $('#imgArea');
				var reader = new FileReader();
				var fileName = input.value;
				
				reader.onload = function(e) {
					$imgArea.append(
						'<div class="col-sm-4" id="img' + i + '">'+
							'<img src="' + e.target.result + '" class="img-responsive"/>'+
							'<button type="button" class="btn btn-sm" onclick="deleteImg('+ i +');">삭제</button>' +
							'<input type="hidden" name="p_origin_name" value="' + fileName + '">' + 
						'</div>'
					);
				}
				i++;
				reader.readAsDataURL(input.files[0]);
			}
		}
<%-- 이미지 삭제 --%>
		
<%-- 이미지 삭제 --%>
		function deleteImg(i){
			var td = $('#img' + i);
			td.remove();
		}
<%-- 이미지 삭제 끝 --%>
		
		
<%-- 테이블 명 --%>
var $table = $('#productDetail');
var j = 0;
<%-- 옵션 유무 선택 --%>
	$('#optionO').click(function(){
		optionAdd();
	});
	
	$('#optionX').click(function(){
		for(var q = j; q >= 0 ; q --) {
			optionDelete(q);
		}
		j = 0;
	});
<%-- 옵션 유무 선택 끝 --%>

<%-- 옵션 추가, 삭제 --%>
	function optionAdd(num){
		j++;
		$('#optionO').prop('checked', true);
		$('#optionX').removeAttr('checked');
		$('#add'+ num).hide();

		$table.append(
			'<tr id="option' + j + '">'+
				'<td>옵션</td>'+
				'<td><input type="text" name="p_option"></td>'+
			'</tr>'+
			'<tr id="price' + j + '">'+
				'<td>가격</td>'+
				'<td><input type="text" name="p_price"></td>'+
			'</tr>'+
			'<tr id="stock' + j + '">'+
				'<td>재고</td>'+
				'<td><input type="text" name="p_stock"></td>'+
			'</tr>'+
			'<tr id="optionAddNDelete' + j + '">'+
				'<td><input id="add' + j + '" class="btn" type="button" value="옵션 추가" onclick="optionAdd('+ j +');"></td>'+
				'<td><input class="btn" type="button" value="옵션 삭제" onclick="optionDelete('+ j +');"></td>'+
			'</tr>'
		);
	};
	function optionDelete(num){
		/* $('#add'+ j).css('display', 'inline-block'); */
		var check = false;
		
		$('#option' + num).remove();
		$('#price' + num).remove();
		$('#stock' + num).remove();
		$('#optionAddNDelete' + num).remove();
		if(j <= 0) {
			$('#optionO').removeAttr('checked');
			$('#optionX').prop('checked', true);
		}
		
		if(num == j) {
			check = true;
		} else{
			check = false;
		}
		
		if(check) {
			var lastBtn = document.getElementById('productDetail').lastChild.lastChild.firstChild.firstChild;
			lastBtn.setAttribute('style', 'display: inline-block');
			console.log(lastBtn);
		}
		
	};
<%-- 옵션 추가, 삭제 끝 --%>
	</script>
</body>
<c:import url="../common/footer.jsp" />
</html>
