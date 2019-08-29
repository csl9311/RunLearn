<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>




.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

#enrty1{
	
	padding-top:10px;
	padding-bottom:10px;
	color:white;

}


#content1{
	width:10%;
	height:100%;
	margin-top:10px;
	
	<!-- content1 -->
}

#image11{
	width:100%;
	height:100%;

}


#content2{
	margin-left:10px;
	width:15%;
	height:150px;
	border-right:2px solid white;
	line-height:30px;
}
.label1{
	border:2px solid white;
	margin-top:10px;
	
	<!-- content2 -->
}

#content3{
	margin-left:5px;
	height:100%;
	width:10%;
	text-align:center;
	<!-- content3 -->
}

#content4{
	margin-left:10px;
	height:100%;
	width:10%;
	text-align:center;
	
	<!-- content4 -->
}

#content5{
	margin-left:10px;
	height:150px;
	width:10%;
	text-align:center;
	border-right:2px solid white;
	<!-- content5 -->
}

#content6{
	height:100%;
	width:40%;
	margin-left:10px;
	<!-- content6 -->
}






.content21{
	height:70px;
	width:50%;
	text-align:center;
	line-height:50px;
	font-weight:bold;

}
#content21{
	background:black;
	color:white;
}


#content22{
	background:white;
	
}

#content201{
	background:white;
}

#content202{
	background:black;
	color:white;
}

#contentMenu1{
	border-right:2px solid #f8f9fa;

}

#contentMenu3{
	border-right:2px solid #f8f9fa;
}


.content22{
	width:31%;
	height:100%;
	margin-left:10px;
	text-align:center;
	
}







#sub1{
	font-size:30px;
	font-weight:border;
	margin-left:15px;
	width:100%;
	height:50px;
	border-bottom:2px solid #f8f9fa;
	
	
}


	

#content23{
	height:1300px;


}

#content25{
	font-size:20px;
	height:1300px;		
	display:none;
}



#content26{
	margin-left:50px;
	font-size:20px;
	height:1300px;
	display:none;
}


#footer{
	width:100%;
	height:100%;


}


.content31{
	width:12.5%;
	height:100%;
	
}

#content33{
	margin-left:20px;
}


.content32{
	width:15%;
	height:100%;

}

#grade{
	text-align:center;
	font-size:15px;
	font-weight:bolder;
}




#paper3{
	display:none;
}

#row1{
	margin-left:200px;
}





.title123{
	text-align:center;
	font-size:20px;

}

#tableCategory1{
	text-align:center;
	font-size:20px;

}

#image1{
	margin:5px;
	text-align:center;
}

#left{
	text-align:center;
	margin-left:20px;
	width:40%;
	

}

#right{
	text-align:center;
	margin-left:5px;
	width:40%;
}


#lectureTitle{
	text-align:center;
	font-size:18px;
	font-weight:bolder;

}

#lectureContent{
	margin-left:5px;
	

}







#contentMenu5{
	font-size:30px;
	font-weight:bolder;
	width:100%;
	height:100%;
	text-align:center;

}

#pagging{
	margin-left:575px;
	margin-bottom:20px;

}



#content27{

	height:1300px;

}

#answer1{
	text-align:center;
	font-size:30px;

}

#pagging2{
	margin-left:575px;
	margin-bottom:20px;

}

</style>


<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>	


</head>



<body>
	
	
	
	<c:import url="common/header.jsp"/>
	
	
	
	<div id="paper" style="background-color:#333;">
	<div class="container" id="enrty1">
		<div class="row" id="row1">
		<div id="content1">
			<div id="image11">
				<img src="images/image11.jpg" width="100%" height="100px" >
				<div id="grade">(일반회원)</div>
			</div>
		</div>
		
	<div id="content2">
		<h4>고석민 님</h4>
		<label class="label1" id="update1">정보수정</label>
		<label class="label1" id="insertTuter">튜터신청</label>
		<label class="label1" id="logout">로그아웃</label>
		
	</div>
	
	<div id="content3">
		<div><img src="images/menu01.png" width="50%" height="50px"></div>
		<br>
		<div>신청한 수업</div>
		<div>0권</div>
	</div>
	
	<div id="content4">
		<div><img src="images/menu02.png" width="50%" height="50px"></div>
		<br>
		<div>받은 수업 </div>
		<div>0권</div>
	</div>
	
	<div id="content5">
		<div><img src="images/menu03.png" width="50%" height="50px"></div>
		<br>
		<div>위시리스트</div>
		<div>0권</div>
	</div>
	
	<div id="content6">
	<div>닉네임&nbsp;&nbsp; :&nbsp;고석민짱</div>
	<div>전화번호 : 010-9177-9509</div>
	<div>이메일&nbsp;&nbsp;&nbsp;:&nbsp;nakcom05a@naver.com</div>
	<div>우편번호 :</div>
	<div>지번주소 :</div>
	<div>상세주소 :</div>
		</div>  
	</div>  <!--  row끝 -->
</div> <!--  entry 끝 -->
</div><!--  paper끝 -->





<div id="paper2" style="background-color:#e3e3e3">
<br><br>
<div class="container" id="entry2" style="background-color:white;">
	<div class="row">
		<div id="content21" class="content21">수강생</div>
		<div id="content22" class="content21">튜터</div>
	</div> <!--  row끝 -->
	
	<div class="row" id="sub1">
	<div class="content22" id="contentMenu1">수강목록</div>
	<div class="content22" id="contentMenu3">강의찜목록</div>
	<div class="content22" id="contentMenu4">상품찜목록</div>
	</div>
	
	<br><br>
	
	<div id="content23">
		<table border="1">
		<tr style="text-align:center; background:skyblue;" >
			<th style="width:100px; "><div class="title123">카테고리</div></th>
			<th style="width:300px; height:25px;"><div class="title123">강의이미지</div></th>
			<th style="width:300px;"><div class="title123">강의정보</div></th>
			<th style="width:100px;"><div class="title123">신청날짜</div></th>
		</tr>
		
		<tr>
			<td style="height:100px;"><div id="tableCategory1">카테고리</div></td>
			<td><div id="image1"><img src="images/item1.jpg" width="150px" height="80px" ></div></td>
			<td>
			<div id="lectureTitle">강의제목</div>  <!-- 제목 -->
			<div id="lectureContent">시간이 없다면 ! 3시간 만에 박살 내는 일러스트레이터 기초 1:1</div>
			<div class="row" id="">
				<div id="left">
					<div id="teacherName">고석민</div>
				
				</div>
				
				<div id="right">
					<div id="lecturePrice">5000</div>
				
				
				</div>
			</div>
			</td>
		</tr>
		
	</table>	
	</div> <!--  content23끝 -->
	
	<div id="content25">
		<table border="1">
		<tr style="text-align:center;">
			<th style="width:200px; height:25px;"><div class="title123">카테고리</div></th>
			<th style="width:200px; height:25px;"><div class="title123">강의명</div></th>
			<th style="width:400px; height:25px;"><div class="title123">강의이미지</div></th>
			<th style="width:400px; height:25px;"><div class="title123">강의내용</div>
			<th style="width:150px; height:25px;"><div class="title123">수강강의 강사</div></th>
			<th style="width:200px; height:25px;"><div class="title123">신청날짜</div></th>
		</tr>
		
		<% for(int i = 0; i < 4; i++){ %>
		<tr>
			<th><div id="tableCategory1">디자인</div></th>
			<th><div id="tabletitle1">포토샵</div></th>
			<td><div id="image1"><img src="images/finalimage2.jpg" width="300px" height="300px" ></div></td>
			<td><div id="tableContent1">최근 잇달아 발생하는 개인 정보와 기업 정보의 유출 사건, 금융 및 통신, 정부기관 시스템 마비에로 인한 사회 혼란 등의 침해 사고로 정보보호의 중요성이 지속적으로 부각되고 있습니다. 4차 산업혁명의 흐름 속에 정보보호 산업은 국가의 발전을 위한 핵심 산업으로 거듭날 것이며, 그를 뒷받침해주는 정보 보안 전문가의 수요는 날로 증가할 것입니다.</div></td>
			<td><div id="tableTeacher1">강건강</div></td>
			<td><div id="tableDate1">2019-08-28</div></td>
		</tr>
		<% } %>
	</table>	
	</div> <!--  content25 끝 -->
	
	<div id="content26">
		<table border="1">
		<tr style="text-align:center;">
			<th style="width:100px; height:25px;"><div class="title123">상품명</div></th>
			<th style="width:400px; height:25px;"><div class="title123">상품이미지</div></th>
			<th style="width:300px; height:25px;"><div class="title123">상품가격</div>
			<th style="width:150px; height:25px;"><div class="title123">수량</div></th>
			<th style="width:200px; height:25px;"><div class="title123">총가격</div></th>
		</tr>
		
		<% for(int i=0; i < 4; i++){ %>
		<tr>
			<th style="height:200px;"><div id="tabletitle1">모나미볼펜</div></th>
			<td style= "height:300px;"><div id="image1"><img src="images/item1.jpg" width="400px" height="300px" ></div></td>
			<td style= "height:200px;"><div id="tablePrice3">1000원</div></td>
			<td style= "height:200px;"><div id="tableCount">5개</div></td>
			<td style= "height:200px;"><div id="tableSum">5000원</div></td>
		</tr>
		<% } %>
	</table>	
	</div> <!--  content26끝 -->
	<div id="pagging">[이전]    [다음]</div>
	</div> <!-- entry2 끝 -->
	<br><br>
</div> <!--  paper2 끝 -->


<div id="paper3" style="background-color:#e3e3e3">
<br><br>
<div class="container" id="entry3" style="background-color:white;">
	<div class="row">
		<div id="content201" class="content21">수강생</div>
		<div id="content202" class="content21">튜터</div>
	</div> <!--  row끝 -->
	
	<div class="row" id="sub1">
	<div id="contentMenu5">My Lecture</div>
	</div> <!-- sub1끝 -->
	<br><br>
	
		<div id="content27">
		<table border="1">
			<tr style="text-align:center;">
			<th style="width:200px; height:25px;"><div class="title123">카테고리</div></th>
			<th style="width:200px; height:25px;"><div class="title123">강의명</div></th>
			<th style="width:400px; height:25px;"><div class="title123">강의이미지</div></th>
			<th style="width:400px; height:25px;"><div class="title123">학생 수</div>
			<th style="width:150px; height:25px;"><div class="title123">등록날짜</div></th>
			<th style="width:200px; height:25px;"><div class="title123">승인여부</div></th>
		</tr>
		
		<% for(int i=0; i < 4; i++){ %>
		<tr>
			<th><div id="tableCategory1">음악</div></th>
			<th><div id="tabletitle1">실용음악</div></th>
			<td style= "height:300px;"><div id="image1"><img src="images/finalimage3.jpg" width="400px" height="300px" ></div></td>
			<th><div id="tableCount">5명</div></th>
			<th><div id="tableDate1">2019-08-29</div></th>
			<th><div id="answer1">◎</div></th>
		</tr>
		<% } %>
		</table>
		</div>  <!--  content27끝 -->
		<div id="pagging2">
		[이전]
		[다음]
	</div> <!--  pagging2 끝 -->
	</div> <!--  entry3끝 -->
	
</div> <!--  paper3끝 -->
<script>
		$("#content22").click(function(){
			var bool = confirm("튜터 등록하시겠습니까?");
			if(bool == true){
				location.href="tuterInsert.jsp";
			}else{
				$("#paper2").css("display","none");
				$("#paper3").css("display","block");
			}
		}),$("#content22").hover(function(){
			$(this).css("background","gray");
			$(this).css("color","white");
		},function(){
			$(this).css("background", "white");
			$(this).css("color","black");
		});
		
		
		  $("#content21").click(function(){
				$("#paper2").css("display","block");
				$("#paper3").css("display","none");
		}),$("#content21").hover(function(){
			$(this).css("background","gray");
			$(this).css("color", "white");
		},function(){
			$(this).css("background","black");
			$(this).css("color", "white");
		});  
		
		$("#contentMenu1").click(function(){
			$("#content23").css("display","block");
			$("#content25").css("display","none");
			$("#content26").css("display","none");
		}),$("#contentMenu1").hover(function(){
			$(this).css("border-bottom","1px solid black");
			$(this).css("cursor","pointer");
		},function(){
			$(this).css("border-bottom","1px solid white");
		});
		
		$("#contentMenu3").click(function(){
			$("#content25").css("display","block");
			$("#content23").css("display","none");
			$("#content26").css("display","none");
		}),$("#contentMenu3").hover(function(){
			$(this).css("border-bottom","1px solid black");
			$(this).css("cursor","pointer");
		},function(){
			$(this).css("border-bottom","1px solid white");
		});
		
		$("#contentMenu4").click(function(){
			$("#content26").css("display","block");
			$("#content23").css("display","none");
			$("#content25").css("display","none");
		}),$("#contentMenu4").hover(function(){
			$(this).css("border-bottom","1px solid black");
			$(this).css("cursor","pointer");
		},function(){
			$(this).css("border-bottom","1px solid white");
		});
		
		
		
		
		$("#update1").click(function(){
			location.href="memberUpdate.jsp";
		}),$("#update1").hover(function(){
			$(this).css("background","white");
			$(this).css("color","black");
			$(this).css("cursor","pointer");
		
		},function(){
			$(this).css("background", "#333");
			$(this).css("color","white");
		});
		
		$("#insertTuter").click(function(){
			location.href="##";
		}),$("#insertTuter").hover(function(){
			$(this).css("background","white");
			$(this).css("color","black");
			$(this).css("cursor","pointer");
		},function(){
			$(this).css("background", "#333");
			$(this).css("color","white");
		});
		
		$("#logout").click(function(){
			location.href="##";
		}),$("#logout").hover(function(){
			$(this).css("background","white");
			$(this).css("color","black");
			$(this).css("cursor","pointer");
		},function(){
			$(this).css("background", "#333");
			$(this).css("color","white");
		});
		
		  $("#content201").click(function(){
				$("#paper2").css("display","block");
				$("#paper3").css("display","none");
		}),$("#content201").hover(function(){
			$(this).css("background","gray");
			$(this).css("color", "white");
		},function(){
			$(this).css("background","white");
			$(this).css("color", "black");
		});
		  
		  $("#content202").click(function(){
				$("#paper2").css("display","block");
				$("#paper3").css("display","none");
		}),$("#content202").hover(function(){
			$(this).css("background","gray");
			$(this).css("color", "white");
		},function(){
			$(this).css("background","black");
			$(this).css("color", "white");
		});
		  
		
			
	
		
	
	</script>




<!-- -------footer------------------------------------------------------------------------------------------------------------- -->	
	
	<c:import url="common/footer.jsp"/> 
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>