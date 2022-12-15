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

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
</div>

<script>
let listBody = $("#listBody");

let makeListBody = function(memoList){
	let trTags = []
	listBody.empty();
	if (makeListBody.length > 0) {
		$.each(memoList, function(index, memo){
			let tr = $("<tr>").append(
				$("<td data-bs-toggle='modal' data-bs-target='#exampleModal'>").html(memo.writer),
				$("<td>").html(this.date)
			).data("memo", memo);
			trTags.push(tr);
			$("#exampleModal").html("<div class='modal-dialog'><div class='modal-content'><div class='modal-body'>" + memo.content + "</div></div></div>")
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
		makeListBody(resp.memoList);
		console.log(resp.memoList);
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