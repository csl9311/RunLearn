<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	.centerBack {
		margin: 90px 0 130px;
		height: auto;
		min-height: 450px;
		text-align: center;
	}
	
	.centerBack .centerMenu {
		height: auto;
	}
	
	.centerBack .centerInfo {
		text-align: right;
		font-size: 12px;
		color: gray;
		margin-right: 55px;
		margin-bottom: 20px;
	}
	
	.centerMenu ul {
		width: 90%;
		align-items: center;
    	border-bottom: 2px solid #dbdbdb;
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
		background: #f6f6f6ba;		
	}
	
	.centerBack table th {
		font-size: 18px;
		text-align: center;
	}
	
	.centerBack table td {
		font-size: 15px;
	}
	
	.active-menu {
		border-top: 2px solid #dbdbdb;
		border-left: 2px solid #dbdbdb;
		border-right: 2px solid #dbdbdb;
	}
	
	#writeBtn {
		margin-top: 60px;
		border: none;
	    background: #ff005a;
	    padding: 10px;
	    font-size: 15px;
	    color: white;
	    border-radius: 4px;
	}
	
	#writeBtn:hover {
	    box-shadow: 0 0 3px 0 #ff005a;
	}
</style>
</head>
<body>
	<c:import url="../common/header.jsp"/>
	
	<div class="container centerBack">
		<div class="row">
			<c:if test="${ empty loginUser }">
				<div class="col-md centerInfo">
					※공지사항을 제외한 다른 게시판들은 로그인이 필요한 서비스입니다!
				</div>
				<div class="x-100"></div>
			</c:if>
			<div class="col-md centerMenu">
				<ul>
					<li class="active-menu">
				    	<span><img src="${ contextPath }/resources/images/cCenter/noticeIcon.png"></span>
				        <span class="center-menuList">공지사항</span>
					</li>
					<c:if test="${ !empty loginUser }">
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
					</c:if>
				</ul>
			</div>
			<div class="x-100"></div>
			<div class="col-md centerList">
				<c:if test="${ !empty list }">
				<table>
					<tr class="thCol">
						<th style="width: 100px;">글 번호</th>
						<c:if test="${ b_category ne '공지사항' }">
						<th style="width: 100px;">카테고리</th>
						</c:if>
						<th style="width: 500px;">제목</th>
						<th style="width: 100px;">작성자</th>
						<th style="width: 100px;">작성일</th>
						<c:if test="${ b_category eq '공지사항' }">
						<th style="width: 100px;">조회수</th>
						</c:if>
					</tr>
					<c:forEach var="l" items="${ list }">
					<c:url var="bdetail" value="cCenterDetailView.do">
						<c:param name="b_num" value="${ l.b_num }"/>
						<c:param name="b_category" value="${ l.b_category }"/>
						<c:param name="page" value="${ pi.currentPage }"/>
					</c:url>
					<tr class="tdCol" onclick="location.href='${bdetail}'">
						<td>${ l.b_num }</td>
						<c:if test="${ b_category ne '공지사항' }">
						<td>${ l.b_subcategory }</td>
						</c:if>
						<td>${ l.b_title }</td>
						<c:if test="${ l.m_id eq 'admin' }">
						<td>관리자</td>
						</c:if>
						<c:if test="${ l.m_id ne 'admin' }">
						<td>${ l.m_id }</td>
						</c:if>
						<td>${ l.b_reg_date }</td>
						<c:if test="${ b_category eq '공지사항' }">
						<td>${ l.b_count }</td>
						</c:if>
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
			<div class="x-100"></div>
			<c:if test="${ !empty list }">
			<div class="col-md-12" style="text-align: center; margin-top: 20px;">
				<nav aria-label="Page navigation">
					<ul class="pagination justify-content-center">
					<c:if test="${ pi.currentPage <= 1 }">
						<li class="page-item disabled">
							<span aria-hidden="true">&laquo;</span>
						</li>
					 </c:if>
					<c:if test="${ pi.currentPage > 1 }">
						<c:url var="pagePrev" value="cCenterView.do">
							<c:param name="page" value="${ pi.currentPage - 1 }" />
							<c:param name="b_category" value="${ b_category }" />
						</c:url>
						<li class="page-item">
							<a class="page-link" href="${ pagePrev }" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
					</c:if>
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:if test="${ p eq currentPage }">
						<li class="page-item active" aria-current="page">
							<a class="page-link" href="#">[${ p }]<span class="sr-only">(current)</span></a>
						</li>
						</c:if>
											
						<c:if test="${ p ne currentPage }">
							<c:url var="pageNum" value="cCenterView.do">
								<c:param name="page" value="${ p }"/>
								<c:param name="b_category" value="${ b_category }" />
							</c:url>
							<li class="page-item"><a class="page-link" href="${ pageNum }">${ p }</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${ pi.currentPage >= pi.maxPage }">
						<li class="page-item disabled">
							<span aria-hidden="true">&raquo;</span>
						</li>
					</c:if>
					<c:if test="${ pi.currentPage < pi.maxPage }">
						<c:url var="pageNext" value="cCenterView.do">
							<c:param name="page" value="${ pi.currentPage + 1 }" />
							<c:param name="b_category" value="${ b_category }" />
						</c:url>
						<li class="page-item">
							<a class="page-link" href="${ pageNext }" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</c:if>
					</ul>
				</nav>
			</div>
			</c:if>
			<div class="x-100"></div>
			<c:if test="${ b_category ne '공지사항' }">
			<c:url var="bwrite" value="cCenterInsertView.do">
				<c:param name="b_category" value="${ b_category }" />
				<c:param name="page" value="${ pi.currentPage }" />
			</c:url>
			<div class="col-md" style="text-align: center;">
				<button id="writeBtn" onclick="location.href='${bwrite}'">작성하기</button>
			</div>
			</c:if>
		</div>
	</div>
	
	<c:import url="../common/footer.jsp"/>
	
	<script>
		$('.centerMenu').children().children('li').click(function() {
			var b_category = $(this).children().eq(1).text();
			
			location.href='cCenterView.do?b_category='+b_category;
		});

		var list = $('.centerMenu').children('ul');
		for (var i = 0; i < 4; i++) {
			if (list.children('li').eq(i).children('.center-menuList').text() == '${b_category}') {
				list.children('li').eq(i).addClass('active-menu');
			} else {
				list.children('li').eq(i).removeClass('active-menu');
			}
		}
	</script>
</body>
</html>