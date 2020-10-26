<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%HttpSession ss = request.getSession(true); 
ss.getAttribute("list");
ss.getAttribute("bvo");
ss.getAttribute("cvo");
ss.getAttribute("cPage");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세</title>
<link href="css/menu.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/login.css" />
<link rel="stylesheet" type="text/css" href="css/footer.css" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="js/login.js"></script>
<script src="js/menu.js"></script>
<style>
	table {
	    width: 800px;
		margin: auto;
		border-collapse: collapse;
		font-size: 14px;
		width: 800px;
	}
	table caption {
		font-size: 20px;
		font-weight: bold;
		margin-bottom: 10px;
	}
	table th {
		padding: 4px; text-align: center; background-color: #FEC111; 
	}
	table td {
		width: 30%;
		background-color: white;
		border-bottom: 3px solid #0E8C43; padding: 4px; text-align: left;
	}
	.table1 {
		width: 10%;
	}
	.comment {
		text-align: center;
	}
	.comment2 {
		text-align: center;
	}
	
</style>
<script>
	function modify_go() {
		if ("${user.userid }" != "${bvo.userid}") {
			alert("본인이 작성한 글만 수정 가능합니다.")
		} else {
			document.location.href="controller?type=Q_ModifyView";
		}
	}
	
	function delete_go(pwd) {
		if ("${user.userid }" != "${bvo.userid}") {
			alert("본인이 작성한 글만 삭제 가능합니다.")
		} else {
			while(true){
				var pwdin = prompt("비밀번호를 확인하세요");
				if( pwdin == pwd || pwdin == null){ break;}
				alert("비밀번호가 틀립니다. 다시 작성하세요.")
				
			}
			if(pwdin == pwd){
				document.location.href="controller?type=Q_DeleteView&q_idx=${bvo.q_idx}";
			}
		}
	}
	
	function list_go() {
		document.frmv.action="controller?type=Q_BBS";
		document.frmv.submit();
	}
	
	function c_write_go(frm) {
		 if ("${storevo.code }" != "") { 
			alert("${storevo.code}")
			frm.action = "controller?type=C_Write";
			frm.submit();
		 } else {
			alert("${storevo.code}")
			alert("관리자만 작성 가능합니다.")
		} 
	}
	
	function c_delete_go(pwd, store_code, cPage, c_idx, q_idx) {
			alert(pwd)
			alert(store_code)
			alert("${bvo.q_idx}")
			alert("${storevo.code }")
		if ("${storevo.code }" != store_code) {
			alert("관리자만 삭제 가능합니다.")
		} else {
			while(true){
				var pwdin = prompt("비밀번호를 확인하세요");
				if( pwdin == pwd || pwdin == null){ break;}
				alert("비밀번호가 틀립니다. 다시 작성하세요.")
				
			}
			if(pwdin == pwd){
				document.location.href="controller?type=C_DeleteView&q_idx=${bvo.q_idx}&cPage="+cPage+"&c_idx="+c_idx+"&q_idx="+q_idx;
			}
		}
	}
	
</script>
</head>
<body>

<%@include file="login/login.jspf" %>
<%@include file="common/menu.jspf" %>


<%-- 게시글 내용 표시 --%>
<form method="post" name="frmv">
	<table>
		<caption>상세보기</caption>
		<tbody>
			<tr>
				<th class="table1">글번호</th>
				<td>${bvo.q_idx }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${bvo.title }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${bvo.userid }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${bvo.content }</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<input type="button" value="수정" onclick="modify_go()">
					<input type="button" value="삭제" onclick="delete_go('${user.getPwd()}')">
					<input type="button" value="목록" onclick="javascript:location.href='controller?type=Q_BBS'">
					<input type="hidden" name="cPage" value="${cPage }">
					<input type="hidden" name="q_idx" value="${bvo.q_idx }">
				</td>
			</tr>
		</tfoot>
	</table>
</form>
<hr>

<%-- 게시글에 대한 댓글 작성 영역 --%>
<form method="post">
	
	<p>답변지점:<input type="text" name="store_code" value="${storevo.code }" readonly></input></p>
	<p>답변내용:<textarea name="content" rows="4" cols="55"></textarea></p>
	<input type="button" value="댓글저장" onclick="c_write_go(this.form)">
	<input type="hidden" name="q_idx" value="${bvo.q_idx }">
</form>

<!-- <hr> -->
<!-- <p class="comment ">댓글들</p> -->
<hr>
<%-- 게시글에 작성된 댓글 표시영역 --%>
<c:forEach var="commVO" items="${c_list }">
<div class="comment">
	<form method="post">
		<p>답변지점 : ${commVO.store_code }&nbsp;&nbsp; 날짜 : ${commVO.c_regdate } </p>
		<p>내용 : ${commVO.content }</p>
		<input type="button" value="댓글삭제" onclick="c_delete_go('${storevo.getPwd()}', '${commVO.store_code }', '${cPage }', '${commVO.c_idx }', '${commVO.q_idx }')">
		<input type="hidden" name="c_idx" value="${commVO.c_idx }">
		<%-- 삭제처리후 게시글 상세페이지로 이동시 --%>
 		<input type="hidden" name="q_idx" value="${commVO.q_idx }">
	</form>
</div>
<hr>
</c:forEach>

<br><br><br><br><br><br><br><br>


	<%@include file="common/footer.jspf" %>

</body>
</html>












