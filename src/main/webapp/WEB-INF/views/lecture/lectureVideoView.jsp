<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제 1회 : 집으로 도망치는 빠르고 쉬운 방법</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<style>
.MediaContainer{
	margin:auto;
	width:80%;
	height:720px;
	margin-top:20px;
}
</style>
</head>
<body>
<c:import url="../common/header.jsp" />
<div class="MediaContainer">
	<div class="row">
		<div id="mediaDiv" class="col-sm-9">
			<object type="text/html" width="100%" height="700px" data="https://www.youtube.com/embed/${ media.L_FILE_VIDEO }" allowFullScreen></object>
		</div>
		<div id="menuDiv" class="col-sm-3">
		<ul class="list-group mb-3">
		<c:forEach var="i" begin="0" end="${ list.size()-1 }" step="1">
		<c:url var="mediaView" value="lectureMediaView.le">
			<c:param name="l_each_num" value="${ list.get(i).L_EACH_NUM }"/>
		</c:url>
		<li class="list-group-item d-flex justify-content-between lh-condensed" onclick="location.href='${ mediaView }'">
          <div>
            <h6 class="my-0">제 ${ i+1 }회</h6>
            <small class="text-muted">${ list.get(i).L_EACH_NAME }</small>
          </div>
          <span class="text-muted"></span>
        </li>
		</c:forEach>
        
        
      </ul>

      
    	</div>
	</div>
</div>
<script type="text/javascript">

</script>
<c:import url="../common/footer.jsp" />
</body>
</html>