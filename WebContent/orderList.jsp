<%@page import="com.bc.model.vo.OrderedToppingVO"%>
<%@page import="com.bc.model.vo.SuborderVO"%>
<%@page import="com.bc.model.vo.CartToppingVO"%>
<%@page import="com.bc.model.vo.CartVO"%>
<%@page import="com.bc.model.vo.BasicSuborderVO"%>
<%@page import="com.bc.model.vo.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.bc.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   request.setCharacterEncoding("UTF-8");
   List<SuborderVO> list = (List<SuborderVO>)request.getAttribute("suborderlist");
   /* List<CartToppingVO> tlist = (List<CartToppingVO>)request.getAttribute("list"); */
   /*session.setAttribute("list", list); */
   List<OrderedToppingVO> l = (List<OrderedToppingVO>)request.getAttribute("orderToppingList");
   int all_total = 0;
   for(int i = 0; i < list.size(); i++){
	   all_total += Integer.parseInt(list.get(i).getAll_total());
   }
   pageContext.setAttribute("all_total", all_total);
%>

<jsp:useBean id="cart" class="com.bc.model.vo.Cart" scope="session" />
<%-- <jsp:useBean id="tcart" class="com.bc.model.vo.CartToppingVO" scope="session" /> --%>

   
    
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문내역</title>
<style>
   body {font-family:"나눔고딕";}
   table {width: 60%; height: 100px; margin:auto; border-collapse: collapse;}
   .all{background-color :#7A1089; }
   .choiceSpace{background-color :#A5A4A4;}
    h2{text-align : center;}
   .yel {color :#FEC111; }
   .white {color : white; }
   .pickup {background-color :#7A1089; }
   .menu {font-weight: bold; font-size : 1.5em;}
   .content {font-size : x-small; color : #A5A4A4;}
   .price {color : #0E8C43; font-weight : bold;}
   .priceAll {text-align: right; }
   #total {font-size : 1.5em; font-weight : bold; color:#0E8C43; }
</style>
<link href="css/menu.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/login.css" />
<link rel="stylesheet" type="text/css" href="css/footer.css" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="js/login.js"></script>
<script src="js/menu.js"></script>
<script>

   function sendAllPrice(){
      document.location.href="sortController?menusort=샌드위치";
   }
   
   function add(){
      if($){}
   };
   
   
   function minus(){
      
   };
   
   function checkAll(){
      if($("#checkAll").is(':checked')){
         $("input[name=checkRow]").prop("checked", true);
      }else{
         $("input[name=checkRow]").prop("checked", false);
      }
   }
   
   var totalTag;
   var totalValue = 0;
   var opts;
   
   
   $(function(){
      var $total = $("#total");
      
     
      
      
      
      $("#orderclick").click(function(){
    	  var total = $("#total").html();
    	  alert(total);
    	  var $cartForm = $("#cartForm");
    	  $cartForm.attr("method", "post");
    	  $cartForm.attr("action", "orderFromCart?all_total=" + total);
    	  $cartForm.submit();
      });
      
      
   });
	
   function plusBt(idx, type){
	   $.ajax("plusCnt", {
		   type : "get",
		   contentType : "application/x-www-form-urlencoded; charset=utf-8",
		   data : {"idx": idx, "type": type}
	   });
   }
   
   
   </script>
</head>
<body>
	<%@include file="login/login.jspf" %>
	<%@include file="common/menu.jspf" %>
      <h2>내 주문내역</h2>
      <form id="cartForm">
      <table>
      <c:if test="${empty suborderlist}">
            <tr>
               <td colspan="3">주문된 내역이 없습니다.</td>
            </tr>
      </c:if>
      
      <c:if test="${not empty suborderlist }">
         <tr class="all">
            <td class="white">픽업매장</td>
            <td class="yel" colspan="2">${suborderlist.get(0).getStore_code() }</td>
      <c:forEach var="vo" items="${suborderlist}">
         
         <tr>
            <tr>
            <td class="menu">${vo.menuname }<input type="hidden" value="${vo.getCnt()}" >
            <input type="hidden" value="${vo.getOne_total()}">
            </td>
            
            <td rowspan="3" colspan="3"><img src="images/${vo.getP_img() }" style="float:right" alt="샌드위치사진" width="180" height="120">
            </td>
         
         </tr> 
         
         <tr>
            <td>
               <c:forEach var="topping" items="${orderToppingList }">
                  <c:if test="${vo.getIdx() == topping.getSuborder_idx() }">
                  
                  <span class="content" style= "font-size : 1em">${topping.getName() } </span>
                  </c:if>
               </c:forEach>
            </td>
         </tr>
         
         
         <%-- <tr>
            
            <td class="content">${vo.getP_content() }</td>
         </tr> --%>
         <tr>
            <td>수량
	            <span>${vo.getCnt()}</span>
            </td>
               
            
         </tr>
         <tr style="border-bottom: 1px solid">
            <td colspan="1"  >
            	<c:if test="${vo.getRoasting() eq 'yes'}">
               		빵 구움
               </c:if>
               <c:if test="${vo.getRoasting() eq 'no'}">
               		빵  굽지 않음
               </c:if>
               &nbsp;&nbsp;빵 크기 : ${vo.getBread_size() }cm
            </td>
               <td colspan="2" class="priceAll">총 주문금액 <span class="${vo.idx }">${vo.one_total }</span>원</td>
           
         </tr>
      </c:forEach>
         <tr>
            <td colspan="3" style= 'font-size: 60px' >
               &nbsp;
            </td>
         </tr>
         </c:if>
         <tr>
         	<td class="content" style="font-size:1.5rem; color:black;">최종 결제 금액 ${all_total }</td>
            <td style= 'float:rignt' colspan="2"><input type="button" value="주문하기" onclick="sendAllPrice()"></td>
         </tr>
      
   </table>
   </form>
   <br><br>
   <%@include file="common/footer.jspf" %>
</body>
</html>