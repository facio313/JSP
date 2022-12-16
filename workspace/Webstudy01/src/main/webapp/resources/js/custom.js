/**
 *
 */
//폼 태그 모든 입력 데이터의 이름과 값을 콘솔에 로그로 출력할 수 있는 함수.
//ex) $("form").log().serializeObject(); 이런 식으로 사용 가능해야 함

$.fn.log = function(){
	let data = this.serializeObject();
	for (let prop in data) { // 언제 of인지(배열 등), 언제 in인지(일반 객체 - 속성(prop) 하나 하나 접근함)
		console.log(prop + " : " + data[prop]);
	}
	return this;
}

$.fn.serializeObject = function(){
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