<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="/WEB-INF/views/include/nav.jsp"%>
<section id="content">
 <form role="form" method="post" autocomplete="off">
  <div class="input_area">
   <label for="userId">아이디</label>
   <input type="email" id="userId" name="userId" value="test@naver.com" placeholder="example@email.com" required="required" />      
  </div>
  
  <div class="input_area">
   <label for="userPass">패스워드</label>
   <input type="password" id="userPass" name="userPass"  value="1234" required="required" />      
  </div>
  
  <div class="input_area">
   <label for="userName">닉네임</label>
   <input type="text" id="userName" name="userName"  value="빙신" placeholder="닉네임을 입력해주세요" required="required" />      
  </div>
  
  <div class="input_area">
   <label for="userPhon">연락처</label>
   <input type="text" id="userPhon" name="userPhon"  value="010-344-3434" placeholder="연락처를 입력해주세요" required="required" />      
  </div>
  
  <button type="submit" id="signup_btn" name="signup_btn">회원가입</button>
  
 </form>   
</section>
<%@include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
