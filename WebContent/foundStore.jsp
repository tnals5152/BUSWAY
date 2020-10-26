<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찾은 매장</title>
<link href="css/menu.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/login.css" />
<link rel="stylesheet" type="text/css" href="css/footer.css" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="js/login.js"></script>
<script src="js/menu.js"></script>
<script>
	function go_order(store_code){
		document.location.href = "storeController?store_code=" + store_code;
	}
</script>
<style>
	#divfound{
		width: 800px;
		left: 50%;
		position:absolute;
		margin-left:-400px;
	}
	#divfound th:first-child{
		width: 100px;
	}
	
	#divfound th:nth-child(2){
		width: 500px;
	}
	
	#divfound th:nth-child(3){
		width: 200px;
	}
	#divfound th, td{
		border-bottom: 2px solid;
	}
	
</style>
</head>
<body>
<%@include file="login/login.jspf" %>
<%@include file="common/menu.jspf" %>
	<div id="divfound">
	<h2 class="center">찾은 매장</h2>
	<table>
		<tr>
			<th>지점명</th>
			<th>주소</th>
			<th>전화번호</th>
		<tr>
		<c:forEach var="store" items="${storeList }">
		<tr>
			<td>${store.name }</td>
			<td>${store.addr }</td>
			<td>${store.shop_number }</td>
			<td><input type="button" onclick="go_order('${store.code }')" value="해당 매장으로 주문하러 가기"></td>
		</tr>
		</c:forEach>
	</table>
	
	</div>
<%@include file="common/footer.jspf" %>	
</body>
</html>