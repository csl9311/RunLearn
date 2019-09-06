<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>error</title>
</head>
<body>
	<div id="error-container" style="text-align:center;">
		<h1>임시 오류페이지</h1>
		<h2>끄앙 에러 X_X</h2>
		<h3 style="color:red;"><%= request.getAttribute("msg") %></h3>
		<h3 style="color:red;"><%= request.getAttribute("javax.servlet.error.message") %></h3>
		<a href="home.do">홈페이지로 돌아가기</a>
	</div>
</body>
</html>