<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}/resources/css" scope="application" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href='${ contextPath }/product/product.css'>
</head>
<c:import url="common/header.jsp"/>
<body>
<br>
<br>
<br>
<br>
	<div class="contents center">
		<div class="row">
				<form action="" class="form" style="float:none; margin:0 auto; width: 50vw;">
					<table class="table center">
						<tr>
							<td>상품명</td>
							<td><input type="text"></td>
						</tr>
						<tr>
							<td>카테고리</td>
							<td><input type="text"></td>
						</tr>
						<tr>
							<td>가격</td>
							<td><input type="text"></td>
						</tr>
						<tr>
							<td>재고</td>
							<td><input type="text"></td>
						</tr>
						<tr>
							<td><input type="button" class="btn" value="취소"></td>
							<td><input type="submit" class="btn" value="수정"></td>
						</tr>
					</table>
				</form>
		</div>
	</div>
	

</body>
<c:import url="common/footer.jsp"/> 
</html>