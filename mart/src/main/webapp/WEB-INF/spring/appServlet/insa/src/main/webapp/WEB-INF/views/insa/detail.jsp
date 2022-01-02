<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
$(function(){
		
		$('input[name=modifyBtn]').click(function(){
			//location.href = "modify?id=${n.id}";
			//$(location).attr('href','modify?id=${n.id}');
					form.submit();
		});	

/* 		$('input[name=delBtn]').click(function(){
			location.href = "delete?id=" + $("input[name=id]").val(); 
		});	 */		
		
		$('input[name=listBtn]').click(function(){
			  $("#form").attr("action", "list");
			  $("#form").attr("method", "GET");  
			  $("#form").submit(); 
		});	
		
		$('input[name=delBtn]').click(function(){
			  $("#form").attr("action", "delete");
			  $("#form").attr("method", "GET");  
			  $("#form").submit(); 
		});		
		
		var gender = "";
		if("${n.gender}" == "m"){
			gender="남자"
		}else if("${n.gender}" == "f"){
			gender="여자"
		}
		$("#gender").append(gender);
		
		var part = "";
		if("${n.part}" == "100"){
			part="기획부"
		}else if("${n.part}" == "200"){
			part="경영부"
		}else if("${n.part}" == "300"){
			part="홍보부"
		}
		$("#part").append(part);
		
});
	
	
	
	
</script>
</head>
<body>
<form id="form" role="form" action="modify"  method="GET">
<input type="hidden" name="id" value="${param.id}" />
<input type="hidden" name="curPage"  value="${param.curPage}" />
<input type="hidden" name="searchType"  value="${param.searchType}" />
<input type="hidden" name="searchWord"  value="${param.searchWord}" />
<ui>
	<li>이름:${n.name}</li>
	<li>나이:${n.age}</li>
	<li id="gender">성별: </li>
	<li id="part">부서: </li>
	<li>취미: ${n.hobby}</li>
</ui>
<ui><br />
	<li>첨부파일</li><br />
	<c:forEach var="f" items="${fileDatil}">
		<li><a href="/download?id=${f.id}"> 파일명:${f.originalFileName}</a></li>
	</c:forEach>
</ui>
<div style="width:200px; padding:10px; text-align:right">
<input name="modifyBtn" type="button" value="수정">
<input name="delBtn" type="button" value="삭제">
<input name="listBtn" type="button" value="목록">
</div>

</form>
</body>
</html>