<%@page import="com.bc.model.vo.ShopVO"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.bc.mybatis.DBService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<%-- 전달받은 제품분류목록(menusort) 값에 해당하는 제품정보를 DB에서 조회
	화면에 목록형태(테이블)로 표시
--%>
	<jsp:useBean id="dao22" class="com.bc.model.dao.ShopDAO" scope="session"/><%-- 
	<jsp:setProperty property="*" name="dao"/> --%>
<%
	//전달받은 파라미터 값 추출
	String menusort = request.getParameter("menusort");
	if ("1".equals(menusort)) {
		menusort = "샌드위치";
	} else if ("2".equals(menusort)) {
		menusort = "찹샐러드";
	} else if ("3".equals(menusort)) {
		menusort = "랩";
	} else if ("4".equals(menusort)) {
		menusort = "스마일썹";
	} else if ("5".equals(menusort)) {
		menusort = "단체메뉴";
	}
	
	pageContext.setAttribute("list", dao22.list(menusort));
	pageContext.setAttribute("menusort", menusort);
%>	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BUSWAY 메뉴소개</title>
<link href="css/menu.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/login.css" />
<link rel="stylesheet" type="text/css" href="css/footer.css" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="js/login.js"></script>
<script src="js/menu.js"></script>
<style>
	#plisttable {
		width: 600px;
		margin: 30px auto 0; /* 상 좌우 하 */
		border-collapse: collapse;
		fon-size: 0.8em;
	}
	#plisttable th {
		padding: 4px; text-align: center; background-color: #FEC111; 
	}
	#plisttable td { 
		border-bottom: 3px solid #0E8C43; padding: 4px; text-align: center;
	}
	
	thead {font-family: '나눔고딕';}
	td {font-family: '나눔고딕';}
	
</style>
</head>
<body>
	<%@include file="login/login.jspf" %>
	
	<%@include file="common/menu.jspf" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <table id="plisttable">
		<thead>
			<tr>
				<th width="15%">제품명</th>
				<th width="20%">이미지</th>
				<th width="15%">판매가격</th>
			</tr>
		</thead>
		<tbody>
		<%--등록된 제품이 없는 경우 --%>
	<c:if test="${empty list }">
		<tr>
			<td colspan='5'>현재 등록된 제품이 없습니다</td>
		</tr>
	</c:if>
	<%--등록된 제품이 있는 경우 --%>
	<c:if test="${not empty list }">
		<c:forEach var="vo" items="${list }">
			<tr>
				<td><a href="product_content.jsp?idx=${vo.getIdx() }">${vo.getMenuname() }</a></td>
				<td>
					<img src="images/${vo.getP_img() }" width="100px" height="95px">
				</td>
				<c:if test="${menusort == '샌드위치' }">   
				<td>15cm:${vo.getPrice15() }원 		30cm:${vo.getPrice30() }원</td>
				</c:if>
				<c:if test="${menusort == '찹샐러드' }">   
				<td>${vo.getPrice15() }원</td>
				</c:if>
				<c:if test="${menusort == '랩' }">   
				<td>${vo.getPrice15() }원</td>
				</c:if>
				<c:if test="${menusort == '스마일썹' }">   
				<td>${vo.getPrice15() }원</td>
				</c:if>
				<c:if test="${menusort == '단체메뉴' }">   
				<td>${vo.getPrice15() }원</td>
				</c:if>
			</tr>
		</c:forEach>
		</c:if>
		</tbody>
	</table>
    <hr>
	<%@include file="common/footer.jspf" %>
</body>
</html>


































































