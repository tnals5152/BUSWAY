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
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<%
	request.setCharacterEncoding("UTF-8");
	ShopVO svo = (ShopVO)request.getAttribute("svo");
	String menusort = request.getParameter("menusort");
	session.setAttribute("menusort", menusort);
%>
<script>
	var pop = "";
	$(function(){
		$("#promo").on({
			"mouseenter":function(){
				$(this).prop("color","green");
			},
			"mouseout":function(){
				$(this).prop("color","gray");
			}
			
		});
	});
	
	
	function detail(){
		/* var idx = document.img2.value;
		alert(idx); */
		
		alert();
	}
	
	function refresh(){
		document.location.href="empty3.jsp";
	}
	function order(idx, price15, price30, menusort){
		var url = "";
		if(menusort != '샌드위치'){
			url = "orderStart.jsp?menusort=" + menusort + "&sort=cheese&idx=" + idx + "&price15=" + price15 + "&price30=" + price30;
		}else{
			url = "orderStart.jsp?menusort=" + menusort + "&sort=bread&idx=" + idx + "&price15=" + price15 + "&price30=" + price30;
		}
		pop = window.open(url,"명칭","width=1000, height=800, top=50%, left=50%, scrollbars=yes");
	}
	

</script>
<style>
	/* #div1 {
		width : 100%; height : 20%;
		background-color : #0E8C43;
	} */
	.menuname{  font-family: "나눔고딕"; font-weight: bold; font-size:1.5em;}
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
	.textEx { font-family:"나눔고딕"; font-size: 0.5rem;  }
</style>
</head>
	<body>
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
		
	
	<table id="menutable">
		<tr>
				<td class="scale" rowspan="4"><a href="detail.jsp?idx=${svo.idx}"><img src="images/${svo.p_img}" 
						alt="사진" width="200px" height="200px"></a></td>
				<td class="menuname">${svo.menuname}
					<input Type="button" value="추천꿀조합" onclick="">
				</td>
				
		</tr>
		<tr>
			<td class="text">${svo.p_content}</td>
		</tr>
		<tr>
			<td colspan="2"><input Type="button" value="주문 시작하기" onclick="order('${svo.idx}', '${svo.price15 }', '${svo.price30 }', '${menusort }');" ><!-- svo.idx : ShopVO(메뉴)의 idx -->
			</td>
		</tr>
			
		
	</table>
	
	
	
	
	
</body>
</html>