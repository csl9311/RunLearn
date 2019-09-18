<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	.centerDetailBack {
		height: auto;
		margin-top: 60px;
		font-family: 'Nanum Gothic', sans-serif;
	}
	.centerDetailBack table {
		position: relative;
		margin: 50px auto;
		width: 95%;
		text-align: left;
		font-size: 16px;
		border-collapse: collapse;
		border-top: 1px solid #3d4045;
	}
	
	.centerDetailBack tr {
		border-bottom: 1px solid #3d4045;
	}
	
	.centerDetailBack th, .centerDetailBack td {
		padding: 10px 30px;
		margin: 0px;
		font-weight: 700;
	}
	
	.centerDetailBack th {
		background-color: #f2f2f2;
	    width: 20%;
	}
	
	#bContent{
		width: 100%;
		height: 300px;
		resize: none;
		font-weight: 400;
		border: 1px solid #3d4045;
		outline: none;
	}
	
	.centerDetailBack .buttons button {
		border: none;
	    background: #ff005a;
	    padding: 10px;
	    font-size: 15px;
	    color: white;
	    border-radius: 4px;
	}
	
	.centerDetailBack select {
		width: 17%;
		height: 30px;
		font-size: 15px;
	}
	
	.centerDetailBack .buttons button:hover {
	    box-shadow: 0 0 3px 0 #ff005a;
	}
	
	.centerDetailBack input[type='text'] {
		border: none;
		outline: none;
		border-bottom: 1px solid #3d4045;
		width: 90%;
	}
	
	.centerDetailBack input[type='text']:hover, .centerDetailBack input[type='text']:focus {
		border-bottom: 1px solid #ff005a;
	}
	
	.centerDetailBack select {
		outline: none;
	}
	
	#bContent:hover, #bContent:focus, .centerDetailBack select:hover, .centerDetailBack select:focus {
		border: 1px solid #ff005a;
	}
	
	.file-upload {
		margin-top: 30px;
	}
	
	.file-upload-btn {
	  width: 20%;
	  margin-top: 10px;
	  background: lightgray;
	  border: none;
	  padding: 10px;
	  border-radius: 4px;
	  border-bottom: 4px solid #bababa;
	  transition: all .2s ease;
	  outline: none;
	  font-size: 14px;
	  font-weight: 700;
	}
	
	.file-upload-btn:hover {
	  transition: all .2s ease;
	  cursor: pointer;
	}
	
	.file-upload-btn:active {
	  border: 0;
	  transition: all .2s ease;
	}
	
	.file-upload-content {
	  display: none;
	  text-align: center;
	}
	
	.file-upload-input {
	  position: absolute;
	  margin: 0;
	  padding: 0;
	  width: 60%;
	  height: 100%;
	  outline: none;
	  opacity: 0;
	  cursor: pointer;
	}
	
	.image-upload-wrap {
	  margin-top: 20px;
	  border: 1px dashed #3d4045;
	  position: relative;
	}
	
	.image-upload-wrap:hover {
	  border: 1px dashed #ff005a;
	}
	
	.image-dropping {
		border: 1px dashed #3d4045;
	}
	
	.image-title-wrap {
	  padding: 0 15px 15px 15px;
	  color: #222;
	}
	
	.drag-text {
	  text-align: center;
	}
	
	.drag-text h3 {
	  font-weight: 100;
	  color: #3d4045;
	  padding: 60px 0;
	}
	
	.file-upload-image {
		max-width: 80%;
		max-height: 80%;
	  margin: auto;
	  padding: 20px;
	}
	
	.remove-image {
	  width: 100px;
	  margin: 0;
	  background: lightgray;
	  border: none;
	  padding: 10px;
	  border-radius: 4px;
	  border-bottom: 4px solid #bababa;
	  transition: all .2s ease;
	  outline: none;
	  text-transform: uppercase;
	  font-size: 13px;
	  font-weight: 700;
	}
	
	.remove-image:hover {
	  transition: all .2s ease;
	  cursor: pointer;
	}
	
	.remove-image:active {
	  border: 0;
	  transition: all .2s ease;
	}
</style>
</head>
<body>
	<c:import url="../common/header.jsp"/>
	<div class="container centerDetailBack">
		<form action="cCenterInsert.do" method="POST">
			<input type="hidden" name="m_id" value="${ loginUser.m_id }">
			<input type="hidden" name="b_category" value="${ b_category }">
			<div class="row">
				<h3>●&nbsp;${ b_category }</h3>
				<div class="col-md">
					<table>
						<tr id="bTitleTr">
							<th>제목</th>
							<td><input type="text" name="b_title"></td>
						</tr>
						<tr>
							<th>세부 카테고리</th>
							<td>
								<select name="b_subcategory">
									<option>상품</option>
									<option>강의</option>
									<option>기타</option>
								</select>
							</td>
						</tr>
						<tr>
							<th rowspan="2">내용</th>
							<td style="width: 100%; padding: 50px;">
								<textarea id="bContent" name="b_content"></textarea>
								<c:if test="${ b_category eq '신고글' }">
									<div class="file-upload">
									  <div class="image-upload-wrap">
									    <input class="file-upload-input" type='file' onchange="readURL(this);" accept="image/*" name="b_origin_name" />
									    <div class="drag-text">
									      <h3>Drag and drop OR select add Image</h3>
									    </div>
									  </div>
									  <div class="file-upload-content">
									    <img class="file-upload-image" src="#" alt="your image" />
									    <div class="image-title-wrap">
									      <p class="image-title">Uploaded Image</p>
									      <button type="button" onclick="removeUpload()" class="remove-image">이미지 삭제</button>
									    </div>
									  </div>
									  <button class="file-upload-btn" type="button" onclick="$('.file-upload-input').trigger( 'click' )">이미지 첨부</button>
									</div>
								</c:if>
							</td>
						</tr>
					</table>
				</div>
				<div class="x-100"></div>
				<c:url var="blist" value="cCenterView.do">
					<c:param name="b_category" value="${ b_category }"/>
					<c:param name="page" value="${ page }"/>
				</c:url>
				<div class="col-md buttons" style="text-align: center; margin-bottom: 50px;">
					<button type="button" onclick="location.href='${blist}'" style="margin-right: 20px;">목록으로</button>
					<button type="submit">작성하기</button>
				</div>
			</div>
		</form>
	</div>
	
	<c:import url="../common/footer.jsp"/>
	
	<script>
		function readURL(input) {
			  if (input.files && input.files[0]) {
	
			    var reader = new FileReader();
	
			    reader.onload = function(e) {
			      $('.image-upload-wrap').hide();
				  $('.file-upload-btn').hide();
				  
			      $('.file-upload-image').attr('src', e.target.result);
			      $('.file-upload-content').show();
	
			      $('.image-title').html(input.files[0].name);
			    };
	
			    reader.readAsDataURL(input.files[0]);
	
			  } else {
			    removeUpload();
			  }
			}
	
			function removeUpload() {
			  $('.file-upload-input').replaceWith($('.file-upload-input').clone());
			  $('.file-upload-content').hide();
			  $('.image-upload-wrap').show();
			  $('.file-upload-btn').show();
			}
			$('.image-upload-wrap').bind('dragover', function () {
					$('.image-upload-wrap').addClass('image-dropping');
				});
				$('.image-upload-wrap').bind('dragleave', function () {
					$('.image-upload-wrap').removeClass('image-dropping');
			});
	</script>
</body>
</html>