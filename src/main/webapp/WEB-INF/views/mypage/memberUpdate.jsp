<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

#page1 {
   width: 100%;
   height: 100%:
}

#entry1 {
   padding-top: 30px;
   padding-bottom: 30px;
   color: white;
   text-align: center;
}

#small {
   margin-top: 30px;
   color: gray;
}

#entry2 {
   border: 1px solid #f16c7c;
   font-family: 'Nanum Gothic', sans-serif;
   "
}

#image {
   width: 20%;
   height: 100%:
}

#image123 {
   box-shadow: 5px 5px 5px 5px #fff3cd;
}

#text1 {
   color: #999;
   line-height: 100px;
   font-weight: bold;
}

#left {
   margin-left: 10px;
   margin-top: 20px;
   margin-bottom: 30px;
   width: 60%;
   height: 100%;
   font-size: 20px;
}

#btn1 {
   text-align: center;
   margin-bottom: 5px;
}

#right {
   padding-left: 70px;
   padding-right: 70px;
   padding-top: 70px;
   width: 39%;
   height: 710px;
   border-left: 2px solid #fff3cd;
}

#btn2 {
   margin-top: 10px;
   margin-bottom: 5px;
}

.input1 {
   margin-top: 30px;
}

input {
   
}

#submitButton {
   padding-top: 50px;
   text-align: center;
}

#update {
   border: 1px solid #f16c7c;
   background-color: rgba(0, 0, 0, 0);
   color: #f16c7c;
   padding: 5px;
}

#update:hover {
   color: white;
   background-color: #f16c7c;
}

#fileUpload {
   border: 1px solid #f16c7c;
   background-color: rgba(0, 0, 0, 0);
   color: #f16c7c;
   padding: 30px;
}

#fileUpload:hover {
   color: white;
   background-color: #f16c7c;
}

#button2 {
   margin-top: 30px;
}

#updateFont {
   font-size: 20px;
}
</style>


<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
   integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
   crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
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
<link
   href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&display=swap&subset=korean"
   rel="stylesheet">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link
   href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&display=swap&subset=korean"
   rel="stylesheet">
</head>
<body>

   <c:import url="../common/header.jsp" />

   <div id="page1">
      <div class="container" id="entry1"></div>
      <!--  container끝(entry1) -->
   </div>
   <!--  page1 끝 -->


   <br>
   <br>
   <br>
   <br>
   <br>
   <form action="mUpdate.do" method="post" enctype="Multipart/form-data">
      <div class="container" id="entry2" style="background: white; color: black;">
         <div class="row">
            <div id="left">
               <div class="input1">
                  <label>이름 :</label>
                  <input type="text" name="m_name" value="${ loginUser.m_name }" readonly>
                  
               </div>

               <div class="input1">
                  <label>아이디 :</label>
                  <input type="text" value="${ loginUser.m_id }" name="m_id" readonly>
               </div>


               <div class="input1">
                  <label>새 비밀번호 :</label>
                  <input type="password" name="m_pw" value="" id="userPw2" style="width: 50%;">
               </div>

               <div class="input1">
                  <label>이메일:</label>
                  <input type="email" placeholder="이메일을 입력해주세요." name="m_email" value="${ loginUser.m_email }" style="width: 80%;">

               </div>

               <div class="input1">
                  <label>핸드폰번호 :</label>
                  <input type="text" name="m_phone" value="${ loginUser.m_phone }" placeholder="( - )를 빼고 입력해주세요" style="width: 70%;">
               </div>

               <div class="input1">
                  <label>우편번호&nbsp;&nbsp; :</label>
                  <input type="text" id="sample4_postcode" placeholder="우편번호" name="postnum" value="${ loginUser.postnum }">
                  <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
               </div>

               <div class="input1">
                  <label>지번주소&nbsp;&nbsp; :</label>
                  <input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="g_address" value="${ loginUser.g_address }" style="width: 70%;">
               </div>

               <div class="input1">
                  <label>도로명주소 :</label>
                  <input type="text" id="sample4_jibunAddress" placeholder="지번주소" name="r_address" value=" ${ loginUser.r_address }" style="width: 70%;">
               </div>

               <div class="input1">
                  <label>상세주소&nbsp;&nbsp; :</label>
                  <input type="text" id="sample4_detailAddress" placeholder="상세주소" name="d_address" value="${ loginUser.d_address }" style="width: 70%;">
               </div>
               <span id="guide" style="color: #999; display: none"></span>

            </div>
            <!--  left끝 -->


            <div id="right">
            <div id="updateFont" style="width: 100%;" class="alert alert-warning">프로필 사진을 선택해주세요.</div>   
               
                <div id="imagebox" style="width:300px; height:300px; background:white;">
               <img src="${contextPath}/resources/images/member/${ profile.m_changed_name }" id="image123" style="width:300px; height:300px; background:white;"/>
               </div>
               <div id="button2">
               <input type='file' name="uploadFile" id="imgInput" class="btn btn-outline-warning" accept="image/gif, image/jpeg, image/png" />
            </div>
               
            </div>
            <!-- right끝 -->
         </div>
         <!-- row 끝 -->

      </div>
      <!-- container끝 -->

      <div id="submitButton" class="container">
         <button type="submit" id="update">수정하기</button>

      </div>

   </form>

   <br>
   <br>
   <br>
   <br>
   <br>

   <!-- -------footer------------------------------------------------------------------------------------------------------------- -->

   <c:import url="../common/footer.jsp" />


   <script>
   function readURL(input) {
       if (input.files && input.files[0]) {
        var reader = new FileReader();
        
        reader.onload = function (e) {
         $('#image123').attr('src', e.target.result);  
        }
        
        reader.readAsDataURL(input.files[0]);
        }
      }
        
      $("#imgInput").change(function(){
         readURL(this);
      });
   
      /*  function fileCheck(obj) {
         pathpoint = obj.value.lastIndexOf('.');
         filepoint = obj.value.substring(pathpoint + 1, obj.length);
         filetype = filepoint.toLowerCase();
         if (filetype == 'jpg' || filetype == 'png'
               || filetype == 'jpeg' || filetype == 'bmp') {

         } else {
            alert('이미지 파일만 선택할 수 있습니다.');
            parentObj = obj.parentNode
            node = parentObj.replaceChild(obj.cloneNode(true), obj);
            return false;
         }
         if (filetype == 'bmp') {
            upload = confirm('BMP 파일은 웹상에서 사용하기엔 적절한 이미지 포맷이 아닙니다. 그래도 계속 하시겠습니까?');
            if (!upload)
               return false;
         }
      }  */

      function sample4_execDaumPostcode() {
         new daum.Postcode({
            oncomplete : function(data) {
               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

               // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
               var roadAddr = data.roadAddress; // 도로명 주소 변수
               var extraRoadAddr = ''; // 참고 항목 변수

               // 법정동명이 있을 경우 추가한다. (법정리는 제외)
               // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
               if (data.bname !== ''
                     && /[동|로|가]$/g.test(data.bname)) {
                  extraRoadAddr += data.bname;
               }
               // 건물명이 있고, 공동주택일 경우 추가한다.
               if (data.buildingName !== ''
                     && data.apartment === 'Y') {
                  extraRoadAddr += (extraRoadAddr !== '' ? ', '
                        + data.buildingName : data.buildingName);
               }
               // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
               if (extraRoadAddr !== '') {
                  extraRoadAddr = ' (' + extraRoadAddr + ')';
               }

               // 우편번호와 주소 정보를 해당 필드에 넣는다.
               document.getElementById('sample4_postcode').value = data.zonecode;
               document.getElementById("sample4_roadAddress").value = roadAddr;
               document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

               // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.

               var guideTextBox = document.getElementById("guide");
               // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
               if (data.autoRoadAddress) {
                  var expRoadAddr = data.autoRoadAddress
                        + extraRoadAddr;
                  guideTextBox.innerHTML = '(예상 도로명 주소 : '
                        + expRoadAddr + ')';
                  guideTextBox.style.display = 'block';

               } else if (data.autoJibunAddress) {
                  var expJibunAddr = data.autoJibunAddress;
                  guideTextBox.innerHTML = '(예상 지번 주소 : '
                        + expJibunAddr + ')';
                  guideTextBox.style.display = 'block';
               } else {
                  guideTextBox.innerHTML = '';
                  guideTextBox.style.display = 'none';
               }
            }
         }).open();
      }
   </script>

</body>
</html>