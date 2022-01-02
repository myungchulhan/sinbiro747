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
<c:if test="${member == null}">
<section id="content">
 <form role="form" method="post" autocomplete="off">
  <div class="input_area">
   <label for="userId">아이디</label>
   <input type="email" id="userId" name="userId" value="m@mm.com" required="required" />      
  </div>
  
  <div class="input_area">
   <label for="userPass">패스워드</label>
   <input type="password" id="userPass" name="userPass"  value="1234" required="required" />      
  </div>
       
  <button type="submit" id="signin_btn" name="signin_btn">로그인</button>
  
  <c:if test="${msg == false}">
   <p style="color:#f00;">로그인에 실패했습니다.</p>
  </c:if>
  
 </form>   
</section>
  </c:if>
<%@include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
