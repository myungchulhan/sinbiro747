<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>eeeeee
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/resources/jquery/jquery-3.3.1.min.js"></script>

<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="/resources/bootstrap/css/admin.css">
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<div id="root">
	<header>
		<div id="header_box">
		<%@include file="/WEB-INF/views/admin/include/header.jsp"%>
		</div>
	</header>

	<nav id="nav">
		<div id="nav_box">
		<%@include file="/WEB-INF/views/admin//include/nav.jsp"%>
		</div>
	</nav>
	
	<section id="container">
		<aside>
		<%@include file="/WEB-INF/views/admin//include/aside.jsp"%>
		</aside>
		<div id="container_box">
		관리자화면
		</div>
	</section>
	
	<footer id="footer">
		<div id="footer_box">
		<%@include file="/WEB-INF/views/admin/include/footer.jsp"%>
		</div>
	</footer>			
</div>
</body>
</html>
