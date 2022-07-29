/**
 *  오더
 */
var ordereeror="주문에 실패하였습니다.";
var namemsg = "이름이 올바르지 않습니다.";
var addressmsg = "주소를 입력하세요.";
var phonemsg = "휴대폰 번호를 입력하세요.";
var emailmsg = "이메일 형식이 맞지 않습니다.";

function erroralert(msg){
	alert(msg);
	history.back();
}

function inputcheck() { //입력에 대한 체크
	if(inputform.check.value == "0" ){
		alert(confirmmsg);
		inputform.memId.focus();
		return false;
	}
	
	if(!inputform.memName.value){
		alert(namemsg);
		inputform.memName.focus();
		return false;
	}
	
	else if(!inputform.memName.value){
		alert(namemsg);
		inputform.memName.focus();
		return false;
	}
	
	else if(!inputform.mmZonecode.value || !inputform.memAddress.value){
		alert(addressmsg);
		inputform.memZonecode.focus();
		return false;
	}
	
	if(inputform.email.value || inputform.email2.value) { // 이메이르 2칸을 모두 채우거나 하나도 안 채우거나. 한칸만 채우면 에러
		if(inputform.email1.value.length == 0 || inputform.email2.value.length == 0){
			alert(emailmsg);
			inputform.email1.focus();
			return false;
		}
	}
	
	if(inputform.phone1.value || inputform.phone2.value || inputform.phone3.value){// 전화번호 3칸을 모두 채우거나 하나도 안채우면 에러
		if(inputform.phone1.value.length < 3 || inputform.phone2.value.length < 3 || inputform.phone3.value.length < 4){
			alert(telmsg);
			inputform.phone1.focus();
			return false;
		}
	}
} 

function nextphone1(){
	if(inputform.phone1.value.length == 3) {
		inputform.phone2.focus();
	}
}
function nextphone2(){
	if(inputform.phone2.value.length == 4) {
		inputform.phone3.focus();
	}
}

function setemail2(val){
	document.getElementsByName("email2")[0].value = val;
}






