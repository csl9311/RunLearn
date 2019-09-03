<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href='${ contextPath }/resources/css/product/product.css'>
<style>
img{
	/* max-height: 15vh; */
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
			<form action="insert.product" class="form" method="post" enctype="Multipart/form-data" style="float: none; margin: 0 auto; width: 50vw;">
				<input type="hidden" name="m_id" value="판매자명">
				
				<label>썸네일</label>
				<input type="file" id="thumbInp" style="margin: auto;"/>
				<div id="thumbnail"></div>
				<br>
				<label>상세 이미지</label>
				<input type="file" id="imgInp" style="margin: auto;"/>
				<!-- <table id="imgArea" class="table center" ></table> -->
				<br>
				<div id="imgArea"></div>

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
						<td>옵션유무</td>
						<td>
							<input type="radio" name="option" value="O"><label>있음</label>
							<input type="radio" name="option" value="X"><label>없음</label>
						</td>
					</tr>
					<tr id="option">
						<td>옵션</td>
						<td><input type="text" name="p_option"></td>
					</tr>
					<tr>
						<td>가격</td>
						<td><input type="text" name="p_price"></td>
					</tr>
					<tr>
						<td>재고</td>
						<td><input type="text" name="p_stock"></td>
					</tr>
					<tr id="">
						<td><input class="btn" type="button" value="옵션 추가" onclick="optionAdd();"></td>
						<td><input class="btn" type="button" value="옵션 삭제" onclick="optionDelete();"></td>
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
	
		var i = 0; // td count
		var j = 0; // tr id
		
		function readURL(input) {
			if (input.files && input.files[0]) {
				var $imgArea = $('#imgArea');
				var $image = $('#image'+j);
				var reader = new FileReader();
				var fileName = input.value;
				
				console.log(input.files[0]);
				
				if(i % 5 == 0) {
					j++;
					reader.onload = function(e) {
						$imgArea.append(
							/* '<tr id="image' + j + '">'+ */
								'<div class="col-sm-4" id="img' + i + '">'+
									'<img src="' + e.target.result + '" class="img-responsive"/><br>'+
									'<button type="button" class="btn btn-sm" onclick="deleteImg('+ i +','+ j +');">삭제</button>' +
									'<input type="hidden" name="p_origin_name" value="' + fileName + '">' + 
								'</div>'/* +
							'</tr>' */
						);
					} 
				} else {
					reader.onload = function(e) {
						$imgArea.append(
							'<div class="col-sm-4" id="img' + i + '">'+
								'<img src="' + e.target.result + '" class="img-responsive"/><br>'+
								'<button type="button" class="btn btn-sm" onclick="deleteImg('+ i +','+ j +');">삭제</button>' +
								'<input type="hidden" name="p_origin_name" value="' + fileName + '">' + 
							'</div>'
						);
					}
				}
				i++;
				reader.readAsDataURL(input.files[0]);
			}
			console.log(this.imgArea);
			console.log(j);
		}

		$("#imgInp").change(function() {
			$('#foo').css('display', 'inherit');
			readURL(this);
		});
		
		function deleteImg(i, j){
			var td = $('#img' + i); // 선택 태그의 속성
			
			var nowTd = $('#img' + i);
			var nextTd = $('#img' + (i + 1));
			console.log(nowTd.find('img'));
			// 다음 이미지의 속성을 변수에 담아 현재 영역 속성에 대입.
			
			td.remove();
		}
		
		
	</script>
</body>
<c:import url="../common/footer.jsp" />
</html>
