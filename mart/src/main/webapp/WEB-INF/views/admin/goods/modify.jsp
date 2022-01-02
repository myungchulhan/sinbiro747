<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		상품수정
		</div>
		<div>
			<form role="form" method="post" autocomplete="off">
			
			<input type="hidden" name="gdsNum" value="${goods.gdsNum}" />
			
			<div class="inputArea"> 
			 <label>1차 분류</label>
			 <select class="category1">
			  <option value="">전체</option>
			 </select>   
			 <label>2차 분류</label>
			 <select class="category2" name="cateCode">
			  <option value="">전체</option>
			 </select>
			</div>
			<div class="inputArea">
			 <label for="gdsName">상품명</label>
			 <input type="text" id="gdsName" name="gdsName" value="${goods.gdsName}"/>
			</div>
			<div class="inputArea">
			 <label for="gdsPrice">상품가격</label>
			 <input type="text" id="gdsPrice" name="gdsPrice" value="${goods.gdsPrice}"/>
			</div>
			<div class="inputArea">
			 <label for="gdsStock">상품수량</label>
			 <input type="text" id="gdsStock" name="gdsStock" value="${goods.gdsStock}"/>
			</div>
			<div class="inputArea">
			 <label for="gdsDes">상품소개</label>
			 <textarea rows="5" cols="50" id="gdsDes" name="gdsDes">${goods.gdsDes}</textarea>
			</div>
			<div class="inputArea">
			 <button type="submit" id="update_Btn" class="btn btn-primary">완료</button>
			 <button type="button" id="back_Btn" class="btn btn-warning">취소</button> 
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

<script>
$(document).ready(function() {
	
 $("#back_Btn").click(function(){
	  //history.back();
	  location.href = "/admin/goods/view?n=" + ${goods.gdsNum};
	 });   
}); 
  </script>

<script>
// 컨트롤러에서 데이터 받기
var jsonData = JSON.parse('${category}');
//document.write('${category}');
var cate1Arr = new Array();
var cate1Obj = new Object();

// 1차 분류 셀렉트 박스에 삽입할 데이터 준비
for(var i = 0; i < jsonData.length; i++) {
 
 if(jsonData[i].level == "1") {
  cate1Obj = new Object();  //초기화
  cate1Obj.cateCode = jsonData[i].cateCode;
  cate1Obj.cateName = jsonData[i].cateName;
  cate1Arr.push(cate1Obj);
 }
}

// 1차 분류 셀렉트 박스에 데이터 삽입
var cate1Select = $(".category1")

for(var i = 0; i < cate1Arr.length; i++) {
 cate1Select.append("<option value='" + cate1Arr[i].cateCode + "'>"
      + cate1Arr[i].cateName + "</option>"); 
}

$(document).on("change", ".category1", function(){

	 var cate2Arr = new Array();
	 var cate2Obj = new Object();
	 $(".cateCode").val($(this).val());
	 // 2차 분류 셀렉트 박스에 삽입할 데이터 준비
	 for(var i = 0; i < jsonData.length; i++) {
	  
	  if(jsonData[i].level == "2") {
	   cate2Obj = new Object();  //초기화
	   cate2Obj.cateCode = jsonData[i].cateCode;
	   cate2Obj.cateName = jsonData[i].cateName;
	   cate2Obj.cateCodeRef = jsonData[i].cateCodeRef;
	   
	   cate2Arr.push(cate2Obj);
	  }
	 }
	 
	 var cate2Select = $("select.category2");
	 cate2Select.children().remove();

	  var selectVal = $(this).val();  
	  cate2Select.append("<option value='"+selectVal+"'>전체</option>");
	  
	  for(var i = 0; i < cate2Arr.length; i++) {
	   if(selectVal == cate2Arr[i].cateCodeRef) {
	    cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
	         + cate2Arr[i].cateName + "</option>");
	   }
	  }	 
	});
	
var select_cateCode = '${goods.cateCode}';
var select_cateCodeRef = '${goods.cateCodeRef}';
var select_cateName = '${goods.cateName}';

if(select_cateCodeRef != null && select_cateCodeRef != '') {
 $(".category1").val(select_cateCodeRef);
 $(".category2").val(select_cateCode);
 $(".category2").children().remove();
 $(".category2").append("<option value='"
       + select_cateCode + "'>" + select_cateName + "</option>");
} else {
 $(".category1").val(select_cateCode);
 $(".category2").val(select_cateCode);
 // select_cateCod가 부여되지 않는 현상이 있어서 아래 코드로 대체
 //$(".category2").append("<option value="' + select_cateCode + '" selected='selected'>전체</option>");
}
</script>
</body>
</html>
