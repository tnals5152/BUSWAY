<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 전달받은 데이터를 화면에 표시하고, 수정버튼 클릭시 암호확인
	- 암호가 일치하면 : 수정요청처리(DB연동작업) - modify_ok.jsp
	- 암호가 불일치면 : 암호확인 메시지 표시 --%>
<%
String pwd = request.getParameter("pwd");
String e_idx = request.getParameter("e_idx");

pageContext.setAttribute("pwd", pwd);
pageContext.setAttribute("e_idx", e_idx);

HttpSession ss = request.getSession(true);
ss.getAttribute("evo");

 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<link href="css/menu.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/login.css" />
<link rel="stylesheet" type="text/css" href="css/footer.css" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="js/login.js"></script>
<script src="js/menu.js"></script>
<script>

	function modify_go(frm) {
			document.myForm.action="controller?type=E_Modify";
			document.myForm.submit();
	}
	
	function list_go() {
		location.href = "controller?type=E_List";
	}

</script>
</head>
<body>

<%@include file="login/login.jspf" %>
<%@include file="common/menu.jspf" %>

<div id="bbs">
<form method="post"
		name="myForm">
	<table>
		<caption>게시글 수정</caption>
		<tbody>
			<tr>
				<th>이벤트명</th>
				<td>
					<input type="text" name="title" size="45" title="제목"
							value="${evo.title }">
				</td>
			</tr>
			<tr>
				<th>지점명</th>
				<td>
					<input type="text" name="code" size="12" title="지점명" 
							value="${evo.code }" readonly>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea name="content" rows="8" cols="50" title="내용">${evo.content }</textarea>
				</td>
			</tr>
			<tr>
				<th>시작일</th>
				<td>
					<textarea name="start_date" size="12" title="시작일">${evo.start_date }</textarea>
				</td>
			</tr>
			<tr>
				<th>종료일</th>
				<td>
					<textarea name="end_date" size="12" title="종료일">${evo.end_date }</textarea>
				</td>
			</tr>
			<tr>
				<th>이미지첨부</th>
				<td>
					<input type="file" name="imgpath">
				</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<input type="button" value="수정" onclick="modify_go()">
					<input type="reset" value="다시작성">
					<input type="button" value="목록" onclick="list_go()">
					<input type="hidden" name="e_idx" value="${e_idx }">
					<input type="hidden" name="title" value="${title }">
					<input type="hidden" name="start_date" value="${start_date }">
					<input type="hidden" name="end_date" value="${end_date }">
				</td>
			</tr>
		</tfoot>
	</table>
</form>

</div>

	<%@include file="common/footer.jspf" %>

</body>
</html>












