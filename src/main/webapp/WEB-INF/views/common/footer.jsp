<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
/* ------------------footer------------------ */
footer {
	width: 100%;
	height: 160px;
	background-color: #3d4045;
	margin-top: 20px;
	padding: 3.2rem 1rem 3.75rem;
	color: #fff;
}

footer .container {
	
	max-width: 1300px;
	width: 1300px;
}

footer .company_info {
	padding: 0;
	word-break: keep-all;
	text-align: left;
}

.company_info p {
	font-size: 11px;
	font-weight: 700;
}

.company_info #logo {
	display: block;
	width: 60px;
	height: 20px;
	margin-bottom: 10px;
}

.company_etc {
	padding-top: 30px;
	padding-right: 50px;
	word-break: keep-all;
	text-align: right;
	font-size: 15px;
	font-weight: 700;
}

.company_etc li {
	display: inline;
	margin-left: 20px;
}
</style>
</head>
<body>
	<footer>
		<div class="container">
			<div class="row">
				<div class="company_info col-sm-6">
					<img id="logo"
						src="${contextPath}/resources/images/common/logo_footer.png">
					<p>
						(주)만취남녀 | 대표자 : 최성락 | E-MAIL : ssminkk0328@gmail.com<br>
						사업자번호 : 851-87-00622 | 개인정보보호책임자 : 최성락 | 통신판매업 : 서울 강남 제2014-01호<br>
						주소 : 서울특별시 강남구 테헤란로14길 6 남도빌딩 2F, 3F, 4F, 5F<br> Copyright ©
						1998-2019 만취남녀 All Right Reserved
					</p>
				</div>
				<div class="company_etc col-sm-6">
					<ul>
						<li>Join Us</li>
						<li>고객센터</li>
						<li>이용약관</li>
						<li>개인정보취급방침</li>
					</ul>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>