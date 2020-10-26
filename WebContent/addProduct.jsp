<%@page import="com.bc.model.vo.StuffVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="cart" class="com.bc.model.vo.Cart2" scope="session"/>
    <jsp:useBean id="dao" class="com.bc.model.CartDAO" scope="session" />
    
<%
	String sort = request.getParameter("sort");
	List<StuffVO> list = (List<StuffVO>)session.getAttribute("sort");
	//카트에 제품담기
	cart.addProduct(sort,dao);
	System.out.println("카트담기 : " + cart.getList());
	
	//토핑 고르고 나면 다음 토핑메뉴가 띄워져 있어야 함 
	int i=1;
	for(i=1 ; i<sort.length() ; i++){
		response.sendRedirect("orderStart.jsp?sort=" + sort);
	}
 
%>


