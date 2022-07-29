<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="setting.jsp" %>
<script src="${project}/member/script.js"></script>
<link type="text/css" rel="stylesheet" href="${project}/member/style_member.css">

<h2> ${page_main} </h2>

<c:if test="${sessionScope.loginId ne null}">
<%-- 로그인 되어있을 때 --%>
	<table>
		<tr>
			<th style="width:300px"> <span>${sessionScope.loginId}</span> ${msg_welcome} </th>
		</tr>
		<tr>
			<th>
				<input class="inputbutton" type="button" value="${btn_modify}" onclick="location='memberModifyForm.do'">
				<input class="inputbutton" type="button" value="${btn_delete}" onclick="location='memberDeleteForm.do'">
				<input class="inputbutton" type="button" value="${btn_logout}" onclick="location='logout.do'">
			</th>
		</tr>
	</table>
</c:if>
<c:if test="${sessionScope.loginId eq null}">
<%-- 로그인 안되어있을 때 --%>
	<form name="mainform" method="post" action="memberLoginPro.do" onsubmit="return maincheck()">
	<%-- 아이디와 비밀번호 입력 안하면 submit버튼 눌러도 안 넘어가게 해야 함 --%>
		<table border="1">
			<tr>
				<th colspan='2'>
					${msg_main}
				</th>
			</tr>
			<tr>
				<th> ${str_id} </th>
				<td> <input class="input" type="text" name="memId" maxlength="30" autofocus> </td>
			</tr>
			<tr>
				<th> ${str_passwd} </th>
				<td> <input class="input" type="password" name="memPasswd" maxlength="30"> </td>
			</tr>
			<tr>
				<th colspan='2'>
					<input class="inputbutton" type="submit" value="${btn_login}">
					<input class="inputbutton" type="reset" value="${btn_cancel}">
					<input class="inputbutton" type="button" value="${btn_input}" onclick="location='memberInputForm.do'">
				</th>
			</tr>
		</table>
	</form>
</c:if>