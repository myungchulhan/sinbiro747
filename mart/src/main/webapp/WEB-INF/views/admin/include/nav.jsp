<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<ul>
<c:if test="${member != null}">
 <li>
  <a href="/">일반회원2"${member.userId}"</a>
 </li>
 <li>
  <a href="/member/logout">로그아웃</a>
 </li>
 </c:if>
</ul>