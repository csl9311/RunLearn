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
<!-- <style>
table{margin-bottom:10px;}
.fontthick{font-weight: 500;}
.fonthotpink{color:#ff005a;}
.hotpink{background-color:#ff005a; !important}
.borderhotpink{border: 1px solid #ff005a;}
.borderhotpinkthick{border: 4px solid #ff005a;}
.fontwhite{color:white;font:bold;}
.ligt-pink{background-color:#F8E0EC; !important}
.hoverpink:hover{background-color:#F5A9BC; color:white;!important}
.tablink{margin:2px; border:0.1px solid #ff005a;}
.marginbtn{margin:2px; border:0.1px solid #ff005a; }
.animate-fading{animation:opac 0.8s }
.minh{min-height:900px;}
.sidebar{height:95%;width:200px;background-color:#fff;position:absolute!important;z-index:1;overflow:auto;display:block!important}
.mainMoreBtn{font-size:17px;float:right; margin:3px;margin-right:10px; height:25px;width:60px;vertical-align:center; font-weight:bold; !impotant}
.mainBorderRa{border-radius:10px;}
.hoverTablePink tr:hover{background-color:#ff005a; color:white; opacity:0.7; !important}
.hoverTablePink tr>button:{background-color:black; color:white;}
.listbtn{border-radius:4px;background-color:gray;font-color:white;font-weight:bold;border:0px; width:80px; height:25px;}
.listbtn:hover{background-color:#3B0B17;}
.mainlistfont{font-size:10px;}
.mainlistfont>th>tr{font-size:5px;}
/* 버튼 글씨체 알 맞게 적용할것  */

/* 스크롤바 */
.scroll::-webkit-scrollbar-track
{
	-webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
	border-radius: 10px;
	background-color: #F8E0EC;
}

.scroll::-webkit-scrollbar
{
	width: 12px;
	background-color: #ff005a;
}

.scroll::-webkit-scrollbar-thumb
{
	border-radius: 10px;
	-webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3);
	background-color: #D62929;
}
</style> -->
<!-- 읽어주세요
w3 css 기반에 제가 몇개 추개해서 구성하였습니다
클래스나 아이디 이름뒤에 붙은 숫자는 왼쪽 st가 sidetab의 순번 뒤의 menu가 그sidetab에 해당하는 메뉴 순번입니다



 -->
</head>
<body>
<h2 class="w3-padding fontthick fonthotpink">마더뷰</h2><hr class="borderhotpink">
    <div class="w3-container minh" style="margin-left:160px;" ><!-- 틀 -->
    
    <div class="borderhotpinkthick" style="width:1300px;min-height:200px;border-radius:10px;opacity:0.8; margin-bottom:10px;"><!--게시글 작성자 날짜 등등  -->
     	<h3 class="fonthotpink" style="opacity:0.4; margin-left:30px; margin-top:10px;">카테고리 부분입니다</h3>
     	<div style="float:left;width:70%;"><!-- 제목부분 -->
     	<h2 class="fonthotpink" style="font-weight:bold;margin-left:30px;margin-right:7px;">제목 작성하는 부분입니다 폰트도 적용할예정</h2><hr class="borderhotpink" style="margin-top:-10px;width:70%;margin-left:5%;margin-right:5%;">
     	</div>
     	<div style="width:29%;float:left;"><!-- 조회수 부분 -->
     	<h3 style="text-align:right;color:#FA5882;margin-right:30px;">조회수 부분입니다</h3>
     	</div>
     	<br>
     	<h4 style="opacity:2.0;padding-top:40px;float:right;">작성자 부분입니다</h4>
     	<h6 style="color:#FA5882;margin-left:30px;font-size:40px;">날짜 부분입니다</h6>
   	</div>
    
    <div  class="borderhotpink"style=";width:1300px;min-height:900px;border-radius:15px;" ><!-- 게시글 내용 -->
    	<div style="margin:10px;font-size:20px;">
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

</body>
</html>