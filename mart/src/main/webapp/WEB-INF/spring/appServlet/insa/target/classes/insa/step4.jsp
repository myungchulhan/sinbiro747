<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
	<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/index.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style-signup.css">

    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script>


</script>
<body>
<div class="panel-body">
    <div class="row">
        <div class="col-lg-12">
            <h4>회원가입</h4>
        </div>    
<form method="POST" action="${pageContext.servletContext.contextPath }/insa/step4">

        이름 : <input name="name" type="text" value="">
			<spring:hasBindErrors name="user1Vo"> 
			            <c:if test="${errors.hasFieldErrors('name') }">                                     			
			            <strong>${errors.getFieldError( 'name' ).defaultMessage }</strong>			
			</c:if>

			</spring:hasBindErrors>



        이메일 : <input id="email" name="email" type="text" value="">
			<spring:hasBindErrors name="user1Vo"> 
			            <c:if test="${errors.hasFieldErrors('email') }">                                     			
			            <strong><spring:message code="${errors.getFieldError('email').codes[0]}"/></strong>			
			</c:if>

			</spring:hasBindErrors>


        비밀번호 : <input name="pwd" type="password" value="">



        <fieldset>

               <legend>성별</legend>

               <label>여</label> <input type="radio" name="gender" value="female" checked="checked">

               <label>남</label> <input type="radio" name="gender" value="male">

        </fieldset>



        <input type="submit" value="가입하기">

</form>
    </div>
</div>



</body>
</html>