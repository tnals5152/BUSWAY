<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장 보기</title>
<link href="css/menu.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/main.css" />
<link rel="stylesheet" type="text/css" href="css/login.css" />
<link rel="stylesheet" type="text/css" href="css/footer.css" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="js/login.js"></script>
<script src="js/menu.js"></script>
<style>
	#divfind{
		width:350px;
		position:absolute;
		display: inline-block;
		left: 50%;
		margin-left: -175px;
	}
</style>
</head>
<body>
	<%@include file="login/login.jspf" %>
	<%@include file="common/menu.jspf" %>
	<div id="divfind">
	<h2 class="center">지점 정보 찾기</h2>
	<h4 class="center">간단한 정보만 입력하세요</h4>
	<form action="FindStoreListController">
		<select name="findstore">
			<option selected="selected" disabled="disabled">찾을 방법 선택</option>
			<option value="name">지점명</option>
			<option value="shop_number">지점 전화번호</option>
			<option value="addr">지점 주소</option>
		</select>
		<input type="text" name="intext">
		<input type="submit" value="찾기">
	</form>
	
	</div>
	
	
	
	
	<br><br><br><br><br><br><br><br><br><br><br>
	<%@include file="common/footer.jspf" %>
</body>
</html>