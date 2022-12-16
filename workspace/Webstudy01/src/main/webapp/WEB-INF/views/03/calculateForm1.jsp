<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>퀘솬퀴</title>
<script src="<%=request.getContextPath() %>/resources/js/jquery-3.6.1.min.js"></script>
</head>
<body>
<input type	="radio" name="dataType" value="json" checked>JSON
<input type="radio" name="dataType" value="xml">XML
<form method="post" onSubmit="return false;">
	<input type="number" name="leftOp" placeholder="좌측피연산자">
		<select name="operator">
			<option value="PLUS">+</option>
			<option value="MINUS">-</option>
			<option value="MULTIPLY">*</option>
			<option value="DIVIDE">/</option>
		</select>
	<input type="number" name="rightOp" placeholder="우측피연산자">
	<button type="submit">=</button>
</form>
<div id="resultArea">
2 + 2 = 4
</div>
<script type="text/javascript">
	let dataTypes = $("[name=dataType]");
	let disp = $("#resultArea");
	
	let btn = $("button").on("click", function(){
		let dataType = dataTypes.filter(":checked").val();
		let operator = $("select").val();
		let left = Number($("input[name=leftOp]").val());
		let right = Number($("input[name=rightOp]").val());

		// 데이터 처리는 서비스에서..
		let result = "";
		let suem = 0;
		if (operator == "PLUS") {
			sum = left + right;
			result = left + " + " + right + " = " + sum;
		} else if (operator == "MINUS") {
			sum = left - right;
			result = left + " - " + right + " = " + sum;
		} else if (operator == "MULTIPLY") {
			sum = left * right;
			result = left + " * " + right + " = " + sum;
		} else {
			sum = left / right;
			result = left + " / " + right + " = " + sum;
		}
		
		let sucesses = {
			json:function(resp){
				console.log(resp);
				disp.empty();
				disp.append(result);
			},
			xml:function(domResp){
				let root = $(domResp).find("Properties");
				console.log(root.children());
				disp.empty();
				disp.append(result);
			}
		}
		$.ajax({
			dataType : dataType,
			success : sucesses[dataType],
			error: function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	});
</script>
</body>
</html>