<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <%@ page session="false" %> --%>
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
<c:import url="../common/header.jsp" />
<div class="container" style="min-height:300px; margin-top: 20px;">
	<h1>강의 신청</h1>
	<h6>　</h6>
      <form enctype="Multipart/form-data" method="post" action="lectureEachInput.le">
        <div class="row">
          <div class="col-md-12 mb-4">
            <label>강의 제목</label>
            <input type="hidden" name="l_num" value="1">
            <input type="text" class="form-control" name="l_each_name" placeholder="강의명을 입력해 주세요" value="" required>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12 mb-4">
            <label>강의영상</label>
            <input type="text" class="form-control" name="l_file_video" placeholder="강의 영상(Youtube링크의 마지막 주소부분, 'https://www.youtube.com/watch?v='의 이후 코드)를 넣어주세요" value="" required>
          </div>
        </div>
	
		<div class="mb-3">
		<h5>강의 자료</h5>
		<label>여려개 넣으려고 하는 경우 압축하여 넣어주십시오.</label>
        <div align="center">
        	<input type="file" name="l_file"/>
        </div>
		</div>
		
        <div class="mb-3">
			<label>강의 상세설명</label>
			<textarea rows="5" cols="" class="form-control" style="resize: none;" name="l_each_content" placeholder="강의에 대한 상세설명을 적어주세요"></textarea>
		</div>
		 <h6>　</h6>
        <hr class="mb-4">   
			<div align="right" style="margin-bottom:10px;">
			<button class="btn btn-primary">글 등록 하기</button>
			</div>
        </form>
</div>
<div><h4>　</h4></div>
<c:import url="../common/footer.jsp" />
</body>
</html>