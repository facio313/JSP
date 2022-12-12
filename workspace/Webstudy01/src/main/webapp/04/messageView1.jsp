<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>04/messageView.jsp</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/jquery-3.6.1.min.js"></script>
</head>
<body>
<h4 id="greetingArea" data-key1="hi" data-key2="sample" data-other-key="TEST"></h4>
<input type="radio" name="dataType" data-data-type="json" checked>JSON
<input type="radio" name="dataType" data-data-type="xml">XML
<input type="radio" name="dataType" data-data-type="text">PLAIN

<input type="radio" name="language" data-locale="ko">한국어
<input type="radio" name="language" data-locale="en" checked>영어

<script>
// 	let greetingArea = $("#greetingArea");
// 	console.log(greetingArea.data("key1"));
// 	console.log(greetingArea.data("otherKey"));
// 	greetingArea.data("key2", "otherValue");
// 	console.log(greetingArea.data("key2"));
	
	let types = $("input[name=dataType]");
	let locales = $("input[name=language]");
	
	let settings = {
		url : "<%= request.getContextPath()%>/04/getGreetingMessage1",
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	};
	
	
	let input = $("input").on("change", function(){
		
		let type = types.filter(":checked").data("dataType");
		settings.dataType = type;
		
		let locale = locales.filter(":checked").data("locale");
		
		if (locales.filter(":checked").length == 0) {
			locale = "";
		}

		settings.data = {
				locale : locale
				
		};
		
		let successes = {
			json:function(resp){
				console.log(resp.hi);
			},
			xml:function(domResp){
				let root = $(domResp).find("Properties");
				let greeting = "";
				root.children().each(function(idx, child){
					let name = child.tagName;
					if ( name == "hi"){
						console.log(child.innerHTML);
					}
				});
			},
			text:function(locale){
				console.log("plain입니다");
			}
		}
		
		settings.success = successes[type];
		
		$.ajax(settings);
	}).trigger("change");
	

</script>
</body>
</html>