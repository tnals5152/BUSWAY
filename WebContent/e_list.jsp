<%@page import="com.bc.model.vo.Q_BBSVO"%>
<%@page import="com.bc.model.dao.DAO"%>
<%@page import="com.bc.model.vo.Paging"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
 
<%HttpSession ss = request.getSession(true); 
	ss.getAttribute("list");
	ss.getAttribute("evo");
	ss.getAttribute("cPage");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트</title>
<link href="css/menu.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/login.css" />
<link rel="stylesheet" type="text/css" href="css/footer.css" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="js/login.js"></script>
<script src="js/menu.js"></script>
<style>
	h1{
		text-align: center;
	}
	a{
		text-decoration:none;
	}
	.table{
		width: 900px;
		margin:auto; 
		text-align: center;
		border-collapse: collapse;
	}
	th {
		font-size: 10pt;
		font-color: #FEC111;
	}
	td {
		border-bottom: 3px solid #0E8C43;
		font-size: 15pt;
	}
	.paging { 
		list-style: none;
	 }
	.paging li {
		float: left;
		margin-right: 8px;
	}
	.paging li a {
		text-decoration: none;
		display: block;
		padding: 3px 7px;
		font-weight: bold;
		color: black;
	}
	.paging .disable {
		border: 1px solid silver;
		padding: 3px 7px;
		color: silver;
	}
	.paging .now {
		border: 1px solid #0E8C43;
		padding: 3px 7px;
		background-color: #FEC111;
	}
	.paging li a:hover {
		background-color: #FEC111 ;
		color: white;
	}
	.frm1{
		text-align: right;
		margin-right: 500px;
	}
	.btn1{
		text-align: right;
		margin-right: 500px;
		font-size: 1.5em;
	}
	.title {
		color: #FEC111;
	}
	.title3 {
		color: #0E8C43;
	}
</style>
<script>
	function write_go(){
		if('${storevo}' == ''){
			alert("관리자만 글쓰기가 가능합니다. 돌아가세요. 훠이훠이~");
			return false;
		}
		document.location.href = 'controller?type=E_WriteView';
	}
</script>
</head>
<body>

<%@include file="login/login.jspf" %>
<%@include file="common/menu.jspf" %>

<h1>이벤트</h1>
<hr>
<form action="controller?type=E_Search" method="post" class="frm1">
	<select name="idx">
		<option value="0">제목</option>
		<option value="1">지점</option>
	</select>
	<input class="btn" type="text" name="keyword">
	<input class="btn" type="submit" value="검색">
</form>
<br>
<form name="EVENT">
<table class="table">
	<thead>
		<tr class="title">
			<th class="no">번호</th>
			<th class="subjectnum">제목</th>
			<th class="title1">지점명</th>			
			<th class="wrtier_date">시작날짜</th>
			<th class="wrtier_date">종료날짜</th>
			<th class="hit">조회수</th>
		</tr>
	</thead>
	<tbody>
	<c:choose>
		<c:when test="${empty list }">
			<tr>
				<td colspan="6">
					<h2>게시글이 없습니다.</h2>
				</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach  var="vo" items="${list }">
			<tr>
				<td>${vo.e_idx }</td>
				<td><a href="controller?type=E_View&e_idx=${vo.e_idx }&cPage=${pvo.nowPage}">${vo.title }</a></td>
				<td>${vo.code }</td>
				<td>${vo.start_date }</td>
				<td>${vo.end_date }</td>
				<td>${vo.views }</td>
			</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="6">
				<ol class="paging">
				<li><a href="controller?type=E_List&cPage=1">첫페이지</a></li>
				<c:choose><%--[이전으로]에 대한 사용여부처리 --%>
					<%--사용불가(disable) 또는 안보이게(hidden) : 첫번째 블록인 경우 --%>
					<c:when test="${pvo.beginPage == 1}">
						<li class="disable"><</li>
					</c:when>
					<c:otherwise>
						<li>
							<a href="controller?type=E_List&cPage=${pvo.beginPage - 1 }"><</a>
						</li>
					</c:otherwise>
				</c:choose>
				<%-- 블록내에 표시할 페이지 태그 작성(시작페이지~끝페이지) --%>	
				<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
				<c:choose>
					<c:when test="${pageNo == pvo.nowPage }">
						<li class="now">${pageNo }</li>
					</c:when>
					<c:otherwise>
						<li>
							<a href="controller?type=E_List&cPage=${pageNo }">${pageNo }</a>
						</li>
					</c:otherwise>
				</c:choose>
				</c:forEach>
					
				<c:choose><%--[다음으로]에 대한 사용여부처리 --%>
					<%--사용불가(disable) 또는 안보이게(hidden) : 마지막 블록인 경우
						endPage가 전체페이지수와 같거나 큰 경우 --%>
					<c:when test="${pvo.endPage >= pvo.totalPage }">
						<li class="disable">></li>
					</c:when>
					<c:otherwise>
						<li><a href="controller?type=E_List&cPage=${pvo.endPage + 1 }">></a></li>
					</c:otherwise>
				</c:choose>
				<li><a href="controller?type=E_List&cPage=${pvo.totalPage} ">끝페이지</a></li>
				</ol>
			</td>
		</tr>
	</tfoot>
</table>
</form>

<div class="btn1">
<input type="button" name="list" value="목록으로" onclick="javascript:location.href='controller?type=E_List'">
<input type="button" name="write" value="글쓰기" onclick="write_go()">
</div>

	<%@include file="common/footer.jspf" %>

</body>
</html>





















































