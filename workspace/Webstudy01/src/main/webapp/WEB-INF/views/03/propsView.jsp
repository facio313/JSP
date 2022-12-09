<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery-3.6.1.min.js"></script>
</head>
<body>
<h4>properties 파일 뷰어</h4>
<!-- <img src="../../resources/images/cat1.jpg"> -->

<label>
	<input type="radio" name="dataType" value="json" checked>JSON
</label>

<label>
	<input type="radio" name="dataType" value="xml">XML
</label>

<button type="button" class="loadData">LOAD DATA</button>
<button type="button" class="clearData">CLEAR DATA</button>
<table border="1px">
	<thead>
		<tr>
			<th>key</th>
			<th>value</th>
		</tr>
	</thead>
	<tbody id="listBody">
		
	</tbody>
</table>

<script type="text/javascript">
	let listBody = $("#listBody");
	let dataTypes = $("[name=dataType]");
	let makeTrTag = function(name, value){
		let tr = $("<tr>").append(//생성
				$("<td>").html(name),
				$("<td>").html(value)
		);
		return tr;
	}
	let btn = $(".loadData").on("click", function(){
		let dataType = dataTypes.filter(":checked").val();
		let sucesses = {
			json:function(resp){
				let trTags = [];
				$.each(resp, function(name, value){
					trTags.push(makeTrTag(name, value));
				});
				listBody.empty();
				listBody.append(trTags);
			},
			xml:function(domResp){
				let root = $(domResp).find("Properties");
				let trTags = [];
				root.children().each(function(idx, child){
					let name = child.tagName;
					let value = child.innerHTML;
					let tr = makeTrTag(name, value);
					trTags.push(tr);
				});
				listBody.empty();
				listBody.append(trTags);
			}
		}
		$.ajax({
	// 		url : "", // 이게 사라지면 호출한 서블릿(자기 자신)으로 다시 보냄(http://localhost/Webstudy01/03/props/propsView.do)
	// 		method : "", // 생략되면 get
	// 		data : {}, // 데이터를 가져올 목적이라면 보낼 게 없으니 생략 오케이
			dataType : dataType, // html은 ui 포함, json은 순수 데이터, xml
			success : sucesses[dataType],
// 			success : function(resp) {
	// 			$("tr") // 셀렉터
	// 			console.log(resp);
	// 			console.log(resp[0].key);
	//         	var html = "";
	//        		for (var i = 0; i < resp.length; i++) {
	//        			console.log(resp[i]);
	//       			html += "<tr>";
	//             	html += "<td>" + resp[i].key +"</td>";
	//             	html += "<td>" + resp[i].value +"</td>";
	//             	html += "</tr>";
	//         	}
	       		
	//         	var obj = document.querySelector("#listBody");
	//         	obj.innerHTML = html;
// 			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	});
	
	let clearBtn = $(".clearData").on("click", function(){
		listBody.empty();
	});
</script>
</body>
</html>