<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.table-column {
   text-align: center;
    font-size: 14px;
    background-color: #ddffaa;
}
.error {
    margin-left: 5px;
    color: red;
    font-size: 12px;
}
 
</style>
</head>
<body>
<div align="center">
<h3> 회원가입 예제 </h3>
<h2><spring:message code="Pattern.personVo.name" /></h2>
<hr width="600" />
<p/>
    <form:form action="join" method="post" commandName="personVO">
        <table border="1" width="500" cellpadding="5" cellspacing="0">
            <colgroup>
                <col width="20%">
                <col width="80%">
            </colgroup>
            <tr>
                <td class="table-column">이름</td>
                <td class="table-danger">
                    <form:input path="name" size="20" />
                    <form:errors path="name" cssClass="error" />
                </td>
            </tr>
            <tr>
                <td class="table-column">나이</td>
                <td>
                    <form:input path="age" size="10"/>
                    <form:errors path="age" cssClass="error" />
                </td>
            </tr>
            <tr>
                <td class="table-column">아이디</td>
                <td>
                    <form:input path="id" size="20" />
                    <form:errors path="id" cssClass="error" />
                </td>
            </tr>
            <tr>
                <td class="table-column">주소</td>
                <td>
                    <form:input path="address" size="40" />
                    <form:errors path="address" cssClass="error" />
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="전송" /> &nbsp; &nbsp;
                    <input type="reset" value="취소" />
                </td>
            </tr>
        </table>
    </form:form>
</div>
</body>
</html>
