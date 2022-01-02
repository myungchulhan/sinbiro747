<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
 <title>jQuery Table Sort</title>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>

var data = JSON.parse('${code}');

var maxlevel = data.map(function(el){ return el.level });
maxlevel = Math.max.apply(null,maxlevel);
//console.log("최대레벨2:"+maxlevel);




$(document).ready(function() {

	$("#code1").change(function(){
		var selcode = $(this).val();
		var level = $(this).attr('id').replace(/[^\d]/g, "");
		
		for (var i = 1; i <= maxlevel; i++) {
			if(i > level){ 
				$("#code"+i).children().remove(); 
			}			
		}
		
		makeCode(selcode);
	});
	
	$("#code2").change(function(){
		var selcode = $(this).val();
		$("#code3").children().remove();
		$("#code4").children().remove();
		makeCode(selcode);
	});
	
	$("#code3").change(function(){
		var selcode = $(this).val();
		$("#code4").children().remove();
		makeCode(selcode);
	});
	
	var makeCode = function(selcode){
		
		var level = 0;
		var codestr = "";
		data.forEach(function(el, index){
			if( selcode == 0 && el.level == 1){
				codestr += "<option value='" + el.code1 + "'>" + el.codename + "</option>";
				level = el.level;
			}else if( selcode == el.code2){
				codestr2 += "<option value='" + el.code1 + "'>" + el.codename + "</option>";
				level = el.level;
			}	
		});	
		
		$("#code"+level).append(codestr);			
	}
	
	makeCode(0);	
});

</script>
<body>
<p align="center">
<div id="tcode">
	<select id="code1">
	<option value="">전체</option>	
	</select>
	
	<select id="code2">
	<option value="">전체</option>	
	</select>
	
	<select id="code3">
	<option value="">전체</option>	
	</select>
	
	<select id="code4">
	<option value="">전체</option>	
	</select>
	
</div>
</p>

</body>
</html>