$("#fillSeeker").on("click",function(event){
	let title = `고졸 취업 고민`;
	$("#counTitle").val(title);
	CKEDITOR.instances.editor.setData(`
		<p>
		안녕하세요<br/>
		특성화고에서 막 졸업한 취준생입니다.<br/>
		상경계열이어서 취업을 하긴 했었는데 여러문제로 다시 학교로 돌아오고 어느새 졸업을 하였습니다.<br/>
		<br/>
		현재 전회1급, 컴활 2급, ERP인사,회계 등 자격증은 있어 경리사무원쪽으로 알아보고 있습니다.<br/>
		<br/>
		지금 부족한게 많은거 같다는 생각은 들지만 현재 무엇을 해야할지 갈피를 못잡고 있는 것 같습니다.<br/>
		조언부탁드려요...ㅠㅠ<br/>
		</p>
	`);
});
$("#fillAdmin").on("click",function(event){
	CKEDITOR.instances.editor.setData(`
		<p>
		학력 회사에 연연하지말고 우선 실무적으로 근무를 하는것을 추천드려요.<br/>
		다른 사람들과 비교하며 이정도 회사는 가야하지 않을까 하는 기준을 낮추세요 우선 지금은 취업활동을 해서 기본적으로 업무를 배우고 사회생활도 하며 본인만의 경력을 쌓으시는게 좋아요.<br/>
		조급해하지 마시고 경리사무를 희망하신다면 우선 집과 가까운곳의 회사들로 보고 규모가 작은 회사더라도 일단 다니시는걸 추천합니다.<br/>
		가능하다면 이직을 하더라도 최소 1년은 채우세요~ 이력서에 재직했던 회사가 많다고 해서 좋은게 아니랍니다.<br/>
		</p>	
	`);
});