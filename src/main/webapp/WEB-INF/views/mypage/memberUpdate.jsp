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

#page1{
 background:url("images/taling1.jpg");
 width:100%;
 height:100%:
 

}

#entry1{
	padding-top:30px;
	padding-bottom:30px;
	color:white;
	text-align:center;
	

}

#small{
	margin-top:30px;
	color:gray;
}





#entry2{
	border:1px solid black;

}


#image{
	
	width:20%;
	height:100%:

}

#image123{
	box-shadow: 5px 5px 5px 5px gray;
}


#text1{
	color:#999;
	line-height:100px;
	font-weight:bold;
}

#left{
	margin-left:10px;
	margin-top:20px;
	width:49%;
	height:100%;
	border-right:2px solid #e3e3e3;
	font-size:20px;


}

#button1{
	text-align:center;
	margin-bottom:5px;

}



#right{
	
	
	margin-top:100px;
	margin-left:150px;
	width:35%;
	height:100%;
	
}

#button2{
	margin-top:10px;
	margin-bottom:5px;
	
}

.input1{
	margin-top: 30px;

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
	
	<div id="page1">
	<div class="container" id="entry1">
		<h1>정보를 입력하세요</h1>
		<h4 id="small">프로필 사진 포함(원하는 수정 정보)</h4>
	
	</div> <!--  container끝(entry1) -->
	</div> <!--  page1 끝 -->
	
	
	<br><br><br><br><br>
	<form>
	<div class="container" id="entry2" style="height:550px;">
		<div class="row">
			<div id="left">
				<div class="input1">
					<label>이름 :</label>
					<input type="text" value="고석민" >
				</div>
				
				<div class="input1">
					<label>아이디 :</label>
					<input type="text" value="nakcom05a" readonly >
				</div>
				
				<div class="input1">
					<label>비밀번호 :</label>
					<input type="password" value="123123">
				</div>
				
				<div class="input1">
					<label>성별 :</label>
					남자&nbsp;<input type="radio" value="남자">
					여자&nbsp;<input type="radio" value="여자">
				</div>
				
				<div class="input1">
					<label>이메일:</label>
					<input type="email" placeholder="이메일을 입력해주세요." style="width:80%;">
				
				</div>
				
				<div class="input1">
					<label>핸드폰번호 :</label>
					<input type="text" value="010" style="width:40px;">-
					<input type="text" value="9177" style="width:60px;">-
					<input type="text" value="9509" style="width:60px;" >
				</div>
				
				<div class="input1">
				   <label>집주소:</label>
					&nbsp;
					<input type="text" value="경기도 고양시 일산동구" style="width:80%">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" value="" style="width:80%">
					
				</div>
				
				
				
			</div>   <!--  left끝 -->
			
			
			<div id="right">
				<div><h3>변경할 사진을 선택해주세요.</h3></div>
				<div id="image">
					<img src="images/image11.jpg" width="300px" height="150px" id="image123" >
				</div>
				<div id="button2">
					<input type="file" name="fileName" value="파일찾기" class="btn btn-danger" accept="image/gif,
					image/jpeg, image/png" onchange="fileCheck(this);">
				</div>
				
				
			</div>  <!-- right끝 -->
		</div> <!-- row 끝 -->
		
	</div>  <!-- container끝 -->
	<div id="button1" class="input1">
					<button type="submit" class="btn btn-danger">수정하기</button>
				</div>
		
</form>

<br><br><br><br><br>

<!-- -------footer------------------------------------------------------------------------------------------------------------- -->	

<jsp:include page="<%= request.getContextPath() %>views/common/footer.jsp"/>


<script>
	function fileCheck(obj){
		pathpoint = obj.value.lastIndexOf('.');
		filepoint = obj.value.substring(pathpoint+1,obj.length);
		filetype = filepoint.toLowerCase();
		if(filetype =='jpg' || filetype =='gif' || filetype =='png' || 
				filetype == 'jpeg' || filetype == 'bmp'){
			
		}else{
			alert('이미지 파일만 선택할 수 있습니다.');
			parentObj = obj.parentNode
			node = parentObj.replaceChild(obj.cloneNode(true),obj);
			return false;
		}if(filetype =='bmp'){
			upload = confirm('BMP 파일은 웹상에서 사용하기엔 적절한 이미지 포맷이 아닙니다. 그래도 계속 하시겠습니까?');
			if(!upload) 
				return false;
		}
	}



</script>









</body>
</html>