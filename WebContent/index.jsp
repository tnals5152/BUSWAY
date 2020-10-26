<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>

</head>
<body>
<%@include file="login/login.jspf" %>
	<%@include file="common/menu.jspf" %>
    <br>
        <div class="main_c"><img src="images/222.jpg" alt="BUSWAY" width="780" height="300">
    <br>
        <iframe width="780" height="300" src="https://www.youtube.com/embed/CPg0FBhdjeg" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
        </div>
    <br>
    <hr>
	<%@include file="common/footer.jspf" %>
</body>
</html>