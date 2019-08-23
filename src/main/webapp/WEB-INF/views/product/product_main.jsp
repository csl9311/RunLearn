<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
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
</style>
</head>
<body>
	<%@ include file="/views/common/header.jsp"%>
	<div class="container">
		<h2>인기 상품</h2>
		<h2>상품 목록</h2>
		<div class="row">
			<div class="col-md-4">
				<div class="card mb-4 shadow-sm">
					<img class="bd-placeholder-img card-img-top" width="100%" height="225" src="<%=request.getContextPath()%>/images/product/sample.png">
					<div class="card-body row">
						<div class="col-md-8">
							<p style="font-weight: bolder;">상품명 </p>
							<div class="d-flex align-items-center">
								<div style="text-align: center; width:35%">
									<img src="<%= request.getContextPath()%>/images/class/sale.png" style="width:100%; height:40%"><br>
									<small style="color: red">할인율 : 50%</small>
								</div>
								<small style="font">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;가격 : <STRIKE>10200원</STRIKE><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; → 5100원 </small>
							</div>
						</div>	
						<div class="col-md-4">
							<div class="peopleAttach">
								<div class="peopleImage">
									<img src="<%= request.getContextPath() %>/images/class/user.png" style="width:100%; height:100%;">
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
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>