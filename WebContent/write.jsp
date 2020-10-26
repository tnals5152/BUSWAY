<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<link href="css/menu.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/login.css" />
<link rel="stylesheet" type="text/css" href="css/footer.css" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="js/login.js"></script>
<script src="js/menu.js"></script>
<script>

	function list_go() {
		location.href = "controller?type=Q_BBS";
	}
	
	function write_go(frm) {
		frm.action = "controller?type=Q_Write";
		frm.submit();
	}
	
</script>
</head>
<body>

<%@include file="login/login.jspf" %>
<%@include file="common/menu.jspf" %>

<div id="bbs">
<form method="post" name="myform">
	<table>
		<caption>문의 게시글 작성</caption>
		<tbody>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="title" size="45" title="제목">
				</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="userid" size="12" title="작성자" 
							value="${user.userid }" readonly>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea name="content" rows="8" cols="50" title="내용"></textarea>
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
					<input type="button" value="등록 " onclick="write_go(this.form)">
					<input type="reset" value="다시작성">
					<input type="button" value="목록" onclick="javascript:location.href='controller?type=Q_BBS'">
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












