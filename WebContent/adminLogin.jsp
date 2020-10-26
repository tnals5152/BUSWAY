<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관계자 로그인 페이지</title>
<link rel="stylesheet" type="text/css" href="css/login.css" />
<link href="css/menu.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/footer.css" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="js/login.js"></script>
<script src="js/menu.js"></script>
<style>
	#adminloginform{
		border: 1px solid;
		width: 400px;
		/* background-color: white; */
		margin: auto;
	}
	
	#adminloginform>table th{
		width: 250px;
	}
	
	#adminloginform>table td{
		width: 250px;
	}
	
	#adminlogincaption {
		background-color: green;
		font-size: 3em;
	}
	#adminloginform th{
		font-size: 1.2em;
	}
	#adminloginform div>span{
		background-color: #0E8C43;
		font-size: 1.1em;
	}
	#adminloginform div>span:hover{
		cursor: pointer;
		font-size: 1.3em;
		background-color: #FEC111;
	}
	
</style>
<script>
	$(function(){
		$("#adminlogingo").click(function(){
			$("#adminloginform").attr("action", "adminloginout?type=login");
			$("#adminloginform").attr("method", "post");
			$("#adminloginform").submit();
		});
		
		$("#returngo").click(function(){
			history.back();
		});
	});
</script>
</head>
<body>
<!-- <div id="pagecontainer">
	<div id="contentwrap"> -->
	<%@include file="login/login.jspf" %>
	<%@include file="common/menu.jspf" %>
	<br><br><br><br><br>
	<form id="adminloginform">
		<table>
			<tr>
				<td colspan="2" id="adminlogincaption">관리자 로그인</td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<th>지점코드(아이디)</th>
				<td><input type="text" name="code" id="adminid"></td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="text" name="pwd" id="adminpwd"></td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2"><div class="center"><span id="adminlogingo">로그인</span></div></td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2"><div class="center"><span id="returngo">되돌아가기</span></div></td>
			</tr>
		</table>
	</form>
	
	
	
	<!-- </div> -->
	<!-- <footer id="footerreal"> -->
	<%@include file="common/footer.jspf" %>
	<!-- </footer> -->
<!-- </div> -->
</body>
</html>