/**
 *  게시판
 */

var inserterror = "질문글 작성에 실패했습니다.\n잠시 후 다시 시도하세요."

var writermsg = "작성자를 입력하세요.";
var subjectmsg = "질문글 제목을 입력하세요.";
var contentmsg = "질문글 내용을 입력하세요.";
var passwdmsg = "비밀번호를 입력하세요.";

var passwderror = "비밀번호가 다릅니다.\n다시 확인하세요.";
var deleteerror = "질문글 삭제에 실패했습니다.\n잠시 후 다시 시도하세요.";
var modifyerror = "질문글 수정에 실패했습니다.\n잠시 후 다시 시도하세요.";

function erroralert(msg){
	alert(msg);
	history.back();
}

function modifycheck(){
	if(! modifyform.subject.value){
		alert(subjectmsg);
		modifyform.subject.focus();
		return false;
	}
	else if(! modifyform.content.value){
		alert(contentmsg);
		modifyform.content.focus();
		return false;		
	}
	else if(! modifyform.passwd.value){
		alert(passwdmsg);
		modifyform.passwd.focus();
		return false;		
	}
}

// 글 삭제
function passwdcheck(){
	if(! passwdform.passwd.value){
		alert(passwdmsg);
		passwdform.passwd.focus();
		return false;
	}
}

// 상품 추가 페이지(inputForm.jsp)
function inputcheck(){
	if(! insertform.writer.value){
		alert(writermsg);
		writeform.writer.focus();
		return false;
	}
	else if(! insertform.subject.value){
		alert(subjectmsg);
		writeform.subject.focus();
		return false;
	}
	else if(! insertform.content.value){
		alert(contentmsg);
		writeform.content.focus();
		return false;
	}
	else if(! insertform.passwd.value){
		alert(passwdmsg);
		writeform.passwd.focus();
		return false;
	}
}