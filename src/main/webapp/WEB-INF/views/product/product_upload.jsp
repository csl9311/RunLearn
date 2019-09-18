<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href='${ contextPath }/resources/css/product/product.css'>
<style>
.img-responsive{
	margin: auto;
}
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
			<form action="insert.product" class="form" method="post" enctype="Multipart/form-data" style="float: none; margin: 0 auto; width: 50vw;" onsubmit="return imgCheck();">
			<%-- Session에서 판매자 정보 받아와야 함. --%>
				<input type="hidden" name="p_num" value="0">
				<input type="hidden" name="m_id" value="${ sessionScope.loginUser.m_id }">
				
				<button class="btn" type="button" onclick="uploadThumbnail();">썸네일 업로드</button>
				<input type='file' name="pi_thumbnail" id="imgInp" style="display: none;">
        		<div class="row">
					<div id="thumbnailArea"></div>
        		</div>
				
				<button class="btn" type="button" onclick="uploadImage();">상세 이미지 업로드</button>
				<input type="file" id="input_imgs" name="pi_detail" multiple style="display: none;">
				<div>
					<div id="detailImgArea" class="row"></div>
				</div>
								
				<table id="productDetail"class="col-md-6 table center">
					<tr>
						<td>상품명</td>
						<td><input id="p_name" type="text" name="p_name" required="required"></td>
					</tr>
					<tr>
						<td>카테고리</td>
						<td>
							<select id="p_category" name="p_category" required="required">
								<option value="bag">가방</option>
								<option value="watch">시계</option>
								<option value="wallet">지갑</option>
								<option value="perfume">향수</option>
								<option value="accessory">악세서리</option>
								<option value="material">재료</option>
							</select>
							<!-- <input id="p_category" type="text" name="p_category" required="required"> -->
						</td>
					</tr>
					<tr id="price">
						<td>기본가격(￦)</td>
						<td><input type="number" step="100" min="0" name="p_price" required="required"></td>
					</tr>
					<!-- <tr>
						<td>옵션추가</td>
						<td>
							<input id="p_optionCheck" name="p_optionCheck" type="hidden">
							<input id="optionO" type="radio" name="option" value="O" required="required">
							<label>추가</label>
							<input id="optionX" type="radio" name="option" value="X" required="required">
							<label>삭제</label>
						</td>
					</tr> -->
					<tr><td></td><td></td></tr>
					<tr id="option0">
						<td>옵션</td>
						<td><input type="text" name="p_option" required="required"></td>
					</tr>
					<tr id="price0">
						<td>가격(￦)</td>
						<td><input type="number" min="0" step="100" name="p_optionPrice" required="required"></td>
					</tr>
					<tr id="stock0">
						<td>재고</td>
						<td><input type="number" min="0" name="p_stock" required="required"></td>
					</tr>
					<tr id="optionAddNDelete0">
						<td><input id="add0" class="btn" type="button" value="옵션 추가" onclick="optionAdd(0);"></td>
						<td><input class="btn" type="button" value="옵션 삭제" onclick="optionDelete(0);"></td>
					</tr>
				</table>
				<div class="row center">
					<input type="button" class="btn" value="이전 페이지로" onclick="history.go(-1);">
					<input type="submit" class="btn" value="등록">
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
<%-- 이미지 미리보기 --%>
	<%-- 썸네일 미리보기 --%>
		function uploadThumbnail(){
			$("#imgInp").trigger('click');
		}
	    $("#imgInp").change(function() {
	        readURL(this);
	    });
		function readURL(input) {
	        if (input.files && input.files[0]) {
	            var reader = new FileReader();
	            reader.onload = function(e) {
	            	$("#thumbnailArea").html(
	            		'<div id="thumbnailImg">' + 
							'<img class="img-responsive" src="'+e.target.result+'">' +
							'<input class="btn" type="button" value="썸네일 삭제" onclick="deleteImg();">' + 
						'</div>'
					);
	            }
	            reader.readAsDataURL(input.files[0]);
	        }
	    }
<%-- 이미지 삭제 --%>
		function deleteImg(){
			var img = $('#thumbnailImg');
			img.remove();
		}

	<%-- 상세 이미지 미리보기 --%>
		var sel_files = [];
		$(document).ready(function(){
			$("#input_imgs").on("change", handleImageFileSelect);
		});
		function uploadImage(){
			$("#input_imgs").trigger('click');
		}
		
		function handleImageFileSelect(e){
			sel_files = [];
			$("#detailImgArea").empty();
		
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);
			
			var index = 0;
			filesArr.forEach(function(f){
				if(!f.type.match("image.*")){
					alert("확장자는 이미지 확장자만 가능합니다.");
					return;
				}
				sel_files.push(f);
			
				var reader = new FileReader();
				
				reader.onload = function(e){
					$("#detailImgArea").append(
						'<div class="col-md-4" onclick="expend('+index+')" id = "img_id_'+index+'">' +
							'<img class="img-responsive" src="'+e.target.result+'" data-file="'+f.name+'">' +
							'<input id="deleteBtn' + index + '" class="btn" type="button" value="이미지 삭제" onclick="deleteImage(' + index + ');">' +
						'</div>'
					);
					index++;
				}
				reader.readAsDataURL(f);
			});
		};
		/* 이미지 확대 */
		function expend(){
			
		};
		/* 이미지 삭제 */
		function deleteImage(index){
			sel_files.splice(index,1);
			$('#deleteBtn'+index).remove();
			$("#img_id_"+index).remove();
		};
<%-- 이미지 미리보기 끝 --%>


<%-- 옵션 --%>
	<%-- 옵션 유무 선택 --%>
		var $table = $('#productDetail');
		var $p_optionCheck = $('#p_optionCheck');
		var j = parseInt(document.getElementById('productDetail').lastChild.childElementCount / 4);
		$('#optionX').prop('checked', true).prop('disabled', true);
		$p_optionCheck.val('X');
		$('#optionO').click(function(){
			$('#optionO').prop('disabled', 'disabled');
			$('#optionX').removeAttr('disabled');
			$p_optionCheck.val('O');
			optionAdd(j);
			j = parseInt(document.getElementById('productDetail').lastChild.childElementCount / 4);
		});
		
		$('#optionX').click(function(){
			for(var q = j; q >= 0 ; q --) {
				optionDelete(q);
			}
			j = parseInt(document.getElementById('productDetail').lastChild.childElementCount / 4);
		});
		
	<%-- 옵션 유무 선택 끝 --%>

	<%-- 옵션 추가 --%>
		function optionAdd(num){
			$p_optionCheck.val('O');
			$('#optionO').prop('checked', true);
			$('#optionX').prop('checked', false);
			$('#add'+ num).hide();
	
			$table.append(
				'<tr id="option' + j + '">'+
					'<td>옵션</td>'+
					'<td><input type="text" name="p_option" required="required"></td>'+
				'</tr>'+
				'<tr id="price' + j + '">'+
					'<td>가격(￦)</td>'+
					'<td><input type="number" min="0" step="100" name="p_optionPrice" required="required"></td>'+
				'</tr>'+
				'<tr id="stock' + j + '">'+
					'<td>재고</td>'+
					'<td><input type="number" min="0" name="p_stock" required="required"></td>'+
				'</tr>'+
				'<tr id="optionAddNDelete' + j + '">'+
					'<td><input id="add' + j + '" class="btn" type="button" value="옵션 추가" onclick="optionAdd('+ j +');"></td>'+
					'<td><input class="btn" type="button" value="옵션 삭제" onclick="optionDelete('+ j +');"></td>'+
				'</tr>'
			);
			j = parseInt(document.getElementById('productDetail').lastChild.childElementCount / 4);
		};
	<%-- 옵션 추가 끝 --%>
	<%-- 옵션 삭제 --%>
		function optionDelete(num){
			$('#option' + num).remove();
			$('#price' + num).remove();
			$('#stock' + num).remove();
			$('#optionAddNDelete' + num).remove();
			
			var length = parseInt(document.getElementById('productDetail').lastChild.childElementCount / 4);
			
			if(num == length) {
				var lastBtn = $table.children(':last').children(':last').children(':first').children(':first');
				lastBtn.css('display', 'inline-block');
			}
			if(length <= 1) {
				$p_optionCheck.val('X');
				$('#optionO').removeAttr('disabled');
				$('#optionX').prop('disabled', 'disabled');
				$('#optionO').prop('checked', false);
				$('#optionX').prop('checked', true);
			}
			j = parseInt(document.getElementById('productDetail').lastChild.childElementCount / 4);
		};
	<%-- 옵션 삭제 끝 --%>
	
<%-- 옵션 끝 --%>

	<%-- 썸네일 등록 여부 확인 --%>
		function imgCheck(){
			if($('#imgInp').val() == '') {
				alert("이미지를 등록해주세요.");
				return false;
			}
		}
	</script>
</body>
<c:import url="../common/footer.jsp" />
</html>
