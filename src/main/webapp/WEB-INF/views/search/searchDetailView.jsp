<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&display=swap&subset=korean" rel="stylesheet">
<style>
ul li a:hover {
   text-decoration: none;
}

#searchResultDiv-back {
   width: 85%;
   height: auto;
}

#searchResultDiv-back>.container {
   width:
}

#sideMenu {
   position: relative;
   width: 100%;
   height: auto;
   margin: 85px 0;
   padding: 20px;
   border: 1px solid lightgray;
}

#sideMenu .col {
   width: 85%;
   height: auto;
   margin: 10px auto;
   padding: 10px;
   border-top: 1px solid lightgray;
}

#sideMenu li {
   margin-bottom: 6px;
}

#sideMenu li a {
   font-size: 1.1em;
}

#sideMenu li .list:hover {
   border: 0;
   text-decoration: none;
   color: #ff005a;
   cursor: pointer;
}

#sideMenu li .selectedList {
   color: #ff005a;
}

#sideMenu .search-subList {
   margin: 10px 18px;
}

#searchResultDiv-back row div {
   padding: 0;
}

#searchResultDiv {
   padding: 80px 0;
}

#searchResultDiv .row>div {
   margin-bottom: 50px;
}

.text-muted {
	font-size: 15px;
	font-family: 'Nanum Gothic', sans-serif;
}

.card-body {
	height: 100px;
}

.card-text {
	display: inline-block;
	width: auto;
}

.card img, .card-title b, .card-body .card-text, .text-muted {
	cursor: pointer;
}

.highlight {
	background: #ff00003b;
	box-shadow: 0px 0px 0px 2px #ff00003b;
}
</style>
</head>
<body>
   <c:import url="../common/header.jsp" />

   <div id="searchResultDiv-back" class="container">
      <div class="row">
         <div class="col-md-2">
            <div id="sideMenu" class="container">
               <b style="font-size: 1.3em; font-weight: 700;">검색 필터</b>
               <div class="row justify-content-center" style="margin-top: 10px;">
                  <div class="col">
                     <ul>
                        <li style="font-weight: 700">카테고리</li>
                        <li><a class="list" href="search.do?search=${ search }&price=전체">전체</a></li>
                        <li>
                           <a class="list" id="cate-lecture" href="searchAll.do?search=${ search }&cate=강의&price=전체">강의</a>
                           <ul class="search-subList lList listCate">
                              <li><a class="list">- 디자인</a></li>
                              <li><a class="list">- 실무역량</a></li>
                              <li><a class="list">- 뷰티</a></li>
                              <li><a class="list">- 영상</a></li>
                              <li><a class="list">- 외국어</a></li>
                              <li><a class="list">- 음악</a></li>
                              <li><a class="list">- 라이프스타일</a></li>
                              <li><a class="list">- 재테크</a></li>
                           </ul>
                        </li>
                        <li>
                           <a class="list" id="cate-product" href="searchAll.do?search=${ search }&cate=상품&price=전체">상품</a>
                           <ul class="search-subList pList listCate">
                              <li><a class="list">- 가방</a></li>
                              <li><a class="list">- 시계</a></li>
                              <li><a class="list">- 지갑</a></li>
                              <li><a class="list">- 향수</a></li>
                              <li><a class="list">- 악세서리</a></li>
                              <li><a class="list">- 재료</a></li>
                           </ul>
                        </li>
                     </ul>
                  </div>
                  <div class="w-100"></div><br>
                  <div class="col">
                     <ul id="priceList">
                        <li><a style="font-weight: 700">가격</a></li>
                        <li><a class="list">가격 전체</a></li>
                        <li><a class="list">무료</a></li>
                        <li><a class="list">1만원 미만</a></li>
                        <li><a class="list">1만원 ~ 2만원</a></li>
                        <li><a class="list">2만원 ~ 3만원</a></li>
                        <li><a class="list">3만원 초과</a></li>
                     </ul>
                  </div>
               </div>
            </div>
         </div>
         <div id="searchResultDiv" class="col-md-10">
            <div class="container">
            	<div class="row">
            		<p style="font-size: 29px; font-weight: 700; margin-bottom: 40px;">'${ search }'에 대한 검색결과</p>
			        <div class="col-md searchListDiv" style="background: #ececec; padding: 2px 10px;">
			        	'${ search }' > 카테고리(${ cate }) 
			        	<c:if test="${ subcate != null }">
			        		> 세부 카테고리(${ subcate })
			        	</c:if>
			        	<c:if test="${ price ne '전체' }">
			        		> 가격(${ price })
			        	</c:if>
			        </div>
            		<div class="col">
            			<div class="album py-5 bg-light">
			               <div class="container">
			                  <div class="row align-items-center">
			                  	<c:choose>
			                  		<c:when test="${ cate.equals('강의') }">
			                  			<c:if test="${empty list}">
					                  		<div class="col"></div>
					                  		<div class="col" style="text-align: center;"><h4>일치하는 ${ cate }정보가 없습니다.</h4></div>
					                  	</c:if>
			                  			<c:forEach var="l" items="${ list }">
					                    	<div class="col-md-4">
						                      <div class="card mb-4 shadow-sm">
						                        <img class="bd-placeholder-img card-img-top" width="90%" height="260" src="${contextPath}/resources/images/lecture/${ l.L_CHANGED_NAME }" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail"/>
						                        <div class="card-body" style="width: 90%;">
						                          <h4 class="card-title"><b>${ l.L_TITLE }</b></h4>
						                          <p class="card-text">${ l.L_CONTENT }</p><br>
						                          <p class="card-text"><small class="text-muted">${ l.L_PRICE }￦</small></p>
						                        </div>
						                      </div>
						                    </div>
					                    </c:forEach>
			                  		</c:when>
			                  		<c:when test="${ cate.equals('상품') }">
			                  			<c:if test="${empty list}">
					                  		<div class="col"></div>
					                  		<div class="col" style="text-align: center;"><h4>일치하는 ${ cate }정보가 없습니다.</h4></div>
					                  	</c:if>
			                  			<c:forEach var="p" items="${ list }">
					                    	<div class="col-md-4">
						                      <div class="card mb-4 shadow-sm">
						                        <img class="bd-placeholder-img card-img-top" width="90%" height="260" src="${contextPath}/resources/images/product/${ p.P_CHANGED_NAME }" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail"/>
						                        <div class="card-body" style="width: 90%;">
						                          <h4 class="card-title"><b>${ p.P_NAME }</b></h4>
						                          <p class="card-text"><small class="text-muted">${ p.P_PRICE }￦</small></p>
						                        </div>
						                      </div>
						                    </div>
					                    </c:forEach>
			                  		</c:when>
			                  	</c:choose>
			                    <div class="x-100"></div>
			                    <c:if test="${!empty list}">
			                    <div class="col-md-12" style="text-align: center;">
						         	<nav aria-label="Page navigation">
									  <ul class="pagination justify-content-center">
									    <c:if test="${ pi.currentPage <= 1 }">
										    <li class="page-item disabled">
										    	<span aria-hidden="true">&laquo;</span>
										    </li>
									    </c:if>
									    
									    <c:if test="${ pi.currentPage > 1 }">
									    
										    <c:if test="${ subcate eq null }">
										    	<c:set var="searchType" value="searchAll.do" />
										    </c:if>
										    <c:if test="${ subcate ne null }">
										    	<c:set var="searchType" value="searchCate.do" />
										    </c:if>
									    
										    <c:url var="pagePrev" value="${ searchType }">
										    	<c:param name="page" value="${ pi.currentPage - 1 }" />
										    	<c:param name="search" value="${ search }" />
										    	<c:param name="cate" value="${ cate }" />
										    	<c:if test="${ subcate != null }">
										    	<c:param name="subcate" value="${ subcate }" />
										    	</c:if>
										    	<c:if test="${ price != null }">
										    	<c:param name="price" value="${ price }" />
										    	</c:if>
										    </c:url>			    
										    <li class="page-item">
										      <a class="page-link" href="${ pagePrev }" aria-label="Previous">
										        <span aria-hidden="true">&laquo;</span>
										      </a>
										    </li>
									    </c:if>
									    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
									    	<c:if test="${ subcate eq null }">
										    	<c:set var="searchType" value="searchAll.do" />
										    </c:if>
										    <c:if test="${ subcate ne null }">
										    	<c:set var="searchType" value="searchCate.do" />
										    </c:if>
										    
									    	<c:url var="pageNum" value="${ searchType }">
										    	<c:param name="page" value="${ p }" />
										    	<c:param name="search" value="${ search }" />
										    	<c:param name="cate" value="${ cate }" />
										    	<c:if test="${ subcate != null }">
										    	<c:param name="subcate" value="${ subcate }" />
										    	</c:if>
										    	<c:if test="${ price != null }">
										    	<c:param name="price" value="${ price }" />
										    	</c:if>
										    </c:url>
										    <c:if test="${ p eq currentPage }">
												<li class="page-item active" aria-current="page">
											      <a class="page-link" href="#">[${ p }]<span class="sr-only">(current)</span></a>
											    </li>
											</c:if>
											
											<c:if test="${ p ne currentPage }">
												<li class="page-item"><a class="page-link" href="${ pageNum }">${ p }</a></li>
											</c:if>
									    </c:forEach>
									    <c:if test="${ pi.currentPage >= pi.maxPage }">
										    <li class="page-item disabled">
										        <span aria-hidden="true">&raquo;</span>
										    </li>
									    </c:if>
									    <c:if test="${ pi.currentPage < pi.maxPage }">
										    <c:url var="pageNext" value="${ searchType }">
											    <c:param name="page" value="${ pi.currentPage + 1 }" />
											    <c:param name="search" value="${ search }" />
											   	<c:param name="cate" value="${ cate }" />
											   	<c:if test="${ subcate != null }">
											   	<c:param name="subcate" value="${ subcate }" />
											   	</c:if>
										    	<c:if test="${ price != null }">
										    	<c:param name="price" value="${ price }" />
										    	</c:if>
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
			                  </div>
			                </div>
		              	</div>
            		</div>
            	</div>
            </div>
         </div>
      </div>
   </div>

   <c:import url="../common/footer.jsp" />
   
   <script>
   		$(function() {
			if ("${cate}" == "강의") {
				$('#cate-product').removeClass('selectedList');
				$('#cate-lecture').addClass('selectedList');
			} else if ("${cate}" == "상품") {
				$('#cate-lecture').removeClass('selectedList');
				$('#cate-product').addClass('selectedList');
			}
			
			$('.card-title').highlight('${search}');
			$('.card-text').highlight('${search}');
		});
   		
   		var searchList = $('.searchListDiv').text();
   		$('.moreBtn').click(function() {
   			$(this).parent().submit();
		});
   		
   		$('.listCate').children().children('.list').click(function() {
   			var cate = $(this).parent().parent().siblings('a').text();
			var subCate = $(this).text().split(' ')[1];
			location.href='searchCate.do?search=${search}&cate='+ cate +'&subcate=' + subCate + '&price=전체';
		});
   		
   		$('#priceList').children().children('.list').click(function() {
			var price = $(this).text();
			if(price == '가격 전체'){
				price = '전체';
			}
			
			var subcate = '${subcate}';
			if(subcate == '') {
				location.href='searchAll.do?&search=${search}&cate=${cate}&price=' + price;
			} else {
				location.href='searchCate.do?&search=${search}&cate=${cate}&subcate=${subcate}&price=' + price;
			}
		});
   </script>
</body>
</html>