<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 삭제</title>
<link href="css/menu.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/login.css" />
<link rel="stylesheet" type="text/css" href="css/footer.css" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="js/login.js"></script>
<script src="js/menu.js"></script>
</head>
<body>

<%@include file="login/login.jspf" %>
<%@include file="common/menu.jspf" %>

<form method="post" action="controller?type=Q_Delete">
	비밀번호 : <input type="password" name="pwd">
	<input type="hidden" name="q_idx" value="${q_idx }">
	<input type="button" value="삭제" onclick="del_go(this.form)">
</form>

<script>
	function del_go(frm) {
		if (frm.pwd.value == "${user.pwd}") { //암호일치
			var isDelete = confirm("좀 사라져!!!!!!!!!");
			if (isDelete) {
				document.location.href="controller?type=Q_Delete&q_idx=${q_idx}";
				frm.submit();
			} else {
				history.back();
			}
		} else {//암호 불일치
			alert("비밀번호가 일치하지 않습니다. 확인하세요");
			frm.pwd.value = "";
			frm.pwd.focus();
		}
	}
</script>

	<%@include file="common/footer.jspf" %>

</body>
</html>












