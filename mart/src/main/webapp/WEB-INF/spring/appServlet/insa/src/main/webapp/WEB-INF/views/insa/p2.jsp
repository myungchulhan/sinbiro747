
<%@ page session="true" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
 <title>jQuery Table Sort</title>


<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="http://autotab.mathachew.com/js/jquery.autotab.js"></script>
<script>
function addCode(code){
	console.log("동작2222");
	var result = "";
	$(':input').each(function(index) {
		result += "태그명 : " + this.tagName // $(this).get(0).tagName
		    + ", type 속성명 : " + $(this).attr('type') + '\n';
		 $(this).attr("disabled",true);
	});

	console.log(result);
	
	
	//$("button").attr("disabled", true);
	var str = "<span><input type='text' id='subcodename" + code + "'></span>"
			+  "<input type='button' value='생성' onclick='addCode2(" + code + ")'>";
	$("#code"+code).append(str);
	console.log(str);
}

function addCode2(code){
	console.log("동작4444");
//	var subcodename =  $("#subcodename" + code).val();
	
	var params = {
		subcode : code,
		subcodename : $("#subcodename" + code).val()			
	}
		
		$.ajax({
	    type : "POST",
	    url : "/cat2", 
	    data : params,
	   // data : $('form').serialize(),
	    error : function(error) {
	    	console.log("error");
	    },
	    success : function(data) {	    	
	    	loadData(data);		    	
	    }
	});
	
}

function loadData(data){
	
	$("#view1").html("");
	var jsonData = JSON.parse(data);
	//console.log(jsonData);
	
	jsonData.forEach(function(el, index){ 
		var space = "";
		if(el.level > 1) { 	
			space = "";
			for (var i = 0; i < (el.level-1); i++) {
				space += "&nbsp;&nbsp;&nbsp;&nbsp;"
			}
		}
		var str1 =  "<div id='code" + el.code1 + "'>"
		+ el.level + ": " + el.code1 + ": "+ space + el.codename
		+ "<input type='button' id='btn"+ el.code1 +"' value='+' onclick='addCode(" + el.code1 + ")'></div>";
		//	console.log(str1);
		$("#view1").append(str1);
		$("input[name=codename]").attr("disabled",false);
		$("input[name=btn1]").attr("disabled",false);
		//console.log(el.code1 + ": " + el.codename);
	
	});	
	
}


$(function(){
	var params = {
			subcode : 0,
			subcodename : ""			
		}
	
	$.ajax({
		type : "POST",
		url : "/cat2",
		data : params,
		// data : $('form').serialize(),
		error : function(error) {
			console.log("error");
		},
		success : function(data) {
			loadData(data);
		}
	});	
	

	
$("input[name=btn1]").click(function(){
console.log("동작");
		$.ajax({
		    type : "POST",
		    url : "/cat", 
		    data : $('form').serialize(),
		    error : function(error) {
		    	console.log("error");
		    },
		    success : function(data) {
		    	loadData(data);			
		    }
		});
	});	
});


</script>
<body>
카테고리 생성<br>  <input type="button" name="btn2" onclick="document.location.href='/p3'"  value="상품등록">
<form name="form1" method="POST">
코드등록 : <input type="text" name="codename">
<input type="button" name="btn1" value="등록">
<div id="view1" >

</div>
</form>


</body>
</html>