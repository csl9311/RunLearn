<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
img:hover {
	cursor: pointer;
}
#upload{
	margin-top : 1vh;
	background: rgba(255, 0, 90, 0.7);
	color: white;
	cursor:pointer;
	right: 100px;
	position: absolute;
}
.empty{
	height: 5vh;
}

</style>
</head>
<body>
	<c:import url="../common/header.jsp"/>
		<div class="container">
			<div class="row">
				<div class="empty">
					<button id="upload" class="btn btn-lg" onclick="upload();">판매등록</button>
				</div>
			</div>
		
			<div class="row">
				<c:forEach items="${ list }" var="p">
					<form action="get.product" method="post">
						<input type="hidden" value="${ p.P_NUM }" name="p_num">
						<div class="col-md-4">
							<div class="row" style="margin: 30px;" id="mainImage">
								<img class="img-responsive" alt="상품이미지" src="${contextPath}/resources/images/product/test1.png" onclick="submit();">
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
		</div>
		
		<script>
			function upload(){
				location.href="upload.product";
			}
		</script>
	<c:import url="../common/footer.jsp"/>
</body>
</html>