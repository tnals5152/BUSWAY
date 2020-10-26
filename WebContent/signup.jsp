<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<link href="css/menu.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/login.css" />
<link rel="stylesheet" type="text/css" href="css/signup.css" />
<link rel="stylesheet" type="text/css" href="css/footer.css" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="js/login.js"></script>
<script src="js/menu.js"></script>
<script src="js/signup.js"></script>
<style>

</style>
</head>
<body>
	<%@include file="login/login.jspf" %>
	<%@include file="common/menu.jspf" %>
	<br><br><br>
	<form id="inputuserform">
	<table id="inputuser">
		<tr>
			<td style="font-size: 2em;" class="center">회원가입</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" id="inputid" name="id" placeholder="ID" id="idinput">
			</td>
			<td style="width: 150px">
				<input type="button" value="아이디 중복확인" id="checkid">
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td colspan="2"><span id="checkMsg"></span></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" id="inputpwd" name="pwd" placeholder="PASSWORD"></td>
		</tr>
		<tr>
			<th>비밀번호 확인</th>
			<td><input type="password" id="pwdcheck" placeholder="PASSWORD CHECK"></td>
		</tr>
		<tr><td colspan="3">&nbsp;</td></tr>
		<tr>
			<th>닉네임</th>
			<td><input type="text" id="inputnickname" name="nickname" placeholder="NICKNAME"></td>
		</tr>
		<tr><td colspan="3">&nbsp;</td></tr>
		<tr>
			<th>이름</th>
			<td><input type="text" id="inputname" name="name" placeholder="NAME"></td>
		</tr>
		<tr><td colspan="3">&nbsp;</td></tr>
		<tr>
			<th>주소</th>
			<td><input type="text" id="inputaddr" name="addr" placeholder="ADDRESS"></td>
		</tr>
		<tr><td colspan="3">&nbsp;</td></tr>
		<tr>
			<th>전화번호</th>
			<td><input type="text" id="inputphone" name="phone" placeholder="PHONE NUMBER"></td>
		</tr>
		<tr><td colspan="3">&nbsp;</td></tr>
		<tr>
			<th>카드번호</th>
			<td><input type="email" id="inputcard" name="card" placeholder="CARD NUMBER"></td>
		</tr>
		<tr><td colspan="3">&nbsp;</td></tr>
		<tr>
			<th>이메일</th>
			<td><input type="email" id="inputemail" name="email" placeholder="E-MAIL"></td>
		</tr>
		<tr>
			<td class="pass" colspan="3">
				<br><a id="insertuser">회원가입</a>
				<input type="hidden" name="type" value="signup">
			</td>
		</tr>
	</table>
	</form>
	
	<br><br><br><br> 
	
	
	
	
	
	
	<%@include file="common/footer.jspf" %>
</body>
</html>