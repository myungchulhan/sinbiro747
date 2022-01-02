<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
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
	
//.jsp 코드
    <section class="pr_img">
          <p>    
            <label for="img"><h2>상품 이미지</h2></label>
        </p>
        <div id="pr_img">
            <input type="file" id="img" name="pr_img"/>
            
        </div>
    </section>  
 
 
//Javascript 코드
    <script>
    
    var img_count = 0;
        
    //input 파일첨부 버튼 클릭하면 실행되는 change 메서드
    $("#img").change(function fileadd() {
        var reader = new FileReader;
    //이미지 파일 정보와 화면출력을 위해 <img> 태그를 변수로 만듦
        var str = "<img id='img_"+(img_count)+"' src=''/>";
    //파일 경로에 넣기 위해 String으로 변환시켜줌
        var img_count_string = img_count.toString();
        
    //jQuery append 메서드를 사용해 <div id="pr_img"> 안에 <img> 태그 변수를 추가해줌
        $("#pr_img").append(str);
    //<img src=""> 사용자가 업로드한 이미지 파일 경로를 src로 저장해줌(data.target.result) 
        
    //onload는 파일이 업로드 완료된 시점에 function을 발생시키는 메서드
        reader.onload = function(data) {
    //태그 안의 속성을 입력할 수 있는 jQuery attr 메서드를 사용 
            $('#img_' + img_count_string).attr('src', data.target.result).width(150);
        };
        
    //화면에 이미지를 출력해주는 FileReader 객체 인스턴스 reader.readAsDataURL();
    //this.files는 <input type="file">을 통해 업로드한 파일의 정보를 저장하고 있는 배열이다.
    //첨부하기 1회당 file 하나만 업로드해서 <img_0,1,2...>에 각각의 파일들을
    //할당시켜줄 것이기 때문에 files[0]로 index 고정
        reader.readAsDataURL(this.files[0]);
        
            img_count++;
    });
    </script>
</body>
</html>
