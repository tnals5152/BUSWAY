<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%HttpSession ss = request.getSession(true); 
ss.getAttribute("list");
ss.getAttribute("bvo");
ss.getAttribute("cPage");
ss.getAttribute("bvo");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의, 공지사항 상세</title>
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
</style>
<script>
	function modify_go(frm) {
		if ("${storevo.code }" != "${nvo.code}") {
			alert("본인이 작성한 글만 수정 가능합니다.")
		} else {
			frm.action = "controller?type=N_ModifyView";
			frm.submit();
		}
	}
	
	function delete_go(pwd) {
		if ("${storevo.code }" != "${nvo.code}") {
			alert("본인이 작성한 글만 삭제 가능합니다.")
		} else {
			while(true){
				var pwdin = prompt("비밀번호를 확인하세요");
				if( pwdin == pwd || pwdin == null){ break;}
				alert("비밀번호가 틀립니다. 다시 작성하세요.")
				
			}
			if(pwdin == pwd){
				document.location.href="controller?type=N_DeleteView&n_idx=${nvo.n_idx}";
			}
		}
	}
	
	function list_go() {
		document.frmv.action="controller?type=N_List";
		document.frmv.submit();
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
				<td>${nvo.n_idx }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${nvo.title }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${nvo.code }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${nvo.content }</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<input type="button" value="수정" onclick="modify_go(this.form)">
					<input type="button" value="삭제" onclick="delete_go('${storevo.getPwd()}')">
					<input type="button" value="목록" onclick="javascript:location.href='controller?type=N_List'">
					<input type="hidden" name="cPage" value="${cPage }">
					<input type="hidden" name="q_idx" value="${nvo.n_idx }">
					<input type="hidden" name="title" value="${nvo.title }">
				</td>
			</tr>
		</tfoot>
	</table>
</form>
<hr>


	<%@include file="common/footer.jspf" %>

</body>
</html>












