<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&display=swap&subset=korean" rel="stylesheet">
<style>
	.centerBack {
		margin: 60px 0;
		height: auto;
		min-height: 450px;
		text-align: center;
	}
	
	.centerBack .centerMenu {
		height: auto;
	}
	
	.centerMenu ul {
		width: 90%;
		align-items: center;
    	border-bottom: 1px solid #dbdbdb;
    	margin: 0 auto;
    	display: flex;
    	flex-shrink: 0;
    	justify-content: flex-start;
	}
	
	.centerMenu ul li {
	    text-align: -webkit-match-parent;
	    margin-right: 30px;
	    padding: 20px 20px 10px;
	    border-top-left-radius: 5px;
	    border-top-right-radius: 5px;
	    cursor: pointer;
	}
	
	.centerMenu ul li img {
		width: 20px;
		height: 20px;
		margin-bottom: 3px;
	}
	
	.centerMenu span {
		font-weight: 400;
    	font-size: 1.6em;
    	color: #454545;
	}
	
	.centerList {
		margin-top: 20px;
		height: auto;
	}
	
	.centerBack table {
		width: 90%;
		margin: 0 auto;
		text-align: center;
		font-family: 'Nanum Gothic', sans-serif;
	}
	
	.centerBack .thCol {
		height: 50px;
	    background: #ffe4e4;
	    box-shadow: 0px 0px 2px 0px #ffaeae;
	    border: none;
	}
	
	.centerBack .tdCol {
		height: 80px;
		border-bottom: 1px solid lightgray;
		cursor: pointer;
	}
	
	.centerBack .tdCol:hover {
		background: #f5f5f5;		
	}
	
	.centerBack table th {
		font-size: 18px;
		text-align: center;
	}
	
	.centerBack table td {
		font-size: 15px;
	}
	
	.active-menu {
		border-top: 1px solid #dbdbdb;
		border-left: 1px solid #dbdbdb;
		border-right: 1px solid #dbdbdb;
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
				    	<span><img src="${ contextPath }/resources/images/cCenter/noticeIcon.png"></span>
				        <span class="center-menuList">공지사항</span>
					</li>
					<li>
				        <span><img src="${ contextPath }/resources/images/cCenter/questionIcon.png"></span>
				        <span class="center-menuList">질문</span>
					</li>
					<li>
				        <span><img src="${ contextPath }/resources/images/cCenter/suggestIcon.png"></span>
				        <span class="center-menuList">건의</span>
					</li>
					<li>
				        <span><img src="${ contextPath }/resources/images/cCenter/declarationIcon.png"></span>
				        <span class="center-menuList">신고글</span>
					</li>
				</ul>
			</div>
			<div class="x-100"></div>
			<div class="col-md centerList">
				<c:if test="${ !empty list }">
				<table>
					<tr class="thCol">
						<th style="width: 100px;">글 번호</th>
						<th style="width: 500px;">제목</th>
						<th style="width: 100px;">작성자</th>
						<th style="width: 100px;">작성일</th>
						<th style="width: 100px;">조회수</th>
					</tr>
					<c:forEach var="l" items="${ list }">
					<tr class="tdCol">
						<td>${ l.b_num }</td>
						<td>${ l.b_title }</td>
						<td>${ l.m_id }</td>
						<td>${ l.b_reg_date }</td>
						<td>${ l.b_count }</td>
					</tr>
					</c:forEach>
				</table>
				</c:if>
				<c:if test="${ empty list }">
				<c:if test="${ b_category eq '건의' }">
				<h3 style="margin-top: 100px;">등록된 ${ b_category }가 없습니다.</h3>
				</c:if>		
				<c:if test="${ b_category ne '건의' }">	
				<h3 style="margin-top: 100px;">등록된 ${ b_category }이 없습니다.</h3>
				</c:if>
				</c:if>
			</div>
		</div>
	</div>
	
	<c:import url="../common/footer.jsp"/>
	
	<script>
		$('.centerMenu').children().children('li').click(function() {
			var b_category = $(this).children().eq(1).text();
			
			location.href='cCenterView.do?b_category='+b_category;
		});
		
		$('.tdCol').click(function() {
			var bNum = $(this).children().eq(0).text();
			location.href='cCenterDetailView.do?b_category=${b_category}&b_num='+bNum;
		});
	</script>
</body>
</html>