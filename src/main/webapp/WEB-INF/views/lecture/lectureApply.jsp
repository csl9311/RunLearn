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
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
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
</style>

</head>
<body>
	<c:import url="common/header.jsp" />
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
					<input type="number" class="form-control" name="l_price" placeholder="강의 가격을 입력해 주세요" value="" step="100" required>
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
					<input type="file" id="input_main_imgs" name="MainImgs" style="display: none;" accept="image/gif, image/jpeg, image/png"/>
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
				console.log("MainFileUploadAction");
				$("#input_main_imgs").trigger('click');
			}
			function mainHandleImageFileSelect(e){
				main_sel_files = [];
				$(".main_imgs_wrap").empty();
				
				var mainFiles = e.target.files;
				var mainFilesArr = Array.prototype.slice.call(mainFiles);
				console.log(mainFilesArr);
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
			function contDeleteImageAction(main_index){
				console.log("index : "+ main_index);
				sel_files.splice(main_index,1);
				var main_img_id = "#cont_img_id_"+main_index;
				$(main_img_id).remove();
				console.log(main_sel_files);
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
						onclick="location.href='#reply'"><h4 style="font-family: 'Jua'">강의평</h4></div>
				</div>
			</div>
			<div class="col-sm-12">
			<div class="mb-3">
				<label>강의 상세설명</label>
				<textarea rows="10" cols="" class="form-control"
					style="resize: none;" name="l_content"
					placeholder="강의에 대한 상세설명을 적어주세요.&#13;&#10;(※개인정보보호차원에서 연락처기능을 따로 제공하지 않기 때문에, 본인 판단하에 연락처를 이곳에 넣어주십시오.)"></textarea>
			</div>
			
			<div align="center">
				<h4>상세설명 이미지추가</h4>
				<div class="input_wrap">
					<a href="javascript:" onclick="ContentFileUploadAction();" class="my_button">[파일 업로드]</a>
					<input type="file" id="input_cont_imgs" name="contImgs" multiple style="display: none;" accept="image/gif, image/jpeg, image/png"/>
				</div>
				<div>
					<div class="cont_imgs_wrap" style="width: 100%">
						<img id="img"/>
					</div>
				</div>
			</div>
			<script type="text/javascript">
				var cont_sel_files = [];
				$(document).ready(function(){
					$("#input_cont_imgs").on("change", contHandleImageFileSelect);
				});
				function ContentFileUploadAction(){
					console.log("ContentFileUploadAction");
					$("#input_cont_imgs").trigger('click');
				}
				function contHandleImageFileSelect(e){
					cont_sel_files = [];
					$(".cont_imgs_wrap").empty();
					
					var contFiles = e.target.files;
					var contFilesArr = Array.prototype.slice.call(contFiles);
					console.log(contFilesArr);
					var cont_index = 0;
					contFilesArr.forEach(function(f){
						if(!f.type.match("image.*")){
							alert("확장자는 이미지 확장자만 가능합니다.");
							return;
						}
						
						cont_sel_files.push(f);
						
						var reader = new FileReader();
						reader.onload = function(e){
							var cont_html = "<a href\"javascript:void(0);\" onclick=\"contDeleteImageAction("+cont_index+")\" id = \"cont_img_id_"+cont_index+"\"><img src=\""+e.target.result+"\" data-file='"+f.name+"' class='contentImgFile' title='click to remove' style='width:100%;'></a>";
							$(".cont_imgs_wrap").append(cont_html);
							cont_index++;
						}
						reader.readAsDataURL(f);
					});
				}
				function contDeleteImageAction(cont_index){
					console.log("index : "+ cont_index);
					sel_files.splice(cont_index,1);
					var cont_img_id = "#cont_img_id_"+cont_index;
					$(cont_img_id).remove();
					console.log(cont_sel_files);
				}
			</script>
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
						onclick="location.href='#reply'"><h4 style="font-family: 'Jua'">강의평</h4></div>
				</div>
			</div>
			<div class="col-sm-12">
				<br>
				<textarea rows="5" cols="" class="form-control"
					style="resize: none;" name="introduce"
					placeholder="자기소개 혹은 연혁을 기입해 주십시오"></textarea>
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
						onclick="location.href='#reply'"><h4 style="font-family: 'Jua'">강의평</h4></div>
				</div>
			</div>
			<div class="col-sm-12">
			<div align="center">
				<h4>커리큘럼 이미지 추가</h4>
				<div class="input_wrap">
					<a href="javascript:" onclick="fileUploadAction();" class="my_button">[파일 업로드]</a>
					<input type="file" id="input_imgs" name="currImgs" multiple style="display: none;" accept="image/gif, image/jpeg, image/png"/>
				</div>
				<div>
					<div class="imgs_wrap" style="width: 100%">
						<img id="img"/>
					</div>
				</div>
			</div>
			<script type="text/javascript">
				var sel_files = [];
				$(document).ready(function(){
					$("#input_imgs").on("change", handleImageFileSelect);
				});
				function fileUploadAction(){
					console.log("fileUploadAction");
					$("#input_imgs").trigger('click');
				}
				function handleImageFileSelect(e){
					sel_files = [];
					$(".imgs_wrap").empty();
					
					var files = e.target.files;
					var filesArr = Array.prototype.slice.call(files);
					console.log(filesArr.length);
					var index = 0;
					filesArr.forEach(function(f){
						if(!f.type.match("image.*")){
							alert("확장자는 이미지 확장자만 가능합니다.");
							return;
						}
						
						sel_files.push(f);
						
						var reader = new FileReader();
						reader.onload = function(e){
							var html = "<a href\"javascript:void(0);\" onclick=\"deleteImageAction("+index+")\" id = \"img_id_"+index+"\"><img src=\""+e.target.result+"\" data-file='"+f.name+"' class='currImgFile' title='click to remove' style='width:100%;'></a>";
							$(".imgs_wrap").append(html);
							index++;
						}
						reader.readAsDataURL(f);
					});
				}
				function deleteImageAction(index){
					console.log("index : "+ index);
					sel_files.splice(index,1);
					var img_id = "#img_id_"+index;
					$(img_id).remove();
					console.log(sel_files);
				}
			</script>
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
						onclick="location.href='#reply'"><h4 style="font-family: 'Jua'">강의평</h4></div>
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
					onclick="location.href='#reply'"><h4 style="font-family: 'Jua'">강의평</h4></div>
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
							placeholder="도로명주소*" name="adr1" required>
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
					console.log($('#sample4_roadAddress').val());
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
					            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
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
						onclick="location.href='#reply'"><h4 style="font-family: 'Jua'; color : darkblue;">강의평</h4></div>
				</div>
			</div>
			<div align="center">
				<h1>강의 평이 들어갈 공간입니다.</h1>
			</div>
			<h6>　</h6>
			<div align="right">
				<button class="btn btn-secondary" style="margin-right: 5%;">신청하기</button>
			</div>
		</form>
	</div>
</body>
				
			<!-- <div class="row">
          <div class="col-md-12 mb-4">
            <label>강의 제목</label>
            <input type="text" class="form-control" name="lectureName" placeholder="강의명을 입력해 주세요" value="" required>
          </div>
        </div>
        <h6>　</h6>
        <div class="row">
          <div class="col-md-12 mb-4">
            <label>강의 목표</label>
            <input type="text" class="form-control" name="lectureObject" placeholder="강의목표를 입력해 주세요" value="" required>
          </div>
        </div>
        <h6>　</h6>
        <div class="row">
        <div class="col-md-12 mb-3">
       
          <label>카테고리</label>
        </div>
        <div class="col-md-3 mb-3">
          <div class="custom-control custom-radio">
            <input id="design" name="category" type="radio" class="custom-control-input" checked required>
            <label class="custom-control-label" for="design">디자인</label>
          </div>
        </div>
        <div class="col-md-3 mb-3">
          <div class="custom-control custom-radio">
            <input id="working" name="category" type="radio" class="custom-control-input"  required>
            <label class="custom-control-label" for="working">실무역량</label>
          </div>
        </div>
        <div class="col-md-3 mb-3">
          <div class="custom-control custom-radio">
            <input id="beautiy" name="category" type="radio" class="custom-control-input"  required>
            <label class="custom-control-label" for="beautiy">뷰티</label>
          </div>
        </div>
        <div class="col-md-3 mb-3">
          <div class="custom-control custom-radio">
            <input id="media" name="category" type="radio" class="custom-control-input"  required>
            <label class="custom-control-label" for="media">영상</label>
          </div>
        </div>
        <div class="col-md-3 mb-3">
          <div class="custom-control custom-radio">
            <input id="language" name="category" type="radio" class="custom-control-input"  required>
            <label class="custom-control-label" for="language">외국어</label>
          </div>
        </div>
        <div class="col-md-3 mb-3">
          <div class="custom-control custom-radio">
            <input id="music" name="category" type="radio" class="custom-control-input"  required>
            <label class="custom-control-label" for="music">음악</label>
          </div>
        </div>
        <div class="col-md-3 mb-3">
          <div class="custom-control custom-radio">
            <input id="lifeStyle" name="category" type="radio" class="custom-control-input"  required>
            <label class="custom-control-label" for="lifeStyle">라이프스타일</label>
          </div>
        </div>
        <div class="col-md-3 mb-3">
          <div class="custom-control custom-radio">
            <input id="jetech" name="category" type="radio" class="custom-control-input"  required>
            <label class="custom-control-label" for="jetech">제테크</label>
          </div>
        </div>
		<h6>　</h6>
        </div>
		
        <div class="mb-3 row" id="addressInput">
			<div class="col-md-6 mb-3">
			<label>강의 방법</label>
				<input type="hidden" id="sample4_postcode" placeholder="우편번호">
				<input type="text"	class="form-control" id="sample4_roadAddress" placeholder="도로명주소*" name="adr1" required>
			</div>
			<div class="col-md-4 mb-3">
			<label>　</label>
				<input type="text"	class="form-control" id="sample4_detailAddress" name="adr3" placeholder="상세주소*">
			</div>
			<div class="col-md-2 mb-3" align="center">
				<div style="height:40%;"></div>
				<button class="btn btn-primary mb-3" type="button" onclick="sample4_execDaumPostcode();">검색</button>
			</div>
			<h6>　</h6>
		</div>
		<script>
						function sample4_execDaumPostcode() {
					        new daum.Postcode({
					            oncomplete: function(data) {
					                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
					                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					                var roadAddr = data.roadAddress; // 도로명 주소 변수

					                // 우편번호와 주소 정보를 해당 필드에 넣는다.
					                document.getElementById("sample4_roadAddress").value = roadAddr;
					                
					                
					            }
					        }).open();
					    }
						
		</script>
		 
		<div class="mb-3">
	
		</div>
		<script type="text/javascript">
		</script>
		 <h6>　</h6>
        <div class="mb-3">
			<label>강의 상세설명</label>
			<textarea rows="10" cols="" class="form-control" style="resize: none;" name="content" placeholder="강의에 대한 상세설명을 적어주세요"></textarea>
		</div>
		 <h6>　</h6>
        <hr class="mb-4">   
			<div align="right" style="margin-bottom:10px;">
			<button type="button" class="btn btn-primary">글 등록 하기</button>
			</div> -->
			
		

	<div>
		<h4></h4>
	</div>

	<c:import url="common/footer.jsp" />
</body>
</html>