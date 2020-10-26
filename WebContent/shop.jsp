<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BUSWAY</title>
<link href="css/menu.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/main.css" />
<link rel="stylesheet" type="text/css" href="css/login.css" />
<link rel="stylesheet" type="text/css" href="css/footer.css" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="js/login.js"></script>
<script src="js/menu.js"></script>
<script>
	//prev, next 버튼이 클릭되었을 때 처리
	//prev : 이전 이미지 표시, next : 다음 이미지 표시
	$(document).ready(function(){
	    var imgNum = 1;
	    //next 버튼 클릭시 : 다음이미지 표시(img태그 src변경)
	    $("#next").click(function(){
	        imgNum++;
	        if (imgNum > 3) imgNum = 1; //처음 이미지로 변경
	        //if (imgNum < 3) {
	         //   imgNum = "0" + imgNum;
	        //}
	        $("#img").prop("src", "ad/main0" + imgNum + ".jpg");
	    });
	    //prev 버튼 클릭시 : 이전 이미지 표시
	    $("#prev").click(function(){
	        imgNum--;
	        if (imgNum < 1) imgNum = 3; //마지막 이미지로 변경
	        /* imgNum = (imgNum < 3) ? "0"+imgNum : imgNum; */
	        console.log(imgNum);
	        
	        $("#img").prop("src", "ad/main0" + imgNum + ".jpg");
	    });
	});
	
	
</script>
</head>
<body>
	<%@include file="login/login.jspf" %>
	<%@include file="common/menu.jspf" %>
	<div>
    <br><br><br> <br><br><br> <br>
        <div id="mainDiv" >
		  <span><a id="prev" href="#"><img src="images/pre.png" ></a></span>
		  <img id="img" src="ad/main01.jpg" alt="AD">
	      <span><a id="next" href="#"><img src="images/next.png"></a></span>
		</div>
    <br>
        <iframe style="left: 50%; margin-left: -390px;" width="780" height="300" src="https://www.youtube.com/embed/CPg0FBhdjeg" 
        frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" 
        allowfullscreen></iframe>
        
      <div style= 'width:1110px; left:50%; margin-left:-555px; position:absolute;'>
    	<a class="event" href="controller?type=E_List"><!-- 이벤트 페이지로 가게 바꾸기 -->
    	<img id=use src="images/올리브배경.png"/>
    	</a>
    	<a class="event" href="controller?type=Q_BBS"><!-- 문의하기 게시판으로 가게 바꾸기 -->
    	<img id=use2 src="images/역사배경.png"/>
    	</a>
    </div>  
        
    </div>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<%@include file="common/footer.jspf" %>
</body>
</html>









