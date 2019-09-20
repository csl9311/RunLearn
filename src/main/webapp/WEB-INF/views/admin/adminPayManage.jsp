<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href='${ contextPath }/resources/css/admin/admin.css'>
</head>
<body>
<c:url var="adminMain" value="adminMain.do"/>
<c:url var="adminUser" value="adminUsesr.do"/>
<%-- <c:url var="adminPayManage" value="adminPayManage.do"/> --%>
<c:url var="adminNoticeAdmin" value="adminNoticeAdmin.do"/>
<c:url var="adminNoticeUser" value="adminNoticeUser.do"/>
<c:url var="adminBoardDetailView" value="adminBoardDetailView.do"/>
<c:url var="adminBoardInsertView" value="adminBoardInsertView.do"/>

<div class="sidebar w3-bar-block  w3-card" style="width:180px; margin-top:3px;">
  <h6 class="w3-bar-item fonthotpink" style="font-size:23px;">관리자페이지</h6>
 <input type="button" value="---->홈으로" class="w3-bar-item tablink hoverpink w3-round" onclick="location.href='adminToHome.do';">  <hr>
  <button id="tablink1" class="w3-bar-item tablink hoverpink w3-round" onclick="location.href='adminMain.do';" style="width:175px">관리자 메인</button>
  <button id="tablink2" class="w3-bar-item tablink hoverpink w3-round" onclick="location.href='adminUser.do';" style="width:175px">회원관리</button>
  <button id="tablink3" class="w3-bar-item tablink hoverpink w3-round hotpink fontwhite" onclick="location.href='adminPayManage.do';" style="width:175px">강의신청</button>
  <button id="tablink4" class="w3-bar-item tablink hoverpink w3-round" onclick="location.href='adminNoticeAdmin.do';" style="width:175px">고객센터</button>

</div>

<div class="minh"style="margin-left:190px">
  <h2 class="w3-padding fontthick fonthotpink">강의 신청</h2><hr class="borderhotpink">
 <div class="w3-container">
  <div id="st3menu2" class="w3-container borderhotpink sidetab3menus animate-fading" >
    <table class="w3-table-all hoverTablePink">
  	<thead>
  	<tr class="fontwhite" style="background-color:#ff005a;">
  		<th style="width:auto;text-align:center;">강의글번호</th>
  		<th style="width:auto;text-align:center;">강의제목</th>
  		<th style="width:auto;text-align:center;">강의 가격</th>
  		<th style="width:auto;text-align:center;">카테고리</th>
  		<th style="width:auto;text-align:center;">신청자</th>

  	</tr>
  	</thead>
  	<c:forEach var="a" items="${ l_list }">
  		<tr>
  			<input type="hidden" name="page" value="${ page }">
			<td style="text-align:center;"><input type="text"  name="b_num"  value="${ a.l_num }" style="text-align:center;background-color:rgba(0,0,0,0);border:rgba(0,0,0,0);width:100px;" readonly>
			<td style="text-align:center;">
			<c:url var="Apply" value="lectureComfirmView.le">
						<c:param name="l_num" value="${ a.l_num }"/>
					</c:url>
					<a href="${ Apply }">${ a.l_title }</a>
			</td>
			<td style="text-align:center;"><input type="text" name="m_id" value="${ a.l_price }" class=" borderInform"readonly></td>
			<td style="text-align:center;"><input type="text" name="b_count" value="${ a.l_category }" class=" borderInform"readonly></td>
			<td style="text-align:center;"><input type="text" name="b_reg_date" value="${ a.m_id }" class="${ a.m_id } borderInform2 allUser" style="border:rgba(0,0,0)"readonly></td>
		</tr>
		
		
			
		</c:forEach>
		<!-- 페이징 -->
		<tr align="center" height="20" id="buttonTab">
			<td style="text-align:center;" colspan="6">
				<!-- [이전] -->
				<c:if test="${ lpi.currentPage <= 1 }">
					[이전] &nbsp;
				</c:if>
				<c:if test="${ lpi.currentPage > 1 }">
					<c:url var="before" value="adminPayManage.do">
						<c:param name="page" value="${ lpi.currentPage - 1 }"/>
					</c:url>
					<a href="${ before }">[이전]</a> &nbsp;
				</c:if>
				<!-- 페이지 -->
				<c:forEach var="p" begin="${ lpi.startPage }" end="${ lpi.endPage }">
					<c:if test="${ p eq currentPage }">
						<font color="red" size="4"><b>[${ p }]</b></font>
					</c:if>
					
					<c:if test="${ p ne currentPage }">
						<c:url var="pagination" value="adminPayManage.do">
							<c:param name="page" value="${ p }"/>
						</c:url>
						<a href="${ pagination }">${ p }</a> &nbsp;<!--blist.do?page=1 페이지라는 변수가지고 컨트롤러를 짜야함  -->
					</c:if>
				</c:forEach>
				<!-- [다음] -->
				<c:if test="${ lpi.currentPage >= lpi.maxPage }">
					[다음]
				</c:if>
				<c:if test="${ lpi.currentPage < lpi.maxPage }">
					<c:url var="after" value="blist.do">
						<c:param name="page" value="${ lpi.currentPage + 1 }"/>
					</c:url> 
					<a href="${ after }">[다음]</a>
				</c:if>
			</td>
		</tr>
		<!-- /페이징 -->
  	</table>
    
  </div>
  </div>
  <script>
function st3menu(evt, sidetab3menu) {
  var i, x, tablinks;
  x = document.getElementsByClassName("sidetab3menus");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("sidetab3menu");
  for (i = 0; i < x.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" hotpink fontwhite", "");
  }
  document.getElementById(sidetab3menu).style.display = "block";
  evt.currentTarget.className += " hotpink fontwhite";
}
</script>
</div>
</body>
</html>