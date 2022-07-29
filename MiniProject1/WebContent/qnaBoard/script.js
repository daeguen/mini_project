/**
 *  QnA 게시판
 */

var titlemsg = "질문글 제목을 입력하세요.";
var contentmsg = "질문글 내용을 입력하세요.";
var passwdmsg = "비밀번호를 입력하세요.";

var passwderror = "비밀번호가 다릅니다.\n다시 확인하세요.";
var inserterror = "질문글 작성에 실패했습니다.\n잠시 후 다시 시도하세요.";
var deleteerror = "질문글 삭제에 실패했습니다.\n잠시 후 다시 시도하세요.";
var modifyerror = "질문글 수정에 실패했습니다.\n잠시 후 다시 시도하세요.";
var loginerror = "로그인 후 이용하실 수 있는 서비스입니다.";
var memiderror = "작성자만 게시글 수정이 가능합니다.";

function erroralert(msg){
	alert(msg);
	history.back();
}

function modifycheck(){
	if(! writeform.qnaTitle.value){
		alert(titlemsg);
		writeform.qnaTitle.focus();
		return false;
	}
	else if(! writeform.qnaContent.value){
		alert(contentmsg);
		writeform.qnaContent.focus();
		return false;
	}
	else if(! modifyform.qnaPasswd.value){
		alert(passwdmsg);
		modifyform.qnaPasswd.focus();
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

// 글 작성 페이지(qnaBoardInputForm.jsp)
function writecheck(){
	if(! writeform.qnaTitle.value){
		alert(titlemsg);
		writeform.qnaTitle.focus();
		return false;
	}
	else if(! writeform.qnaContent.value){
		alert(contentmsg);
		writeform.qnaContent.focus();
		return false;
	}
}