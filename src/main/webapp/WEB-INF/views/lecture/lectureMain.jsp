<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>
<c:if test="${ cName ne null }">${ cName } 강의실 탐색</c:if>
<c:if test="${ cName eq null }">인기강의목록</c:if></title>
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
	<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
<style>
#Ctable td:hover {
	cursor: pointer;
}

.peopleAttach {
	width: 100%;
	height:100%;
	top: 45%;
	right: 3%;
}

.peopleImage {
	width: 100%;
	height: 60%;
}

.peopleContext {
	top: 10px;
	width: 100%;
	height: 40%;
}

.card{
	cursor:pointer;
}
</style>
</head>
<body>
	<c:import url="../common/header.jsp"/>
	<div class="container">
		<h1>
		<c:if test="${ cName ne null }">카테고리명 : ${ cName }</c:if>
		<c:if test="${ cName eq null }">인기강의목록</c:if>
		</h1>
		<h1></h1>
		<h2>강의 목록</h2>
		<h6></h6>
		<div class="row">
			<c:forEach var="list" items="${ list }">
				<c:url var="detailView" value="lectureDetailView.le">
					<c:param name="l_num" value="${ list.L_NUM }"/>
				</c:url>
				
				<div class="col-md-4" onclick="location.href='${ detailView }'">
					<div class="card mb-4 shadow-sm">
						<img class="bd-placeholder-img card-img-top" width="100%"
							height="225" src="${contextPath}/resources/images/lecture/${list.L_CHANGED_NAME}">
						<div style="min-height:150px" class="card-body row">
							<div class="col-md-8">
								<p style="font-weight: bolder;">${ list.L_TITLE }</p>
								<div class="d-flex align-items-center">
									<small style="font">가격 : ${ list.L_PRICE } </small>
								</div>
							</div>	
							<div class="col-md-4">
								<div class="peopleAttach">
									<div class="peopleImage">
										<img src="${contextPath}/resources/images/member/${ list.M_CHANGED_NAME }" style="width:100%; height:65px;">
									</div>
									<div class="peopleContext" style="text-align: center;">
									<p>${ list.M_NAME }</p>
									<p>${ list.M_NICKNAME }</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div align="center" style="font-size: 15pt; font-family: 'Sunflower', sans-serif; margin-top: 30px">
			<c:if test="${ list ne null }">
				<c:if test="${ cName ne null }">
					<c:set var="loc" value="/selectLectureList.le" scope="page"/>
				</c:if>
				<c:if test="${ cName eq null }">
					<c:set var="loc" value="/selectLectureAllList.le" scope="page"/>
				</c:if>
				<c:if test="${ pi.currentPage <= 1 }">
					<span>[이전]</span>
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="lectureListBack" value="${ loc }"><%-- (==<c:url var="blistBack" value="selectList.bo"/>) c:url이 알아서 contextPath와 연동되여 걸어주므로, contextPath를 걸어줄필요없다. 이후 이곳에 쿼리스트링(?)가 들어감. --%>
						<c:if test="${ cName ne null }">
							<c:param name="l_category" value="${ cName }"/>
						</c:if>
						<c:param name="page" value="${ pi.currentPage - 1 }"/><!-- currentPage의 Parameter값을 여기서 지정해주고 있는것. -->
					</c:url>
					<span><a href="${ lectureListBack }">[이전]</a></span>
				</c:if>
				
				<!-- [이전],[다음] 사이의 번호들 -->
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<!--  현재 페이지와 같은 페이지리 번호를 선택했을때. -->
					<c:if test="${ p eq pi.currentPage }">
						<span>${ p }</span>
					</c:if>
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="lectureCheck" value="${ loc }">
							<c:if test="${ cName ne null }">
								<c:param name="l_category" value="${ cName }"/>
							</c:if>
							<c:param name="page" value="${ p }"/>
						</c:url>
						<span><a href="${ lectureCheck }">${ p }</a></span>
					</c:if>
				</c:forEach>
				
				<!-- [다음] -->
				<c:if test="${ pi.currentPage >= pi.maxPage }">
					<span>[다음]</span>
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="lectureListNext" value="${ loc }">
						<c:if test="${ cName ne null }">
							<c:param name="l_category" value="${ cName }"/>
						</c:if>
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url>
					<span><a href="${ lectureListNext }">[다음]</a></span>
				</c:if>
			</c:if>
		</div>
	</div>
	<c:import url="../common/footer.jsp"/>
</body>
</html>