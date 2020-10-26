<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서버관리자</title>
<link href="css/logo.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/footer.css" />
<link rel="stylesheet" type="text/css" href="css/mypage.css"/>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="js/menu.js"></script>
<script src="js/serverlogo.js"></script>
<script>
	$(function(){
		$("#name_gender").click(function(){
			
		});
	});
</script>
</head>
<body>
<%@include file="common/serverlogo.jspf" %>

	<div class="center" id="maindiv">
		<h2 class="center">총 관리자 페이지</h2><br>
		<div class="mybusdiv" id="mypage">
			<div class="name_gender">
				<p class="user">${storevo.name }님</p>
			</div>
			<a class="mybusspan" id="name_gender"><span class="center_v">메뉴 or 토핑 추가</span></a>
		</div>
		<div class="mybusdiv" id="mycard"><p class="user">새소식</p>
			<a class="mybusspan"><span class="center_v">새소식관리</span></a>
		</div><br>
		<div class="mybusdiv" id="myorder"><p class="user">전체 판매내역</p>
			<a class="mybusspan"><span class="center_v">전체 판매내역</span></a>
		</div>
		<div class="mybusdiv" id="mycart"><p class="user">지점관리</p>
			<a class="mybusspan"><span class="center_v">지점관리</span></a>
		</div>
		
	</div>
<%@include file="common/footer.jspf" %>
</body>
</html>