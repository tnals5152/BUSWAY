<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%UsersVO i = ((UsersVO)session.getAttribute("user")); 
System.out.println("iiiiiiiiiiiii" + i);%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link href="css/menu.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/login.css" />
<link rel="stylesheet" type="text/css" href="css/footer.css" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="js/login.js"></script>
<script src="js/menu.js"></script>
<link rel="stylesheet" type="text/css" href="css/mypage.css"/>
<script>
	$(function(){
		
		if('${user}' == ''){
			alert("로그인이 필요합니다.");
			document.location.href="index.jsp";
		}
		
		$('#name_gender').click(function(e){
			e.preventDefault();
			
			//$("body").not("#checkpwd").css("display", "none");
			$("#checkpwd").fadeIn(300);
			
		});
		
		$("#checkpwdClose").click(function(e){
			e.preventDefault();
			$("#checkpwd").fadeOut(300);
			$("body>").not("#checkpwd").css("display", "");
		});
		
		$("#myorder .mybusspan").click(function(){
			document.location.href = "orderlsit";
		});
		
		$("#mycart .mybusspan").click(function(){
			document.location.href = "cartController";
		});
	});
	
	function checkpwd(){
		var inputpwd = document.getElementById("pwdinput");
		if(inputpwd.value != ${user.pwd}){
			alert("비밀번호가 일치하지 않습니다.\n다시 입력하여주세요.");
			inputpwd.value = "";
			inputpwd.focus();
			return false;
		}
		document.location.href = "mypage?type=update";
	}
	
	
	
</script>
</head>
<body>
<%@include file="/login/login.jspf" %>
<%@include file="/common/menu.jspf" %>
	<div id="checkpwd">
	<br><br><br>
		<table>
			<tr>
				<th>비밀번호</th>
			</tr>
			<tr>
				<td>&nbsp;
			</tr>
			<tr>
			<td><input id="pwdinput" type="password" name="checkpwd" placeholder="PASSWORD CHECK"></td>
			</tr>
		</table>
		<a class="center" onclick="checkpwd()">확인</a><br>
		<a class="center" id="checkpwdClose">닫기</a>
	</div>
	<br>
	<div class="center" id="maindiv">
		<h2 class="center">MY BUS</h2><br>
		<div class="mybusdiv" id="mypage">
			<div class="name_gender">
				<p class="user">${user.getNickname() }님</p>
			</div>
			<a class="mybusspan" id="name_gender"><span class="center_v">회원정보수정</span></a>
		</div>
		<div class="mybusdiv" id="mycard"><p class="user">현재까지 주문횟수</p>
			<span class="mybusspan"><span class="center_v">${user.getCnt() }번</span></span>
		</div><br>
		<div class="mybusdiv" id="myorder"><p class="user">주문내역</p>
			<a class="mybusspan"><span class="center_v">주문내역관리</span></a>
		</div>
		<div class="mybusdiv" id="mycart"><p class="user">장바구니</p>
			<a class="mybusspan"><span class="center_v">내 장바구니보기</span></a>
		</div>
		
	</div>
	<%@include file="/common/footer.jspf" %>
</body>



</html>