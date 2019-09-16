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
		font-size: 18px;
		border-collapse: collapse;
		border-top: 2px solid #3d4045;
	}
	
	.centerDetailBack tr {
		border-bottom: 1px solid #3d4045;
		font-weight: 700;
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
	    width: 20%;
	}
	
	#bContent{
		width: 100%;
		height: 300px;
		resize: none;
		font-weight: 400;
		border: 1px solid lightgray;
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
	
	.centerDetailBack select {
		width: 17%;
		height: 30px;
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
		<form action="cCenterInsert.do" method="POST">
			<input type="hidden" name="m_id" value="${ loginUser.m_id }">
			<input type="hidden" name="b_category" value="${ b_category }">
			<div class="row">
				<h3>●&nbsp;${ b_category }</h3>
				<div class="col-md">
					<table>
						<tr id="bTitleTr">
							<th>제목</th>
							<td><input type="text" name="b_title"></td>
						</tr>
						<tr>
							<th>세부 카테고리</th>
							<td>
								<select>
									<option>1</option>
									<option>2</option>
									<option>3</option>
								</select>
							</td>
						</tr>
						<tr>
							<th rowspan="2">내용</th>
							<td style="width: 100%; padding: 50px;">
								<textarea id="bContent" name="b_content"></textarea>
								<c:if test="b_category eq '신고글'">
								<p>dd</p>
								</c:if>
							</td>
						</tr>
					</table>
				</div>
				<div class="x-100"></div>
				<c:url var="blist" value="cCenterView.do">
					<c:param name="b_category" value="${ b_category }"/>
					<c:param name="page" value="${ page }"/>
				</c:url>
				<div class="col-md" style="text-align: center; margin-bottom: 50px;">
					<button type="button" onclick="location.href='${blist}'" style="margin-right: 20px;">목록으로</button>
					<button type="submit">작성하기</button>
				</div>
			</div>
		</form>
	</div>
	
	<c:import url="../common/footer.jsp"/>
</body>
</html>