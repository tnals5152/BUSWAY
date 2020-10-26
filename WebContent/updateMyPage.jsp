<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보수정</title>
<link href="css/menu.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/login.css" />
<link rel="stylesheet" type="text/css" href="css/footer.css" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="js/login.js"></script>
<script src="js/menu.js"></script>

<style>
	table tr td{
		text-align: center;
	}
	
	table {
        /* width: 100%; */
        border: 1px solid #333333;
        margin-left: auto;
        margin-right: auto;
      }
</style>
<script>
	function updateuser(frm){
		if(frm.nickname.value == ""){
			alert("닉네임을 입력해주세요.");
			frm.nickname.focus();
			return false;
		}
		if(frm.pwd.value != frm.checkpwd.value){
			alert("비밀번호 확인을 다시 해주세요.");
			frm.pwd.value = "";
			frm.checkpwd.value = "";
			frm.pwd.focus();
			return false;
		}
		if(frm.pwd.value == ""){
			alert("비밀번호를 입력해주세요.");
			return false;
		}
		
		frm.action = "userupdate";
		frm.submit();
		
	}
</script>
</head>
<body>
<%@include file="/login/login.jspf" %>
<%@include file="/common/menu.jspf" %>
	<form>
		<table>
			<tr>
				<th>아이디</th>
				<td>${user.userid } </td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${user.name }</td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td><input type="text" name="nickname" value="${user.nickname }" ></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="addr" value="${user.addr }"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="phone" value="${user.phone }"></td>
			</tr>
			<tr>
				<th>카드</th>
				<td><input type="text" name="card" value="${user.card }"></td>
			</tr>
			<tr>
				<th>E-mail</th>
				<td><input type="text" name="email" value="${user.email }"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pwd"></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" name="checkpwd"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" onclick="updateuser(this.form)" value="저장하기"></td>
			</tr>
		</table>
	</form>
	
	<%@include file="/common/footer.jspf" %>
</body>
</html>