<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
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
</head>
<body>
<c:import url="common/header.jsp"/>
<div class="container" style="min-height:300px; margin-top: 20px;">
	<h1>강의 신청</h1>
	<h6>　</h6>
      <form class="">
        <div class="row">
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
		<div class="row">
        <div class="col-md-8 mb-3">
          <label>강의 방법</label>
        </div>
        <div class="col-md-2 mb-3">
          <div class="custom-control custom-radio" onclick="openAddress();">
            <input id="offline" name="system" type="radio" class="custom-control-input" checked required>
            <label class="custom-control-label" for="offline" id="offlineLabel">현장강의</label>
          </div>
        </div>
        
		<div class="col-md-2 mb-3">
          <div class="custom-control custom-radio" onclick="closeAddress();">
            <input id="online" name="system" type="radio" class="custom-control-input" required>
            <label class="custom-control-label" for="online" id="onlineLabel">온라인 강의</label>
          </div>
        </div>
        </div>
        <script>
        function openAddress(){
        	$('#addressInput').slideDown();
        }
        function closeAddress(){
        	$('#addressInput').slideUp();
        }
        </script>
         <h6>　</h6>
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
		<label>상세설명 이미지 추가</label>
        <table class="table table-striped table-bordered" width="100%">
            <tbody id="fileTableTbody">
                <tr id="dropZone">
                    <td>
                        	이곳에 커리큘럼 파일 끌어 넣어주세요(jpg, jpeg, png파일만을 지원합니다.)
                    </td>
                </tr>
            </tbody>
        </table>
		</div>
		<script type="text/javascript">
 
    // 파일 리스트 번호
    var fileIndex = 0;
    // 등록할 전체 파일 사이즈
    var totalFileSize = 0;
    // 파일 리스트
    var fileList = new Array();
    // 파일 사이즈 리스트
    var fileSizeList = new Array();
    // 등록 가능한 파일 사이즈 MB
    var uploadSize = 50;
    // 등록 가능한 총 파일 사이즈 MB
    var maxUploadSize = 500;
 
    $(function (){
        // 파일 드롭 다운
        fileDropDown();
    });
 
    // 파일 드롭 다운
    function fileDropDown(){
        var dropZone = $("#dropZone");
        //Drag기능 
        dropZone.on('dragenter',function(e){
            e.stopPropagation();
            e.preventDefault();
            // 드롭다운 영역 css
            dropZone.css('background-color','#E3F2FC');
        });
        dropZone.on('dragleave',function(e){
            e.stopPropagation();
            e.preventDefault();
            // 드롭다운 영역 css
            dropZone.css('background-color','#FFFFFF');
        });
        dropZone.on('dragover',function(e){
            e.stopPropagation();
            e.preventDefault();
            // 드롭다운 영역 css
            dropZone.css('background-color','#E3F2FC');
        });
        dropZone.on('drop',function(e){
            e.preventDefault();
            // 드롭다운 영역 css
            dropZone.css('background-color','#FFFFFF');
            
            var files = e.originalEvent.dataTransfer.files;
            if(files != null){
                if(files.length < 1){
                    alert("폴더 업로드 불가");
                    return;
                }
                selectFile(files)
            }else{
                alert("ERROR");
            }
        });
    }
 
    // 파일 선택시
    function selectFile(files){
        // 다중파일 등록
        if(files != null){
            for(var i = 0; i < files.length; i++){
                // 파일 이름
                var fileName = files[i].name;
                var fileNameArr = fileName.split("\.");
                // 확장자
                var ext = fileNameArr[fileNameArr.length - 1];
                // 파일 사이즈(단위 :MB)
        		var fileSize = files[i].size /1024/ 1024;
                
                /* if($.inArray(ext, ['exe', 'bat', 'sh', 'java', 'jsp', 'html', 'js', 'css', 'xml']) < 0){
                    // 확장자 체크
                    alert("등록 불가 확장자");
                    break;
                } */ 
                if($.inArray(ext, ['jpg', 'jpeg', 'png']) < 0){
                	alert("등록 불가 확장자");
                    break;
                }else if(fileSize > uploadSize){
                    // 파일 사이즈 체크
                    alert("용량 초과\n업로드 가능 용량 : " + uploadSize + " MB");
                    break;
                }else{
                    // 전체 파일 사이즈
                    totalFileSize += fileSize;
                    
                    // 파일 배열에 넣기
                    fileList[fileIndex] = files[i];
                    
                    // 파일 사이즈 배열에 넣기
                    fileSizeList[fileIndex] = fileSize;
 
                    // 업로드 파일 목록 생성
                    addFileList(fileIndex, fileName, fileSize);
 
                    // 파일 번호 증가
                    fileIndex++;
                }
            }
        }else{
            alert("ERROR");
        }
    }
 
    // 업로드 파일 목록 생성
    function addFileList(fIndex, fileName, fileSize){
        var html = "";
        html += "<tr id='fileTr_" + fIndex + "'>";
        html += "    <td class='left' >";
        html +=         fileName + " / " + fileSize + "MB "  + "<a href='#' onclick='deleteFile(" + fIndex + "); return false;' class='btn btn-sm btn-secondary'>삭제</a>"
        html += "    </td>"
        html += "</tr>"
 
        $('#fileTableTbody').append(html);
    }
 
    // 업로드 파일 삭제
    function deleteFile(fIndex){
        // 전체 파일 사이즈 수정
        totalFileSize -= fileSizeList[fIndex];
        
        // 파일 배열에서 삭제
        delete fileList[fIndex];
        
        // 파일 사이즈 배열 삭제
        delete fileSizeList[fIndex];
        
        // 업로드 파일 테이블 목록에서 삭제
        $("#fileTr_" + fIndex).remove();
    }
		</script>
		 <h6>　</h6>
		<div class="mb-3">
		<label>커리큘럼 이미지 추가</label>
        <table class="table table-striped table-bordered" width="100%">
            <tbody id="fileTableTbody2">
                <tr id="dropZone2">
                    <td>
                        	이곳에 커리큘럼 파일 끌어 넣어주세요(jpg, jpeg, png파일만을 지원합니다.)
                    </td>
                </tr>
            </tbody>
        </table>
		</div>
		<script type="text/javascript">
 
	    // 파일 리스트 번호
	    var fileIndex2 = 0;
	    // 등록할 전체 파일 사이즈
	    var totalFileSize2 = 0;
	    // 파일 리스트
	    var fileList2 = new Array();
	    // 파일 사이즈 리스트
	    var fileSizeList2 = new Array();
	    // 등록 가능한 파일 사이즈 MB
	    var uploadSize2 = 50;
	    // 등록 가능한 총 파일 사이즈 MB
	    var maxUploadSize2 = 500;
	 
	    $(function (){
	        // 파일 드롭 다운
	        fileDropDown2();
	    });
	 
	    // 파일 드롭 다운
	    function fileDropDown2(){
	        var dropZone2 = $("#dropZone2");
	        //Drag기능 
	        dropZone2.on('dragenter',function(e){
	            e.stopPropagation();
	            e.preventDefault();
	            // 드롭다운 영역 css
	            dropZone2.css('background-color','#E3F2FC');
	        });
	        dropZone2.on('dragleave',function(e){
	            e.stopPropagation();
	            e.preventDefault();
	            // 드롭다운 영역 css
	            dropZone2.css('background-color','#FFFFFF');
	        });
	        dropZone2.on('dragover',function(e){
	            e.stopPropagation();
	            e.preventDefault();
	            // 드롭다운 영역 css
	            dropZone2.css('background-color','#E3F2FC');
	        });
	        dropZone2.on('drop',function(e){
	            e.preventDefault();
	            // 드롭다운 영역 css
	            dropZone2.css('background-color','#FFFFFF');
	            
	            var files2 = e.originalEvent.dataTransfer.files;
	            console.log(files2)
	            if(files2 != null){
	                if(files2.length < 1){
	                    alert("폴더 업로드 불가");
	                    return;
	                }
	                selectFile2(files2)
	            }else{
	                alert("ERROR!!");
	            }
	        });
	    }
	 
	    // 파일 선택시
	    function selectFile2(files2){
	        // 다중파일 등록
	        if(files2 != null){
	            for(var i = 0; i < files2.length; i++){
	                // 파일 이름
	                var fileName2 = files2[i].name;
	                var fileNameArr2 = fileName2.split("\.");
	                // 확장자
	                var ext2 = fileNameArr2[fileNameArr2.length - 1];
	                // 파일 사이즈(단위 :MB)
	        		var fileSize2 = files2[i].size /1024/ 1024;
	                
	                /* if($.inArray(ext, ['exe', 'bat', 'sh', 'java', 'jsp', 'html', 'js', 'css', 'xml']) < 0){
	                    // 확장자 체크
	                    alert("등록 불가 확장자");
	                    break;
	                } */ 
	                if($.inArray(ext2, ['jpg', 'jpeg', 'png']) < 0){
	                	alert("등록 불가 확장자");
	                    break;
	                }else if(fileSize2 > uploadSize2){
	                    // 파일 사이즈 체크
	                    alert("용량 초과\n업로드 가능 용량 : " + uploadSize2 + " MB");
	                    break;
	                }else{
	                    // 전체 파일 사이즈
	                    totalFileSize2 += fileSize2;
	                    
	                    // 파일 배열에 넣기
	                    fileList2[fileIndex2] = files2[i];
	                    
	                    // 파일 사이즈 배열에 넣기
	                    fileSizeList2[fileIndex2] = fileSize2;
	 
	                    // 업로드 파일 목록 생성
	                    addFileList2(fileIndex2, fileName2, fileSize2);
	 
	                    // 파일 번호 증가
	                    fileIndex2++;
	                }
	            }
	        }else{
	            alert("ERROR");
	        }
	    }
	 
	    // 업로드 파일 목록 생성
	    function addFileList2(fIndex2, fileName2, fileSize2){
	        var html = "";
	        html += "<tr id='fileTr2_" + fIndex2 + "'>";
	        html += "    <td class='left' >";
	        html +=         fileName2 + " / " + fileSize2 + "MB "  + "<a href='#' onclick='deleteFile2(" + fIndex2 + "); return false;' class='btn btn-sm btn-secondary'>삭제</a>"
	        html += "    </td>"
	        html += "</tr>"
	 
	        $('#fileTableTbody2').append(html);
	    }
	    
	    // 업로드 파일 삭제
	    function deleteFile2(fIndex2){
	        // 전체 파일 사이즈 수정
	        totalFileSize2 -= fileSizeList2[fIndex2];
	        
	        // 파일 배열에서 삭제
	        delete fileList2[fIndex2];
	        
	        // 파일 사이즈 배열 삭제
	        delete fileSizeList2[fIndex2];
	        
	        // 업로드 파일 테이블 목록에서 삭제
	        $("#fileTr2_" + fIndex2).remove();
	    }
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
			</div>
        </form>
</div>
<div><h4>　</h4></div>
<c:import url="common/footer.jsp"/>
</body>
</html>