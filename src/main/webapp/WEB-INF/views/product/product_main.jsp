<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href='${ contextPath }/resources/css/product/product.css'>
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
		
		<!-- 페이징 -->
		<div class="row center">
			<!-- [이전] -->
			<c:if test="${ pi.currentPage <= 1 }">
				[이전] &nbsp;
			</c:if>
			<c:if test="${ pi.currentPage > 1 }">
				<c:url var="before" value="blist.do">
					<c:param name="page" value="${ pi.currentPage - 1 }"/>
				</c:url>
				<a href="${ before }">[이전]</a> &nbsp;
			</c:if>
			
			<!-- 페이지 -->
			<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				<c:if test="${ p eq currentPage }">
					<font color="red" size="4"><b>[${ p }]</b></font>
				</c:if>
				
				<c:if test="${ p ne currentPage }">
					<c:url var="pagination" value="getList.product">
						<c:param name="page" value="${ p }"/>
					</c:url>
					<a href="${ pagination }">${ p }</a> &nbsp;
				</c:if>
			</c:forEach>
			
			<!-- [다음] -->
			<c:if test="${ pi.currentPage >= pi.maxPage }">
				[다음]
			</c:if>
			<c:if test="${ pi.currentPage < pi.maxPage }">
				<c:url var="after" value="blist.do">
					<c:param name="page" value="${ pi.currentPage + 1 }"/>
				</c:url> 
				<a href="${ after }">[다음]</a>
			</c:if>
		</div>
		<script>
			function upload(){
				location.href="upload.product";
			}
		</script>
	<c:import url="../common/footer.jsp"/>
</body>
</html>