<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
</style>
</head>
<body>
	<c:import url="common/header.jsp"/>
	<div class="container">
		<h2>인기 상품</h2>
		<h2>상품 목록</h2>
		<div class="row">
			<div class="col-md-4">
				<div class="card mb-4 shadow-sm">
					<img class="bd-placeholder-img card-img-top" width="100%" height="225" src="${contextPath}/resources/images/product/test1.png">
					<div class="card-body row">
						<div class="col-md-8">
							<p style="font-weight: bolder;">상품명 </p>
							<div class="d-flex align-items-center">
								<div style="text-align: center; width:35%">
									<img src="${contextPath}/resources/images/product/test1.png" style="width:100%; height:40%"><br>
									<small style="color: red">할인율 : 50%</small>
								</div>
								<small style="font">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;가격 : <STRIKE>10200원</STRIKE><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; → 5100원 </small>
							</div>
						</div>	
						<div class="col-md-4">
							<div class="peopleAttach">
								<div class="peopleImage">
									<img src="${contextPath}/resources/images/product/test1.png" style="width:100%; height:100%;">
								</div>
								<div class="peopleContext" style="text-align: center;">
								<p>판매자명</p>
								<p>닉네임</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<c:import url="common/footer.jsp"/>
</body>
</html>