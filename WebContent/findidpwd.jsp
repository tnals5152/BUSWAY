<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 비밀번호 찾기</title>
<link href="css/menu.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/login.css" />
<link rel="stylesheet" type="text/css" href="css/footer.css" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="js/login.js"></script>
<script src="js/menu.js"></script>
<script>
	$(function(){
		$("#findid").click(function(){
			var name = $("#idinputname").val();
			var phone = $("#idinputphone").val();
			
			findid(name, phone);
		});
		
		
		$("#findpwd").click(function(){
			var id = $("#pwdinputid").val();
			var name = $("#pwdinputname").val();
			var phone = $("#pwdinputphone").val();
			
			findpwd(id, name, phone);
		});
	});
	
 	function findid(name, phone){
		$.ajax("findId", {
			type : "post",
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
			data : {"type":"findid", "name":name, "phone":phone},
			dataType : "json",
			success:function(data){
				var text = "";
				var size = Object.keys(data.list).length;
				if(size == 1){
					text = data.list[0].id;
				}else {
					for(var i = 0; i < size; i++){
						text += data.list[i].id;
						if(i != (size - 1)){
							text += ", ";
						}
					}
				}
				
				
				alert("일치하는 아이디는 " + text + "입니다.");
				location.href = "shop.jsp?find=find";
				
			},error : function(){
				alert("일치하는 아이디가 없습니다."
						+ "\n회원가입페이지로 이동합니다.");
				location.href = "signstep?type=1";
			}
		});
	}
 	
 	function findpwd(id, name, phone){
		$.ajax("findPwd", {
			type : "post",
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
			data : {"type":"findpwd", "id":id, "name":name, "phone":phone},
			dataType : "json",
			success:function(data){
				
				
				alert("일치하는 비밀번호는 " + data.pwd + "입니다.");
				location.href = "shop.jsp?find=find";
				
			},error : function(){
				alert("일치하는 아이디가 없습니다."
						+ "\n회원가입페이지로 이동합니다.");
				location.href = "signstep?type=1";
			}
		});
	}
 	
</script>
<style>

	
	.findtable{
		display:absolute;
		padding: 100px 0px;
		width: 600px;
		margin: auto;
		/*border: 1px solid gray;*/
		
	}
	/* #inputuser td, th{
	border: 1px solid;
	} */
	.findtable th{
		width: 300px;
	}
	.findtable td{
		width: 300px;
	}
	.pass{
		 text-align:center;
	}
	.pass a{
		font-size: 1.2em;
		background-color: #FEC111;
	}
</style>
</head>
<body>

	<%@include file="login/login.jspf" %>
	<%@include file="common/menu.jspf" %>
	<br><br><br>
	<form id="findidform">
	<table class="findtable">
		<tr>
			<td style="font-size: 2em;" class="center">아이디 찾기</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<th>이름</th>
			<td><input type="text" id="idinputname" name="name" placeholder="NAME"></td>
		</tr>
		<tr><td colspan="3">&nbsp;</td></tr>
		<tr>
			<th>전화번호</th>
			<td><input type="text" id="idinputphone" name="phone" placeholder="PHONE"></td>
		</tr>
		<tr><td colspan="2">&nbsp;</td></tr>
		<tr>
			<td class="pass" colspan="2">
				<a id="findid">아이디찾기</a>
				<input type="hidden" name="type" value="findid">
			</td>
		</tr>
	</table>
	</form>
	
	<br><br><br>
	<form id="findpwdform">
	<table class="findtable">
		<tr>
			<td style="font-size: 2em;" class="center">비밀번호 찾기</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<th>아이디</th>
			<td><input type="text" id="pwdinputid" name="id" placeholder="ID"></td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<th>이름</th>
			<td><input type="text" id="pwdinputname" name="name" placeholder="NAME"></td>
		</tr>
		<tr><td colspan="3">&nbsp;</td></tr>
		<tr>
			<th>전화번호</th>
			<td><input type="text" id="pwdinputphone" name="phone" placeholder="PHONE"></td>
		</tr>
		<tr><td colspan="2">&nbsp;</td></tr>
		<tr>
			<td class="pass" colspan="2">
				<a id="findpwd">비밀번호찾기</a>
				<input type="hidden" name="type" value="findpwd">
			</td>
		</tr>
	</table>
	</form>
	<br><br><br><br> 
	
	
	
	
	
	
	<%@include file="common/footer.jspf" %>
</body>
</html>