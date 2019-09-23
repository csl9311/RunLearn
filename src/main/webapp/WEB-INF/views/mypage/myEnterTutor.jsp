+<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	.enterDiv {
		height: auto;
		margin: 70px 0;
	}
	
	.enterDiv table {
		width: 90%;
		margin: 60px auto;
		font-size: 16px;
		border-collapse: collapse;
		border-top: 2px solid #3d4045;
	}
	
	.enterDiv table tr {
		font-size: 18px;
		border-bottom: 1px solid #3d4045;
	}
	
	#bContent{
		width: 100%;
		height: 300px;
		resize: none;
		font-size: 16px;
		border: 1px solid lightgray;
		outline: none;
	}
	
	.enterDiv th, .enterDiv td {
		padding: 10px 30px;
		margin: 0px;
	}
	
	.titleTh {
		width: 15%;
		background: #f2f2f2;
	}
	
	.enterDiv input {
		border: none;
		outline: none;
		width: 90%;
	}
	
	.enterDiv button {
		border: none;
	    background: #ff005a;
	    padding: 10px;
	    font-size: 15px;
	    color: white;
	    border-radius: 4px;
	}
	
	.enterDiv button:hover {
	    box-shadow: 0 0 3px 0 #ff005a;
	}
</style>
</head>
<body>
	<c:import url="../common/header.jsp" />
	
	<div class="container enterDiv">
			<input type="hidden" name="b_category" value="튜터신청">
			<input type="hidden" name="m_id" value="${ loginUser.m_id }">
			<div class="rows">
				<div class="col-md title" style="margin: 10px 0; text-align: center;">
					<h2>튜터 신청 내역</h2>
				</div>
				<div class="x-100"></div>
				<div class="col-md">
					<table>
						<tr>
							<th class="titleTh">제목</th>
							<td colspan="2"><input type="text" name="b_title" value="${ b.b_title }" readonly></td>
						</tr>
						<tr>
							<td colspan="6" style="width: 100%; padding: 50px;">
								<textarea id="bContent" name="b_content" readonly> ${ b.b_content }</textarea>
							</td>
						</tr>
					</table>
				</div>
				<div class="x-100"></div>
				<div class="col-md" style="text-align: center; margin-bottom: 50px;">
					<c:url var="enterTutorUpdate" value="tutorUpdateView.do">
						<c:param name="b_num" value="${ b.b_num }"/>
					</c:url>
					<button type="button" onclick="location.href='${ enterTutorUpdate }'">수정하기</button>
					<button type="button" style="margin-left: 20px;" onclick="deleteYN();">신청취소</button>
				</div>
			</div>
	</div>
	
	<c:import url="../common/footer.jsp" />
	
	<script>
		function deleteYN() {
			if (confirm('정말 튜터신청을 취소하시겠습니까?')) {
				location.href='deleteEnterTutor.do?b_num=${b.b_num}';
			}
		}
	</script>
</body>
</html>