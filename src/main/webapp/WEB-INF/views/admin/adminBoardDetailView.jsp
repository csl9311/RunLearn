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
<c:url var="adminUser" value="adminUsesr.do"/>
<c:url var="adminPayManage" value="adminPayManage.do"/>
<c:url var="adminNoticeAdmin" value="adminNoticeAdmin.do"/>
<c:url var="adminNoticeUser" value="adminNoticeUser.do"/>
<%-- <c:url var="adminBoardDetailView" value="adminBoardDetailView.do"/> --%>
<c:url var="adminBoardInsertView" value="adminBoardInsertView.do"/>
  <jsp:include page="../common/header.jsp"/>

<div class="sidebar w3-bar-block  w3-card" style="width:180px; margin-top:3px;">
  <h6 class="w3-bar-item fonthotpink" style="font-size:23px;">관리자페이지</h6>
  <hr>
  <button id="tablink1" class="w3-bar-item tablink hoverpink w3-round" onclick="location.href='adminMain.do';" style="width:175px">관리자 메인</button>
  <button id="tablink2" class="w3-bar-item tablink hoverpink w3-round" onclick="location.href='adminUser.do';" style="width:175px">회원관리</button>
  <button id="tablink3" class="w3-bar-item tablink hoverpink w3-round" onclick="location.href='adminPayManage.do';" style="width:175px">결제관리</button>
  <button id="tablink4" class="w3-bar-item tablink hoverpink w3-round" onclick="location.href='adminNoticeAdmin.do';" style="width:175px">고객센터(관리자)</button>
  <button id="tablink5" class="w3-bar-item tablink hoverpink w3-round" onclick="location.href='adminNoticeUser.do';" style="width:175px">고객센터(요청)</button>
  <button id="tablink6" class="w3-bar-item tablink hoverpink w3-round hotpink fontwhite" onclick="location.href='adminBoardDetailView.do';" style="width:175px">(작업용)게시판뷰</button>
  <button id="tablink8" class="w3-bar-item tablink hoverpink w3-round" onclick="location.href='adminBoardInsertForm.do';" style="width:175px">(작업용)게시판작성</button>
</div>

<div class="minh"style="margin-left:190px">
<h2 class="w3-padding fontthick fonthotpink">마더뷰</h2><hr class="borderhotpink">
    <div class="w3-container minh" style="margin-left:160px;" ><!-- 틀 -->
    
    <div class="borderhotpinkthick" style="width:1300px;min-height:200px;border-radius:10px;opacity:0.8; margin-bottom:10px;"><!--게시글 작성자 날짜 등등  -->
     	<h3 class="fonthotpink" style="opacity:0.4; margin-left:30px; margin-top:10px;">카테고리 부분입니다</h3>
     	<h3 style="text-align:right;color:#FA5882;margin-right:30px;">조회수 부분입니다</h3>
     	<h2 class="fonthotpink" style="font-weight:bold;margin-left:30px;margin-right:7px;">제목 작성하는 부분입니다 폰트도 적용할예정</h2><hr class="borderhotpink" style="margin-top:-10px;width:70%;margin-left:5%;margin-right:5%;">
     	<br>
     	<h4 style="opacity:2.0;padding-top:0px;float:right;margin-right:40px;">작성자 부분입니다</h4>
     	<h6 style="color:#FA5882;margin-left:30px;font-size:40px;">날짜 부분입니다</h6>
   	</div>
    
    <div  class="borderhotpink"style=";width:1300px;min-height:900px;border-radius:15px;" ><!-- 게시글 내용 -->
    	<div style="margin-top:20px;margin-left:30px;margin-right:30px;font-size:20px;">
    	(임시글)
타공 제품을 새로운 타공 제품으로 바꾸는 경우에도 구멍이 안생긴다고 장담할 수 없어요. 사이즈는 규격화 되어 일치하는 제품들이 많지만, 고정을 위한 나사 구멍은 각기 다를 수 있거든요. 

미리 정확한 나사 구멍 위치까지 파악하긴 어려우니, 타공 도어락을 설치할 경우는 구멍이 생길 수 있음을 반드시 염두에 두고 진행해주세요!
    
TIP. 도어락 설치, 집주인과 디테일한 커뮤니케이션 하기
간혹 떼면 원상복구가 안된다는 것을 트집잡아, 세입자가 달았던 도어락을 두고 가라고 억지 쓰는 경우도 있다고 해요. 

그러니 설치부터 원상복구에 이르는 모든 디테일을 미리 체크하는 것이 필수! 아래의 리스트를 토대로 집주인과 커뮤니케이션을 위한 디테일을 정해보세요. 
 None
  
집주인이 인수하는 경우는 사실상 집주인이 해주는 것과 비슷한 상황이에요. 다만 제품을 고르고 설치하는 과정을 세입자가 하기 때문에, 나중에 가서 '아니 무슨 40만원 짜리를 달았어? 그거 다 못줘!' 할 수도 있어요. 그러니 사전에 정확한 모델과 가격을 얘기하며 조율하는 것이 좋답니다!

None
안전하게 살기 위한 기본, 도어락! 위에서 알려드린 노하우대로 무타공 도어락을 설치하거나, 집주인과 디테일한 커뮤니케이션으로 보증금 걱정 없는 도어락 설치에 성공하시길 바랄게요 🙏

도어락을 설치하기 전에 현관문 리폼을 계획하고 있다면 아래 콘텐츠도 꼭 읽어보세요. 현관문 리폼할 때 드는 비용을 알려드려요 😄(임시글)
(임시글)
타공 제품을 새로운 타공 제품으로 바꾸는 경우에도 구멍이 안생긴다고 장담할 수 없어요. 사이즈는 규격화 되어 일치하는 제품들이 많지만, 고정을 위한 나사 구멍은 각기 다를 수 있거든요. 

미리 정확한 나사 구멍 위치까지 파악하긴 어려우니, 타공 도어락을 설치할 경우는 구멍이 생길 수 있음을 반드시 염두에 두고 진행해주세요!
    
TIP. 도어락 설치, 집주인과 디테일한 커뮤니케이션 하기
간혹 떼면 원상복구가 안된다는 것을 트집잡아, 세입자가 달았던 도어락을 두고 가라고 억지 쓰는 경우도 있다고 해요. 

그러니 설치부터 원상복구에 이르는 모든 디테일을 미리 체크하는 것이 필수! 아래의 리스트를 토대로 집주인과 커뮤니케이션을 위한 디테일을 정해보세요. 
 None
  
집주인이 인수하는 경우는 사실상 집주인이 해주는 것과 비슷한 상황이에요. 다만 제품을 고르고 설치하는 과정을 세입자가 하기 때문에, 나중에 가서 '아니 무슨 40만원 짜리를 달았어? 그거 다 못줘!' 할 수도 있어요. 그러니 사전에 정확한 모델과 가격을 얘기하며 조율하는 것이 좋답니다!

None
안전하게 살기 위한 기본, 도어락! 위에서 알려드린 노하우대로 무타공 도어락을 설치하거나, 집주인과 디테일한 커뮤니케이션으로 보증금 걱정 없는 도어락 설치에 성공하시길 바랄게요 🙏

도어락을 설치하기 전에 현관문 리폼을 계획하고 있다면 아래 콘텐츠도 꼭 읽어보세요. 현관문 리폼할 때 드는 비용을 알려드려요 😄(임시글)
    	
    	
    	</div>
    	
    </div>
      <button class=" ligt-pink  borderhotpink w3-round-large hoverpink fonthotpink" style="float:right;margin-right:250px;margin-top:20px;border:white;width:200px;height:50px;font-size:30px;">삭제</button>
        <button class=" ligt-pink  borderhotpink w3-round-large hoverpink fonthotpink" style="float:right;margin-right:50px;margin-top:20px;border:white;width:200px;height:50px;font-size:30px;">수정</button>
    <div><!-- 댓글 -->
    
    </div>
     	
    
    </div>
    </div>
   <jsp:include page="../common/footer.jsp"/>
</body>
</html>