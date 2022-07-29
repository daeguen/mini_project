<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
<script src="${project}/member/script.js"></script>
<link type="text/css" rel="stylesheet" href="${project}/member/style_member.css">

<h2> ${page_delete} </h2>

<c:if test="${sessionScope.loginId eq null}">
	<%-- 비로그인 접근 에러 --%>
	<script type="text/javascript">
	<!--
		alert(loginerror);
	//-->
	</script>
	<meta http-equiv="refresh" content="0; url=memberMain.do">
</c:if>
<c:if test="${sessionScope.loginId ne null}">
	<form method="post" name="passwdform" action="memberDeletePro.do" onsubmit="return passwdcheck()">
		<table>
			<tr>
				<th colspan='2'> ${msg_passwd} </th>
			</tr>
			<tr>
				<th> ${str_passwd} </th>
				<td> <input class="input" type="password" name="memPasswd" maxlength="30" autofocus>
			</tr>
			<tr>
				<th colspan='2'>
					<input class="inputbutton" type="submit" value="${btn_del}">
					<input class="inputbutton" type="button" value="${btn_del_cancel}" onclick="location='memberMain.do'">
				</th>
			</tr>
		</table>
	</form>
</c:if>