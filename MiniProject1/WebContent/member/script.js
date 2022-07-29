/**
 * 회원관리
 */

var idmsg = "아이디를 입력하세요.";
var passwdmsg = "비밀번호를 입력하세요.";
var repasswdmsg = "비밀번호가 일치하지 않습니다.";
var namemsg = "이름을 입력하세요.";
var addressmsg = "주소를 입력하세요.";
var telmsg = "전화번호를 입력하세요.";
var emailmsg = "이메일 형식이 맞지 않습니다.";
var confirmmsg = "아이디 중복확인을 해주세요";

var iderror = "입력하신 아이디가 없습니다.\n다시 확인하세요.";
var passwderror = "입력하신 비밀번호가 다릅니다.\n다시 확인하세요.";
var inputerror = "회원가입에 실패했습니다.\n 잠시 후 다시 시도하세요.";
var deleteerror = "회원탈퇴에 시패했습니다.\n 잠시 후 다시 시도하세요.";
var loginerror = "로그인 후 이용하실 수 있는 서비스입니다.";
	
function erroralert(msg){
	alert(msg);
	history.back();	// window.history.back() : 이전 페이지로 돌아감
}

// 회원정보 수정
function modifycheck(){
	if(!modifyform.memPasswd.value){
		alert(passwdmsg);
		modifyform.memPasswd.focus();
		return false;
	}
	else if(modifyform.memPasswd.value != modifyform.repasswd.value){
		alert(repasswdmsg);
		modifyform.memPasswd.focus();
		return false;
	}
}

// 회원 탈퇴
function passwdcheck(){
	if(!passwdform.memPasswd.value){
		alert(passwdmsg);
		passwdform.memPasswd.focus();
		return false;
	}
}

// 우편번호 찾기 API 페이지 실행
function findzonecode(){
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
        	// getElementsByName()는 배열로 값을 받아온다.
            document.getElementsByName("memZonecode")[0].value = data.zonecode;
            document.getElementsByName("memAddress")[0].value = data.address;
            document.getElementsByName("memBuildingName")[0].value = data.buildingName;
            document.getElementsByName("memAddrDetail")[0].focus();
        }
    }).open();
}

// 아이디 중복확인
function confirm(){
	if(!inputform.memId.value){
		alert(idmsg);
		inputform.memId.focus();
		return;
	}
	var url = "memberConfirm.do?memId=" + inputform.memId.value;
	window.open(url, "confirm", "menubar=no, scrollbar=no, status=no, width=400, height=300");
}

// 아이디 중복확인 도중 null 입력 방지
function confirmcheck(){
	if(! confirmform.memId.value){
		alert(idmsg);
		confirmform.memId.focus();
		return false;
	}
}

// 아이디 입력 시 중복확인 여부 초기화
function confirmuncheck(){
	inputform.check.value = "0";
}

function setid(memId){
	opener.document.inputform.memId.value = memId; // opener: 중복확인 창을 띄워준 부모 창
	opener.document.inputform.check.value = "1";
	window.close();
	// self.close(); 도 가능하다.
}

// 회원 가입
function inputcheck(){	// 입력에 대한 체크
	if(inputform.check.value == "0"){ // 중복확인 미실시 시 가입 버튼 클릭 불가
		alert(confirmmsg);
		inputform.memId.focus();
		return false;
	}
	
	if(!inputform.memId.value){
		alert(idmsg);
		inputform.memId.focus();
		return false;
	}
	else if(!inputform.memPasswd.value){
		alert(passwdmsg);
		inputform.memPasswd.focus();
		return false;
	}
	else if(inputform.memPasswd.value != inputform.repasswd.value){
		alert(repasswdmsg);
		inputform.memPasswd.focus();
		return false;
	}
	else if(!inputform.memName.value){
		alert(namemsg);
		inputform.memName.focus();
		return false;
	}
	else if(!inputform.memZonecode.value || !inputform.memAddress.value){
		alert(addressmsg);
		inputform.memZonecode.focus();
		return false;
	}

	if(inputform.email1.value || inputform.email2.value){ // 이메일 2칸을 모두 채우거나 하나도 안 채우거나. 한 칸만 채우기는 NG
		if(inputform.email1.value.length == 0 || inputform.email2.value.length == 0){
			alert(emailmsg);
			inputform.email1.focus();
			return false;
		}
	}
	
	if(inputform.phone1.value || inputform.phone2.value || inputform.phone3.value){ // 전화번호 3칸을 모두 채우거나 하나도 안 채우거나. 한 칸만 채우기는 NG
		if(inputform.phone1.value.length < 3 || inputform.phone2.value.length < 3 || inputform.phone3.value.length < 4){
			alert(telmsg);
			inputform.phone1.focus();
			return false;
		}
	}
}

function nextphone1(){
	if(inputform.phone1.value.length == 3){
		inputform.phone2.focus();
	}
}
function nextphone2(){
	if(inputform.phone2.value.length == 4){
		inputform.phone3.focus();
	}
}

function setemail2(val){
	document.getElementsByName("email2")[0].value = val;
}

// 메인페이지
function maincheck(){
	if(!mainform.memId.value){
		alert(idmsg);
		mainform.memId.focus;
		return false;
	}
	else if(!mainform.memPasswd.value){
		alert(passwdmsg);
		mainform.memPasswd.focus;
		return false;
	}
	
}