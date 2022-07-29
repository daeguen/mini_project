<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="project" value="/MiniProject1"/>

<c:set var="page_main" value="메인 페이지"/>
<c:set var="page_input" value="회 원 가 입"/>
<c:set var="page_confirm" value="아이디 중복확인"/>
<c:set var="page_login" value="로 그 인"/>
<c:set var="page_logout" value="로그아웃"/>
<c:set var="page_delete" value="회 원 탈 퇴"/>
<c:set var="page_modify" value="회원 정보 수정"/>

<c:set var="msg_main" value="회원이 아니시면 회원가입을 해주세요."/>
<c:set var="msg_input" value="회원 정보를 입력해주세요."/>
<c:set var="msg_confirm_x" value="는 시용할 수 없습니다."/>
<c:set var="msg_confirm_o" value="는 시용할 수 있습니다."/>
<c:set var="msg_login" value="회원가입을 성공했습니다. 로그인해주세요"/>
<c:set var="msg_welcome" value="님 안녕하세요."/>
<c:set var="msg_passwd" value="비밀번호를 다시 확인해주세요."/>
<c:set var="msg_tel" value="'-'(하이픈) 없이 번호만 입력하세요."/>
<c:set var="msg_modify" value="수정할 정보를 입력하세요."/>

<c:set var="str_id" value="아이디"/>
<c:set var="str_passwd" value="비밀번호"/>
<c:set var="str_name" value="이름"/>
<c:set var="str_jumin" value="주민등록번호"/>
<c:set var="str_zonecode" value="우편번호"/>
<c:set var="str_address" value="주소"/>
<c:set var="str_building" value="건물명"/>
<c:set var="str_addrdetail" value="상세주소"/>
<c:set var="str_phone" value="전화번호"/>
<c:set var="str_email" value="이메일"/>
<c:set var="str_regdate" value="가입일자"/>

<c:set var="btn_login" value="로그인"/>
<c:set var="btn_cancel" value="취소"/>
<c:set var="btn_input" value="가입"/>
<c:set var="btn_input_cancel" value="가입취소"/>
<c:set var="btn_confirm" value="중복확인"/>
<c:set var="btn_find_zonecode" value="우편번호 찾기"/>
<c:set var="btn_ok" value="확인"/>
<c:set var="btn_modify" value="정보수정"/>
<c:set var="btn_delete" value="회원탈퇴"/>
<c:set var="btn_logout" value="로그아웃"/>
<c:set var="btn_del" value="탈퇴"/>
<c:set var="btn_del_cancel" value="탈퇴취소"/>
<c:set var="btn_mod" value="수정"/>
<c:set var="btn_mod_cancel" value="수정취소"/>