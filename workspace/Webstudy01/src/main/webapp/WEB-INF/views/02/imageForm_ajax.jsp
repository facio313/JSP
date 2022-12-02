<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jpeg-red, png-green, gif-blue -->
<style>
.red {
	background-color : red;
}
.green {
	background-color : green;
}
.blue {
	background-color : blue;
}
</style>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery-3.6.1.min.js"></script>
</head>
<body>
	<form name="imgForm" action="<%=request.getContextPath()%>/ImageStreaming.do">
		<select name="image">
		</select>
		<input type="submit" value="전송">
	</form>
	<div id="imgArea">
<%-- 		<img src="<%=request.getContextPath()%>/ImageStreaming.do?image=cat1.jpg" /> --%>
	</div>
<script src="<%= request.getContextPath() %>/resources/js/jquery-3.6.1.min.js"></script>
<script>
	const DIVTAG = $("#imgArea");
	const SELECTTAG = $("[name=image]").on("change", function(event){
		let option = $(this).find("option:selected");
		let mime = option.attr("class");
		let clzName = matchedClass(mime);
		$(this).removeClass(colors);
		$(this).addClass(clzName);
		
		let srcURL = document.imgForm.action;
		let queryString = $(document.imgForm).serialize();
		let src = "%U?%P".replace("%U", srcURL).replace("%P", queryString);
		
		let img = $("<img>").attr("src", src)
		DIVTAG.html(img);
// 	}).on("change", function(event){
// 		event.target===this
<%-- 		$('img').attr("src", "<%=request.getContextPath()%>/ImageStreaming.do?image=" + $(this).val()); --%>
	});
	const changeCondition = {
			jpeg : "red",
			png : "green",
			gif : "blue"
	}
	const colors = [];
	$.each(changeCondition, function(prop, propValue){
		colors.push(propValue);
	});
	let matchedClass = function(mime){ // 자바스크립트에서는 함수도 객체이다.
		let clzName = "";
		for (let prop in changeCondition) {
			let idx = mime.indexOf(prop);
			if (idx >= 0) {
				clzName = changeCondition[prop];
				break;
			}
		}
		return clzName;
	}
	$.ajax({
		dataType : "json", // request-header 설정 ! accept하는 부분이 달라짐 / request-header와 response-header의 accept 하는 부분이 같아야 함
		success : function(resp) { // resp 이미 unmarshalling이 끝난 시점의 javascript 객체임
			// for (let idx in resp) {} 
			// $.each(resp, function(index, element){console.log(index + element + this);});
			/*
			var txt = "";
			for(var i = 0; i < resp.length; i++){ 
				txt += "<option>" + resp[i].name + "</option>";
			}
			$('select').html(txt);
			*/
			let options = [];
			$.each(resp, function(index, file){ // 파일의 이름은 file이나 this가 갖고 있음
				let option = $('<option>')
					.addClass(file.mime)
					.html(file.name); // $('<??>') 새로운 태그를 만들겠다! 근데 아직 객체 상태
				options.push(option)
			});
			SELECTTAG.append(options);
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
// 	$('select').on('change',function(){
// 		console.log($('select option:selected').attr('class'));
// 		if ($('select option:selected').attr('class') == "image/jpeg"){
// 			$(this).attr("class", "image/jpeg red");
// 		} else if ($('select option:selected').attr('class') == "image/png"){
// 			$(this).attr("class", "image/png green");
// 		} else if ($('select option:selected').attr('class') == "image/gif"){
// 			$(this).attr("class", "image/gif blue");
// 		} else {
			
// 		}
// 	});
	
// 	let obj = { jpeg : "red" }
// 	obj.png = "green"
// 	obj['gif']="blue";
// 	obj -> {jpeg: 'red', png: 'green', gif: 'blue'}
// 	let prop = "gif";
// 	obj[prop] -> 'blue'

</script>
</body>
</html>