<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href='${ contextPath }/resources/css/admin/admin.css'>
</head>
<body>
<c:url var="adminMain" value="adminMain.do"/>
<%-- <c:url var="adminUser" value="adminUsesr.do"/> --%>
<c:url var="adminPayManage" value="adminPayManage.do"/>
<c:url var="adminNoticeAdmin" value="adminNoticeAdmin.do"/>
<c:url var="adminNoticeUser" value="adminNoticeUser.do"/>
<c:url var="adminBoardDetailView" value="adminBoardDetailView.do"/>
<c:url var="adminBoardInsertView" value="adminBoardInsertView.do"/>
  <jsp:include page="../common/header.jsp"/>

<div class="sidebar w3-bar-block  w3-card" style="width:180px; margin-top:3px;">
  <h6 class="w3-bar-item fonthotpink" style="font-size:23px;">관리자페이지</h6>
  <hr>
  <button id="tablink1" class="w3-bar-item tablink hoverpink w3-round" onclick="location.href='adminMain.do';" style="width:175px">관리자 메인</button>
  <button id="tablink2" class="w3-bar-item tablink hoverpink w3-round hotpink fontwhite" onclick="location.href='adminUser.do';" style="width:175px">회원관리</button>
  <button id="tablink3" class="w3-bar-item tablink hoverpink w3-round" onclick="location.href='adminPayManage.do';" style="width:175px">결제관리</button>
  <button id="tablink4" class="w3-bar-item tablink hoverpink w3-round" onclick="location.href='adminNoticeAdmin.do';" style="width:175px">고객센터(관리자)</button>
  <button id="tablink5" class="w3-bar-item tablink hoverpink w3-round" onclick="location.href='adminNoticeUser.do';" style="width:175px">고객센터(요청)</button>
  <button id="tablink6" class="w3-bar-item tablink hoverpink w3-round" onclick="location.href='adminBoardDetailView.do';" style="width:175px">(작업용)게시판뷰</button>
  <button id="tablink8" class="w3-bar-item tablink hoverpink w3-round" onclick="location.href='adminBoardInsertForm.do';" style="width:175px">(작업용)게시판작성</button>
</div>

<div class="minh"style="margin-left:190px">

 <h2 class="w3-padding fontthick fonthotpink">회원관리</h2><hr class="borderhotpink">
    <div class="w3-container">

  <div class="w3-bar w3-white w3-card">
    <button class="w3-bar-item sidetab2menu sidetab2menu1 w3-round hoverpink hotpink fontwhite" onclick="st2menu(event,'st2menu1');" style="min-width:150px; margin-left:5px;margin-right:5px;">회원관리</button>
    <button class="w3-bar-item sidetab2menu sidetab2menu3 w3-round hoverpink" onclick="st2menu(event,'st2menu2');" style="min-width:150px; margin-left:5px;margin-right:5px;">튜터회원신청</button>
  </div>
  
  <div id="st2menu1" class="w3-container borderhotpink sidetab2menus animate-fading" style="border-top:white">
    <h3 class="fonthotpink" style="font-weight:bold">회원관리</h3>
    <span class="fonthotpink">전체회원 : ${ pia.listCount } |</span>
    <span class="fonthotpink">튜티회원 : ${ pitee.listCount } |</span>
    <span class="fonthotpink">튜터회원 : ${ pitor.listCount } |</span>
    <span class="fonthotpink">블랙회원 : ${ pib.listCount } |</span>
    <span class="fonthotpink">탈퇴회원 : ${ pil.listCount } |</span>
     <span class="fonthotpink">관리자 수 : ${ piad.listCount }</span>
    
    <form action="searchUser.do">
				<div class="borderhotpinkthick" style="width:460px;">
					<select name="" class="borderhotpink" style="margin:5px;">
						<option value="">아이디</option>
						<option value="">닉네임</option>
						<option value="">이메일</option>
						<option value="">전화번호</option>
						<option value="">정보수정일</option>
						<option value="">등급</option>
						<option value="">상태</option>
					</select>
					<input type="text" name="search" id="fixed-searchcss" placeholder="아이디를 입력해주세요" autocomplete="off" value="" style="border:white;width:300px;">
					<img src="${contextPath}/resources/images/common/search.png" class="searchBtn" onclick="">
				</div>
	</form>
    
    <button class="allUserChangeBtn listbtn fontwhite" style="margin:5px;margin-right:20px;float:right;width:auto;display:block;" onclick="insertTrAll('allUser','allUserB','allUserBC');">모든회원 수정 상태로</button>
   	<button class="allUserChangeBtnCan listbtn fontwhite" style="margin:5px;margin-right:20px;float:right;width:auto;display:none;" onclick="insertTrAllRollback('allUser','allUserB','allUserBC');">모든회원 수정 상태 풀기</button>
    <table class="w3-table-all hoverTablePink" style="width:100%;">
  	<thead>
  	<tr class="fontwhite Ltitle" style="background-color:#ff005a;">
 <!--  		<th style="width:auto;text-align:center;">회원번호</th> -->
  		<th style="width:auto;text-align:center;">회원 사진</th>
  		<th style="width:auto;text-align:center;" class="thead" id="">아이디</th>
  		<th style="width:auto;text-align:center;" class="thead" id="">이름</th>
  		<th style="width:auto;text-align:center;" class="thead" id="">닉네임</th>
  		<th style="width:auto;text-align:center;" class="thead" id="">이메일</th>
  		<th style="width:auto;text-align:center;" class="thead" id="">전화번호</th>
  		<th style="width:auto;text-align:center;" class="thead" id="">가입일▼</th>
  		<th style="width:auto;text-align:center;" class="thead" id="">정보수정일</th>  		
  		<th style="width:auto;text-align:center;" class="thead" id="">등급</th>
  		<th style="width:auto;text-align:center;" class="thead" id="">상태</th>
  		<th style="width:auto;text-align:center;">주소</th> 
  		<th style="width:auto;text-align:center;">수정</th>
  		
  	</tr>
  	
  	</thead>
  	  <script>
  	 $('.Ltitle').children('th').click(function(){
	  		  var category= $(this).text();
	  		 var a = document.getElementsByClassName("thead");
	  		 console.log(a);
  		 console.log(typeof($(this).text())); 
  		console.log($(this).text()); 
  		console.log(category);
  		console.log(typeof(category));
  		console.log(category.length);
  		console.log(typeof(category.length));
  		console.log(a.length);
  		console.log(a[0].textContent);
  		for(i = 0; i < a.length; i++){
  			if(a[i].textContent.substring(a[i].textContent.length-1)=="▼"
  					||
  					a[i].textContent.substring(a[i].textContent.length-1)=="▲"){
  				console.log(a[i].textContent);
  				a[i].textContent=a[i].textContent.substring(0,a[i].textContent.length-1);
  			}
  		}
  		 if(category.substring(category.length-1)=="▼"){
  			console.log($(this).text().substring(0,$(this).text().length-1));
  			$(this).text($(this).text().substring(0,$(this).text().length-1)+'▲');
  			
  		}else if(category.substring(category.length-1)=="▲"){
  			console.log($(this).text().substring(0,$(this).text().length-1));
  			$(this).text($(this).text().substring(0,$(this).text().length-1)+'▼');
  			
  		}else if(category.substring(category.length-1)!="▲" || category.substring(category.length-1)!="▼"){
  			$(this).text($(this).text().substring(0,$(this).text().length)+'▼')
  		};
  			
  		
  	  });
  	  
  $('.centerMenu').children().children('li').click(function() {
		var b_category = $(this).children().eq(1).text();
		
		location.href='cCenterView.do?b_category='+b_category;
	});

	
  </script>
  	<c:forEach var="a" items="${ userList }">
  		<form action="targetUserUpdate.do" method="post" enctype="Multipart/form-data">
  		
  		<tr>
  			<input type="hidden" name="page" value="${ page }">
  			<input type="hidden" name=m_pw valiue="${a.m_pw}">
			<td style="text-align:center;width:100px;">사진 넣을거임</td>
			<td style="text-align:center;"><input type="text" name="m_id"  value="${ a.m_id }" style="text-align:center;background-color:rgba(0,0,0,0);border:rgba(0,0,0,0);width:100px;" readonly></td>
			<td style="text-align:center;"><input type="text" name="m_name" value="${ a.m_name }" class="${ a.m_id } borderInform allUser"  readonly></td>
			<td style="text-align:center;"><input type="text" name="m_nickname" value="${ a.m_nickname }" class="${ a.m_id } borderInform allUser"readonly></td>
			<td style="text-align:center;"><input type="text" name="m_email" value="${ a.m_email }" class="${ a.m_id } borderInform2 allUser" readonly></td>
			<td style="text-align:center;"><input type="text" name="m_phone" value="${ a.m_phone }" class="${ a.m_id } borderInform allUser" readonly></td>
			<td style="text-align:center;"><input type="text" name="m_create_date" value="${ a.m_create_date }" class=" borderInform"readonly></td>
			<td style="text-align:center;"><input type="text" name="m_modify_date" value="${ a.m_modify_date }" class=" borderInform"readonly></td>
			<td style="text-align:center;"><input type="text" name="m_grade" value="${ a.m_grade }" class="${ a.m_id } borderInform allUser" readonly></td>
			<td style="text-align:center;"><input type="text" name="m_status" value="${ a.m_status }" class="${ a.m_id } borderInform allUser" readonly></td>
	
			<td>
			<input type="text" name="postnum" value="${ a.postnum }" class="${ a.m_id } borderInform2 allUser" style="width:15%;" readonly>
			<input type="text" name="g_address" value="${ a.g_address }" class="${ a.m_id } borderInform2 allUser" style="width:30%;" readonly>
			<input type="text" name="r_address" value="${ a.r_address }" class="${ a.m_id } borderInform2 allUser" style="width:30%;" readonly>
			<input type="text" name="d_address" value="${ a.d_address }" class="${ a.m_id } borderInform2 allUser" style="width:10%;" readonly>
			</td>
			<td style="text-align:center;">
			<button type="button" class="${ a.m_id }B allUserB listbtn fontwhite" style="display:block;"onclick="insertTr('${ a.m_id }','${ a.m_id }B','${ a.m_id }BC');">수정</button>
			<button type="submit" class="${ a.m_id }BC  allUserBC listbtn fontwhite" style="display:none;">수정하기</button>
			</td>
		
		</tr>
		
		<script>
		
		function insertTr(target, targetB, targetBC){/* 회원 정보 수정 */
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
		</c:forEach>
				<!-- 페이징 -->
		<tr align="center" height="20" id="buttonTab">
			<td style="text-align:center;" colspan="12">
			
				<!-- [이전] -->
				<c:if test="${ pia.currentPage <= 1 }">
					[이전] &nbsp;
				</c:if>
				<c:if test="${ pia.currentPage > 1 }">
					<c:url var="before" value="adminUser.do">
						<c:param name="page" value="${ pia.currentPage - 1 }"/>
					</c:url>
					<a href="${ before }">[이전]</a> &nbsp;
				</c:if>
				
				<!-- 페이지 -->
				<c:forEach var="p" begin="${ pia.startPage }" end="${ pia.endPage }">
					<c:if test="${ p eq currentPage }">
						<font color="red" size="4"><b>[${ p }]</b></font>
					</c:if>
					
					<c:if test="${ p ne currentPage }">
						<c:url var="pagination" value="adminUser.do">
							<c:param name="page" value="${ p }"/>
						</c:url>
						<a href="${ pagination }">${ p }</a> &nbsp;<!--blist.do?page=1 페이지라는 변수가지고 컨트롤러를 짜야함  -->
					</c:if>
				</c:forEach>
				
				<!-- [다음] -->
				<c:if test="${ pia.currentPage >= pia.maxPage }">
					[다음]
				</c:if>
				<c:if test="${ pia.currentPage < pia.maxPage }">
					<c:url var="after" value="blist.do">
						<c:param name="page" value="${ pia.currentPage + 1 }"/>
					</c:url> 
					<a href="${ after }">[다음]</a>
				</c:if>
			</td>
		</tr>
		<!-- /페이징 -->
  	</table>
   
		
		
  </div>

 

 

  <div id="st2menu2" class="w3-container borderhotpink sidetab2menus animate-fading" style="display:none;border-top:white">
 
    <h3 class="fonthotpink" style="font-weight:bold">튜터신청 목록</h3><span class="fonthotpink">명이 신청하였습니다</span>
 <button class="allUserChangeBtn listbtn fontwhite" style="margin:5px;margin-right:20px;float:right;width:auto;display:block;" onclick="insertTrAll('allUser','allUserB','allUserBC');">모든회원 수정 상태로</button>
   	<button class="allUserChangeBtnCan listbtn fontwhite" style="margin:5px;margin-right:20px;float:right;width:auto;display:none;" onclick="insertTrAllRollback('allUser','allUserB','allUserBC');">모든회원 수정 상태 풀기</button>
    <table class="w3-table-all hoverTablePink">
  	<thead>
  	<tr class="fontwhite" style="background-color:#ff005a;">
 <!--  		<th style="width:auto;text-align:center;">회원번호</th> -->
  		<th style="width:auto;text-align:center;">회원 사진</th>
  		
  		<th style="width:auto;text-align:center;">아이디</th>
  		<th style="width:auto;text-align:center;">이름</th>
  		<th style="width:auto;text-align:center;">닉네임</th>
  		<th style="width:auto;text-align:center;">이메일</th>
  		<th style="width:auto;text-align:center;">전화번호</th>
  		<th style="width:auto;text-align:center;">가입일</th>
  		<th style="width:auto;text-align:center;">정보수정일</th>  		
  		<th style="width:auto;text-align:center;">등급</th>
  		<th style="width:auto;text-align:center;">상태</th>
  		<th style="width:auto;text-align:center;">주소</th> 
  		<th style="width:auto;text-align:center;">수정</th>
  		
  	</tr>
  	</thead>
  	<c:forEach var="a" items="${ userList }">
  		<c:if test="${a.m_grade eq '튜티'}">
		 		<form action="targetUserUpdate.do" method="post" enctype="Multipart/form-data">
  		
  		<tr>
  			<input type="hidden" name="page" value="${ page }">
  			<input type="hidden" name=m_pw valiue="${a.m_pw}">
			<td style="text-align:center;width:100px;">사진 넣을거임</td>
			<td style="text-align:center;"><input type="text" name="m_id"  value="${ a.m_id }" style="text-align:center;background-color:rgba(0,0,0,0);border:rgba(0,0,0,0);width:100px;" readonly></td>
			<td style="text-align:center;"><input type="text" name="m_name" value="${ a.m_name }" class="${ a.m_id } borderInform allUser"  readonly></td>
			<td style="text-align:center;"><input type="text" name="m_nickname" value="${ a.m_nickname }" class="${ a.m_id } borderInform allUser"readonly></td>
			<td style="text-align:center;"><input type="text" name="m_email" value="${ a.m_email }" class="${ a.m_id } borderInform2 allUser" readonly></td>
			<td style="text-align:center;"><input type="text" name="m_phone" value="${ a.m_phone }" class="${ a.m_id } borderInform allUser" readonly></td>
			<td style="text-align:center;"><input type="text" name="m_create_date" value="${ a.m_create_date }" class=" borderInform"readonly></td>
			<td style="text-align:center;"><input type="text" name="m_modify_date" value="${ a.m_modify_date }" class=" borderInform"readonly></td>
			<td style="text-align:center;"><input type="text" name="m_grade" value="${ a.m_grade }" class="${ a.m_id } borderInform allUser" readonly></td>
			<td style="text-align:center;"><input type="text" name="m_status" value="${ a.m_status }" class="${ a.m_id } borderInform allUser" readonly></td>
	
			<td>
			<input type="text" name="postnum" value="${ a.postnum }" class="${ a.m_id } borderInform2 allUser" style="width:15%;" readonly>
			<input type="text" name="g_address" value="${ a.g_address }" class="${ a.m_id } borderInform2 allUser" style="width:30%;" readonly>
			<input type="text" name="r_address" value="${ a.r_address }" class="${ a.m_id } borderInform2 allUser" style="width:30%;" readonly>
			<input type="text" name="d_address" value="${ a.d_address }" class="${ a.m_id } borderInform2 allUser" style="width:10%;" readonly>
			</td>
			<td style="text-align:center;">
			<button type="button" class="${ a.m_id }B allUserB listbtn fontwhite" style="display:block;"onclick="insertTr('${ a.m_id }','${ a.m_id }B','${ a.m_id }BC');">수정</button>
			<button type="submit" class="${ a.m_id }BC  allUserBC listbtn fontwhite" style="display:none;">수정하기</button>
			</td>
		
		</tr>
		
		<script>
	
		function insertTr(target, targetB, targetBC){/* 회원 정보 수정 */
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
			<td style="text-align:center;" colspan="12">
			
				<!-- [이전] -->
				<c:if test="${ pia.currentPage <= 1 }">
					[이전] &nbsp;
				</c:if>
				<c:if test="${ pia.currentPage > 1 }">
					<c:url var="before" value="adminUser.do">
						<c:param name="page" value="${ pia.currentPage - 1 }"/>
					</c:url>
					<a href="${ before }">[이전]</a> &nbsp;
				</c:if>
				
				<!-- 페이지 -->
				<c:forEach var="p" begin="${ pia.startPage }" end="${ pia.endPage }">
					<c:if test="${ p eq currentPage }">
						<font color="red" size="4"><b>[${ p }]</b></font>
					</c:if>
					
					<c:if test="${ p ne currentPage }">
						<c:url var="pagination" value="adminUser.do">
							<c:param name="page" value="${ p }"/>
						</c:url>
						<a href="${ pagination }">${ p }</a> &nbsp;<!--blist.do?page=1 페이지라는 변수가지고 컨트롤러를 짜야함  -->
					</c:if>
				</c:forEach>
				
				<!-- [다음] -->
				<c:if test="${ pia.currentPage >= pia.maxPage }">
					[다음]
				</c:if>
				<c:if test="${ pia.currentPage < pia.maxPage }">
					<c:url var="after" value="blist.do">
						<c:param name="page" value="${ pia.currentPage + 1 }"/>
					</c:url> 
					<a href="${ after }">[다음]</a>
				</c:if>
			</td>
		</tr>
		<!-- /페이징 -->
  	</table>
  </div>
  
</div>
</div>

<script>


function st2menu(evt, sidetab2menu) {
  var i, x, tablinks;
  x = document.getElementsByClassName("sidetab2menus");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("sidetab2menu");
  for (i = 0; i < x.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" hotpink fontwhite", "");
  }
  document.getElementById(sidetab2menu).style.display = "block";
  evt.currentTarget.className += " hotpink fontwhite";
}
function insertTrAll(target, targetB, targetBC){/*모든 회원 정보 수정 */
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
	  a = document.getElementsByClassName("allUserChangeBtn");
	  b = document.getElementsByClassName("allUserChangeBtnCan");
	  for (i = 0; i < a.length; i++) {
		  a[i].style.display="none";
		  }
		  for (i = 0; i < b.length; i++) {
			  b[i].style.display="";
			}
}
function insertTrAllRollback(target, targetB, targetBC){/*모든 회원 정보 수정 취소 */
	$('.'+target).attr('readonly',true);

	x = document.getElementsByClassName(target);
	console.log(typeof(target));
	listInform = document.getElementsByClassName(target);
	  for (i = 0; i < x.length; i++) {
		  listInform[i].className = listInform[i].className.replace(" borderReplace"," borderInform");
		  listInform[i].className = listInform[i].className.replace(" borderReplace2"," borderInform2");
	  };
	
	  y = document.getElementsByClassName(targetB);
	  z = document.getElementsByClassName(targetBC);
	  for (i = 0; i < y.length; i++) {
	  y[i].style.display="";
	  }
	  for (i = 0; i < z.length; i++) {
		  z[i].style.display="none";
	}
	  a = document.getElementsByClassName("allUserChangeBtn");
	  b = document.getElementsByClassName("allUserChangeBtnCan");
	  for (i = 0; i < a.length; i++) {
		  a[i].style.display="";
		  }
	  for (i = 0; i < b.length; i++) {
			  b[i].style.display="none";
			}
		
}
</script>

   <jsp:include page="../common/footer.jsp"/>
</body>
</html>