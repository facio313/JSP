/**
 *
 */
//폼 태그 모든 입력 데이터의 이름과 값을 콘솔에 로그로 출력할 수 있는 함수.
//ex) $("form").log().serializeObject(); 이런 식으로 사용 가능해야 함
//그러려면 return this 해주기

//$.sessionTimer => 대상이 되는 element가 없는 상황

$.fn.sessionTimer = function(timeout, msgObj) {
	if (!timeout)
		throw Error("세션 타입아웃 값이 없음.");
	// $(document).on("click", ".controlBtn", function(){}); //이런 식으로도 씀(Descendant 구조)
	const SPEED = 100;
	const TIMEOUT = timeout;
	// 상수인 이유! 기준값이어야 해서
//	const timerArea = $("#timerArea"); // 트래버싱? 안 하기 위해, 부하를 줄이기 위해
	const timerArea = this;
	
	let msgArea = null;
	if (msgObj){
		// 	event propagation : bubbling 방식
		msgArea = $(msgObj.msgAreaSelector).on("click", msgObj.btnSelector, function(event){ // event handler에서는 항상 event를 받아놔라!
			// 		this // 이때 this는 even의 타겟, 여기서는 .controlBtn이냐 $("#msgArea")이냐? => .controlBtn, 이게 없다면 $("#msgArea")
			// 		console.log(this.id + ", " + $(this).prop("id"));
			if (this.id == "YES"){
				jobClear();
				timerInit();
				// 새로운 요청을 보내야 함 -> 동기 or 비동기
				// 만약 동기를 사용하면 다 적고 날라감
				// 그냥 세션 갱신을 위한 요청만 보내면 됨. body가 필요 없음
				$.ajax({ // url이 없으면 현재 브라우저가 갖고 있는 주소로 다시 가는데 body가 필요 없음
					method : "head"
				});
			}
			msgArea.hide(); // msg 본래의 역할이 끝났으니 다시 숨겨주기
		}).hide();
	}
		
	let jobClear = function() {
		let timerJob = timerArea.data("timerJob"); // 전역변수를 쓰면 안 된다가 아니라, 전역변수가 아니라도 사용 가능하다
		if (timerJob) // 이 데이터가 있다면o
			clearInterval(timerJob);
		
		let msgJob = msgArea.data("msgJob");
		if (msgJob)
			clearTimeout(msgJob);
	}
	
	let timerInit = function() {
		if (msgObj){
			let msgJob = setTimeout(() => {
				msgArea.show();
			}, (TIMEOUT - 60)*SPEED);
			msgArea.data("msgJob", msgJob);
		}
		
		let timer = TIMEOUT;
		
		let timerJob = setInterval(() => {
			if (timer == 1){
				clearInterval(timerJob);
				location.reload();
			} else {
				timerArea.html(timeFormat(--timer));
			}
		}, SPEED);
		timerArea.data("timerJob", timerJob);
	}
	
	timerInit();
	
	let timeFormat = function(time) {
		let min = Math.trunc(time / 60); // 동적타입언어에서는 연산자가 결과값 타입을 결정 vs 정적타입언어에서는 피연산자의 타입에 의해 결과값 타입 결정 // 내림은 floor나 trunc
		let sec = time % 60;
		return min + ":" + sec;
	}
	
	return this;
}

$.fn.sessionTimer1 = function(time, half) {
	function count(){
		time--;
		timeArea.html(time);
		if (time == half) {
			if(confirm("세션을 연장하시겠습니까?")) {
				location.reload();
			}  else {
				return;
			}
		} else if (time < 0) {
			location.reload();
		}
	}
	setInterval(count, 1000);
}

$.fn.log = function() {
	let data = this.serializeObject();
	for (let prop in data) { // 언제 of인지(배열 등), 언제 in인지(일반 객체 - 속성(prop) 하나 하나 접근함)
		console.log(prop + " : " + data[prop]);
	}
	return this;
}

$.fn.serializeObject = function() {
	if (this.prop('tagName') != 'FORM')
		throw Error("from 태그 외에는 사용 불가.");
	let fd = new FormData(this[0]); // jquery객체이기 때문에 [0]을 넣어줌
	let nameSet = new Set();
	for (let key of fd.keys()) { // 향상된 for
		nameSet.add(key);
	}
	let data = {};
	for (let name of nameSet) {
		let values = fd.getAll(name); // get()은 하나만 가져옴, getAll()은 배열 반환
		if (values.length > 1) {
			data[name] = values; // 여러 개면 배열
		} else {
			data[name] = values[0]; // 한 개면 값 하나
		}
	}
	return data;
}