<%@page import="com.bc.model.vo.CartToppingVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bc.model.vo.StuffVO"%>
<%@page import="com.bc.model.vo.ShopVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문시작하는창</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<jsp:useBean id="dao" class="com.bc.model.CartDAO" scope="session" />
<%
	request.setCharacterEncoding("UTF-8");
	String sort = request.getParameter("sort");
	pageContext.setAttribute("sort", sort);
	System.out.println("-------------------------------------sort : " + sort);
	System.out.println("================="+sort);
	System.out.println(request.getParameter("idx"));
	pageContext.setAttribute("idx", request.getParameter("idx"));
	List<StuffVO> list = (List<StuffVO>)session.getAttribute("sortlist");
	request.getAttribute(sort);
	String price15 = request.getParameter("price15");
	String price30 = request.getParameter("price30");
	request.setAttribute("price15", price15);
	request.setAttribute("price30", price30);
%>
<script>
	$("#promo").on({
		"mouseenter":function(){
			$(this).prop("color","green");
		},
		"mouseout":function(){
			$(this).prop("color","gray");
		}
		
	});
	
	function go(){
		history.forward(1);
	}
	function back(){
		history.back(-1);
	}
	
	function cartList(){
		location.href="cartList.jsp";
	}
	/* function add(frm){
		location.href= "OrderChoiceController?sort=${img.sort}";
		frm.submit();
		
	} */
	
		var type = Array();
	$(function(){
		
		$(".topping").click(function (){
			var topping = $(this).prev().val();
			
			if('<%=sort %>' == "bread"){
				
				location.href= "OrderChoiceController?idx=${idx}&sort=bread&goSort=cheese&type=" + topping
						+ "&price15=" + <%=price15%> + "&price30=" + <%=price30%>;
			}
			var check = true;
			for(var i=0; i< type.length ; i++ ){
				if(topping == type[i] ){
					check = false;
					break;
				}
				
			}
			if(check == true){
				type[type.length] = topping;
			}
			alert("type : " + type);
		});
		
	});
	
	function changePage(s, nowPagesort){
		if(s == 'bread' && '${menusort}' != '샌드위치'){
			alert("빵은 샌드위치만 선택 가능합니다.");
			return;
		}
		document.location.href="OrderChoiceController?idx=${idx}&sort="+nowPagesort+"&type="+type + "&goSort=" + s
				+ "&price15=" + <%=price15%> + "&price30=" + <%=price30%>;
	}
	
	function goCart(s){
		if('${bread}' == ""){
			if('${menusort}' == '샌드위치'){
				alert("빵 종류를 선택하세요. 무조건 무조건이야~~");
				document.location.href="orderStart.jsp?idx=${idx }&sort=bread"
						+ "&price15=" + <%=price15%> + "&price30=" + <%=price30%>;
				//document.location.href="OrderChoiceController?sort=bread&idx=${idx}&sort=bread";
				return;
			}else{
				document.location.href="OrderChoiceController?idx=${idx}&sort=" + s + "&type=" + type + "&goSort=mu"
						+ "&price15=" + <%=price15%> + "&price30=" + <%=price30%> + "&roasting=" + roasting + "&size=" + 15;
						opener.location.href="javascript:refresh();";
			}
		}else if('${bread}' != ""){
			if('${menusort}' == '샌드위치'){
				var roasting = "";
				var result = confirm("빵을 구워서 드릴까요?(예 : 확인, 아니오 : 취소)");
				if(result){
					roasting = "yes";
				}else{
					roasting = "no";
				}
				
				
				result = true;
				var size;
				while(result){
					size = prompt("빵 사이즈를 선택하세요(15cm or 30cm)");
					if(size == '15' || size == '30')break;
					alert("15또는 30을 입력하세요.");
				}
			
			}else{
				var size = 15;
			}
			
			
			document.location.href="OrderChoiceController?idx=${idx}&sort=" + s + "&type="+ type + "&goSort=mu"
				+ "&price15=" + <%=price15%> + "&price30=" + <%=price30%> + "&roasting=" + roasting + "&size=" + size;
				opener.location.href="javascript:refresh();";
				
		}
	}

</script>
<style>
	
	.menuName{  font-family: "나눔고딕";}
	.menu {	font-family : "나눔고딕";
			width: 100px; height:50px;
			line-height: 50px;
			background-color:white;
			color: gray;
			font-size: smaller;
			display: inline-block;
			text-align:center;
			
		}
	.menu-wrap ul{
			display: block;
			left: 500%;
			background-color:white;
			width : 600px;
			line-height : 100px;
			text-align:center;
			padding:0px; /*메뉴바 앞 불필요한 공간점유 없애기*/
			margin : auto;	
			
		}
	
	.menu-wrap li {
			display:inline; /*한줄로 정렬*/
			border-left: 1px solid gray; /*각 메뉴 왼쪽에 경계*/
			padding: 0px 20px 0px 20px; /*메뉴와 경계선 사이 간격 넓혀주기(상/우/하/좌)*/
			
		}
	.menu-wrap li:first-child{
			border-left:none; /*첫메뉴 왼쪽 경계선 지우기 */
		}
	.menu-wrap ul li a{
			font-family : "나눔고딕";
			text-decoration: none;
			color : #666666;
	}
	
	.menu_wrap { display: inline-block; text-align: center; weight:100%; }
	
	.img {margin: 0 auto; line-height: 100px;}
	.img img{
			-webkit-transform:scale(0.8);
		    -moz-transform:scale(0.8);
		    -ms-transform:scale(0.8); 
		    -o-transform:scale(0.8);  
		    transform:scale(0.8);
		}	
	#menutable{
		width: 560px;
		margin:auto;
		background-color: white;
	}
	.scale{
		width: 200px;
		height:200px;
	}
	.scale img{
		width: 190px;
		height: 190px;
	}
	.scale:hover img{
		width: 200px;
		height: 200px;
	}
	
	.scale:hover img {
			-webkit-transform:scale(1.0);
		    -moz-transform:scale(1.0);
		    -ms-transform:scale(1.0);   
		    -o-transform:scale(1.0);
		    transform:scale(1.0);
	}	    
	body{
		background-color:#8CCB3F; backfround-repeat:no-repeat;
	}
	#courseOfMenu {
		margin : auto 0;
		display : block; left:80%;
		width:100%;
		height:80px;
	}
	
	#courseOfMenu li{ 
		display: inline-block;
		padding: 0px 40px 0px 40px; /*메뉴와 경계선 사이 간격 넓혀주기(상/우/하/좌)*/
						
	}
	
	.fastSub{ font-size: 3em; color: white; font-family: "나눔고딕"; font-weight: bold; list-style:none; 
			 width:10%;}
	.fastSub2{ font-size: 0.7em; font-family: "나눔고딕"; list-style:none; color: white; }
	
	.text{
		font-family:"나눔고딕";
		}
	#button{width: 180px; font-size:1.5em;}
	#topping { display:none;}
	
</style>
</head>
	<body>
		
		<div>
			<center>
			
				<span><img src="img/busway.png" width="240px" height="100px"></span><br>
				<span class="fastSub2">메뉴소개/새소식/주문하기</span>
				<br>
			</center>
		</div>
	
		
		<div class="menu-wrap">
			<center>
			<ul>
				<li>
				<a onclick="changePage('bread', '${sort}')">빵선택</a>
				</li>
				<li>
				<a  id="cheese" onclick="changePage('cheese', '${sort}')">치즈선택</a>
				</li>
				<li>
				<a id="veg" onclick="changePage('veg', '${sort}')">야채선택</a>
				</li>
				<li>
				<a id="source" onclick="changePage('source', '${sort}')">소스선택</a>
				</li>
				<li>
				<a id="more" onclick="changePage('more', '${sort}')">추가선택</a>
				</li>
				
			</ul>
			</center>
		</div>
<%
		int i=1;
		List<StuffVO> stuffList = (List<StuffVO>)session.getAttribute("stuffVoList");
		int sortLength = 0;
		List<StuffVO> selectStuffBySort = new ArrayList<StuffVO>();
		for(int k = 0; k < stuffList.size(); k++){
			if(stuffList.get(k).getSort().equals(sort)){
				sortLength++;
				selectStuffBySort.add(stuffList.get(k));
			}
		}
		request.setAttribute("selectStuffBySort", selectStuffBySort);
		System.out.println(sort + "의 개수 : " + sortLength);
		int howfor= (int)Math.ceil(sortLength/3.0);
		request.setAttribute("i", i);
		request.setAttribute("howfor", howfor);
		
		
		System.out.println("stuffList : " + stuffList);
%>
			<form name="product">
			<table border id="menutable">
			
			<c:forEach begin="${i }" end="${howfor }" >
			<tr>
				<c:forEach var="img" items="${selectStuffBySort }" begin="${(i-1)*3 }" end="${(i-1)*3+2 }">
					<%-- <c:if test="${img.sort eq sort}"> --%>
					<td>
					<%-- <a href="stuffController?sort=${img.sort }"> --%>
					<input type="hidden" id="topping" value="${img.name}">
					<img src="images/${img.image }" class="topping" name="img" alt="사진" width="180px" height="180px" value=${selectStuffBySort }>
					<!-- </a> -->
					</td>
					<%-- </c:if> --%>
			</c:forEach>
			</tr>
			
			
			
			<tr>
				<c:forEach var="text" items="${selectStuffBySort }" begin="${(i-1)*3 }" end="${(i-1)*3+2 }" >
					<c:if test="${text.sort eq sort}">
					<td class="text" style="text-align:center;">${text.name}</td>
					</c:if>
					
				</c:forEach>
				<%request.setAttribute("i", ++i);%>
			</tr>
			</c:forEach>
			</table>
			</form>
			<p>
				<center>
				<input type="button" value="주문담기" id="button" onclick="goCart('${sort}')">
				</center>
			</p>
			
			
</body>
</html>