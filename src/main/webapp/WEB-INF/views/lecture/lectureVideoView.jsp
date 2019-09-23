<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제 1회 : 집으로 도망치는 빠르고 쉬운 방법</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<style>
.MediaContainer{
	margin:auto;
	width:80%;
	height:720px;
	margin-top:20px;
}
.HasVideo:hover{
	cursor : pointer;
}
</style>
</head>
<body>
<c:import url="../common/header.jsp" />
<div class="MediaContainer">
	<div class="row">
		<div id="mediaDiv" class="col-md-9">
			<object type="text/html" width="100%" height="700px" data="https://www.youtube.com/embed/${ media.L_FILE_VIDEO }" allowFullScreen></object>
		</div>
		<div id="menuDiv" class="col-md-3">
			<ul class="list-group mb-3">
				<c:if test="${ loginUser.m_id ne 'admin1' && loginUser.m_id ne etc.M_ID }">
				<c:forEach var="i" begin="0" end="${ list.size()-1 }" step="1">
					<c:if test="${ list.get(i).L_FILE_VIDEO ne null }">
					<c:url var="mediaView" value="lectureMediaView.le">
						<c:param name="l_each_num" value="${ list.get(i).L_EACH_NUM }"/>
					</c:url>
					
					<c:if test="${ list.get(i).L_EACH_NUM ne media.L_EACH_NUM }">
					<li class="list-group-item d-flex justify-content-between lh-condensed HasVideo" onclick="location.href='${ mediaView }'">
						<div>
							<h6 class="my-0">제 ${ i+1 }회</h6>
							<p class="text-muted">${ list.get(i).L_EACH_NAME }</p>
						</div>
						<span class="text-muted"></span>
					</li>
					</c:if>
					<c:if test="${ list.get(i).L_EACH_NUM eq media.L_EACH_NUM }">
					<c:url var="returnView" value="lectureEachMainView.le">
						<c:param name="l_each_num" value="${ list.get(i).L_EACH_NUM }"/>
						<c:param name="l_num" value="${ media.L_NUM }"/>
					</c:url>
					<li class="list-group-item d-flex justify-content-between lh-condensed HasVideo" onclick="location.href='${ returnView }'">
						<div>
							<h6 class="my-0">제 ${ i+1 }회</h6>
							<p>${ list.get(i).L_EACH_NAME }</p>
							<small class="text-muted">강의 상세설명으로 돌아가기</small>
						</div>
						<span class="text-muted"></span>
					</li>
					</c:if>
					</c:if>
					<c:if test="${ list.get(i).L_FILE_VIDEO eq null }">
					<li class="list-group-item d-flex justify-content-between lh-condensed">
						<div>
							<h6 class="my-0">제 ${ i+1 }회</h6>
							<p>${ list.get(i).L_EACH_NAME }</p>
							<small class="text-muted">영상강의가 아닙니다.</small>
						</div>
						<span class="text-muted"></span>
					</li>
					</c:if>
				</c:forEach>
				</c:if>
				<c:if test="${ loginUser.m_id eq 'admin1' || loginUser.m_id eq etc.M_ID }">
				<c:forEach var="i" begin="0" end="${ tlist.size()-1 }" step="1">
					<c:if test="${ tlist.get(i).L_FILE_VIDEO ne null }">
					<c:url var="mediaView" value="lectureMediaView.le">
						<c:param name="l_each_num" value="${ tlist.get(i).L_EACH_NUM }"/>
					</c:url>
					
					<c:if test="${ tlist.get(i).L_EACH_NUM ne media.L_EACH_NUM }">
					<li class="list-group-item d-flex justify-content-between lh-condensed HasVideo" onclick="location.href='${ mediaView }'">
						<div>
							<h6 class="my-0">제 ${ i+1 }회</h6>
							<p class="text-muted">${ tlist.get(i).L_EACH_NAME }</p>
						</div>
						<span class="text-muted"></span>
					</li>
					</c:if>
					<c:if test="${ tlist.get(i).L_EACH_NUM eq media.L_EACH_NUM }">
					<c:url var="returnView" value="lectureEachMainView.le">
						<c:param name="l_each_num" value="${ tlist.get(i).L_EACH_NUM }"/>
						<c:param name="l_num" value="${ media.L_NUM }"/>
					</c:url>
					<li class="list-group-item d-flex justify-content-between lh-condensed HasVideo" onclick="location.href='${ returnView }'">
						<div>
							<h6 class="my-0">제 ${ i+1 }회</h6>
							<p>${ tlist.get(i).L_EACH_NAME }</p>
							<small class="text-muted">강의 상세설명으로 돌아가기</small>
						</div>
						<span class="text-muted"></span>
					</li>
					</c:if>
					</c:if>
					<c:if test="${ tlist.get(i).L_FILE_VIDEO eq null }">
					<li class="list-group-item d-flex justify-content-between lh-condensed">
						<div>
							<h6 class="my-0">제 ${ i+1 }회</h6>
							<p>${ tlist.get(i).L_EACH_NAME }</p>
							<small class="text-muted">영상강의가 아닙니다.</small>
						</div>
						<span class="text-muted"></span>
					</li>
					</c:if>
				</c:forEach>
				</c:if>
			</ul>
		</div>
	</div>
	<div>
		<c:if test="${ media.L_FILE_CHANGED_NAME ne null }">
			첨부파일 : 
			<a href="${contextPath}/resources/data/lecture/${ media.L_FILE_CHANGED_NAME }" download="${ media.L_FILE_ORIGIN_NAME }">
				<img src="${contextPath}/resources/images/lecture/download.png" style="width: 20px; height: 20px;">
			</a>
		</c:if>
	</div>
</div>
<script type="text/javascript">

</script>
<c:import url="../common/footer.jsp" />
</body>
</html>