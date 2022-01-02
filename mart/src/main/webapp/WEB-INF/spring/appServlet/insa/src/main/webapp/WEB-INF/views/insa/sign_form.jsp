<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
</head>
<body onload="document.f.user_id.focus();">
    <f:form name="f" action="${pageContext.request.contextPath }/insa/sign"
        method="POST" modelAttribute="member2Vo">
        <table>
            <tr>
                <td>아이디 (영문 3글자+숫자 3글자 조합)</td>
         <!-- <td><input type="text" id="user_id" name="user_id" onfocus="this.value=''"/></td> -->
                <td><f:input path="user_id" /></td>
                <td><input type="button" value="중복확인" onclick="check_id()" />
                <f:errors path="user_id" cssClass="error" /></td>
            </tr>
            <tr>
                <td>비밀번호(6~20자리)</td>
                <!-- <td><input type="password" id="password" /></td> -->
                <td><f:password path="password" /> </td>
                <td><f:errors path="password"
                        cssClass="error" /></td>
            </tr>
            <tr>
                <td>이름</td>
                <!-- <td><input type="text" id="name" /></td> -->
                <td><f:input path="name" /> </td>
                <td><f:errors path="name"
                        cssClass="error" /></td>
            </tr>
            <tr>
                <td>email</td>
                <!-- <td><input type="text" id="email" /></td> -->
                <td><f:input path="email" /> </td>
                <td><f:errors path="email"
                        cssClass="error" /></td>
            </tr>
            <tr>
                <td>핸드폰(010-1234-1234)</td>
                <!-- <td><input type="text" id="phone" /></td> -->
                <td><f:input path="phone" /> </td>
                <td><f:errors path="phone"
                        cssClass="error" /></td>
            </tr>
            <tr>
                <td>생년월일</td>
                <!-- <td><input type="date" id="birth_day" /></td> -->
                <td><f:input type="date" path="birth_day" /></td>
                <td></td>
            </tr>
            <tr>
                <td>양력/읍력 사용</td>
                <!-- <td><select name="solar_yn" id="solar_yn">
                        <option value="1">양력</option>
                        <option value="0">음력</option>
                </select></td> -->
                <td><f:select path="solar_birth_yn" id="solar_birth_yn">
                        <f:option value="1">양력</f:option>
                        <f:option value="0">음력</f:option>
                    </f:select></td>
            </tr>
            <tr>
                <td>주소</td>
                <!-- <td><input type="text" id="address" /></td> -->
                <td><f:input path="address" /> </td>
                <td><f:errors path="address"
                        cssClass="error" /></td>
            </tr>
        </table>

        <input type="submit" value="가입">
        <input type="reset" value="리셋">
        <input type="button" value="취소" onclick="cancel_sign()">
        <input type="hidden" id="client_id_sign" value="">
    </f:form>
    ${MSG }
</body>
</html>
