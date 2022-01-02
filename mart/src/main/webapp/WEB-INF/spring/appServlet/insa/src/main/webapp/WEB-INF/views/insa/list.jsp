<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<title>kuzuro 게시판</title>

<!-- 제이쿼리 -->
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script>

	function fn_paging(curPage) {
	     self.location = "list?"
		     + 'curPage=' + curPage
		     + "&searchType=" + $("#searchType option:selected").val()
		     + "&searchWord=" + encodeURIComponent($('#searchWord').val()); 
		
/* 		$(location).attr("href", "/insa/pager?curPage=" + curPge
		+ "&searchType=" + $("#searchType option:selected").val()
	    + "&searchWord=" + encodeURIComponent($('#searchWord').val(); 		
		); */
	}
	
$(function(){	
	$("#allBtn").click(function(){
		alert("sss");
		self.location = "list";
	});
});	
</script>
</head>
<body>
<form>
<input type="hidden" id="save" value="">

</form>
	<!-- <div id="root"> -->
	<div class="container">


		<!-- <section id="container"> -->
		<section>
			<h2>글 목록</h2>

			<table class="table table-hover">
				<thead>
					<tr>
						<th>글 번호</th>
						<th>이름</th>
						<th>나이</th>
						<th>부서</th>
						<th>취미</th>
					</tr>
				</thead>
				<!-- 목록 시작 -->
				<c:if test="${pagination.listCnt eq 0}">
				<tr style="text-align:center;"><td colspan="5">조회된 목록이 없습니다.</td></tr>
				</c:if>
				<c:if test="${pagination.listCnt ne 0}">
				<c:forEach items="${list}" var="list">
					<tr>
						<td>${list.id}</td>
						<td><a href="#" onclick= "detailMove('${list.id}')">${list.name}</a>			
						</td>

						<td>${list.age}</td>
						<td>${list.part}</td>
						<td>${list.hobby}</td>
					</tr>		
				</c:forEach>
				</c:if> 
				<!-- 목록 끝 -->
			</table>
						<script>
							function detailMove(id) {
							//var str=	$("#detailMove");
							 	 var str = "&curPage=${pagination.curPage}"									 	 
									     + "&searchType=" + $("#searchType option:selected").val()
									     + "&searchWord=" + encodeURIComponent($('#searchWord').val()); 
								
								self.location = "detail?id="+ id + str; 
							}
						</script>
			<div class="search row">
				<div class="col-xs-2 col-sm-2">
					<select name="searchType" id="searchType" class="form-control">
					  <option value="">--검색선택--</option>
					  <option value="n"<c:out value="${pagination.searchType eq 'n' ? 'selected' : ''}"/>>이름</option>
					  <option value="g"<c:out value="${pagination.searchType eq 'g' ? 'selected' : ''}"/>>성별</option>
					  <option value="h"<c:out value="${pagination.searchType eq 'h' ? 'selected' : ''}"/>>취미</option>
					  <option value="nh"<c:out value="${pagination.searchType eq 'nh' ? 'selected' : ''}"/>>이름+취미</option>
					</select>
				</div>

				<div class="col-xs-10 col-sm-10" style="width:400px;">
					<div class="input-group">
						<input type="text" name="searchWord" id="searchWord"
							value="${pagination.searchWord}" class="form-control" /> <span
							class="input-group-btn">
							<button id="searchBtn" class="btn btn-default">검색</button>	
							<button id="allBtn" class="btn btn-default">전체</button>													
						</span>
					</div>
				</div>
				  <script>
				 $(function(){
				  $('#searchBtn').click(function() {
					  
				     self.location = "list?"
				     + 'curPage=1'
				     + "&searchType=" + $("#searchType option:selected").val()
				     + "&searchWord=" + encodeURIComponent($('#searchWord').val()); 
				    });
				 });   
				 </script>
			</div>	
			
			 
			<div class="col-md-offset-3">
				<ul class="pagination">
					<c:if test="${pagination.curRange > 1 }">
						<li><a href="#" onClick="fn_paging(1)">[처음]</a></li>
						<li><a href="#" onClick="fn_paging('${pagination.prevPage }')">[이전]</a></li>
					</c:if>
					<c:forEach var="pageNum" begin="${pagination.startPage }"
						end="${pagination.endPage }">
						<c:choose>
							<c:when test="${pageNum eq  pagination.curPage}">
								<li><span style="font-weight: bold;"><a href="#"
									onClick="fn_paging('${pageNum }')">${pageNum }</a></span></li>
							</c:when>
							<c:otherwise>
								<li><a href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${pagination.curRange < pagination.rangeCnt}">
						<li><a href="#" onClick="fn_paging('${pagination.nextPage }')">[다음]</a></li>
						<li><a href="#" onClick="fn_paging('${pagination.pageCnt }')">[끝]</a></li>
					</c:if>
				</ul>
			</div>

			<div>총 게시글 수 : ${pagination.listCnt } / 총 페이지 수 :
				${pagination.pageCnt } / 현재 페이지 : ${pagination.curPage } / 현재 블럭 :
				${pagination.curRange } / 총 블럭 수 : ${pagination.rangeCnt }
			</div>


		</section>

		<footer> </footer>
	</div>
</body>
</html>
