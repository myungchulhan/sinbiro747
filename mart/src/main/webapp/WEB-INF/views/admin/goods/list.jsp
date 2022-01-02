<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="/resources/bootstrap/css/admin.css">
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
		<style>
		#container_box table td {width:100px;}
		</style>
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
		<div >
		상품목록
		</div>
		<div id="container_box">
		<table>
		 <thead>
		  <tr>
		   <th>번호</th>
		   <th>이름</th>
		   <th>카테고리</th>
		   <th>가격</th>
		   <th>수량</th>
		   <th>등록날짜</th>
		  </tr>
		 </thead>
		 <tbody>
		  <c:forEach items="${list}" var="list">
		  <tr>
		   <td><a href="/admin/goods/view?n=${list.gdsNum}">${list.gdsName}</a></td>
		   <td>${list.gdsName}</td>
		   <td><fmt:formatNumber value="${list.cateCode}" pattern="###,###,###" /></td>
		   <td>${list.gdsPrice}</td>
		   <td>${list.gdsStock}</td>
		   <td><fmt:formatDate value="${list.gdsDate}" pattern="yyyy-mm-dd" /></td>
		  </tr>   
		  </c:forEach>
		 </tbody>
		</table>
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
