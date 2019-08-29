<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${ cName } 강의실 탐색</title>
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
		<h1>카테고리명 : ${ cName }</h1>
		<h1></h1>
		<h2>강의 목록</h2>
		<h6></h6>
		<div class="row">
			<c:forEach var="list" items="${ list }">
				<c:url var="detailView" value="detailView.le">
					<c:param name="l_code" value="${ list.l_num }"/>
				</c:url>
				
				<div class="col-md-4" onclick="location.href='${ detailView }'">
					<div class="card mb-4 shadow-sm">
						<img class="bd-placeholder-img card-img-top" width="100%"
							height="225" src="${contextPath}/resources/images/lecture/classImg1.png">
						<div class="card-body row">
							<div class="col-md-8">
								<p style="font-weight: bolder;">${list. l_title }</p>
								<div class="d-flex align-items-center">
									<small style="font">가격 :5100원 </small>
								</div>
							</div>	
							<div class="col-md-4">
								<div class="peopleAttach">
									<div class="peopleImage">
										<img src="${contextPath}/resources/images/lecture/user.png" style="width:100%; height:100%;">
									</div>
									<div class="peopleContext" style="text-align: center;">
									<p>${ list.m_id }</p>
									<p>미스타김</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
			</c:forEach>
		
			<%-- <div class="col-md-4">
				<div class="card mb-4 shadow-sm">
					<img class="bd-placeholder-img card-img-top" width="100%"
						height="225"
						src="${contextPath}/resources/images/lecture/classImg1.png">

					<div class="card-body row">
						<div class="col-md-8">
							<p style="font-weight: bolder;">집으로 도망치는 빠르고 쉬운방법 </p>
							<p>수강생수 : 50 명</p>
							<div class="d-flex align-items-center">
								<div style="text-align: center; width:35%">
									<img src="${contextPath}/resources/images/lecture/sale.png" style="width:100%; height:40%"><br>
									<small style="color: red">할인율 : 50%</small>
								</div>
								<small style="font">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;가격 : <STRIKE>10200원</STRIKE><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; → 5100원 </small>
							</div>
						</div>	
						<div class="col-md-4">
							<div class="peopleAttach">
								<div class="peopleImage">
									<img src="${contextPath}/resources/images/lecture/user.png" style="width:100%; height:100%;">
								</div>
								<div class="peopleContext" style="text-align: center;">
								<p>김성훈</p>
								<p>미스타김</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card mb-4 shadow-sm">
					<img class="bd-placeholder-img card-img-top" width="100%"
						height="225"
						src="${contextPath}/resources/images/lecture/classImg2.png">
					<div id="imageAttach"></div>
					<div class="card-body">
						<p class="card-text">강의 설명이 들어가는 공간이에요. 뭐든 들어가겠지요</p>
						<div class="d-flex justify-content-between align-items-center">
							<div class="btn-group">
								<button type="button" class="btn btn-sm btn-outline-secondary">상세보기</button>
							</div>
							<small class="text-muted">가격 : 9990원</small>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card mb-4 shadow-sm">
					<img class="bd-placeholder-img card-img-top" width="100%"
						height="225"
						src="${contextPath}/resources/images/lecture/classImg3.jpg">
					<div id="imageAttach"></div>
					<div class="card-body">
						<p class="card-text">강의 설명이 들어가는 공간이에요. 뭐든 들어가겠지요</p>
						<div class="d-flex justify-content-between align-items-center">
							<div class="btn-group">
								<button type="button" class="btn btn-sm btn-outline-secondary">상세보기</button>
							</div>
							<small class="text-muted">가격 : 22100원</small>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card mb-4 shadow-sm">
					<img class="bd-placeholder-img card-img-top" width="100%"
						height="225"
						src="${contextPath}/resources/images/lecture/classImg1.png">

					<div class="card-body row">
						<div class="col-md-8">
							<p style="font-weight: bolder;">집으로 도망치는 빠르고 쉬운방법 </p>
							<p>수강생수 : 50 명</p>
							<div class="d-flex align-items-center">
								<div style="text-align: center; width:35%">
									<img src="${contextPath}/resources/images/lecture/class/sale.png" style="width:100%; height:40%"><br>
									<small style="color: red">할인율 : 50%</small>
								</div>
								<small style="font">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;가격 : <STRIKE>10200원</STRIKE><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; → 5100원 </small>
							</div>
						</div>	
						<div class="col-md-4">
							<div class="peopleAttach">
								<div class="peopleImage">
									<img src="${contextPath}/resources/images/lecture/user.png" style="width:100%; height:100%;">
								</div>
								<div class="peopleContext" style="text-align: center;">
								<p>김성훈</p>
								<p>미스타김</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card mb-4 shadow-sm">
					<img class="bd-placeholder-img card-img-top" width="100%"
						height="225"
						src="${contextPath}/resources/images/lecture/classImg2.png">
					<div id="imageAttach"></div>
					<div class="card-body">
						<p class="card-text">강의 설명이 들어가는 공간이에요. 뭐든 들어가겠지요</p>
						<div class="d-flex justify-content-between align-items-center">
							<div class="btn-group">
								<button type="button" class="btn btn-sm btn-outline-secondary">상세보기</button>
							</div>
							<small class="text-muted">가격 : 9990원</small>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card mb-4 shadow-sm">
					<img class="bd-placeholder-img card-img-top" width="100%"
						height="225"
						src="${contextPath}/resources/images/lecture/classImg3.jpg">
					<div id="imageAttach"></div>
					<div class="card-body">
						<p class="card-text">강의 설명이 들어가는 공간이에요. 뭐든 들어가겠지요</p>
						<div class="d-flex justify-content-between align-items-center">
							<div class="btn-group">
								<button type="button" class="btn btn-sm btn-outline-secondary">상세보기</button>
							</div>
							<small class="text-muted">가격 : 22100원</small>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card mb-4 shadow-sm">
					<img class="bd-placeholder-img card-img-top" width="100%"
						height="225"
						src="${contextPath}/resources/images/lecture/classImg1.png">

					<div class="card-body row">
						<div class="col-md-8">
							<p style="font-weight: bolder;">집으로 도망치는 빠르고 쉬운방법 </p>
							<p>수강생수 : 50 명</p>
							<div class="d-flex align-items-center">
								<div style="text-align: center; width:35%">
									<img src="${contextPath}/resources/images/lecture/sale.png" style="width:100%; height:40%"><br>
									<small style="color: red">할인율 : 50%</small>
								</div>
								<small style="font">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;가격 : <STRIKE>10200원</STRIKE><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; → 5100원 </small>
							</div>
						</div>	
						<div class="col-md-4">
							<div class="peopleAttach">
								<div class="peopleImage">
									<img src="${contextPath}/resources/images/lecture/user.png" style="width:100%; height:100%;">
								</div>
								<div class="peopleContext" style="text-align: center;">
								<p>김성훈</p>
								<p>미스타김</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card mb-4 shadow-sm">
					<img class="bd-placeholder-img card-img-top" width="100%"
						height="225"
						src="${contextPath}/resources/images/lecture/classImg2.png">
					<div id="imageAttach"></div>
					<div class="card-body">
						<p class="card-text">강의 설명이 들어가는 공간이에요. 뭐든 들어가겠지요</p>
						<div class="d-flex justify-content-between align-items-center">
							<div class="btn-group">
								<button type="button" class="btn btn-sm btn-outline-secondary">상세보기</button>
							</div>
							<small class="text-muted">가격 : 9990원</small>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card mb-4 shadow-sm">
					<img class="bd-placeholder-img card-img-top" width="100%"
						height="225"
						src="${contextPath}/resources/images/lecture/classImg3.jpg">
					<div id="imageAttach"></div>
					<div class="card-body">
						<p class="card-text">강의 설명이 들어가는 공간이에요. 뭐든 들어가겠지요</p>
						<div class="d-flex justify-content-between align-items-center">
							<div class="btn-group">
								<button type="button" class="btn btn-sm btn-outline-secondary">상세보기</button>
							</div>
							<small class="text-muted">가격 : 22100원</small>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card mb-4 shadow-sm">
					<img class="bd-placeholder-img card-img-top" width="100%"
						height="225"
						src="${contextPath}/resources/images/lecture/classImg1.png">

					<div class="card-body row">
						<div class="col-md-8">
							<p style="font-weight: bolder;">집으로 도망치는 빠르고 쉬운방법 </p>
							<p>수강생수 : 50 명</p>
							<div class="d-flex align-items-center">
								<div style="text-align: center; width:35%">
									<img src="${contextPath}/resources/images/lecture/sale.png" style="width:100%; height:40%"><br>
									<small style="color: red">할인율 : 50%</small>
								</div>
								<small style="font">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;가격 : <STRIKE>10200원</STRIKE><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; → 5100원 </small>
							</div>
						</div>	
						<div class="col-md-4">
							<div class="peopleAttach">
								<div class="peopleImage">
									<img src="${contextPath}/resources/images/lecture/user.png" style="width:100%; height:100%;">
								</div>
								<div class="peopleContext" style="text-align: center;">
								<p>김성훈</p>
								<p>미스타김</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card mb-4 shadow-sm">
					<img class="bd-placeholder-img card-img-top" width="100%"
						height="225"
						src="${contextPath}/resources/images/lecture/classImg2.png">
					<div id="imageAttach"></div>
					<div class="card-body">
						<p class="card-text">강의 설명이 들어가는 공간이에요. 뭐든 들어가겠지요</p>
						<div class="d-flex justify-content-between align-items-center">
							<div class="btn-group">
								<button type="button" class="btn btn-sm btn-outline-secondary">상세보기</button>
							</div>
							<small class="text-muted">가격 : 9990원</small>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card mb-4 shadow-sm">
					<img class="bd-placeholder-img card-img-top" width="100%"
						height="225"
						src="${contextPath}/resources/images/lecture/classImg3.jpg">
					<div id="imageAttach"></div>
					<div class="card-body">
						<p class="card-text">강의 설명이 들어가는 공간이에요. 뭐든 들어가겠지요</p>
						<div class="d-flex justify-content-between align-items-center">
							<div class="btn-group">
								<button type="button" class="btn btn-sm btn-outline-secondary">상세보기</button>
							</div>
							<small class="text-muted">가격 : 22100원</small>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card mb-4 shadow-sm">
					<img class="bd-placeholder-img card-img-top" width="100%"
						height="225"
						src="${contextPath}/resources/images/lecture/classImg1.png">

					<div class="card-body row">
						<div class="col-md-8">
							<p style="font-weight: bolder;">집으로 도망치는 빠르고 쉬운방법 </p>
							<p>수강생수 : 50 명</p>
							<div class="d-flex align-items-center">
								<div style="text-align: center; width:35%">
									<img src="${contextPath}/resources/images/lecture/sale.png" style="width:100%; height:40%"><br>
									<small style="color: red">할인율 : 50%</small>
								</div>
								<small style="font">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;가격 : <STRIKE>10200원</STRIKE><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; → 5100원 </small>
							</div>
						</div>	
						<div class="col-md-4">
							<div class="peopleAttach">
								<div class="peopleImage">
									<img src="${contextPath}/resources/images/lecture/user.png" style="width:100%; height:100%;">
								</div>
								<div class="peopleContext" style="text-align: center;">
								<p>김성훈</p>
								<p>미스타김</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card mb-4 shadow-sm">
					<img class="bd-placeholder-img card-img-top" width="100%"
						height="225"
						src="${contextPath}/resources/images/lecture/classImg2.png">
					<div id="imageAttach"></div>
					<div class="card-body">
						<p class="card-text">강의 설명이 들어가는 공간이에요. 뭐든 들어가겠지요</p>
						<div class="d-flex justify-content-between align-items-center">
							<div class="btn-group">
								<button type="button" class="btn btn-sm btn-outline-secondary">상세보기</button>
							</div>
							<small class="text-muted">가격 : 9990원</small>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card mb-4 shadow-sm">
					<img class="bd-placeholder-img card-img-top" width="100%"
						height="225"
						src="${contextPath}/resources/images/lecture/classImg3.jpg">
					<div id="imageAttach"></div>
					<div class="card-body">
						<p class="card-text">강의 설명이 들어가는 공간이에요. 뭐든 들어가겠지요</p>
						<div class="d-flex justify-content-between align-items-center">
							<div class="btn-group">
								<button type="button" class="btn btn-sm btn-outline-secondary">상세보기</button>
							</div>
							<small class="text-muted">가격 : 22100원</small>
						</div>
					</div>
				</div>
			</div> --%>
		</div>
		<%-- <h2>강의 목록</h2>
		<h6></h6>
		<table id="Ctable" class="table-hover table-striped"
			style="text-align: center; vertical-align: middle; padding: 10px">
			<tr>
				<th width="15%" style="text-align: center;">강의 이미지</th>
				<th width="35%" style="text-align: center;">강의 명</th>
				<th width="10%" style="text-align: center;">강사 명</th>
				<th width="10%" style="text-align: center;">강의방식</th>
				<th width="20%" style="text-align: center;">강의기간/강좌 수</th>
				<th width="10%" style="text-align: center;">강의 비용</th>
			</tr>
			<tr>
				<td width="15%"><img class="bd-placeholder-img card-img-top"
					width="100%" height="100px"
					src="<%=request.getContextPath()%>/images/class/classImg1.png"></td>
				<td width="35%">집으로 도망치는 빠르고 쉬운방법</td>
				<td width="10%">미스터 김</td>
				<td width="10%">현장강의</td>
				<td width="20%">2019-08-11 ~ 2019-12-31</td>
				<td width="10%">10200원</td>
			</tr>
			<tr>
				<td width="15%"><img class="bd-placeholder-img card-img-top"
					width="100%" height="100px"
					src="<%=request.getContextPath()%>/images/class/classImg2.png"></td>
				<td width="35%">이곳에서도 빠져나갈수 있다!</td>
				<td width="10%">미스터 김</td>
				<td width="10%">인터넷강의</td>
				<td width="20%">24강</td>
				<td width="10%">9990원</td>
			</tr>
			<tr>
				<td width="15%"><img class="bd-placeholder-img card-img-top"
					width="100%" height="100px"
					src="<%=request.getContextPath()%>/images/class/classImg3.jpg"></td>
				<td width="35%">은신술을 통한 집으로의 도주법</td>
				<td width="10%">미스터 김</td>
				<td width="10%">현장강의</td>
				<td width="20%">2019-12-01-2022-12-31</td>
				<td width="10%">22100원</td>
			</tr>
		</table> --%>
	</div>
	<c:import url="../common/footer.jsp"/>
</body>
</html>