<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴소개</title>
<link href="css/menu.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/login.css" />
<link rel="stylesheet" type="text/css" href="css/signup.css" />
<link rel="stylesheet" type="text/css" href="css/footer.css" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="js/login.js"></script>
<script src="js/menu.js"></script>
<script src="js/signup.js"></script>

<style>
table {
	text-align: center;
	width: 100%;
	margin: 30px auto 0; /* 상 좌우 하 */
	border-collapse: collapse;
	fon-size: 0.5em;
}

</style>

</head>
<body>
	<%@include file="login/login.jspf" %>
	<%@include file="common/menu.jspf" %>
	
	<table>
		<tr>
			<td><a href="product_list.jsp?menusort=1"> 
			<img width="100px" height="45px" src="images/2.jpg" alt="샌드위치"></a>
			<p><b>샌드위치</b></p>
			</td>
			<td><a href="product_list.jsp?menusort=2"> 
			<img width="100" height="45" src="images/22.jpg" alt="찹샐러드"></a>
			<p><b>찹샐러드</b></p>
			</td>
		</tr>
		<tr>
			<td><a href="product_list.jsp?menusort=3"> 
			<img width="100" height="45" src="images/33.jpg" alt="랩"></a>
			<p><b>랩</b></p>
			</td>
			<td><a href="product_list.jsp?menusort=4"> 
			<img width="100" height="45" src="images/44.jpg" alt="스마일썹"></a>
			<p><b>스마일썹</b></p>
			<td>
		</tr>
		<tr>
			<td><a href="product_list.jsp?menusort=5"> 
			<img width="100" height="45" src="images/55.jpg" alt="웨지수프"></a>
			<p><b>웨지수프</b></p>
			</td>
			<td><a href="product_list.jsp?menusort=6"> 
			<img width="100" height="45" src="images/66.jpg" alt="사이드/음료"></a>
			<p><b>사이드/음료</b></p>
			</td>
		</tr>
		<tr>
			<td>
			<a href="product_list.jsp?menusort=7"> 
			<img width="100" height="45" src="images/333.jpg" alt="프로모션"></a>
			<p><b>깜짝^^프로모션</b></p>
			</td>
			<td>
			<a href="product_list.jsp?menusort=7"> 
			<img width="100" height="45" src="images/333.jpg" alt="프로모션"></a>
			<p><b>궁금하면 클릭^^</b></p>
			</td>
		</tr>
	</table>
			
	<br><br><br><br><br>

	<%@include file="common/footer.jspf" %>
</body>
</html>



















