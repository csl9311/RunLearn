<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	.centerDetailBack {
		height: auto;
		margin-top: 60px;
	}
	.centerDetailBack table {
		position: relative;
		margin: 50px auto;
		width: 95%;
		text-align: left;
		border-collapse: collapse;
		border-top: 2px solid #3d4045;
	}
	
	.centerDetailBack tr {
		border-bottom: 1px solid #3d4045;
		font-weight: 700;
	}
	
	#bTitleTr {
		font-size: 18px;
	}
	
	#nSubTr {
		font-size: 14px;
	}
	
	.centerDetailBack th, .centerDetailBack td {
		padding: 10px 30px;
		margin: 0px;
	}
	
	.centerDetailBack th {
		background-color: #f2f2f2;
	    width: 15%;
	}
	
	#bContent{
		width: 100%;
		height: 300px;
		resize: none;
		font-size: 16px;
		border: none;
		outline: none;
	}
	
	.centerDetailBack button {
		border: none;
	    background: #ff005a;
	    padding: 10px;
	    font-size: 15px;
	    color: white;
	    border-radius: 4px;
	}
	
	.centerDetailBack button:hover {
	    box-shadow: 0 0 3px 0 #ff005a;
	}
	
	.centerDetailBack input {
		border: none;
		outline: none;
		border-bottom: 1px solid lightgray;
		width: 90%;
	}
	
	.centerDetailBack input:hover, .centerDetailBack input:focus {
		border-bottom: 1px solid #ff005a;
	}
	
	#bContent:hover, #bContent:focus {
		border: 1px solid #ff005a;
	}
</style>
</head>
<body>
	<c:import url="../common/header.jsp"/>
	
	<div class="container centerDetailBack">
		<form action="cCenterUpdate.do" method="POST">
			<input type="hidden" name="b_num" value="${ b.b_num }">
			<input type="hidden" name="b_category" value="${ b.b_category }">
			<input type="hidden" name="page" value="${ page }">
			<input type="hidden" name="m_id" value="${ loginUser.m_id }">
			<div class="row">
				<h3>●&nbsp;${ b.b_category } 수정</h3>
				<div class="col-md">
					<table>
						<tr id="bTitleTr">
							<th>제목</th>
							<td colspan="5"><input type="text" name="b_title" value="${ b.b_title }"></td>
						</tr>
						<tr id="nSubTr">
							<th>작성자</th>
							<td>${ b.m_id }</td>
							<th>작성일</th>
							<td>${ b.b_reg_date }</td>
							<th>조회수</th>
							<td>${ b.b_count }</td>
						</tr>
						<tr>
							<td colspan="6" style="width: 100%; padding: 50px;">
								<textarea id="bContent" name="b_content">${ b.b_content }</textarea>
							</td>
						</tr>
					</table>
				</div>
				<div class="x-100"></div>
				<c:url var="blist" value="cCenterView.do">
					<c:param name="b_category" value="${ b.b_category }"/>
					<c:param name="page" value="${ page }"/>
				</c:url>
				<div class="col-md" style="text-align: center; margin-bottom: 50px;">
					<button class="backBtn" onclick="location.href='${blist}'" style="margin-right: 20px;">목록으로</button>
					<button type="submit">수정하기</button>
				</div>
			</div>
		</form>
	</div>
	
	<c:import url="../common/footer.jsp"/>
</body>
</html>