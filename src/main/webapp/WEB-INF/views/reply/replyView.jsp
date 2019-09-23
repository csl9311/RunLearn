<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&display=swap&subset=korean" rel="stylesheet">
<style type="text/css">
	#commentDiv {
		font-family: 'Nanum Gothic', sans-serif;
	    width: 100%;
	    height: auto;
	    left: 50%;
	    margin-bottom: 80px;
	    padding: 20px 60px;
	    text-align: left;
	}

	#commentDiv>div{
		position: relative;
		width: 100%;
		margin-left: auto;
		margin-right: auto;
	}
	
	#commentDiv ul {
		list-style: none;
		height: auto;
		max-height: 600px;
	}
	
	.commentList {
		overflow: auto;
		padding-right: 5px;
		height: 500px;
	}
	
	.commentList li {
		margin: 20px 0;
	}
	
	.comment-reply {
		margin-left: 30px;	
	}
	
	.comment-reply .comment-item {
		margin-top: 6px;
	    background: #efefef;
	    overflow: visible;
	    border-radius: 4px;
	    padding: 8px 12px;
	    position: relative;
	}
	
	.comment-reply .comment-item:before {
		content: '';
	    position: absolute;
	    left: 17px;
	    top: -4px;
	    width: 8px;
	    height: 8px;
	    background: #efefef;
	    transform: rotate(45deg);
	}
	
	.comment-name {
		font-size: 16px;
		font-weight: 700;
	}
	
	#commentDiv .profile {
		width: 35px;
		height: 35px;
		border-radius: 50px;
		border: 1px solid gray;
		margin-right: 10px;
	}
	
	.createDate {
		font-size: 13px;
		font-weight: 400;
		margin-left: 30px;
		margin-right: 30px;
	}
	
	.text {
		margin-top: 6px;
		font-weight: 300;
		padding-left: 70px;
	}
	
	.comment-form {
		border-top: 0;
		padding: 0;
		width: 100%;
	}
	.inner>.input-text {
		width: 100%;
	}
	
	.input-text {
		left: 0;
		right: 64px;
		font-size: 14px;
		font-weight: 300;
		width: 94%;
		position: absolute;
		height: 35px;
		display: inline-block;
		vertical-align: middle;
	}
	
	.input-text input {
		line-height: 16px;
		border: 1px solid #acacac;
		box-sizing: border-box;
		padding: 2px 8px;
		border-radius: 2px;
	}
	
	.inner {
		position: relative;
	    height: 32px;
	    width: 100%;
	    margin-top: 10px;
	}
	
	#commentAddBtn{
		position: absolute;
	    height: 100%;
	    right: 0;
	    width: 56px;
	    color: #fff;
	    background: #ff005a;
	    border: 1px solid #ff005a;
	    height: 34px;
	    cursor: pointer;
	}
	
	.replyBtn, .coDelBtn, .coUpdateBtn, .coUpdateCanBtn {
		margin: 0 2px;
		height: 25px;
		width: 50px;
		font-size:12px;
		font-weight: 300;
		cursor: pointer;
		background-color: gray;
		color: white;
		border: 0;
		outline: none;
	}
	
	.updateCoInput {
		width: 85%;
		height: 25px;
		margin-top: 5px;
	}
	
	.updateSendBtn {
		position: relative;
		top: -1px;
		width: 35px;
		height: 28px;
		margin-left: 4px;
		padding: 3px;
		border: 0;
		outline: none;
		background-color: rgb(0,100,0);
		color: white;
	}
</style>
</head>
<body>
	<div id="commentDiv">
		<div>
			<ul class="commentList">
				
			</ul>
			<div class="inner">
				<label class="input-text">
					<input type="text" id="replySubmit" class="input-text" name="comment" placeholder="댓글을 남겨주세요">
				</label>
				<button id="commentAddBtn">등록</button>
			</div>
		</div>
	</div>
	<script>
		/* $('.updateCoInput, .updateSendBtn, .coUpdateCanBtn').hide();
		
		$('.coUpdateBtn').click(function() {
			var content = $(this).parent().siblings('p').children('span').text();
			$(this).siblings('.coDelBtn').hide();
			$(this).parent().siblings('p').children('span').hide();
			$(this).parent().siblings('p').children('.updateCoInput, .updateSendBtn').show();
			$(this).parent().siblings('p').children('.updateCoInput').val(content);
			$(this).hide();
			$(this).siblings('.coUpdateCanBtn').show();
		});
		
		$('.coUpdateCanBtn').click(function() {
			$(this).siblings('.coUpdateBtn, .coDelBtn').show();
			
			$(this).parent().siblings().children('span').show();
			$(this).parent().siblings().children('input, .updateSendBtn').hide();
			$(this).hide();
		}); */
		
		function reply(num, type) {
			$.ajax({
				url: "getReplyList.do",
				data: {num:num, type:type},
				dataType: "json",
				success: function(data) {
					$ul = $('.commentList');
					$ul.html("");
					
					var $li, $div, $img, $nickname, $delBtn, $id, $date, $content;
					
					if (data.length == 0) {
						if(type == '강의') {
							$ul.append('<h4 style="text-align:center; margin: 70px 0;">등록된 강의평이 없습니다.');
						} else {
							$ul.append('<h4 style="text-align:center; margin: 70px 0;">등록된 댓글이 없습니다.');
						}
					}
					
					for (var i = 0; i < data.length; i++) {
						$li = $('<li class="comment-item">');
						$div = $('<div class="area-txt">');
						$img = $('<img class="profile">').attr('src', '${contextPath}/resources/images/member/'+data[i].M_CHANGED_NAME);
						$nickname = $('<span class="comment-name">').text(decodeURIComponent(data[i].M_NICKNAME)+' ('+(decodeURIComponent(data[i].M_ID)).substr(0,2)+'****)');
						$date = $('<span class="createDate">').text(data[i].R_CREATE_DATE);
						$delBtn = $('<button class="coDelBtn" onclick="deleteBtn($(this))">삭제</button>');
						$rNum = $('<input type="hidden" name="r_num" value="'+data[i].R_NUM+'">')
						$content = $('<p class="text">').text(decodeURIComponent(data[i].R_CONTENT).replace(/\+/g,' '));
						
						$div.append($img);
						$div.append($nickname);
						$div.append($date);
						
						if ('${loginUser.m_id}' == data[i].M_ID) {
							$div.append($delBtn);
						}
						
						$div.append($rNum);
						$div.append($content);
						
						$li.append($div);
						
						$ul.append($li);
					}
				}
			});
		}
		
		function insertReply(num, type) {
			var content = $('#replySubmit').val();
			$('#replySubmit').val("");
			var result = '';
			
			$.ajax({
				url: "insertReply.do",
				async:false,
				data: {content:content, num:num, type:type},
				success: function(data, response) {
					result = response;
				}, 
				error: function(message) {
					alert('등록 실패ㅠㅠ');
				}
			});
			
			return result;
		}
		
		function deleteReply(r_num) {
			var result = '';
			
			$.ajax({
				url: "deleteReply.do",
				async:false,
				data: {r_num:r_num},
				success: function(data, response) {
					result = response;
				},
				error: function() {
					alert('삭제 실패ㅠㅠ');
				}
			});
			
			return result;
		}
	</script>
</body>
</html>