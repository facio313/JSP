<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>04/messageView.jsp</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery-3.6.1.min.js"></script>
</head>
<body>
<select id="selName">
<!-- // 이거 누를 때마다 바꾸고, message bundle로 긁어와서 key를 넣어주기 -->
</select>
<h4 id="greetingArea" data-key1="prop1" data-key2="sample" data-other-key="TEST"></h4>
<input type="radio" name="dataType" data-data-type="json" checked/>JSON
<input type="radio" name="dataType" data-data-type="xml"/>XML
<input type="radio" name="dataType" data-data-type="text"/>PLAIN

<input type="radio" name="language" data-locale="ko"/>한국어
<input type="radio" name="language" data-locale="en"/>영어
<script>
		let greetingArea = $("#greetingArea");
		console.log(greetingArea.data("key1"));
//		console.log(greetingArea.data("otherKey"));
//		greetingArea.data("key2", "otherValue");
//		console.log(greetingArea.data("key2"));
   
	let radioBtns = $('[type="radio"]');
	let dataTypes = radioBtns.filter("[name=dataType]");
	let locales = radioBtns.filter("[name=language]");
	let selects = $("#selName");
	let select;
	let selected = greetingArea.data("key1");
	
	$("#selName").on("change", function(){
		select = $("#selName").val();
		greetingArea.attr("data-key1", select);
		settings.data = {
				name : $("#selName").val()
		};
		$.ajax(settings);
	});
	
	let successes = {
		json:function(resp){
			let keys = Object.keys(resp.target);
			selects.html("");
			let options = "";
			for (let i=0; i<keys.length; i++) {
				options += "<option>" + keys[i] + "</option>";
			}
			selects.html(options);
			greetingArea.text(resp.message);
			console.log(resp.message);
		},
		xml:function(docResp){
			let message = $(docResp).find("message").text();
			let root = $(docResp).find("target");
			selects.html("");
			let options = "";
			root.children().each(function(idx, child){
				options += "<option>" + child.tagName + "</option>"; 
			});
			selects.html(options);
			greetingArea.html(message);
			
		},
		text:function(plain){
			selects.html("");
			console.log(plain);
			greetingArea.html(plain);
		}
	}
   
	let settings={
		url : "<%=request.getContextPath() %>/04/getGreetingMessage",
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	};
   
	radioBtns.on("change", function(){
		greetingArea.html("");
		let dataType = dataTypes.filter(":checked").data("dataType");
		settings.dataType = dataType;
		settings.success = successes[dataType];
		settings.data = {
			name : selected
		};
		let locale = locales.filter(":checked").data("locale");
		if(locale) {
			settings.data.locale = locale;
		}
		$.ajax(settings);
	}).trigger("change");
	
	$("#selName").on("change", function(){
		select = $("#selName").val();
		greetingArea.attr("data-key1", select);
		settings.data = {
				name : $("#selName").val()
		};
		$.ajax(settings);
	});
</script>
</body>
</html>