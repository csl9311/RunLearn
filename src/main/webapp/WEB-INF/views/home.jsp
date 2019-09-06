<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/jquery.slick/1.6.0/slick.css"/>
   <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/gh/kenwheeler/slick@1.8.1/slick/slick-theme.css"/>
   <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&display=swap&subset=korean" rel="stylesheet">
   <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
   <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
   <script type="text/javascript" src="//cdn.jsdelivr.net/jquery.slick/1.6.0/slick.min.js"></script>
   <style>
      /* ------------------슬라이드------------------ */
      .body {
         margin: 0;
         font-family: 'Nanum Gothic', sans-serif;
      }
      
      .slide-area {
         height: 450px;
      }
      
      .slide-area .slide {
         height: 450px;
         width: 100%;
         margin: 0 auto;
         padding: 0;
      }
      
      .slide .slideItem {
         display: inline-block;
         height: 450px;
      }
      
      .slide .slideItem img {
         height: 450px;
         width: 100%;
      }
      
      /* -----------------------메인 아래부분----------------------- */
      .body .main-bottom {
         position: relative;
         max-width: 1000px;
         width: 1000px;
         height: 400px;
         margin: 10% auto 20%;
         padding: 0;
      }
      
      /* -----------------강의상세----------------- */
      .body .detailDiv {
         height: 100%;
         border: 1px solid lightgray;
         box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
      }
      
      .detailDiv table {
         width: 90%;
         margin: 5% 5%;
         border-collapse: collapse;
      }
      
      .detailDiv .imgRow {
         width: 100%;
         height: 250px;
         max-height: 250px;
      }
      
      .detailDiv .imgRow img {
         width: 100%;
         height: 250px;
      }
      
      .detailDiv .subRow {
         height: 20px;
         padding: 0;
      }
      
      .detailDiv .title {
         font-size: 16px;
         font-weight: 700;
      }
      
      .detailDiv .sub {
         font-size: 13px;
         font-weight: 400;
      }
      
      .detailDiv .price {
         font-size: 11px;
         font-weight: 400;
      }
      
      
      /* -----------------강의상세 옆 목록들----------------- */
      .body .sideDiv {
         height: 100%;
         padding-left: 30px;
      }
      
      .sideDiv button {
         width: 60px;
         border: 0;
         outline: none;
         background-color: white;
         margin: 2px 0 10px;
         font-weight: 700;
      }
      
      .sideDiv button:hover {
         color: #ff005a;
      }
      
      #lectureBtn {
         border-right: 1px solid lightgray;
      }
      
      .list-select {
         color: #ff005a;
         border-bottom: 1px solid #ff005a;
      }
      
      .sideDiv table {
         border-collapse: collapse;
         width: 100%;
      }
      
      .sideDiv td {
         padding: 5px 0;
         border-top: 1px solid lightgray;
         border-bottom: 1px solid lightgray;
         cursor: pointer;
      }
      
      .imgRow-side{
      	width: 35%;
      	paddig-left: 30px;
      }
      
      .imgRow-side img {
         width: 80px;
         height: 80px;
         margin: 0 40px;
      }
      
      .sideDiv .title {
         font-size: 15px;
         font-weight: 700;
         margin-bottom: 5px;
      }
      
      .sideDiv .price {
         font-size: 12px;
         font-weight: 400;
      }
      
      .sideDiv tr:hover {
          background: #f5f5f5;
      }
      
      /* -----------------오늘의 문구----------------- */
      .mentDiv {
         position: relative;
         background-image: url(resources/images/main/ment_sample.jpg);
         background-size: 100% 100%;
         background-repeat: no-repeat;
         margin: 0 auto;
         height: 250px;
         width: 80%;
         margin-bottom: 10%;
      }
      
      .mentDiv img {
         width: 100%;
         height: 100%;
      }
      
      .img-cover {
          position: absolute;
        height: 100%;
        width: 100%;
        background-color: rgba(0, 0, 0, 0.5);                                                                 
        z-index:1;
      }
      
      .mentDiv .ment {
          position: absolute;
         top:50%;
         left:50%;
         transform: translate(-50%, -50%);                                                                   
         font-size:5rem;
         color: white;
         z-index: 2;
         text-align: center;
      }
   </style>
</head>
<body>
   <!-- header include -->
   <c:import url="common/header.jsp"/>
   
   <!-- main -->
   <div class="body">
      <div class="slide-area">
         <div class="slide">
               <div class="slideItem" id="slide1"><img src="${contextPath}/resources/images/main/mainBanner1.jpg"></div>
               <div class="slideItem" id="slide1"><img src="${contextPath}/resources/images/main/mainBanner2.jpg"></div>
               <div class="slideItem" id="slide1"><img src="${contextPath}/resources/images/main/mainBanner3.jpg"></div>
         </div>
      </div>
      <div class="container main-bottom">
          <h3>최신 강의</h3><br>
         <div class="detailDiv col-sm-5">
            <table class="topItem">
               <tr class="imgRow">
                  <td>
                     <img id="img-detail" src="${contextPath}/resources/images/main/lectureImg_sample.PNG">
                  </td>
               </tr>
               <tr class="subRow title">
                  <td><br></td>
               </tr>
               <tr class="subRow sub">
                  <td></td>
               </tr>
               <tr class="subRow price">
                  <td><br></td>
               </tr>
            </table>
         </div>
         <div class="sideDiv col-sm-7">
            <div class="newListDiv">
               <button id="lectureBtn" class="list-select">강의</button>
               <button id="productBtn">상품</button>
            </div>
            <script>
            	window.onload=function(){
            		$('.rows').hover(function() {
					     var src = $(this).children().children('img').attr('src');
					     var title = $(this).children().children('.title').text();
					     var sub = $(this).children().children('.sub').text();
					     var price = $(this).children().children('.price').text();
					     
					     $('#img-detail').attr('src', src);
					     $('.detailDiv .title td').html('<br>'+title);
					     $('.detailDiv .sub td').html(sub);
					     $('.detailDiv .price td').html('<br>'+price);
					  });
            	}
		      </script>
            <table class="sideItems">
            </table>
         </div>
      </div>
      <div class="mentDiv">
          <div class="ment">
             <h2>배우고 싶은 기술이 있다면, 무엇이든 어디에서든</h2>
             <img src="${contextPath}/resources/images/common/logo_footer.png" style="width: 120px; height: 50px;">
          </div>
          <div class="img-cover"></div>
      </div>
   </div>
   
   <!-- footer include -->
    <c:import url="common/footer.jsp"/>
   
   <script>
	   $(function() {
		   getNewList('강의');
		   
		   $('#productBtn').click(function() {
			   getNewList('상품');
			   $(this).toggleClass('list-select');
			   $('#lectureBtn').toggleClass('list-select');
		   });
		   
		   $('#lectureBtn').click(function() {
			   getNewList('강의');
			   $(this).toggleClass('list-select');
			   $('#productBtn').toggleClass('list-select');
		   });
	   });
	   
	   function getNewList(cate) {
		   var type = '';
		   
		   if (cate == '강의') {
			   type = 'getNewLectureList.do';
		   } else if (cate == '상품') {
			   type = 'getNewProductList.do';
		   }
		   
		   $.ajax({
				url: type,
				dataType: "json",
				success: function(data) {
					$table = $(".sideItems");
		            $table.html("");
		            
		            var $tr;
		            var $img;
		            var $td;
		            var $title;
		            var $sub;
		            var $price;
		            
		            if (cate == '강의') {
		            	$('.imgRow').siblings('.title').children('td').html("<br>"+decodeURIComponent(data[0].L_TITLE.replace(/\+/g,' ')));
						$('.imgRow').siblings('.sub').children('td').html(decodeURIComponent(data[0].L_CONTENT.replace(/\+/g,' ')));
						$('.imgRow').siblings('.price').children('td').html("<br>"+data[0].L_PRICE+"￦");
						
		            	for (var i = 0; i < 4; i++) {
							$tr = $('<tr class="rows">');
							$img = $('<td class="imgRow-side"><img src="${contextPath}/resources/images/main/lectureImg_sample.PNG">');
							$td = $('<td>');
							$title =  $('<div class="title">').text(decodeURIComponent(data[i].L_TITLE.replace(/\+/g,' ')));
							$sub = $('<div class="sub">').text(decodeURIComponent(data[i].L_CONTENT.replace(/\+/g,' ')))
							$price = $('<div class="price">').text(data[i].L_PRICE+"￦");
							
							$tr.append($img);
							
							$td.append($title);
							$td.append($sub);
							$td.append($price);
							
							$tr.append($td);
							
							$table.append($tr);
						}
		            } else if (cate == '상품') {
		            	console.log(data);
		            }
				}
			});
	   }
	   
       $.noConflict();
       $('.slide').slick({
            dots: true,
            infinite: true,
            slidesToShow: 1,
            autoplay: true,
            autoplaySpeed: 2000
       });
       
   </script>
</body>
</html>