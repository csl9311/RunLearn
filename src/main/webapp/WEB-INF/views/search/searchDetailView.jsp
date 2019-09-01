<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
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
                        <li><a style="font-weight: 700">카테고리</a></li>
                        <li><a class="list" href="search.do?search=${ search }">전체</a></li>
                        <li>
                           <a class="list" id="cate-lecture" href="lsearchAll.do?search=${ search }">강의</a>
                           <ul class="search-subList">
                              <li><a class="list">- 인기수업</a></li>
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
                           <a class="list" id="cate-product" href="psearchAll.do?search=${ search }">상품</a>
                           <ul class="search-subList">
                              <li><a class="list">- 핸드메이드</a></li>
                              <li><a class="list">- 재료</a></li>
                           </ul>
                        </li>
                     </ul>
                  </div>
                  <div class="w-100"></div><br>
                  <div class="col">
                     <ul>
                        <li><a style="font-weight: 700">가격</a></li>
                        <li><a class="list">가격 전체</a></li>
                        <li><a class="list">무료</a></li>
                        <li><a class="list">1만원 미만</a></li>
                        <li><a class="list">1만원 ~ 2만원</a></li>
                        <li><a class="list">2만원 ~ 3만원</a></li>
                     </ul>
                  </div>
               </div>
            </div>
         </div>
         <div id="searchResultDiv" class="col-md-10">
            <div class="container">
            	<div class="row">
            		<p style="font-size: 29px; font-weight: 700; margin-bottom: 40px;">'${ search }'에 대한 검색결과</p>
			        <div class="col-md" style="background: #ececec; padding: 2px 10px;">
			        	'강의' > 카테고리(${ cate })
			        </div>
            		<div class="col">
            			<div class="album py-5 bg-light">
			               <div class="container">
			                  <div class="row align-items-center">
			                  	<%-- <c:if test="${empty lectureList}">
			                  		<div class="col"></div>
			                  		<div class="col" style="text-align: center;"><h4>일치하는 강의정보가 없습니다.</h4></div>
			                  	</c:if>
			                  	<c:if test="${!empty lectureList}"> --%>
			                     <% for(int i=0; i<12; i++) { %>
				                    <div class="col-md-4">
				                      <div class="card mb-4 shadow-sm">
				                        <img class="bd-placeholder-img card-img-top" width="90%" height="260" src="${contextPath}/resources/images/main/lectureImg_sample.PNG" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail"/>
				                        <div class="card-body" style="width: 90%;">
				                          <h4 class="card-title">강의 제목</h4>
				                          <p class="card-text">강의 서브 설명</p>
				                          <p class="card-text"><small class="text-muted">10,000￦</small></p>
				                        </div>
				                      </div>
				                    </div>
			                    <% } %>
			                    <div class="x-100"></div>
			                    <div class="col-md-12" style="text-align: center;">
						         	<nav aria-label="Page navigation">
									  <ul class="pagination justify-content-center">
									    <li class="page-item disabled">
									      <a class="page-link" href="#" aria-label="Previous">
									        <span aria-hidden="true">&laquo;</span>
									      </a>
									    </li>
									    <li class="page-item active" aria-current="page">
									      <a class="page-link" href="#">1 <span class="sr-only">(current)</span></a>
									    </li>
									    <li class="page-item"><a class="page-link" href="#">2</a></li>
									    <li class="page-item"><a class="page-link" href="#">3</a></li>
									    <li class="page-item">
									      <a class="page-link" href="#" aria-label="Next">
									        <span aria-hidden="true">&raquo;</span>
									      </a>
									    </li>
									  </ul>
									</nav>
						         </div>
			                    <%-- </c:if> --%>
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
		});
   </script>
</body>
</html>