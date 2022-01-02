<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<head>
<title>파일업로드예제</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>

	<form action="/insa/test"
		method="post" enctype="multipart/form-data">
		<label><input type="file" name="upload" /></label> <label>
		<input type="file" name="upload" /></label> <input type="submit" value="업로드" />
	</form>
<a href="/download?id=55">다운로드</a>



</body>
</html>