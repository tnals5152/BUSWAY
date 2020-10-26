<%@page import="com.bc.model.vo.ShopVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 전달받은 제품번호를 사용해서 DB데이터 조회 후 화면 표시 --%>
<%
	//전달받은 값 추출(파라미터 값)
	String idx = request.getParameter("idx");
%>
	<%-- 액션태그 userBean scope상에 id명의 속성값이 
		있으면 사용하고, 없으면 새로 생성 --%>
	<jsp:useBean id="dao33" class="com.bc.model.dao.ShopDAO" scope="session" />
<%
	// DAO 객체(인스턴스) 사용해서 제품정보 조회 후 VO에 저장
	//ShopVO vo = dao.selectOne(pNum);
	//System.out.println("content vo : " + vo);
	
	//EL, JSTL 사용을 위한 속성값 설정
	pageContext.setAttribute("vo", dao33.selectOne(idx));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품상세정보</title>
<link href="css/menu.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/login.css" />
<link rel="stylesheet" type="text/css" href="css/footer.css" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="js/login.js"></script>
<script src="js/menu.js"></script>
<style>
	table {
      width: 600px;
      height: 400px;
      margin: 30px auto 0; /* 상 좌우 하 */
      border-collapse: collapse;
      fon-size: 0.8em;
   }
   tfoot { height: 3em; text-align: center; }
   .title { width: 30%; }
   .center { text-align: center; }
   
   td { 
      border-bottom: 3px solid #0E8C43; padding: 4px; text-align: center;
   }
   th {
      padding: 4px; text-align: center; background-color: #FEC111; 
   }
</style>
</head>
<body>
	<%@include file="common/menu.jspf"%>
	
	<table>
		<tbody>
			<tr>
				<th class="title">제품명</th>
				<td>${vo.getMenuname() }</td>
			</tr>
			<tr>
				<th>제품가격</th>
				<%-- <c:if test="${menusort eq '샌드위치' }">   --%> 
				<td>15cm:${vo.price15 }원 		30cm:${vo.getPrice30() }원</td>
				<%-- </c:if> --%>
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
			<tr>
				<th>제품설명</th>
				<td>${vo.getP_content() }</td>
			</tr>
			<tr>
				<td colspan="2" class="center">
					<img src="images/${vo.getP_img() }" alt="제품이미지">
				</td>
			</tr>
		</tbody>
		<tfoot>
			
		</tfoot>
	</table>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	
	<%@include file="common/footer.jspf" %>
</body>
</html>









