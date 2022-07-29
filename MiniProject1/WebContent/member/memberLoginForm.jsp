<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
<script src="${project}/member/script.js"></script>
<link type="text/css" rel="stylesheet" href="${project}/member/style_member.css">

<h2> ${page_login} </h2>

<form name="mainform" method='post' action="memberLoginPro.do" onsubmit="return maincheck()">
	<table>
		<tr>
			<th colspan='2'> ${msg_login} </th>
		</tr>
		<tr>
			<th> ${str_id} </th>
			<td> <input class="input" type="text" name="memId" maxlength="30"> </td>
		</tr>
		<tr>
			<th> ${str_passwd} </th>
			<td> <input class="input" type="password" name="memPasswd" maxlength="30"> </td>
		</tr>
		<tr>
			<th colspan='2'>
				<input class="inputbutton" type="submit" value="${btn_login}">
				<input class="inputbutton" type="reset" value="${btn_cancel}">
			</th>
		</tr>
	</table>
</form>