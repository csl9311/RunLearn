<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의신청</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
<style>
.row .col-sm-2 {
	height: 50px;
	border: 1px solid black;
	background-color: aliceblue;
	color: black;
	font-size: 12px;
	font-weight: 20px;
}

.row .col-sm-2:hover {
	background-color: azure;
	color: gray;
}

.row .col-sm-2 a:hover {
	cursor: pointer;
}
.hover:hover{
	cursor : pointer;
}
</style>

</head>
<body>
	<c:import url="../common/header.jsp" />
	<div class="container" style="min-height: 300px; margin-top: 20px;">
		<h1>강의 신청</h1>
		<h6></h6>
		<form method="post" enctype="Multipart/form-data" action="lectureApply.le" id="ApplyForm">
			<div class="col-md-12 mb-4">
				<div class="row">
					<h3>강의 제목</h3>
					<input type="text" class="form-control" name="l_title"
						placeholder="강의명을 입력해 주세요" value="" required>
				</div>
			</div>
			<div class="col-md-12 mb-4">
				<div class="row">
					<h3>강의 가격</h3>
					<input type="number" class="form-control" name="l_price" placeholder="강의 가격을 입력해 주세요" value="" min="0" step="100" required>
				</div>
			</div>
			<h3>카테고리</h3>
			<div>
				<div class="col-md-3 mb-3">
					<div class="custom-control custom-radio">
						<input id="design" name="l_category" type="radio"
							class="custom-control-input" value="디자인" checked required> <label
							class="custom-control-label" for="design">디자인</label>
					</div>
				</div>
				<div class="col-md-3 mb-3">
					<div class="custom-control custom-radio">
						<input id="working" name="l_category" type="radio"
							class="custom-control-input" value="실무역량" required> <label
							class="custom-control-label" for="working">실무역량</label>
					</div>
				</div>
				<div class="col-md-3 mb-3">
					<div class="custom-control custom-radio">
						<input id="beautiy" name="l_category" type="radio"
							class="custom-control-input" value="뷰티" required> <label
							class="custom-control-label" for="beautiy">뷰티</label>
					</div>
				</div>
				<div class="col-md-3 mb-3">
					<div class="custom-control custom-radio">
						<input id="media" name="l_category" type="radio"
							class="custom-control-input" value="영상" required> <label
							class="custom-control-label" for="media">영상</label>
					</div>
				</div>
				<div class="col-md-3 mb-3">
					<div class="custom-control custom-radio">
						<input id="language" name="l_category" type="radio"
							class="custom-control-input" value="외국어" required> <label
							class="custom-control-label" for="language">외국어</label>
					</div>
				</div>
				<div class="col-md-3 mb-3">
					<div class="custom-control custom-radio">
						<input id="music" name="l_category" type="radio"
							class="custom-control-input" value="음악" required> <label
							class="custom-control-label" for="music">음악</label>
					</div>
				</div>
				<div class="col-md-3 mb-3">
					<div class="custom-control custom-radio">
						<input id="lifeStyle" name="l_category" type="radio"
							class="custom-control-input" value="라이프스타일" required> <label
							class="custom-control-label" for="lifeStyle">라이프스타일</label>
					</div>
				</div>
				<div class="col-md-3 mb-3">
					<div class="custom-control custom-radio">
						<input id="jetech" name="l_category" type="radio"
							class="custom-control-input" value="제테크" required> <label
							class="custom-control-label" for="jetech">제테크</label>
					</div>
				</div>
			</div>
			<h6>　</h6>
			<div align="center">
				<h4>메인 이미지추가</h4>
				<div class="input_wrap">
					<a href="javascript:" onclick="MainFileUploadAction();" class="my_button">[파일 업로드]</a>
					<input type="file" id="input_main_imgs" name="mainImage" style="display: none;" accept="image/gif, image/jpeg, image/png"/>
				</div>
				<div>
					<div class="main_imgs_wrap" style="width: 100%">
						<img id="img"/>
					</div>
				</div>
			</div>
			<!-- <div id="MainImg" align="center">
				<h4>강의 메인 이미지 선택</h4>
				<div id="button2">
					<input type='file' name="mainImage" id="MainImageId"
						accept="image/gif, image/jpeg, image/png" />
				</div>
				<br> <img width="80%" id="mainImageThumb"
					style="background: white"> <br>
			</div> -->
			<script type="text/javascript">
			var main_sel_files = [];
			$(document).ready(function(){
				$("#input_main_imgs").on("change", mainHandleImageFileSelect);
			});
			function MainFileUploadAction(){
				$("#input_main_imgs").trigger('click');
			}
			function mainHandleImageFileSelect(e){
				main_sel_files = [];
				$(".main_imgs_wrap").empty();
				
				var mainFiles = e.target.files;
				var mainFilesArr = Array.prototype.slice.call(mainFiles);
				var main_index = 0;
				mainFilesArr.forEach(function(f){
					if(!f.type.match("image.*")){
						alert("확장자는 이미지 확장자만 가능합니다.");
						return;
					}
					
					main_sel_files.push(f);
					
					var reader = new FileReader();
					reader.onload = function(e){
						var main_html = "<a href\"javascript:void(0);\" onclick=\"mainDeleteImageAction("+main_index+")\" id = \"main_img_id_"+main_index+"\"><img src=\""+e.target.result+"\" data-file='"+f.name+"' class='mainImgFile' title='click to remove' style='width:100%;'></a>";
						$(".main_imgs_wrap").append(main_html);
						main_index++;
					}
					reader.readAsDataURL(f);
				});
			}
			function mainDeleteImageAction(main_index){
				sel_files.splice(main_index,1);
				var main_img_id = "#main_img_id_"+main_index;
				$(main_img_id).remove();
			}
			
				/* function mainImage(input) {
					if (input.files && input.files[0]) {
						var reader = new FileReader();

						reader.onload = function(e) {
							$('#mainImageThumb').attr('src', e.target.result);
						}
						reader.readAsDataURL(input.files[0]);
					}
				}
				$("#MainImageId").change(function() {
					mainImage(this);
				}); */
			</script>
			<div class="col-sm-12">
				<div id="Cintro" style="height: 60px;"></div>
				<div class="row" style="margin-bottom: 10px;">
					<div class="col-sm-2" style="border-bottom: 0px;" align="center"
						onclick="location.href='#Cintro'"><h4 style="font-family: 'Jua'; color : darkblue;">강의소개</h4></div>
					<div class="col-sm-2" align="center"
						onclick="location.href='#Tintro'"><h4 style="font-family: 'Jua'">강사소개</h4></div>
					<div class="col-sm-2" align="center"
						onclick="location.href='#curr'"><h4 style="font-family: 'Jua'">커리큘럼</h4></div>
					<div class="col-sm-2" align="center"
						onclick="location.href='#target'"><h4 style="font-family: 'Jua'">강의목표</h4></div>
					<div class="col-sm-2" align="center"
						onclick="location.href='#address'"><h4 style="font-family: 'Jua'">강의실 주소</h4></div>
					<div class="col-sm-2" align="center"
						onclick="location.href='#reply'"><h4 style="font-family: 'Jua'">강의댓글</h4></div>
				</div>
			</div>
			<div class="col-sm-12">
			<div class="mb-3">
				<label>강의 상세설명</label>
				<textarea rows="10" cols="" class="form-control"
					style="resize: none;" name="l_content"
					placeholder="강의에 대한 상세설명을 적어주세요.&#13;&#10;(※개인정보보호차원에서 연락처기능을 따로 제공하지 않기 때문에, 본인 판단하에 연락처를 이곳에 넣어주십시오.)"></textarea>
			</div>
			
			<div class="row">
			<div class="col-md-12" align="center">
				<div id="Cattach">
	                <label style="font-weight: bold; font-size: 15pt;" class="waves-effect waves-teal btn-flat hover" for="cuploadInputBox">[상세 설명 이미지 첨부]</label>
	                <input id="cuploadInputBox" style="display: none" type="file" name="cfiledata"/>
            	</div>
				<div id="cpreview" class="content" style="width:100%;"></div>
				
			</div>
			</div>
			<script type="text/javascript">
			var cfiles = {};
	        var cpreviewIndex = 0;
	 
	        // image preview 기능 구현
	        // input = file object[]
	        function caddPreview(input) {
	            if (input[0].files) {
	                for (var fileIndex = 0; fileIndex < input[0].files.length; fileIndex++) {
	                    var file = input[0].files[fileIndex];
	 
	                    if (cvalidation(file.name))
	                        continue;
	 
	                    var reader = new FileReader();
	                    reader.onload = function(img) {
	                       
	                        var imgNum = cpreviewIndex++;
	                        $("#cpreview")
	                                .append(
	                                        "<div class=\"preview-box\" value=\"" + imgNum +"\">"
	                                                + "<img class=\"thumbnail\" src=\"" + img.target.result + "\"\ style='width:100%;'/>"
	                                                + "<p>"
	                                                + file.name
	                                                + "</p>"
	                                                + "<div class=\"btn btn-primary\" value=\""
	                                                + imgNum
	                                                + "\" onclick=\"cdeletePreview(this)\">"
	                                                + "삭제" + "</div>" + "</div>");
	                        cfiles[imgNum] = file;
	                    };
	                    reader.readAsDataURL(file);
	                }
	            } else
	                alert('invalid file input'); // 첨부클릭 후 취소시의 대응책은 세우지 않았다.
	        }
	 
	        //preview 영역에서 삭제 버튼 클릭시 해당 미리보기이미지 영역 삭제
	        function cdeletePreview(obj) {
	            var imgNum = obj.attributes['value'].value;
	            delete cfiles[imgNum];
	            $("#cpreview .preview-box[value=" + imgNum + "]").remove();
	        }
	 
	        //client-side validation
	        //always server-side validation required
	        function cvalidation(fileName) {
	            fileName = fileName + "";
	            var fileNameExtensionIndex = fileName.lastIndexOf('.') + 1;
	            var fileNameExtension = fileName.toLowerCase().substring(
	                    fileNameExtensionIndex, fileName.length);
	            if (!((fileNameExtension === 'jpg')
	                    || (fileNameExtension === 'gif') || (fileNameExtension === 'png'))) {
	                alert('jpg, gif, png 확장자만 업로드 가능합니다.');
	                return true;
	            } else {
	                return false;
	            }
	        }
	 
	        $(document).ready(function() {
	            $('#submitBtn').on('click',function() { 
	            	
	                var cform = $('#cuploadForm')[0];
	                var cformData = null;
	                cformData = new FormData(cform);
	                for (var index = 0; index < cpreviewIndex; index++) {
	                    cformData.append('cfiles', cfiles[index]);
	                }
	                $.ajax({
	                    type : 'POST',
	                    enctype : 'multipart/form-data',
	                    processData : false,
	                    contentType : false,
	                    cache : false,
	                    timeout : 600000,
	                    url : 'contImageInsert.le',
	                    data : cformData,
	                    success : function(result) {
	        	                var tform = $('#tuploadForm')[0];
	        	                var tformData = null;
	        	                tformData = new FormData(tform);
	        	    			for (var index = 0; index < tpreviewIndex; index++) {
	        	                    tformData.append('tfiles', tfiles[index]);
	        	                }
	        	                $.ajax({
	        	                    type : 'POST',
	        	                    enctype : 'multipart/form-data',
	        	                    processData : false,
	        	                    contentType : false,
	        	                    cache : false,
	        	                    timeout : 600000,
	        	                    url : 'tutorImageInsert.le',
	        	                    data : tformData,
	        	                    success : function(result) {
	        	                        $("#hiddenTutoValue").val(result);
	        	        	                var rform = $('#ruploadForm')[0];
	        	        	                var rformData = null;
	        	        	                rformData = new FormData(rform);
	        	        	                for (var index = 0; index < rpreviewIndex; index++) {
	        	        	                    rformData.append('rfiles',rfiles[index]);
	        	        	                }
	        	        	                $.ajax({
	        	        	                    type : 'POST',
	        	        	                    enctype : 'multipart/form-data',
	        	        	                    processData : false,
	        	        	                    contentType : false,
	        	        	                    cache : false,
	        	        	                    timeout : 600000,
	        	        	                    url : 'currImageInsert.le',
	        	        	                    dataType : 'JSON',
	        	        	                    data : rformData,
	        	        	                    success : function(result) {
	        	        	                        $("#hiddenCurrValue").val(result);
	        	        	                        $("#ApplyForm").submit();
	        	        	                    }
	        	        	                });
	        	        	            }
	        	                    });
	        	                }
	        	            });
	                        $("#hiddenContValue").val(result);
	                    //전송실패에대한 핸들링은 고려하지 않음
	                });
	            // <input type=file> 태그 기능 구현
	            $('#Cattach input[type=file]').change(function() {
	                caddPreview($(this)); //preview form 추가하기
	            });
	        });
			</script>
			<input type="hidden" id="hiddenContValue" name="ContResult"/>
			</div>
			<div class="col-sm-12">
				<div id="Tintro" style="height: 60px;"></div>
				<div class="row" style="margin-bottom: 10px;">
					<div class="col-sm-2" align="center"
						onclick="location.href='#Cintro'"><h4 style="font-family: 'Jua'">강의소개</h4></div>
					<div class="col-sm-2" style="border-bottom: 0px;" align="center"
						onclick="location.href='#Tintro'"><h4 style="font-family: 'Jua'; color : darkblue;">강사소개</h4></div>
					<div class="col-sm-2" align="center"
						onclick="location.href='#curr'"><h4 style="font-family: 'Jua'">커리큘럼</h4></div>
					<div class="col-sm-2" align="center"
						onclick="location.href='#target'"><h4 style="font-family: 'Jua'">강의목표</h4></div>
					<div class="col-sm-2" align="center"
						onclick="location.href='#address'"><h4 style="font-family: 'Jua'">강의실 주소</h4></div>
					<div class="col-sm-2" align="center"
						onclick="location.href='#reply'"><h4 style="font-family: 'Jua'">강의댓글</h4></div>
				</div>
			</div>
			<div class="col-sm-12" align="center">
			<div class="row">
			<div class="col-md-12" align="center">
				<div id="Tattach">
	                <label style="font-weight: bold; font-size: 15pt;" class="waves-effect waves-teal btn-flat hover" for="tuploadInputBox">[강사 소개 이미지 첨부]</label>
	                <input id="tuploadInputBox" style="display: none" type="file" name="tfiledata"/>
            	</div>
				<div id="tpreview" class="content" style="width:100%;"></div>
				
			</div>
			</div>
			<script type="text/javascript">
			var tfiles = {};
	        var tpreviewIndex = 0;
	 
	        // image preview 기능 구현
	        // input = file object[]
	        function taddPreview(input) {
	            if (input[0].files) {
	                for (var fileIndex = 0; fileIndex < input[0].files.length; fileIndex++) {
	                    var file = input[0].files[fileIndex];
	 
	                    if (tvalidation(file.name))
	                        continue;
	 
	                    var reader = new FileReader();
	                    reader.onload = function(img) {
	                       
	                        var imgNum = tpreviewIndex++;
	                        $("#tpreview")
	                                .append(
	                                        "<div class=\"preview-box\" value=\"" + imgNum +"\">"
	                                                + "<img class=\"thumbnail\" src=\"" + img.target.result + "\"\ style='width:100%;'/>"
	                                                + "<p>"
	                                                + file.name
	                                                + "</p>"
	                                                + "<div class=\"btn btn-primary\" value=\""
	                                                + imgNum
	                                                + "\" onclick=\"tdeletePreview(this)\">"
	                                                + "삭제" + "</div>" + "</div>");
	                        tfiles[imgNum] = file;
	                    };
	                    reader.readAsDataURL(file);
	                }
	            } else
	                alert('invalid file input'); // 첨부클릭 후 취소시의 대응책은 세우지 않았다.
	        }
	 
	        //preview 영역에서 삭제 버튼 클릭시 해당 미리보기이미지 영역 삭제
	        function tdeletePreview(obj) {
	            var imgNum = obj.attributes['value'].value;
	            delete tfiles[imgNum];
	            $("#tpreview .preview-box[value=" + imgNum + "]").remove();
	        }
	 
	        //client-side validation
	        //always server-side validation required
	        function tvalidation(fileName) {
	            fileName = fileName + "";
	            var fileNameExtensionIndex = fileName.lastIndexOf('.') + 1;
	            var fileNameExtension = fileName.toLowerCase().substring(
	                    fileNameExtensionIndex, fileName.length);
	            if (!((fileNameExtension === 'jpg')
	                    || (fileNameExtension === 'gif') || (fileNameExtension === 'png'))) {
	                alert('jpg, gif, png 확장자만 업로드 가능합니다.');
	                return true;
	            } else {
	                return false;
	            }
	        }
	 
	        $(document).ready(function() {
	            
	            // <input type=file> 태그 기능 구현
	            $('#Tattach input[type=file]').change(function() {
	                taddPreview($(this)); //preview form 추가하기
	            });
	        });
			</script>
			<input type="hidden" id="hiddentutoValue" name="ContResult"/>
			</div>
			<div class="col-sm-12">
				<div id="curr" style="height: 60px;"></div>
				<div class="row" style="margin-bottom: 10px;">
					<div class="col-sm-2" align="center"
						onclick="location.href='#Cintro'"><h4 style="font-family: 'Jua'">강의소개</h4></div>
					<div class="col-sm-2" align="center"
						onclick="location.href='#Tintro'"><h4 style="font-family: 'Jua'">강사소개</h4></div>
					<div class="col-sm-2" style="border-bottom: 0px;" align="center"
						onclick="location.href='#curr'"><h4 style="font-family: 'Jua'; color : darkblue;">커리큘럼</h4></div>
					<div class="col-sm-2" align="center"
						onclick="location.href='#target'"><h4 style="font-family: 'Jua'">강의목표</h4></div>
					<div class="col-sm-2" align="center"
						onclick="location.href='#address'"><h4 style="font-family: 'Jua'">강의실 주소</h4></div>
					<div class="col-sm-2" align="center"
						onclick="location.href='#reply'"><h4 style="font-family: 'Jua'">강의댓글</h4></div>
				</div>
			</div>
			<div class="col-sm-12">
			<div class="row">
			<div class="col-md-12" align="center">
				<div id="Rattach">
	                <label style="font-weight: bold; font-size: 15pt;" class="waves-effect waves-teal btn-flat hover" for="ruploadInputBox">[커리큘럼 이미지 첨부]</label>
	                <input id="ruploadInputBox" style="display: none" type="file" name="rfiledata"/>
            	</div>
				<div id="rpreview" class="content" style="width:100%;"></div>
				
			</div>
			</div>
			<script type="text/javascript">
			var rfiles = {};
	        var rpreviewIndex = 0;
	 
	        // image preview 기능 구현
	        // input = file object[]
	        function raddPreview(input) {
	            if (input[0].files) {
	                for (var fileIndex = 0; fileIndex < input[0].files.length; fileIndex++) {
	                    var file = input[0].files[fileIndex];
	 
	                    if (rvalidation(file.name))
	                        continue;
	 
	                    var reader = new FileReader();
	                    reader.onload = function(img) {
	                       
	                        var imgNum = rpreviewIndex++;
	                        $("#rpreview")
	                                .append(
	                                        "<div class=\"preview-box\" value=\"" + imgNum +"\">"
	                                                + "<img class=\"thumbnail\" src=\"" + img.target.result + "\"\ style='width:100%;'/>"
	                                                + "<p>"
	                                                + file.name
	                                                + "</p>"
	                                                + "<div class=\"btn btn-primary\" value=\""
	                                                + imgNum
	                                                + "\" onclick=\"rdeletePreview(this)\">"
	                                                + "삭제" + "</div>" + "</div>");
	                        rfiles[imgNum] = file;
	                    };
	                    reader.readAsDataURL(file);
	                }
	            } else
	                alert('invalid file input'); // 첨부클릭 후 취소시의 대응책은 세우지 않았다.
	        }
	 
	        //preview 영역에서 삭제 버튼 클릭시 해당 미리보기이미지 영역 삭제
	        function rdeletePreview(obj) {
	            var imgNum = obj.attributes['value'].value;
	            delete rfiles[imgNum];
	            $("#rpreview .preview-box[value=" + imgNum + "]").remove();
	        }
	 
	        //client-side validation
	        //always server-side validation required
	        function rvalidation(fileName) {
	            fileName = fileName + "";
	            var fileNameExtensionIndex = fileName.lastIndexOf('.') + 1;
	            var fileNameExtension = fileName.toLowerCase().substring(
	                    fileNameExtensionIndex, fileName.length);
	            if (!((fileNameExtension === 'jpg')
	                    || (fileNameExtension === 'gif') || (fileNameExtension === 'png'))) {
	                alert('jpg, gif, png 확장자만 업로드 가능합니다.');
	                return true;
	            } else {
	                return false;
	            }
	        }
	 
	        $(document).ready(function() {
	            
	            // <input type=file> 태그 기능 구현
	            $('#Rattach input[type=file]').change(function() {
	                raddPreview($(this)); //preview form 추가하기
	            });
	        });
			</script>
			<input type="hidden" id="hiddenCurrValue" name="CurrResult">
			</div>
			<div class="col-sm-12">
				<div id="target" style="height: 60px;"></div>
				<div class="row" style="margin-bottom: 10px;">
					<div class="col-sm-2" align="center"
						onclick="location.href='#Cintro'"><h4 style="font-family: 'Jua'">강의소개</h4></div>
					<div class="col-sm-2" align="center"
						onclick="location.href='#Tintro'"><h4 style="font-family: 'Jua'">강사소개</h4></div>
					<div class="col-sm-2" align="center"
						onclick="location.href='#curr'"><h4 style="font-family: 'Jua'">커리큘럼</h4></div>
					<div class="col-sm-2" style="border-bottom: 0px;" align="center"
						onclick="location.href='#target'"><h4 style="font-family: 'Jua'; color : darkblue;">강의목표</h4></div>
					<div class="col-sm-2" align="center"
						onclick="location.href='#address'"><h4 style="font-family: 'Jua'">강의실 주소</h4></div>
					<div class="col-sm-2" align="center"
						onclick="location.href='#reply'"><h4 style="font-family: 'Jua'">강의댓글</h4></div>
				</div>
			</div>
			<div class="col-sm-12">
				<div class="row">
					<div class="col-md-12 mb-4">
						<label>강의 목표</label> <input type="text" class="form-control"
							name="l_object" placeholder="강의목표를 입력해 주세요" value=""
							required>
					</div>
				</div>
			</div>
			<div class="col-sm-12">
			<div id="address" style="height: 60px;"></div>
			<div class="row" style="margin-bottom: 10px;">
				<div class="col-sm-2" align="center"
					onclick="location.href='#Cintro'"><h4 style="font-family: 'Jua'">강의소개</h4></div>
				<div class="col-sm-2" align="center"
					onclick="location.href='#Tintro'"><h4 style="font-family: 'Jua'">강사소개</h4></div>
				<div class="col-sm-2" align="center"
					onclick="location.href='#curr'"><h4 style="font-family: 'Jua'">커리큘럼</h4></div>
				<div class="col-sm-2" align="center"
					onclick="location.href='#target'"><h4 style="font-family: 'Jua'">강의목표</h4></div>
				<div class="col-sm-2"
					style="border-right: 1px solid black; border-bottom: 0px;"
					align="center" onclick="location.href='#address'"><h4 style="font-family: 'Jua'; color : darkblue;">강의실 주소</h4></div>
				<div class="col-sm-2" align="center"
					onclick="location.href='#reply'"><h4 style="font-family: 'Jua'">강의댓글</h4></div>
			</div>
		</div>
		<div class="col-sm-12">
				<div class="row">
					<div class="col-md-8 mb-3">
						<label>강의 방법</label>
					</div>
					<div class="col-md-2 mb-3">
						<div class="custom-control custom-radio" onclick="openAddress();">
							<input id="offline" name="l_system" type="radio"
								class="custom-control-input" value="1" checked required> <label
								class="custom-control-label" for="offline" id="offlineLabel">현장강의</label>
						</div>
					</div>

					<div class="col-md-2 mb-3">
						<div class="custom-control custom-radio"
							onclick="closeAddress();">
							<input id="online" name="l_system" type="radio"
								class="custom-control-input" value="0" required> <label
								class="custom-control-label" for="online" id="onlineLabel">온라인
								강의</label>
						</div>
					</div>
				</div>
				<script>
		        function openAddress(){
		        	$('#addressInput').slideDown();
		        }
		        function closeAddress(){
		        	$('#addressInput').slideUp();
		        	$('#mapC').slideUp();
		        	$('#sample4_roadAddress').val("");
		        	$('#sample4_detailAddress').val("");
		        }
		        </script>
				<div class="mb-3 row" id="addressInput">
					<div class="col-md-5 mb-3">
						<label>강의 주소</label> <input type="hidden" id="sample4_postcode"
							placeholder="우편번호"> <input type="text"
							class="form-control" id="sample4_roadAddress"
							placeholder="도로명주소*" name="adr1">
					</div>
					<div class="col-md-3 mb-3">
						<label>　</label> <input type="text" class="form-control"
							id="sample4_detailAddress" name="adr2" placeholder="상세주소*">
					</div>
					<div class="col-md-2 mb-3" align="center">
						<div style="height: 40%;"></div>
						<button class="btn btn-primary mb-3" type="button"
							onclick="sample4_execDaumPostcode();">검색</button>
					</div>
					<div class="col-md-2 mb-3">
						<div style="height: 40%;"></div>
						<button id="mapBtn" type="button" class="btn btn-secondary mb-3"
							onclick="mapOpen();">지도로 확인하기</button>
					</div>
				</div>
				<script>
				function sample4_execDaumPostcode() {
					new daum.Postcode({
						oncomplete: function(data) {
							var roadAddr = data.roadAddress;
							document.getElementById("sample4_roadAddress").value = roadAddr;
						}
					}).open();
				}
				</script>
				<div id="mapC" style="width: 100%; height: 355px;">
					<div id="map" style="width: 100%; height: 350px;"></div>
				</div>

				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c7cf7462e708fa6699765139ddbccfb5&libraries=services"></script>
				<script>
				function mapOpen(){
					$('#mapC').slideDown();
					var location = $('#sample4_roadAddress').val();
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					    mapOption = {
					        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
					        level: 3 // 지도의 확대 레벨
					    };
					
					// 지도를 생성합니다    
					var map = new kakao.maps.Map(mapContainer, mapOption); 
					
					// 주소-좌표 변환 객체를 생성합니다
					var geocoder = new kakao.maps.services.Geocoder();
					
					// 주소로 좌표를 검색합니다
					geocoder.addressSearch(location, function(result, status) {
					
					    // 정상적으로 검색이 완료됐으면 
					     if (status === kakao.maps.services.Status.OK) {
					
					        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
					
					        // 결과값으로 받은 위치를 마커로 표시합니다
					        var marker = new kakao.maps.Marker({
					            map: map,
					            position: coords
					        });
					
					        // 인포윈도우로 장소에 대한 설명을 표시합니다
					        var infowindow = new kakao.maps.InfoWindow({
					            content: '<div style="width:150px;text-align:center;padding:6px 0;">강의 장소</div>'
					        });
					        infowindow.open(map, marker);
					
					        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
					        map.setCenter(coords);
					    }
					});
				}
				$(function(){
					$('#mapC').css("display","none");
				});
				</script>
			</div>
			<h6></h6>
			<div class="col-sm-12">
				<div id="reply" style="height: 40px;"></div>
				<div class="row" style="margin-bottom: 10px;">
					<div class="col-sm-2" align="center"
						onclick="location.href='#Cintro'"><h4 style="font-family: 'Jua'">강의소개</h4></div>
					<div class="col-sm-2" align="center"
						onclick="location.href='#Tintro'"><h4 style="font-family: 'Jua'">강사소개</h4></div>
					<div class="col-sm-2" align="center"
						onclick="location.href='#curr'"><h4 style="font-family: 'Jua'">커리큘럼</h4></div>
					<div class="col-sm-2" align="center"
						onclick="location.href='#target'"><h4 style="font-family: 'Jua'">강의목표</h4></div>
					<div class="col-sm-2" align="center"
						onclick="location.href='#address'"><h4 style="font-family: 'Jua'">강의실 주소</h4></div>
					<div class="col-sm-2" align="center" style="border-bottom: 0px;"
						onclick="location.href='#reply'"><h4 style="font-family: 'Jua'; color : darkblue;">강의댓글</h4></div>
				</div>
			</div>
			<div align="center">
				<h1>강의댓글이 들어갈 공간입니다.</h1>
			</div>
			<h6>　</h6>
			<div align="right">
				<button type="button" class="btn btn-secondary" id="submitBtn" style="margin-right: 5%;">신청하기</button>
			</div>
		</form>
		<form id="ruploadForm" style="display: none;"></form>
		<form id="cuploadForm" style="display: none;"></form>
		<form id="tuploadForm" style="display: none;"></form>
		<script>
		</script>
	</div>
</body>

	<div>
		<h4></h4>
	</div>

	<c:import url="../common/footer.jsp" />
</body>
</html>