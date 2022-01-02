<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>new JSP</title>
</head>
<body>
<h3>메일보내기</h3>
<form action="/insa/mailer" method="post" enctype="multipart/form-data">
	<table>
		<tr>
			<th class="w-px160">제목</th>
			<td><input type="text" name="subject" value="열심히 살자"/></td>
		</tr>
		<tr>
			<th class="w-px160">메일주소</th>
			<td><input type="text" name="mailaddr" value="sinbiro747@naver.com"/></td>
		</tr>
		<tr>
			<th class="w-px160">첨부파일</th>
			<td><input type="file" name="fileadd" /></td>
		</tr>		
	
	</table>
	
<div class="btnSet">
	<button type="submit">저장</button>
</div>	
	
</form>


</body>
</html>