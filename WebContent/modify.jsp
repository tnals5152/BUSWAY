<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 전달받은 데이터를 화면에 표시하고, 수정버튼 클릭시 암호확인
	- 암호가 일치하면 : 수정요청처리(DB연동작업) - modify_ok.jsp
	- 암호가 불일치면 : 암호확인 메시지 표시 --%>
<%
String c_idx = request.getParameter("c_idx");	
String pwd = request.getParameter("pwd");
String b_idx = request.getParameter("q_idx");

pageContext.setAttribute("c_idx", c_idx);
pageContext.setAttribute("pwd", pwd);
pageContext.setAttribute("q_idx", b_idx);

HttpSession ss = request.getSession(true);
ss.getAttribute("bvo");

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
		/* if(var pwd1 = ${user.pwd}) {
			alert('수정되었습니다.'); */
			document.myForm.action="controller?type=Q_Modify";
			document.myForm.submit();
			
		/* } else {
			alert('비밀번호를 확인해주세요.');
		} */
	}
	
	function list_go() {
		location.href = "controller?type=Q_BBS";
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
				<th>제목</th>
				<td>
					<input type="text" name="title" size="45" title="제목"
							value="${bvo.title }">
				</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="userid" size="12" title="작성자"
							value="${bvo.userid }">
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea name="content" rows="8" cols="50" title="내용">${bvo.content }</textarea>
				</td>
			</tr>
			<!-- <tr>
				<th>패스워드</th>
				<td>
					<input type="password" name="pwd" size="12" title="패스워드">
				</td>
			</tr> -->
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<input type="button" value="수정" onclick="modify_go()">
					<input type="reset" value="다시작성">
					<input type="button" value="목록" onclick="list_go()">
					<input type="hidden" value="${q_idx }">
				</td>
			</tr>
		</tfoot>
	</table>
</form>

</div>

	<%@include file="common/footer.jspf" %>

</body>
</html>












