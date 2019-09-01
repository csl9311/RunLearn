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
	<c:import url="../common/header.jsp"/>
	<div class="container">
		<div class="row">
			<c:forEach items="${ list }" var="p">
				<form action="" method="post">
					<div class="col-md-4">
						<div class="row" id="mainImage">
							<img class="img-responsive" alt="상품이미지" src="${contextPath}/resources/images/product/test1.png">
						</div>
						<div class="col-md-6" id="productInfo">
							<p>${ p.P_NAME }</p>
							<p>${ p.P_PRICE }</p>
						</div>
						<div class="col-md-6" id="sellerInfo">
							<img class="img-responsive" alt="판매자이미지" src="">
							<p>${ p.M_NAME } </p>
							<p>${ p.M_NICKNAME }</p>
						</div>
					</div>
				</form>
			</c:forEach>
		</div>
		<c:if test="list == null"></c:if>
		
		
		
	</div>
	<c:import url="../common/footer.jsp"/>
</body>
</html>