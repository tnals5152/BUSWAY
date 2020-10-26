<%@page import="java.util.ArrayList"%>
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
   List<CartVO> list = (List<CartVO>)request.getAttribute("list");
   /* List<CartToppingVO> tlist = (List<CartToppingVO>)request.getAttribute("list"); */
   /*session.setAttribute("list", list); */
   List<CartToppingVO> l = (List<CartToppingVO>)session.getAttribute("cartToppingList");
%>

<jsp:useBean id="cart" class="com.bc.model.vo.Cart" scope="session" />
<%-- <jsp:useBean id="tcart" class="com.bc.model.vo.CartToppingVO" scope="session" /> --%>

   
    
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>장바구니 보기</title>
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
<%
	List<CartVO> store_code = new ArrayList<>();
	if(request.getAttribute("list") != null){
		
		store_code = ((List<CartVO>)request.getAttribute("list"));
	}
%>
<script>

   function sendAllPrice(){
	   
	  if(!${empty list} && !${empty store_code}){
		  var code = cartForm.store_code2.value;
		   alert(code);
	      	document.location.href="sortController?menusort=샌드위치&store_code="+code;
      }else{
    	  alert("매장을 먼저 선택하세요.");
    	  location.href="findStore.jsp";
      }
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
      
     
      
      $('.menuPrice').click(function(){
         var totalPrice = parseInt($total.text());
         let optPrice = parseInt($(this).next().next().val());
         let cnt = parseInt($(this).next().val());
         if($(this).prop("checked")){
            totalPrice += optPrice * cnt;
         }else{
            totalPrice -= optPrice * cnt;
         }
         $total.text(totalPrice);
      });
      
      $("#checkAll").click(function(){
         var totalPrice = 0;
         var cnt = 0;
         if($(this).prop("checked")){
            $(".menuPrice").each(function(){
            	$(".menuPrice").prop("checked", true);
               optPrice = parseInt($(this).next().next().val());
               cnt = parseInt($(this).next().val());
               
               totalPrice += optPrice*cnt;
               
               
            });
            $total.text(totalPrice);
         }else{
        	 $(".menuPrice").each(function(){
             	$(".menuPrice").prop("checked", false);
        	 });
            $total.text(0);
         }
      });
      
      
      $(".plus").click(function(){
    	  var $idx = $(this).next();
    	  var idx = $idx.val();
    	  var type = "plus";
    	  plusBt(idx, type);
    	  
    	  var cnt = $idx.next().html();
    	  cnt *= 1;
    	  $idx.next().html(cnt + 1);
    	  window.location.reload();
    	  
      });
      
      $(".minus").click(function(){
    	  var $idx = $(this).prev();
    	  var idx = $idx.val();
    	  var type = "minus";
    	  plusBt(idx, type);
    	  
    	  var cnt = $idx.prev().html();
    	  cnt *= 1;
    	  $total = $idx.parent().next().children().first();
    	  alert($total.html());
    	  window.location.reload();
      });
      
      
      $("#orderclick").click(function(){
    	  if(${empty list}){
    		  alert("장바구니에 리스트가 없습니다.");
    		  return;
    	  }
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
   
   function deleteselected(frm){
	   //location.href="deleteMyCart";
	   frm.action = "deleteMyCart";
	   frm.submit();
   }
   
   
  /*  function order(frm){
	   frm.action = "orderFromCart";
	   frm.submit();
   } */
   
   </script>
</head>
<body>
	<%@include file="login/login.jspf" %>
	<%@include file="common/menu.jspf" %>
      <h2>장바구니</h2>
      <form id="cartForm">
      <table>
      <c:if test="${empty list}">
            <tr>
               <td colspan="3">장바구니에 상품을 담아주세요</td>
            </tr>
      </c:if>
      
      <c:if test="${not empty list }">
         <tr class="all">
            <td class="white">픽업매장</td>
            <td class="yel">${list.get(0).getStore_code() }<input type="hidden" name="store_code2" value="${list.get(0).getStore_code() }"></td>
            <td><!-- <input type="button" value="변경" style="float:right" > --></td>
         </tr>
            <tr class="choiceSpace">
            <td><input type="checkbox" id="checkAll" onclick='checkAll();' value="전체선택" >전체선택</td>
            <td>&nbsp;</td>
            <td><input type="button" style="float:right" value="선택삭제" onclick="deleteselected(this.form)"></td>
         </tr>
      <c:forEach var="vo" items="${list}">
         
         <tr>
            <tr>
            <td class="menu"><input type="checkbox" class="menuPrice" name="checkRow" value="${vo.idx }">${vo.menuname }<input type="hidden" value="${vo.getCnt()}" >
            <input type="hidden" value="${vo.getOne_total()}">
            </td>
            
            <td rowspan="3" colspan="3"><img src="images/${vo.getP_img() }" style="float:right" alt="샌드위치사진" width="180" height="120">
            </td>
         
         </tr> 
         
         <tr>
            <td>
               <c:forEach var="topping" items="${cartToppingList }">
                  <c:if test="${vo.getIdx() == topping.getCart_idx() }">
                  
                  <span class="content" style= "font-size : 1em">${topping.getName() } </span>
                  </c:if>
               </c:forEach>
            </td>
         </tr>
         
         
         <%-- <tr>
            
            <td class="content">${vo.getP_content() }</td>
         </tr> --%>
         <tr>
            <td class="price">${vo.getOne_total() }원</td>
         </tr>
         <tr>
            <td>수량
	            <input type="button" class="plus" value="+">
	            <input type="hidden" class="plushidden" value="${vo.idx }">
	            <span>${vo.getCnt()}</span>
	            <input type="hidden" value="${vo.idx }">
	            <button type="button" class="minus">-</button>
            </td>
            <td colspan="2" class="priceAll">총 주문금액 <span class="${vo.idx }">${vo.getOne_total() * vo.getCnt() }</span>원</td>   
            
         </tr>
         <tr>
            <td colspan="3" style= 'font-size: 40px' >
               &nbsp;
            </td>
         </tr>
      </c:forEach>
         <tr>
            <td colspan="3" style= 'font-size: 60px' >
               &nbsp;
            </td>
         </tr>
         </c:if>
         <tr>
            <td>최종 결제 금액 <span id="total">0</span>원</td>
            <td style= 'float:rignt' ><input type="button" value="메뉴추가하기" onclick="sendAllPrice()"></td>
            <td><input type="button" value="주문하기"  id="orderclick"></td>
         </tr>
      
   </table>
   </form>
   <%@include file="common/footer.jspf" %>
</body>
</html>