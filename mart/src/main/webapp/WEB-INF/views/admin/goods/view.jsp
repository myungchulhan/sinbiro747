<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		상품등록
		</div>
		<div>
		<form role="form" method="post"  id="formObj" autocomplete="off">
		<input type="hidden" name="n" value="${goods.gdsNum}" />
		<div class="inputArea"> 
		 <label>1차 분류</label>
		 <span class="category1"></span>        
		 <label>2차 분류</label>
		 <span class="category2">${goods.cateCode}</span>
		</div>
		
		<div class="inputArea">
		 <label for="gdsName">상품명</label>
		 <span>${goods.gdsName}</span>
		</div>
		
		<div class="inputArea">
		 <label for="gdsPrice">상품가격</label>
		 <span><fmt:formatNumber value="${goods.gdsPrice}" pattern="###,###,###"/></span>
		</div>
		
		<div class="inputArea">
		 <label for="gdsStock">상품수량</label>
		 <span>${goods.gdsStock}</span>
		</div>
		
		<div class="inputArea">
		 <label for="gdsDes">상품소개</label>
		 <span>${goods.gdsDes}</span>
		</div>
		
		<div class="inputArea">
		 <button type="button" id="modify_Btn" class="btn btn-warning">수정</button>
		 <button type="button" id="delete_Btn" class="btn btn-danger">삭제</button>
		</div>
		
		</form>
		</div>		
	</section>
	
	<footer id="footer">
		<div id="footer_box">
		<%@include file="/WEB-INF/views/admin/include/footer.jsp"%>
		</div>
	</footer>			
</div>
<script language='javascript'>

$(document).ready(function() {

	$('#modify_Btn').click(function() {

		$(location).attr('href','modify?n=${goods.gdsNum}');

	});
	
	$("#delete_Btn").click(function(){
		 
		 var con = confirm("정말로 삭제하시겠습니까?");
		 
		 if(con) {      
			 $("#formObj").attr("action", "/admin/goods/delete");
			 $("#formObj").submit();
		 }
		});

});

</script>

</body>
</html>
