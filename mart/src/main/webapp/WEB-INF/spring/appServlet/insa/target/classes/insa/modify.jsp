<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="/resources/jsutil/fileSave.js?v=<%=System.currentTimeMillis() %>"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
$(function(){
	$('select[name=part]').val('${n.part}').prop("selected", true);

	$("input:radio[name ='gender'][value='${n.gender}']").attr("checked", true);
	
	var splitCode = '${n.hobby}'.split(",");
	for(var idx in splitCode) {
		$("input[name=hobby][value=" + splitCode[idx] + "]").attr("checked",true);
	}

//	$("input[name=modifyBtn]").click(function(){
//		$("input[name=modify]").submit();
//	});

});
</script>
</head>
<body>
<form name="dataForm" id="dataForm" >
<input type="hidden" name="id" value="${param.id}" />
<input type="hidden" name="curPage"  value="${param.curPage}" />
<input type="hidden" name="searchType"  value="${param.searchType}" />
<input type="hidden" name="searchWord"  value="${param.searchWord}" />
<ui>
	<li>이름:<input type="text" name ="name" value="${n.name}" /></li>
	<li>나이:<input type="text" name ="age" value="${n.age}" /></li>
	<li>성별: 남<input type="radio" name ="gender" value="m" />녀<input type="radio" name ="gender" value="f" /></li>
	<li>부서:
	<select name="part">
		<option value="">선택</option>
		<option value="100">기획부</option>
		<option value="200">경영부</option>		
		<option value="300">홍보부</option>		
	</select></li>
	<li>취미: <input type="checkbox" name="hobby" value="낚시">
	<input type="checkbox" name="hobby" value="독서">
	<input type="checkbox" name="hobby" value="여행">
	<input type="checkbox" name="hobby" value="멍때리기"></li>	
</ui>
<ui><br />
  	<button id="btn-upload" type="button" style="border: 1px solid #ddd; outline: none;">파일 추가</button>
  	<input id="input_file" multiple="multiple" type="file" style="display:none;">
  	<span style="font-size:10px; color: gray;">※첨부파일은 최대 10개까지 등록이 가능합니다.</span>
  	<div class="data_file_txt" id="data_file_txt" style="margin:40px;">
		<span>첨부 파일</span>
		<br />
		<div id="articlefileChange">
		</div>
	</div><br /><br />

	<li>첨부파일</li><br />
	<c:forEach var="f" items="${fileDatil}">
		<div id="${'file'}${f.id}"><a href="/download?id=${f.id}"> 파일명:${f.originalFileName}</a>
		<input onclick="fileDelete2('${'file'}${f.id}')" type="button" value="삭제"></div>

	</c:forEach>
    

       		
</ui>
<div style="width:200px; padding:10px; text-align:right">
<input type="button" name="modifyBtn" value="수정" onclick="return registerAction('modify')">
</div>

</form>
</body>
</html>