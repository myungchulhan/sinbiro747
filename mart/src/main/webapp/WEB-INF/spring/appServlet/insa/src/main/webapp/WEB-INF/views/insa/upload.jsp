<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
  <title>파일업로드예제</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

  <script src="/resources/jsutil/fileSave.js?v=<%=System.currentTimeMillis() %>"></script>
</head>
<body>

<div class="container">
  <h2>파일업로드</h2>
  <form name="dataForm" id="dataForm" onsubmit="return registerAction('modify')">
<ui>
	<li>이름:<input type="text" name ="name" value="" /></li>
	<li>나이:<input type="text" name ="age" value="" /></li>
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
  	<button id="btn-upload" type="button" style="border: 1px solid #ddd; outline: none;">파일 추가</button>
  	<input id="input_file" multiple="multiple" type="file" style="display:none;">
  	<span style="font-size:10px; color: gray;">※첨부파일은 최대 10개까지 등록이 가능합니다.</span>
  	<div class="data_file_txt" id="data_file_txt" style="margin:40px;">
		<span>첨부 파일</span>
		<br />
		<div id="articlefileChange">
		</div>
	</div>
  	<button type="submit" style="border: 1px solid #ddd; outline: none;">전송</button>
  </form>
</div>



</body>
</html>