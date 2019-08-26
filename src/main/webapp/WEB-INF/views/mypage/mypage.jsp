<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	border:1px solid black;
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
	width:30%;
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


.content22{
	width:20%;
	height:100%;
	margin-left:10px;
	text-align:center;
	
}

#content24{
	display:none;

}

#content25{
	display:none;
}



#sub1{
	padding-bottom:10px;
	margin-top:20px;
	margin-left:15px;
	width:90%;
	border-bottom:2px solid #f8f9fa;
	
}


#content23{
	
	width:100%;
	height:280px;
	

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




#paper3{
	display:none;
}




</style>


<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.css">
<link rel="canonical"
	href="https://getbootstrap.com/2.3.2/base-css.html#buttons">
<link rel="canonical"
	href="https://getbootstrap.com/docs/4.3/examples/album/">	
<script type="text/javascript"
	src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>

</head>



<body>
	
	
	<jsp:include page="<%= request.getContextPath() %>/views/common/header.jsp"/>
	
	
	
	<div id="paper" style="background-color:#333;">
	<div class="container" id="enrty1">
		<div class="row">
		<div id="content1">
			<div id="image11">
				<img src="images/image11.jpg" width="100%" height="100px" >
			</div>
		</div>
		
	<div id="content2">
		<h4>고석민짱 님</h4>
		<label class="label1" id="update1">정보수정</label>
		<label class="label1">로그아웃</label>
		
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
	<div>전화번호 : 010-9177-9509</div>
	<div>이메일&nbsp;&nbsp;&nbsp;:&nbsp;nakcom05a@naver.com</div>
	</div>
		</div>   <!--  row끝 -->
	</div> <!--  entry 끝 -->
</div> <!--  paper끝 -->






<div id="paper2" style="background-color:#e3e3e3">
<br><br>
<div class="container" id="entry2" style="background-color:white;">
	<div class="row">
		<div id="content21" class="content21">수강생</div>
		<div id="content22" class="content21">튜터</div>
	</div> <!--  row끝 -->
	
	<div class="row" id="sub1">
	<div class="content22" id="contentMenu1">신청한 수업</div>
	<div class="content22" id="contentMenu2">수강목록</div>
	<div class="content22" id="contentMenu3">위시리스트</div>
	</div>
	
	<br><br>
	<div id="content23">
	<table>
		<tr >
			<th style="width:300px;">신청강의 명</th>
			<th style="width:300px;">신청강사 명</th>
			<th style="width:300px;">신청날짜</th>
		</tr>
		
		<% for(int i = 0; i < 10; i++) { %>
		<tr>
			<td style="width:300px;">JAVA프로그래밍</td>
			<td style="width:300px;">숨칼렛요한숨</td>
			<td style="width:300px;">2019-08-25</td>
		</tr>
		<% } %>
		
	</table>
	<%-- <% for(int i = 0; i < 1; i++){ %>
		수강중인 과목이없습니다.
	<% } %>
	페이징(할줄모름ㅎㅎ;) --%>
	</div>
	
	<div id="content24">
	


		<table>
		<tr >
			<th style="width:300px;">수강강의 명</th>
			<th style="width:300px;">수강강의 강사명</th>
			<th style="width:300px;">수강 신청날짜</th>
		</tr>
		
		<% for(int i = 0; i < 10; i++){ %>
			<tr>
				<td>java프로그래밍</td>
				<td>고석민</td>
				<td>2019-08-25</td>
			</tr>
		<% } %>
	</table>	

	
	
	</div>
	
	<div id="content25">
		<table>
		<tr >
			<th style="width:300px;">상품 명</th>
			<th style="width:300px;">상품 가격</th>
			<th style="width:300px;">수량</th>
			<th style="width:300px;">총 가격</th>
			<th style="width:300px;">신청날짜</th>
		</tr>
		
		<% for(int i = 0; i < 10; i++){ %>
			<tr>
				<td>갤럭시s10노트</td>
				<td>200000</td>
				<td>1</td>
				<td>200000</td>
				<td>2019-08-25</td>
			</tr>
		<% } %>
	</table>	
	</div>
		
	</div> <!-- paper2 container 끝 -->
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
	<div class="content22">내 수업</div>
	</div>
	<div id="myClass">
	
	<img src="images/image13.jpg" width="100%" height="700px" >
	
	
	
	</div>		
	</div> <!-- entry3 끝 -->
	<br><br>
</div> <!--  paper3 끝 -->













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
			$("#content24").css("display","none");
			$("#content25").css("display","none");
		}),$("#contentMenu1").hover(function(){
			$(this).css("border-bottom","1px solid black");
		},function(){
			$(this).css("border-bottom","1px solid white");
		});
		
		$("#contentMenu2").click(function(){
			$("#content24").css("display","block");
			$("#content23").css("display","none");
			$("#content25").css("display","none");
		}),$("#contentMenu2").hover(function(){
			$(this).css("border-bottom","1px solid black");
		},function(){
			$(this).css("border-bottom","1px solid white");
		});
		
		$("#contentMenu3").click(function(){
			$("#content25").css("display","block");
			$("#content23").css("display","none");
			$("#content24").css("display","none");
		}),$("#contentMenu3").hover(function(){
			$(this).css("border-bottom","1px solid black");
		},function(){
			$(this).css("border-bottom","1px solid white");
		});
		
		
		$("#update1").click(function(){
			location.href="memberUpdate.jsp";
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
	
	<jsp:include page="<%= request.getContextPath() %>views/common/footer.jsp"/>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>