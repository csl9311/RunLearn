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
<c:url var="adminPayManage" value="adminPayManage.do"/>
<%-- <c:url var="adminNoticeAdmin" value="adminNoticeAdmin.do"/> --%>
<c:url var="adminNoticeUser" value="adminNoticeUser.do"/>
<c:url var="adminBoardDetailView" value="adminBoardDetailView.do"/>
<c:url var="adminBoardInsertView" value="adminBoardInsertView.do"/>

<div class="sidebar w3-bar-block  w3-card" style="width:180px; margin-top:3px;">
  <h6 class="w3-bar-item fonthotpink" style="font-size:23px;">관리자페이지</h6>
  <input type="button" value="홈으로" onclick="location.href='adminToHome.do';">
  <hr>
 <button id="tablink1" class="w3-bar-item tablink hoverpink w3-round" onclick="location.href='adminMain.do';" style="width:175px">관리자 메인</button>
  <button id="tablink2" class="w3-bar-item tablink hoverpink w3-round" onclick="location.href='adminUser.do';" style="width:175px">회원관리</button>
  <button id="tablink3" class="w3-bar-item tablink hoverpink w3-round" onclick="location.href='adminPayManage.do';" style="width:175px">결제관리</button>
  <button id="tablink4" class="w3-bar-item tablink hoverpink w3-round hotpink fontwhite" onclick="location.href='adminNoticeAdmin.do';" style="width:175px">고객센터</button>

</div>

<div class="minh"style="margin-left:190px">
 <h2 class="w3-padding fontthick fonthotpink">관리자 게시글</h2><hr class="borderhotpink">
    <div class="w3-container">

  <div class="w3-bar w3-white w3-card">
    <button class="w3-bar-item  sidetab4menu w3-round hoverpink hotpink fontwhite" onclick="st4menu(event,'st4menu1')" style="min-width:150px; margin-left:5px;margin-right:5px;">공지사항</button>
    <button class="w3-bar-item  sidetab4menu w3-round hoverpink" onclick="st4menu(event,'st4menu2')" style="min-width:150px; margin-left:5px;margin-right:5px;">질문</button>
     <button class="w3-bar-item  sidetab4menu w3-round hoverpink" onclick="st4menu(event,'st4menu3')" style="min-width:150px; margin-left:5px;margin-right:5px;">건의</button>
      <button class="w3-bar-item  sidetab4menu w3-round hoverpink" onclick="st4menu(event,'st4menu4')" style="min-width:150px; margin-left:5px;margin-right:5px;">신고글</button>
    
  </div>
  
  <div id="st4menu1" class="w3-container borderhotpink sidetab4menus animate-fading" style="border-top:white">
    <h3 class="fonthotpink" style="font-weight:bold">공지사항</h3>
    <button class="listbtn fontwhite" style="margin:5px;margin-right:20px;float:right;"onclick="location.href='adminInsertNotice.do';">글 작성</button>
    <table class="w3-table-all hoverTablePink">
  	<thead>
  	<tr class="fontwhite" style="background-color:#ff005a;">
  		<th style="width:5%;text-align:center;">글번호</th>
  		<th style="width:60%;text-align:center;">글제목</th>
  		<th style="width:5%;text-align:center;">작성자</th>
  		<th style="width:5%;text-align:center;">조회수</th>
  		<th style="width:10%;text-align:center;">작성시간</th>
  		<th style="width:10%;text-align:center;">삭제</th>
  	</tr>
  	</thead>
  	<c:forEach var="a" items="${ boardList }">
  		<c:if test="${ a.b_status  eq 'Y' and a.b_category eq '공지'}">
  		<form action="targetBoardDelete.do" method="post" enctype="Multipart/form-data">
  		<tr>
  			<input type="hidden" name="page" value="${ page }">
  			<input type="hidden" name="b_status" value="${ a.b_status }" class=" borderInform"readonly>
  			<input type="hidden" name="b_category" value="${ a.b_category }" class="${ a.m_id } borderInform allUser" readonly>
  			<input type="hidden" name="b_content" value="${ a.b_content }" class="${ a.m_id } borderInform allUser"readonly>
  			<input type="hidden" name="b_subcategory" value="${ a.b_subcategory }" class=" borderInform"readonly>
			<td style="text-align:center;"><input type="text"  name="b_num"  value="${ a.b_num }" style="text-align:center;background-color:rgba(0,0,0,0);border:rgba(0,0,0,0);width:100px;" readonly>
			<td style="text-align:center;"><input type="text" name="b_title" value="${ a.b_title }" class="${ a.m_id } borderInform allUser"  readonly></td>
			<td style="text-align:center;"><input type="text" name="m_id" value="${ a.m_id }" class=" borderInform"readonly></td>
			<td style="text-align:center;"><input type="text" name="b_count" value="${ a.b_count }" class=" borderInform"readonly></td>
			
			<td style="text-align:center;"><input type="text" name="b_reg_date" value="${ a.b_reg_date }" class="${ a.m_id } borderInform2 allUser" style="border:rgba(0,0,0)"readonly></td>
			
			<td><button type="button" value="삭제하기"class="${ a.m_id }BC  allUserBC listbtn fontwhite" >삭제하기</button></td>
			
		</tr>
		<script>
		function insertTr(target, targetB, targetBC){
			
			$('.'+target).removeAttr('readonly').attr;
			
			x = document.getElementsByClassName(target);
			console.log(typeof(target));
			listInform = document.getElementsByClassName(target);
			  for (i = 0; i < x.length; i++) {
				  listInform[i].className = listInform[i].className.replace(" borderInform", " borderReplace");
				  listInform[i].className = listInform[i].className.replace(" borderInform2", " borderReplace2");
			  };
			  y = document.getElementsByClassName(targetB);
			  z = document.getElementsByClassName(targetBC);
			  for (i = 0; i < y.length; i++) {
			  y[i].style.display="none";
			  }
			  for (i = 0; i < y.length; i++) {
				  z[i].style.display="";
				}
		}
		</script>
		
			</form>
			</c:if>
			
		</c:forEach>
		<!-- 페이징 -->
		<tr align="center" height="20" id="buttonTab">
			<td style="text-align:center;" colspan="6">
				<!-- [이전] -->
				<c:if test="${ blcn.currentPage <= 1 }">
					[이전] &nbsp;
				</c:if>
				<c:if test="${ blcn.currentPage > 1 }">
					<c:url var="before" value="adminNoticeAdmin.do">
						<c:param name="page" value="${ blcn.currentPage - 1 }"/>
					</c:url>
					<a href="${ before }">[이전]</a> &nbsp;
				</c:if>
				<!-- 페이지 -->
				<c:forEach var="p" begin="${ blcn.startPage }" end="${ blcn.endPage }">
					<c:if test="${ p eq currentPage }">
						<font color="red" size="4"><b>[${ p }]</b></font>
					</c:if>
					
					<c:if test="${ p ne currentPage }">
						<c:url var="pagination" value="adminNoticeAdmin.do">
							<c:param name="page" value="${ p }"/>
						</c:url>
						<a href="${ pagination }">${ p }</a> &nbsp;<!--blist.do?page=1 페이지라는 변수가지고 컨트롤러를 짜야함  -->
					</c:if>
				</c:forEach>
				<!-- [다음] -->
				<c:if test="${ blcn.currentPage >= blcn.maxPage }">
					[다음]
				</c:if>
				<c:if test="${ blcn.currentPage < blcn.maxPage }">
					<c:url var="after" value="blist.do">
						<c:param name="page" value="${ blcn.currentPage + 1 }"/>
					</c:url> 
					<a href="${ after }">[다음]</a>
				</c:if>
			</td>
		</tr>
		<!-- /페이징 -->
  	</table>
  </div>

 

  
  <div id="st4menu2" class="w3-container borderhotpink sidetab4menus animate-fading" style="display:none;border-top:white">
      <h3 class="fonthotpink" style="font-weight:bold">질문</h3>
    <table class="w3-table-all hoverTablePink">
  	<thead>
  	<tr class="fontwhite" style="background-color:#ff005a;">
  		<th style="width:5%;text-align:center;">글번호</th>
  		<th style="width:60%;text-align:center;">글제목</th>
  		<th style="width:5%;text-align:center;">작성자</th>
  		<th style="width:5%;text-align:center;">조회수</th>
  		<th style="width:10%;text-align:center;">작성시간</th>
  		<th style="width:10%;text-align:center;">삭제</th>
  	</tr>
  	</thead>
  	<c:forEach var="a" items="${ boardList }">
  		<c:if test="${ a.b_status  eq 'Y' and a.b_category eq '질문'}">
  		<form action="targetBoardDelete.do" method="post" enctype="Multipart/form-data">
  		<tr>
  			<input type="hidden" name="page" value="${ page }">
  			<input type="hidden" name="b_status" value="${ a.b_status }" class=" borderInform"readonly>
  			<input type="hidden" name="b_category" value="${ a.b_category }" class="${ a.m_id } borderInform allUser" readonly>
  			<input type="hidden" name="b_content" value="${ a.b_content }" class="${ a.m_id } borderInform allUser"readonly></td>
			<input type="hidden" name="b_subcategory" value="${ a.b_subcategory }" class=" borderInform"readonly>
			<td style="text-align:center;"><input type="text"  name="b_num"  value="${ a.b_num }" style="text-align:center;background-color:rgba(0,0,0,0);border:rgba(0,0,0,0);width:100px;" readonly>
			<td style="text-align:center;"><input type="text" name="b_title" value="${ a.b_title }" class="${ a.m_id } borderInform allUser"  readonly></td>
			<td style="text-align:center;"><input type="text" name="m_id" value="${ a.m_id }" class=" borderInform"readonly></td>
			<td style="text-align:center;"><input type="text" name="b_count" value="${ a.b_count }" class=" borderInform"readonly></td>
			
			<td style="text-align:center;"><input type="text" name="b_reg_date" value="${ a.b_reg_date }" class="${ a.m_id } borderInform2 allUser" style="border:rgba(0,0,0)"readonly></td>
			
			<td><button type="button" class="${ a.m_id }BC  allUserBC listbtn fontwhite">삭제하기</button></td>
			
		</tr>
		<script>
		function insertTr(target, targetB, targetBC){
			
			$('.'+target).removeAttr('readonly').attr;
			
			x = document.getElementsByClassName(target);
			console.log(typeof(target));
			listInform = document.getElementsByClassName(target);
			  for (i = 0; i < x.length; i++) {
				  listInform[i].className = listInform[i].className.replace(" borderInform", " borderReplace");
				  listInform[i].className = listInform[i].className.replace(" borderInform2", " borderReplace2");
			  };
			  y = document.getElementsByClassName(targetB);
			  z = document.getElementsByClassName(targetBC);
			  for (i = 0; i < y.length; i++) {
			  y[i].style.display="none";
			  }
			  for (i = 0; i < y.length; i++) {
				  z[i].style.display="";
				}
		}
		</script>
		
			</form>
			</c:if>
			
		</c:forEach>
		<!-- 페이징 -->
		<tr align="center" height="20" id="buttonTab">
			<td style="text-align:center;" colspan="6">
				<!-- [이전] -->
				<c:if test="${ blcq.currentPage <= 1 }">
					[이전] &nbsp;
				</c:if>
				<c:if test="${ blcq.currentPage > 1 }">
					<c:url var="before" value="adminNoticeAdmin.do">
						<c:param name="page" value="${ blcq.currentPage - 1 }"/>
					</c:url>
					<a href="${ before }">[이전]</a> &nbsp;
				</c:if>
				<!-- 페이지 -->
				<c:forEach var="p" begin="${ blcq.startPage }" end="${ blcq.endPage }">
					<c:if test="${ p eq currentPage }">
						<font color="red" size="4"><b>[${ p }]</b></font>
					</c:if>
					
					<c:if test="${ p ne currentPage }">
						<c:url var="pagination" value="adminNoticeAdmin.do">
							<c:param name="page" value="${ p }"/>
						</c:url>
						<a href="${ pagination }">${ p }</a> &nbsp;<!--blist.do?page=1 페이지라는 변수가지고 컨트롤러를 짜야함  -->
					</c:if>
				</c:forEach>
				<!-- [다음] -->
				<c:if test="${ blcq.currentPage >= blcq.maxPage }">
					[다음]
				</c:if>
				<c:if test="${ blcq.currentPage < blcq.maxPage }">
					<c:url var="after" value="blist.do">
						<c:param name="page" value="${ blcq.currentPage + 1 }"/>
					</c:url> 
					<a href="${ after }">[다음]</a>
				</c:if>
			</td>
		</tr>
		<!-- /페이징 -->
  	</table>
    
  </div>
  
  <div id="st4menu3" class="w3-container borderhotpink sidetab4menus animate-fading" style="display:none;border-top:white">
    <h3 class="fonthotpink" style="font-weight:bold">건의</h3>
    <table class="w3-table-all hoverTablePink">
  	<thead>
  	<tr class="fontwhite" style="background-color:#ff005a;">
  		<th style="width:5%;text-align:center;">글번호</th>
  		<th style="width:60%;text-align:center;">글제목</th>
  		<th style="width:5%;text-align:center;">작성자</th>
  		<th style="width:5%;text-align:center;">조회수</th>
  		<th style="width:10%;text-align:center;">작성시간</th>
  		<th style="width:10%;text-align:center;">삭제</th>
  	</tr>
  	</thead>
  	<c:forEach var="a" items="${ boardList }">
  		<c:if test="${ a.b_status  eq 'Y' and a.b_category eq '건의'}">
  		<form action="targetBoardDelete.do" method="post" enctype="Multipart/form-data">
  		<tr>
  			<input type="hidden" name="page" value="${ page }">
  			<input type="hidden" name="b_status" value="${ a.b_status }" class=" borderInform"readonly>
  			<input type="hidden" name="b_category" value="${ a.b_category }" class="${ a.m_id } borderInform allUser" readonly>
  			<input type="hidden" name="b_content" value="${ a.b_content }" class="${ a.m_id } borderInform allUser"readonly></td>
			<td style="text-align:center;"><input type="text"  name="b_num"  value="${ a.b_num }" style="text-align:center;background-color:rgba(0,0,0,0);border:rgba(0,0,0,0);width:100px;" readonly>
			<td style="text-align:center;"><input type="text" name="b_title" value="${ a.b_title }" class="${ a.m_id } borderInform allUser"  readonly></td>
			<td style="text-align:center;"><input type="text" name="m_id" value="${ a.m_id }" class=" borderInform"readonly></td>
			<td style="text-align:center;"><input type="text" name="b_count" value="${ a.b_count }" class=" borderInform"readonly></td>
			
			<input type="hidden" name="b_reg_date" value="${ a.b_reg_date }" class="${ a.m_id } borderInform2 allUser" style="border:rgba(0,0,0)"readonly>
			<td style="text-align:center;"><input type="text" name="b_subcategory" value="${ a.b_subcategory }" class=" borderInform"readonly></td>
			<td><button type="button" class="${ a.m_id }BC  allUserBC listbtn fontwhite" >삭제하기</button></td>
			
		</tr>
		<script>
		function insertTr(target, targetB, targetBC){
			
			$('.'+target).removeAttr('readonly').attr;
			
			x = document.getElementsByClassName(target);
			console.log(typeof(target));
			listInform = document.getElementsByClassName(target);
			  for (i = 0; i < x.length; i++) {
				  listInform[i].className = listInform[i].className.replace(" borderInform", " borderReplace");
				  listInform[i].className = listInform[i].className.replace(" borderInform2", " borderReplace2");
			  };
			  y = document.getElementsByClassName(targetB);
			  z = document.getElementsByClassName(targetBC);
			  for (i = 0; i < y.length; i++) {
			  y[i].style.display="none";
			  }
			  for (i = 0; i < y.length; i++) {
				  z[i].style.display="";
				}
		}
		</script>
		
			</form>
			</c:if>
			
		</c:forEach>
		<!-- 페이징 -->
		<tr align="center" height="20" id="buttonTab">
			<td style="text-align:center;" colspan="6">
				<!-- [이전] -->
				<c:if test="${ blcs.currentPage <= 1 }">
					[이전] &nbsp;
				</c:if>
				<c:if test="${ blcs.currentPage > 1 }">
					<c:url var="before" value="adminNoticeAdmin.do">
						<c:param name="page" value="${ blcs.currentPage - 1 }"/>
					</c:url>
					<a href="${ before }">[이전]</a> &nbsp;
				</c:if>
				<!-- 페이지 -->
				<c:forEach var="p" begin="${ blcs.startPage }" end="${ blcs.endPage }">
					<c:if test="${ p eq currentPage }">
						<font color="red" size="4"><b>[${ p }]</b></font>
					</c:if>
					
					<c:if test="${ p ne currentPage }">
						<c:url var="pagination" value="adminNoticeAdmin.do">
							<c:param name="page" value="${ p }"/>
						</c:url>
						<a href="${ pagination }">${ p }</a> &nbsp;<!--blist.do?page=1 페이지라는 변수가지고 컨트롤러를 짜야함  -->
					</c:if>
				</c:forEach>
				<!-- [다음] -->
				<c:if test="${ blcs.currentPage >= blcs.maxPage }">
					[다음]
				</c:if>
				<c:if test="${ blcs.currentPage < blcs.maxPage }">
					<c:url var="after" value="blist.do">
						<c:param name="page" value="${ blcs.currentPage + 1 }"/>
					</c:url> 
					<a href="${ after }">[다음]</a>
				</c:if>
			</td>
		</tr>
		<!-- /페이징 -->
  	</table>
  </div>
  
  <div id="st4menu4" class="w3-container borderhotpink sidetab4menus animate-fading" style="display:none;border-top:white">
    <h3 class="fonthotpink" style="font-weight:bold">신고글</h3>
    <table class="w3-table-all hoverTablePink">
  	<thead>
  	<tr class="fontwhite" style="background-color:#ff005a;">
  		<th style="width:5%;text-align:center;">글번호</th>
  		<th style="width:60%;text-align:center;">글제목</th>
  		<th style="width:5%;text-align:center;">작성자</th>
  		<th style="width:5%;text-align:center;">조회수</th>
  		<th style="width:10%;text-align:center;">작성시간</th>
  		<th style="width:10%;text-align:center;">삭제</th>
  	</tr>
  	</thead>
  	<c:forEach var="a" items="${ boardList }">
  		<c:if test="${ a.b_status  eq 'Y' and a.b_category eq '신고'}">
  		<form action="targetBoardDelete.do" method="post" enctype="Multipart/form-data">
  		<tr>
  			<input type="hidden" name="page" value="${ page }">
  			<input type="hidden" name="b_status" value="${ a.b_status }" class=" borderInform"readonly>
  			<input type="hidden" name="b_category" value="${ a.b_category }" class="${ a.m_id } borderInform allUser" readonly>
  			<input type="hidden" name="b_content" value="${ a.b_content }" class="${ a.m_id } borderInform allUser"readonly></td>
			<td style="text-align:center;"><input type="text"  name="b_num"  value="${ a.b_num }" style="text-align:center;background-color:rgba(0,0,0,0);border:rgba(0,0,0,0);width:100px;" readonly>
			<td style="text-align:center;"><input type="text" name="b_title" value="${ a.b_title }" class="${ a.m_id } borderInform allUser"  readonly></td>
			<td style="text-align:center;"><input type="text" name="m_id" value="${ a.m_id }" class=" borderInform"readonly></td>
			<td style="text-align:center;"><input type="text" name="b_count" value="${ a.b_count }" class=" borderInform"readonly></td>
			
			<td style="text-align:center;"><input type="text" name="b_reg_date" value="${ a.b_reg_date }" class="${ a.m_id } borderInform2 allUser" style="border:rgba(0,0,0)"readonly></td>
			<input type="hidden" name="b_subcategory" value="${ a.b_subcategory }" class=" borderInform"readonly>
			<td><button type="button" class="${ a.m_id }BC  allUserBC listbtn fontwhite" >삭제하기</button></td>
			
		</tr>
		<script>
		function insertTr(target, targetB, targetBC){
			
			$('.'+target).removeAttr('readonly').attr;
			
			x = document.getElementsByClassName(target);
			console.log(typeof(target));
			listInform = document.getElementsByClassName(target);
			  for (i = 0; i < x.length; i++) {
				  listInform[i].className = listInform[i].className.replace(" borderInform", " borderReplace");
				  listInform[i].className = listInform[i].className.replace(" borderInform2", " borderReplace2");
			  };
			  y = document.getElementsByClassName(targetB);
			  z = document.getElementsByClassName(targetBC);
			  for (i = 0; i < y.length; i++) {
			  y[i].style.display="none";
			  }
			  for (i = 0; i < y.length; i++) {
				  z[i].style.display="";
				}
		}
		</script>
		
			</form>
			</c:if>
			
		</c:forEach>
		<!-- 페이징 -->
		<tr align="center" height="20" id="buttonTab">
			<td style="text-align:center;" colspan="6">
				<!-- [이전] -->
				<c:if test="${ blcd.currentPage <= 1 }">
					[이전] &nbsp;
				</c:if>
				<c:if test="${ blcd.currentPage > 1 }">
					<c:url var="before" value="adminNoticeAdmin.do">
						<c:param name="page" value="${ blcd.currentPage - 1 }"/>
					</c:url>
					<a href="${ before }">[이전]</a> &nbsp;
				</c:if>
				<!-- 페이지 -->
				<c:forEach var="p" begin="${ blcd.startPage }" end="${ blcd.endPage }">
					<c:if test="${ p eq currentPage }">
						<font color="red" size="4"><b>[${ p }]</b></font>
					</c:if>
					
					<c:if test="${ p ne currentPage }">
						<c:url var="pagination" value="adminNoticeAdmin.do">
							<c:param name="page" value="${ p }"/>
						</c:url>
						<a href="${ pagination }">${ p }</a> &nbsp;<!--blist.do?page=1 페이지라는 변수가지고 컨트롤러를 짜야함  -->
					</c:if>
				</c:forEach>
				<!-- [다음] -->
				<c:if test="${ blcd.currentPage >= blcd.maxPage }">
					[다음]
				</c:if>
				<c:if test="${ blcd.currentPage < blcd.maxPage }">
					<c:url var="after" value="blist.do">
						<c:param name="page" value="${ blcd.currentPage + 1 }"/>
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
function st4menu(evt, sidetab4menu) {
  var i, x, tablinks;
  x = document.getElementsByClassName("sidetab4menus");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("sidetab4menu");
  for (i = 0; i < x.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" hotpink fontwhite", "");
  }
  document.getElementById(sidetab4menu).style.display = "block";
  evt.currentTarget.className += " hotpink fontwhite";
}
</script>
</div>
</body>
</html>