<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	.centerBack {
		margin-top: 50px;
		height: 600px;
		background: pink;
	}
	
	.centerBack .centerMenu {
		height: 45px;
	}
	
	.centerMenu ul {
		align-items: center;
    	border-bottom: 1px solid #dbdbdb;
    	display: flex;
    	flex-shrink: 0;
    	justify-content: flex-start;
    	padding: 10px 20px;
	}
	
	.centerMenu ul li {
	    text-align: -webkit-match-parent;
	    margin-right: 10px;
	}
	
	.centerMenu ul li img {
		width: 23px;
		height: 23px;
		margin-bottom: 3px;
	}
	
	.centerMenu a {
		border: 1px solid transparent;
    	border-radius: 4px 4px 0 0;
	}
	
	.centerMenu span {
		font-weight: 400;
    	font-size: 1.6em;
    	color: #454545;
	}
</style>
</head>
<body>
	<c:import url="../common/header.jsp"/>
	
	<div class="container centerBack">
		<div class="row">
			<div class="col-md centerMenu">
				<ul>
					<li>
						<a href="#">
				          <span><img src="${ contextPath }/resources/images/cCenter/noticeIcon.png"></span>
				          <span>공지사항</span>
				        </a>
					</li>
					<li>
						<a href="#">
				          <span class="icon is-small"><i class="far fa-file-certificate" aria-hidden="true"></i></span>
				          <span>질문</span>
				        </a>
					</li>
					<li>
						<a href="#">
				          <span class="icon is-small"><i class="far fa-file-certificate" aria-hidden="true"></i></span>
				          <span>건의</span>
				        </a>
					</li>
					<li>
						<a href="#">
				          <span class="icon is-small"><i class="far fa-file-certificate" aria-hidden="true"></i></span>
				          <span>신고글</span>
				        </a>
					</li>
				</ul>
			</div>
			<div class="x-100"></div>
		</div>
	</div>
	
	<c:import url="../common/footer.jsp"/>
</body>
</html>