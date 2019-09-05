<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" scope="application" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<script type="text/javascript" src="${ contextPath }/resources/js/jquery-3.4.1.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding:400,700&display=swap&subset=korean" rel="stylesheet">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${ contextPath }/resources/css/common/login.css">

<title>만취남녀</title>
<style>
body {
	width: 100%;
	margin: 0;
	padding: 0;
	font-family: 'Nanum Gothic Coding', monospace;
}

div {
	display: block;
}

ul {
	list-style: none;
	margin: 0;
	padding: 0;
}

ul li a:hover {
   text-decoration: none;
}

a {
	text-decoration: none;
	color: black;
}

/* ------------------header------------------ */
header {
	width: 100%;
	height: 80px;
}

header .header-top {
	width: 100%;
	height: 30px;
	border-top: 0 none;
	border-bottom: 1px solid #d9d9d9;
	background: #f5f5f5;
	font-size: 11px;
	color: #666;
	vertical-align: middle;
	margin-bottom: 8px;
	padding-top: 7px;
}

header .header-top .top-menu {
	width: 70%;
	height: 30px;
	position: relative;
	margin: 0 auto;
}

.top-menu .top-ul {
	display: block;
	float: right;
}

.header-top .top-menu li {
	display: inline;
	margin: 0;
	padding: 10px 10px;
	position: relative;
}

.top-ul li ul {
	display: none;
	background: white;
	height: auto;
	position: absolute;
	top: 100%;
	left: 0;
	top: 30px;
	width: 150px;
	padding: 5px 0;
	z-index: 200;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
}

.top-ul #myPage:hover ul {
	display: block;
}

header .header-bottom {
	position: relative;
	width: 800px;
	height: 70px;
	margin: 20px auto 0;
	padding: 0 10px;
}

.logo-div {
	width: 150px;
	height: 50px;
	margin: 10px 40px 0 0;
	float: left;
}

.logo-div img {
	width: 100%;
	height: 100%;
	cursor: pointer;
}

header .search {
	width: 520px;
	height: 55px;
	margin-top: 5px;
	float: left;
}

header form {
	margin-top: 0em;
}

header .lcont {
	width: 560px;
	height: 45px;
	border: 3px solid #ff005a;
	border-radius: 40px;
	margin-top: 10px;
	padding-left: 40px;
	overflow: hidden;
}

header .searchBtn {
	position: relative;
	top: 0px;
	width: 20px;
	height: 20px;
	cursor: pointer;
}

header .search-cate {
	width: 80px;
	height: 20px;
	float: left;
	margin-right: 10px;
	margin-top: 10px;
	border: 1px solid #ff005a;
	outline: none;
}

header .search .lcont input[type=text] {
	width: 350px;
	padding-top: 5px;
	margin-top: 2px;
	height: 80%;
	border: none;
	font-size: 14px;
	color: #333333;
	font-weight: 500;
	outline: none;
}

.menubar-back {
	width: 100%;
	height: auto;
	padding: 6px 0;
	margin-top: 4%;
	display: block;
	border-bottom: 1px solid #f5f5f5;
	background: white;
	font-size: 11px;
	color: #666;
	box-shadow: 0 5px 10px -8px lightgray;
}

.menubar-inner {
	width: 600px;
	height: 30px;
	margin: 10px auto 0;
	text-align: center;
}

.menubar-inner li {
	display: inline;
	width: 200px;
	margin: 0 80px;
	padding: 10px 0;
	font-size: 18px;
	font-weight: 700;
	position: relative;
	cursor: pointer;
}

.shop-detail li a:hover, .lecture-detail li a:hover, .fixed-menu .shopList li a:hover, .fixed-menu .lectureList li a:hover {
	color: #ff005a;
}

.menubar-back .menu-sub {
	display: none;
	width: 100%;
	height: 40px;
	margin: 0 auto 10px;
	padding: 5px 0;
	border-top: 1px solid lightgray;
	border-bottom: 1px solid lightgray;
}

.menubar-back .shop {
	position: relative;
	width: 1000px;
	margin: 0 auto;
	padding: 5px 0 5px 95px;
	margin-bottom: 8px;
}

.menubar-back .lecture {
	position: relative;
	width: 1200px;
	margin: 0 auto;
	padding: 5px 0 5px 60px;
	margin-bottom: 8px;
}

.menubar-back .shop li {
	float: left;
	margin: 5px 50px;
	font-size: 15px;
	font-weight: 700;
}

.menubar-back .lecture li {
	float: left;
	margin: 5px 3%;
	font-size: 15px;
	font-weight: 700;
}

.upBtn {
	display: none;
	position: fixed;
	z-index: 999;
	width: 60px;
	height: 60px;
	background: #ff005a;
	border: 1px solid #ff005a;
	border-radius: 50%;
	text-align: center;
	color: white;
	font-weight: 700;
	padding: 20px 0;
	right: 6%;
	bottom: 2%;
	cursor: pointer;
}

.fixed-menu {
	display: none;
	z-index: 999;
	width: 100%;
	height: 60px;
	position: fixed;
	background: white;
	padding: 0 15%;
	margin: 0;
	top: 0;
	left: 0;
	box-shadow: 0 5px 10px -3px lightgray;
}

.fixed-menu .logoDiv {
	width: 110px;
	height: 35px;
	margin: 13px 20px 10px 0;
	float: left;
}

.fixed-menu .logoDiv img {
	width: 100%;
	height: 100%;
	cursor: pointer;
}

.fixed-menu .cate {
	width: auto;
	height: 50px;
	margin: 5px 29% 5px 10px;
	float: left;
}

.fixed-menu .cate img {
	width: 13px;
	height: 13px;
	margin-right: 10px;
}

.fixed-menu>.cate>ul>li {
	font-size: 15px;
	font-weight: 700;
	padding: 14px 25px;
	float: left;
}

.fixed-menu .shop {
	margin-right: 10px;
}

.fixed-menu .shopList {
	display: none;
	background: white;
	position: absolute;
	top: 55px;
	width: 150px;
	height: 250px;
	padding: 10px 15px;
	z-index: 200;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
}

.fixed-menu .shopList li, .fixed-menu .lectureList li {
	margin-top: 10px;
}

.fixed-menu .lectureList {
	display: none;
	background: white;
	position: absolute;
	top: 55px;
	width: 155px;
	height: 320px;
	padding: 10px 15px;
	z-index: 200;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
}

.fixed-menu .shop:hover .shopList {
	display: block;
}

.fixed-menu .lecture:hover, .fixed-menu .shop:hover {
	background: #f5f5f5;
}

.fixed-menu .lecture:hover .lectureList {
	display: block;
}

.fixed-menu search {
	width: 400px;
	height: 55px;
	margin-top: 15px;
	float: left;
}

.fixed-menu .lcont {
	width: 400px;
	height: 35px;
	border: 2px solid #ff005a;
	border-radius: 40px;
	margin-top: 15px;
	padding-left: 30px;
	overflow: hidden;
}

.fixed-menu .searchBtn {
	position: relative;
	top: 0px;
	width: 20px;
	height: 20px;
	cursor: pointer;
}

.fixed-menu .search-cate {
	width: 80px;
	height: 20px;
	float: left;
	margin-right: 10px;
	margin-top: 5px;
	border: 1px solid #ff005a;
	outline: none;
}

.fixed-menu .search .lcont input[type=text] {
	width: 200px;
	padding-top: 5px;
	margin: 2px 10px;
	height: 80%;
	box-shadow: none;
	font-size: 14px;
	color: #333333;
	font-weight: 500;
	outline: none;
	border: 0;
}
</style>
</head>
<body>
	<div class="fixed-menu">
		<div class="logoDiv">
			<img src="${contextPath}/resources/images/common/logo_2.png" onclick="location.href='${contextPath}'">
		</div>
		<div class="cate">
			<ul>
				<li class="shop">
					<img src="${contextPath}/resources/images/common/arrow.png">
					<a onclick="changeView();">상품</a>
					<ul class="shopList">
						<li><a onclick="changeView('bag');">가방</a></li>
						<li><a onclick="changeView('watch');">시계</a></li>
						<li><a onclick="changeView('wallet');">지갑</a></li>
						<li><a onclick="changeView('perfume');">향수</a></li>
						<li><a onclick="changeView('accessory');">악세서리</a></li>
						<li><a onclick="changeView('material');">재료</a></li>
					</ul>
				</li>
				<li class="lecture">
					<img src="${contextPath}/resources/images/common/arrow.png">
					강의
					<ul class="lectureList">
							<li>
								<c:url var="all" value="selectLectureAllList.le"/>
							<a href="${ all }">인기수업</a>
							</li>
							<li>
								<c:url var="design" value="selectLectureList.le">
									<c:param name="l_category" value="D"/>
								</c:url>
								<a href="${ design }">디자인</a>
							</li>
							<li>
								<c:url var="working" value="selectLectureList.le">
									<c:param name="l_category" value="W"/>
								</c:url>
								<a href="${ working }">실무역량</a>
							</li>
							<li>
								<c:url var="beauty" value="selectLectureList.le">
									<c:param name="l_category" value="B"/>
								</c:url>
								<a href="${ beauty }">뷰티</a>
							</li>
							<li>
								<c:url var="video" value="selectLectureList.le">
									<c:param name="l_category" value="V"/>
								</c:url>
								<a href="${ video }">영상</a>
							</li>
							<li>
								<c:url var="foreign" value="selectLectureList.le">
									<c:param name="l_category" value="F"/>
								</c:url>
								<a href="${ foreign }">외국어</a>
							</li>
							<li>
								<c:url var="music" value="selectLectureList.le">
									<c:param name="l_category" value="M"/>
								</c:url>
								<a href="${ music }">음악</a>
							</li>
							<li>
								<c:url var="lifeStyle" value="selectLectureList.le">
									<c:param name="l_category" value="L"/>
								</c:url>
								<a href="${ lifeStyle }">라이프스타일</a>
							</li>
							<li>
								<c:url var="JTec" value="selectLectureList.le">
									<c:param name="l_category" value="J"/>
								</c:url>
								<a href="${ JTec }">재테크</a>
							</li>
					</ul>
				</li>
			</ul>
		</div>
		<div class="search">
			<form action="search.do">
				<div class="lcont">
					<select name="" class="search-cate">
						<option value="">튜터</option>
						<option value="">카테고리</option>
					</select>
					<input type="text" name="search" id="fixed-searchcss" placeholder="검색어를 입력해주세요" autocomplete="off" value="">
					<input type="hidden" name="price" value="전체">
					<img src="${contextPath}/resources/images/common/search.png" class="searchBtn">
				</div>
			</form>
		</div>
	</div>
	<header>
		<div class="header-top">
			<div class="top-menu">
				<div class="top-ul">
					<ul>
						<c:if test="${ empty sessionScope.loginUser }">
							<li><a href="#loginM" data-toggle="modal">로그인</a>
								<div id="loginM" class="modal fade">
									<div class="modal-dialog modal-login">
										<div class="modal-content">
											<div class="modal-header">
												<h4 class="modal-header">로그인</h4>
												<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
											</div>
											<div class="modal-body">
												<form action="login.do" method="post">
													<div class="form-group">
														<i class="fa fa-user"></i>
														<input type="text" class="form-control" name="m_id" placeholder="아이디" />
													</div>
													<div class="form-group">
														<i class="fa fa-lock"></i>
														<input type="password" class="form-control" name="m_pw" placeholder="비밀번호" />
													</div>
													<div class="form-group">
														<input type="submit" class="btn btn-primary btn-block btn-lg" value="로그인" />
													</div>
												</form>
											</div>
											<div class="modal-footer">
												<a href="minsertView.do">회원가입</a> / <a href="#">아이디/패스워드 찾기</a>
											</div>
										</div>
									</div>
								</div></li>
						</c:if>
						<c:if test="${ !empty sessionScope.loginUser }">
							<li><a href="logout.do">로그아웃</a></li>
						</c:if>
						<c:if test="${ empty sessionScope.loginUser }">
							<li><a href="minsertView.do">회원가입</a></li>
						</c:if>
						<c:if test="${ !empty sessionScope.loginUser }">
						<c:url var="myPage" value="mypage.do"/>
							<li id="myPage"><a href="${ myPage }">마이페이지</a>
								<ul id="myPage-detail">
									<li><a href="#">내 정보</a></li>
									<li><a href="#">내 강의/거래</a></li>
								</ul></li>
						</c:if>
						<li><a href="cCenterView.do?b_category=공지사항">고객센터</a></li>
						<c:if test="${ !empty sessionScope.loginUser }">
							<li><a href="#">ID/PWD찾기</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
		<div class="header-bottom">
			<div class="logo-div">
				<img src="${contextPath}/resources/images/common/logo_2.png" onclick="location.href='${contextPath}'">
			</div>
			<div class="search">
				<form action="search.do">
					<div class="lcont">
						<select name="" class="search-cate">
							<option value="">튜터</option>
							<option value="">카테고리</option>
						</select>
						<input type="text" name="search" id="searchcss" autocomplete="off" placeholder="배우고 싶은 튜터 또는 카테고리를 검색해보세요!" value="">
						<input type="hidden" name="price" value="전체">
						<img src="${contextPath}/resources/images/common/search.png" class="searchBtn">
					</div>
				</form>
			</div>
		</div>
	</header>
	<div class="menubar-back">
		<div class="menubar-inner">
			<ul>
				<li id="shopMenu"><a onclick="changeView();">상품</a></li>
				<li id="lectureMenu">강의</li>
			</ul>
		</div>
		<div class="menu-sub shop">
			<ul class="shop-detail">
				<li><a onclick="changeView('bag');">가방</a></li>
				<li><a onclick="changeView('watch');">시계</a></li>
				<li><a onclick="changeView('wallet');">지갑</a></li>
				<li><a onclick="changeView('perfume');">향수</a></li>
				<li><a onclick="changeView('accessory');">악세서리</a></li>
				<li><a onclick="changeView('material');">재료</a></li>
			</ul>
		</div>
		<div class="menu-sub lecture">
			<ul>
				<li>
							<c:url var="all" value="selectLectureAllList.le"/>
							<a href="${ all }">인기수업</a>
							</li>
							<li>
								<c:url var="design" value="selectLectureList.le">
									<c:param name="l_category" value="D"/>
								</c:url>
								<a href="${ design }">디자인</a>
							</li>
							<li>
								<c:url var="working" value="selectLectureList.le">
									<c:param name="l_category" value="W"/>
								</c:url>
								<a href="${ working }">실무역량</a>
							</li>
							<li>
								<c:url var="beauty" value="selectLectureList.le">
									<c:param name="l_category" value="B"/>
								</c:url>
								<a href="${ beauty }">뷰티</a>
							</li>
							<li>
								<c:url var="video" value="selectLectureList.le">
									<c:param name="l_category" value="V"/>
								</c:url>
								<a href="${ video }">영상</a>
							</li>
							<li>
								<c:url var="foreign" value="selectLectureList.le">
									<c:param name="l_category" value="F"/>
								</c:url>
								<a href="${ foreign }">외국어</a>
							</li>
							<li>
								<c:url var="music" value="selectLectureList.le">
									<c:param name="l_category" value="M"/>
								</c:url>
								<a href="${ music }">음악</a>
							</li>
							<li>
								<c:url var="lifeStyle" value="selectLectureList.le">
									<c:param name="l_category" value="L"/>
								</c:url>
								<a href="${ lifeStyle }">라이프스타일</a>
							</li>
							<li>
								<c:url var="JTec" value="selectLectureList.le">
									<c:param name="l_category" value="J"/>
								</c:url>
								<a href="${ JTec }">재테크</a>
							</li>
			</ul>
		</div>
	</div>
	<div class="upBtn">UP</div>
	<script>
		var flag = false;
		$(function() {
			$('#shopMenu').hover(function() {
				if (!flag) {
					$('.menubar-back .shop').slideDown();
				} else {
					$('.menubar-back .lecture').css('display', 'none');
					$('.menubar-back .shop').css('display', 'block');
				}
				flag = true;
			}, function() {
				$('.menu-sub').mouseleave(function() {
					$('.menubar-back .shop').slideUp();
					flag = false;
				});
			});

			$('#lectureMenu').hover(function() {
				if (!flag) {
					$('.menubar-back .lecture').slideDown();
				} else {
					$('.menubar-back .shop').css('display', 'none');
					$('.menubar-back .lecture').css('display', 'block');
				}
				flag = true;
			}, function() {
				$('.menu-sub').mouseleave(function() {
					$('.menubar-back .lecture').slideUp();
					flag = false;
				});
			});

			$('.upBtn').click(function() {
				$('body,html').animate({
					scrollTop : 0
				}, 600);
			});
		});

		$(window).scroll(function() {
			var height = $(document).scrollTop();

			if (height > 150) {
				$('.upBtn').css('display', 'block');
			} else {
				$('.upBtn').css('display', 'none');
			}

			if (height > 200) {
				$('.fixed-menu').css('display', 'block');
			} else {
				$('.fixed-menu').css('display', 'none');
			}
		});
    
    $('.searchBtn').click(function() {
	          $(this).parent().parent().submit();
	  });
		
		/* 페이지이동 */
		var p_category;
		function changeView(p_category){
			if(p_category == null) {
				location.href="getList.product";
			} else {
				location.href="getList.product?p_category=" + p_category;
			}
		}
		
	</script>
</body>
</html>