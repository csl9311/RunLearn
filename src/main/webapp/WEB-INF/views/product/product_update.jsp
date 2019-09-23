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
			<form action="update.productInfo" class="form" method="post" enctype="Multipart/form-data" style="float: none; margin: 0 auto; width: 50vw;">
			<%-- Session에서 판매자 정보 받아와야 함. --%>
				<input type="hidden" name="p_num" value="${ list.get(0).P_NUM }">
				<input type="hidden" name="m_id" value="${ sessionScope.loginUser.m_id }">
				
				<button class="btn" type="button" onclick="uploadThumbnail();">썸네일 수정</button>
				<input type='file' name="pi_thumbnail" id="imgInp" style="display: none;">
        		<div class="row">
					<div id="thumbnailArea">
						<div id="thumbnailImg">
							<c:forEach var="p" items="${ list }">
								<c:if test="${ p.P_FILE_LEVEL+0 == 0 }">
									<img class="img-responsive center" alt="썸네일" src="${ contextPath }/resources/images/product/${ p.P_CHANGED_NAME }">
									<input type="hidden" name="thumbnailFileName" value="${p.P_CHANGED_NAME}">
								</c:if>
							</c:forEach>
						</div>
					</div>
        		</div>
				
				<button class="btn" type="button" onclick="uploadImage();">상세 이미지 수정</button>
				<input type="file" id="input_imgs" name="pi_detail" multiple style="display: none;">
				<div>
					<div id="detailImgArea" class="row">
						<c:forEach var="p" items="${ list }">
							<c:if test="${ p.P_FILE_LEVEL+0 == 1 }">
								<img class="img-responsive center" alt="상세 이미지" src="${ contextPath }/resources/images/product/${ p.P_CHANGED_NAME }">
								<input type="hidden" name="detailImgFileName" value="${p.P_CHANGED_NAME}">
							</c:if>
						</c:forEach>
					</div>
				</div>
								
				<table id="productDetail"class="col-md-6 table center">
					<tr>
						<td>상품명</td>
						<td><input id="p_name" type="text" name="p_name" value="${ list.get(0).P_NAME }" required="required"></td>
					</tr>
					<tr>
						<td>카테고리</td>
						<td>
							<select id="p_category" name="p_category" required="required">
							<c:if test="${ list.get(0).P_CATEGORY eq 'bag' }">
								<option value="bag" selected="selected">가방</option>
								<option value="watch">시계</option>
								<option value="wallet">지갑</option>
								<option value="perfume">향수</option>
								<option value="accessory">악세서리</option>
								<option value="shoes">수제화</option>
								<option value="material">재료</option>
							</c:if>
							<c:if test="${ list.get(0).P_CATEGORY eq 'watch' }">
								<option value="bag">가방</option>
								<option value="watch" selected="selected">시계</option>
								<option value="wallet">지갑</option>
								<option value="perfume">향수</option>
								<option value="accessory">악세서리</option>
								<option value="shoes">수제화</option>
								<option value="material">재료</option>
							</c:if>
							<c:if test="${ list.get(0).P_CATEGORY eq 'wallet' }">
								<option value="bag">가방</option>
								<option value="watch">시계</option>
								<option value="wallet" selected="selected">지갑</option>
								<option value="perfume">향수</option>
								<option value="accessory">악세서리</option>
								<option value="shoes">수제화</option>
								<option value="material">재료</option>
							</c:if>
							<c:if test="${ list.get(0).P_CATEGORY eq 'perfume' }">
								<option value="bag">가방</option>
								<option value="watch">시계</option>
								<option value="wallet">지갑</option>
								<option value="perfume" selected="selected">향수</option>
								<option value="accessory">악세서리</option>
								<option value="shoes">수제화</option>
								<option value="material">재료</option>
							</c:if>
							<c:if test="${ list.get(0).P_CATEGORY eq 'accessory' }">
								<option value="bag">가방</option>
								<option value="watch">시계</option>
								<option value="wallet">지갑</option>
								<option value="perfume">향수</option>
								<option value="accessory" selected="selected">악세서리</option>
								<option value="shoes">수제화</option>
								<option value="material">재료</option>
							</c:if>
							<c:if test="${ list.get(0).P_CATEGORY eq 'material' }">
								<option value="bag">가방</option>
								<option value="watch">시계</option>
								<option value="wallet">지갑</option>
								<option value="perfume">향수</option>
								<option value="accessory">악세서리</option>
								<option value="shoes">수제화</option>
								<option value="material" selected="selected">재료</option>
							</c:if>
							<c:if test="${ list.get(0).P_CATEGORY eq 'shoes' }">
								<option value="bag">가방</option>
								<option value="watch">시계</option>
								<option value="wallet">지갑</option>
								<option value="perfume">향수</option>
								<option value="accessory">악세서리</option>
								<option value="shoes" selected="selected">수제화</option>
								<option value="material">재료</option>
							</c:if>
							</select>
						</td>
					</tr>
					<tr style="background: gray;"><td></td><td></td></tr>
					<tr>
						<td colspan="2">설명글 (최대 2000자)</td>
					</tr>
					<tr>
						<td colspan="2"><textarea name="p_content" style="width:60vw;" rows="10">${ list.get(0).P_CONTENT }</textarea></td>
					</tr>
					<c:forEach items="${ poList }" var="po" varStatus="i"> 
						<tr id="option${ i.index }">
							<td>옵션</td>
							<td><input type="text" name="p_option" required="required" value="${ po.p_option }"></td>
						</tr>
						<tr id="price${ i.index }">
							<td>가격(￦)</td>
							<td><input type="number" min="0" step="100" name="p_optionPrice" required="required" value="${ po.p_optionPrice }"></td>
						</tr>
						<tr id="stock${ i.index }">
							<td>재고</td>
							<td><input type="number" min="0" name="p_stock" required="required" value="${ po.p_stock }"></td>
						</tr>
						<tr id="optionAddNDelete${ i.index }">
							<c:if test="${ i.last == false}">
								<td><input id="add${ i.index }" class="btn" type="button" value="옵션 추가" style="display:none;" onclick="optionAdd(${ i.index });"></td>
							</c:if>
							<c:if test="${ i.last == true }">
								<td><input id="add${ i.index }" class="btn" type="button" value="옵션 추가" onclick="optionAdd(${ i.index });"></td>
							</c:if>
							
							<td><input class="btn" type="button" value="옵션 삭제" onclick="optionDelete(${ i.index });"></td>
						</tr>
					</c:forEach>
				</table>
				<div class="row center">
					<c:if test="${ list.get(0).M_ID eq loginUser.m_id  }">
						<button type="button" class="btn" onclick="deleteProduct();">상품 삭제</button>
					</c:if>
					<input type="button" class="btn" value="이전 페이지로" onclick="history.go(-1);">
					<input type="submit" class="btn" value="상품정보수정">
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		function deleteProduct(){
			var check = confirm("삭제하시겠습니까?");
			if(check){
				location.href="delete.product?p_num=${ list.get(0).P_NUM }";
			} else {
				alert("취소하셨습니다.");
			}
		}
		
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
			$("#detailImgArea").children('img').remove();
		
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
		/* 이미지 삭제 */
		function deleteImage(index){
			sel_files.splice(index,1);
			$('#deleteBtn'+index).remove();
			$("#img_id_"+index).remove();
		};
<%-- 이미지 미리보기 끝 --%>


<%-- 옵션 --%>
		var $table = $('#productDetail');
		var j = parseInt(document.getElementById('productDetail').lastChild.childElementCount / 4);

	<%-- 옵션 추가 --%>
		function optionAdd(num){
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
			j = parseInt(document.getElementById('productDetail').lastChild.childElementCount / 4);
		};
	<%-- 옵션 삭제 끝 --%>
	
<%-- 옵션 끝 --%>

		function check(){
			var p_option = document.getElementsByName("p_option");
			
			for (var i = 0 ; i < p_option.length; i ++) {
				for(var num = i+1 ; num < p_option.length ; num ++) {
					if(p_option[num].value == p_option[i].value){
						alert("옵션 중 같은 이름이 있습니다. 확인 후 변경해주세요.");
						return false;
					}
				}
			}
			if($('#imgInp').val() == '') {
				alert("썸네일을 다시 등록해주세요.");
				$("#imgInp").trigger('click');
				return false;
			}
		}
	</script>
</body>
<c:import url="../common/footer.jsp" />
</html>
