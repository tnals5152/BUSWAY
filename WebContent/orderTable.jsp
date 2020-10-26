<%@page import="com.bc.model.vo.ShopVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문하는창</title>
<link href="css/menu2.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/login.css" />
<link rel="stylesheet" type="text/css" href="css/footer.css" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="js/login.js"></script>
<script src="js/menu.js"></script>
<%
	request.setCharacterEncoding("UTF-8");
	List<ShopVO> list = (List<ShopVO>)request.getAttribute("list");
	System.out.println("ShopVO list : " + list);
	

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
	
	function detail(){
		/* var idx = document.img2.value;
		alert(idx); */
		
		
	}
	
	
	
	

</script>
<style>
	/* #div1 {
		width : 100%; height : 20%;
		background-color : #0E8C43;
	} */
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
		width: 600px;
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
	
</style>
</head>
	<body>
		<%@include file="login/login.jspf" %>
		<%@include file="common/menu.jspf" %>
		<div>
			<center>
			
				<span class="fastSub">Fast-Sub</span><br>
				<span class="fastSub2">온라인 주문 후 매장에서 픽업/시식하는 서비스 입니다.</span>
				<br>
			
			<!-- <ul>
				<li class="fastSub">Fast-Sub</li>
				<li class="fastSub2">온라인 주문 후 매장에서 픽업/시식하는 서비스 입니다.</li>
			</ul> -->
			</center>
		</div>
	
		<div id="courseOfMenu" style="text-align:center;">
		
				<br>
				<img src="img/1-1.png" width="40px" height="40px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<img src="img/1-2.png" width="40px" height="40px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<img src="img/1-3.png" width="40px" height="40px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<img src="img/1-4.png" width="40px" height="40px">
		
			<!-- <ul>
				<li><img src="img/1-1.png" width="40px" height="40px"></li>
				<li><img src="img/1-2.png" width="40px" height="40px"></li>
				<li><img src="img/1-3.png" width="40px" height="40px"></li>
				<li><img src="img/1-4.png" width="40px" height="40px"></li>
			</ul> -->
		</div>
		
		<div class="menu-wrap">
			<center>
			<ul>
				<li><a href="#">
				</a><img src='img/star.png' width='30px' height='30px' style= line-height:30px>
				</li>
				<li id="promo"><a href="sortController?menusort=프로모션">프로모션</a></li>
				<li id="sendw"><a href="sortController?menusort=샌드위치">샌드위치</a></li>
				<li id="chap"><a href="sortController?menusort=찹샐러드">찹샐러드</a></li>
				<li id="rep"><a href="sortController?menusort=랩">랩</a></li>
				<li id="side"><a href="sortController?menusort=사이드음료">사이드/음료</a></li>
			</ul>
			</center>
		</div>
		
	<% int i=1; 
	   int howfor = (int)Math.ceil(list.size()/3.0);
	   request.setAttribute("i", i);
	   request.setAttribute("howfor", howfor);
	%>
	<!-- var="menu" items="${list}"  -->
	<table id="menutable">
	<c:forEach begin="${i }" end="${howfor }"  >
	<tr>
		<c:forEach var="img" items="${list }" begin="${(i-1)*3 }"  end="${(i-1)*3+2 }">

				<td class="scale"><a href="detailController?idx=${img.idx }&menusort=${img.menusort}"><img src="images/${img.p_img}" 
						alt="사진" width="200px" height="200px"></a></td>

		</c:forEach>
	</tr>
	<tr>
		<c:forEach var="text" items="${list }" begin="${(i-1)*3 }"  end="${(i-1)*3+2 }">

				<td class="text" style="text-align:center;">${text.menuname }</td>

		</c:forEach>
		<%request.setAttribute("i", ++i); %>
		<%-- <c:forEach var="menunames" items="${menuname }" begin="<%=i%>*3"  end="<%=i*3+2 %>">
			<tr>
				<td class="menuName" style="text-align:center; ">${menuname }</td>		
			</tr>
		</c:forEach> --%>
	</tr>
	</c:forEach>
	</table>
	
	
	
	
	<!-- <table style="width:600px; height:300px; margin:auto; background-color: white;">
		<tbody>
				
				<tr class="img">
					<td class="scale"><img src="img/스테이크치즈.jpg" alt="스테이크치즈" width="200px" height="160px" onclick="detailStake.jsp">
					</td>
					<td class="scale"><img src="img/터키베이컨.jpg" alt="터키베이컨" width="200px" height="160px"></td>
					<td class="scale"><img src="img/로스트치킨.jpg" alt="로스트치킨" width="200px" height="160px"></td>
				</tr>
				<tr class="menuName" style="text-align : center;">
					<td>스테이크 치즈</td>
					<td>터키 베이컨 아보카도</td>
					<td>로스트 치킨</td>
				</tr>
				
			
				<tr class="img">
					<td class="scale"><img src="img/로티세리바베큐.jpg" alt="로티세리바베큐" width="200px" height="160px"></td>
					<td class="scale"><img src="img/서브웨이멜트.jpg" alt="서브웨이멜트" width="200px" height="160px"></td>
					<td class="scale"><img src="img/풀드포크.jpg" alt="풀드포크" width="200px" height="160px"></td>
				</tr>
				<tr class="menuName" style="text-align : center;">
					<td>로티세리바베큐</td>
					<td>서브웨이멜트</td>
					<td>풀드포크</td>
				</tr>
				
				<tr class="img">
					<td class="scale"><img src="img/쉬림프.jpg" alt="쉬림프" width="200px" height="160px"></td>
					<td class="scale"><img src="img/스파이시 이탈리안.jpg" alt="스파이시 이탈리안" width="200px" height="160px"></td>
					<td class="scale"><img src="img/써브웨이 클럽.jpg" alt="서브웨이 클럽" width="200px" height="160px"></td>
				</tr>
				<tr class="menuName" style="text-align : center;">
					<td>쉬림프</td>
					<td>스파이시 이탈리안</td>
					<td>써브웨이 클럽</td>
				</tr>
				
		</tbody>
	</table> -->
	<%@include file="common/footer.jspf" %>
</body>
</html>