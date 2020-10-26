<%@page import="com.bc.model.vo.StuffVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	request.setCharacterEncoding("UTF-8");
	List<StuffVO> list =(List<StuffVO>)session.getAttribute("sortlist");
	System.out.println("ordering_StuffVO list : " + list);

	
	

%>


<%-- <title>제품상세정보</title>
<script>
	
</script>
<style>
</style>
<body>
	<table border>
			<tr>
				<td rowspan="5"><img src="img/${image }" width="200px" height="200px" alt="사진"></td>
				<td width="50px">길이</td>
				<td width="50px">빵</td>
				<td width="50px">치즈</td>
				<td width="50px">야채</td>
				<td width="50px">소스</td>
			</tr>
			<tr>
				<td colspan="5">추가한 토핑들 텍스트정렬</td>
				
			</tr>
			<tr><td colspan="5">&nbsp;&nbsp;</td></tr>
			<tr>
				<td width="70px">추가선택</td>
			</tr>
			<tr>
				<td colspan="5">추가선택한 토핑 정렬</td>
				
			</tr>
	
	<tbody>
	
	</tbody>
	
	</table>
	

</body> --%>