<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/includee/preScript.jsp"/>
</head>
<body>
<h4>Restful 기반의 메모 관리</h4>
<table class="table-bordered">
	<thead>
		<tr>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
	</thead>
	<tbody id="listBody">
		
	</tbody>
</table>
<script>
let listBody = $("#listBody");
// let makeTrTag = function(name, value){
// 	let tr = $("<tr>").append(//생성
// 			$("<td>").html(name),
// 			$("<td>").html(value)
// 	);
// 	return tr;
// }

let makeListBody = function(memoList){
	let trTags = []
	listBody.empty();
	if (makeListBody.length > 0) {
		$.each(memoList, function(index, memo){
			let tr = $("<tr>").append(
				$("<td>").html(memo.writer),
				$("<td>").html(this.date)
			).data("memo", memo);
			trTags.push(tr);
		});
	} else {
		let tr = $("<tr>").html(
			$("<td>")
			.attr("colspan", "2") // attr의 한계! 모든 걸 문자열로 줄 수밖에..
			.html("작성된 메모 없음")
		);
		trTags.push(tr);
	}
	listBody.append(trTags); // append....push....put....add 차이 좀..
}

$.ajax({
	url : "${pageContext.request.contextPath}/memo",
	method : "get",
// 	data : {},
	dataType : "json",
	success : function(resp) {
		// resp의 구조를 본다.
		console.log(resp.memoList);
		// 데이터를 가져와서 tbody에 뿌려준다.
// 		let trTags = [];
// 		$.each(resp.memoList, function(name, value){
// 			trTags.push(makeTrTag(value.writer, value.date));
// 		});
// 		listBody.empty();
// 		listBody.append(trTags);	
		makeListBody(resp.memoList);
	},
	error : function(jqXHR, status, error) {
		console.log(jqXHR);
		console.log(status);
		console.log(error);
	}
});
</script>
<jsp:include page="/includee/postScript.jsp"/>
</body>
</html>