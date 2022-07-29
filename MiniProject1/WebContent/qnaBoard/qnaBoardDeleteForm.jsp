<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="setting.jsp"%>
<script src="${project}/qnaBoard/script.js"></script>
<link type="text/css" rel="stylesheet" href="${project}/qnaBoard/style_board.css">

<h2> ${page_delete} </h2>
<c:if test="${sessionScope.loginId eq null}">
	<%-- 비로그인 접근 에러 --%>
	<script type="text/javascript">
	<!--
		erroralert(loginerror);
	//-->
	</script>
</c:if>
<c:if test="${sessionScope.loginId ne null}">
	<form name="passwdform" method="post" action="qnaBoardDeletePro.do" onsubmit="return passwdcheck()">
		<input type="hidden" name="qnaNum" value="${qnaNum}">
		<input type="hidden" name="pageNum" value="${pageNum}">
		<table>
			<tr>
				<th colspan='2'> ${msg_passwd} </th>
			</tr>
			<tr>
				<th> ${str_passwd} </th>
				<td> <input class="input" type="password" name="passwd" maxlength="20" autofocus> </td>
			</tr>
			<tr>
				<th colspan='2'>
					<input class="inputbutton" type="submit" value="${btn_del}">
					<input class="inputbutton" type="button" value="${btn_del_cancel}" onclick="location='qnaBoardList.do?pageNum=${pageNum}'">
				</th>
			</tr>
		</table>
	</form>
</c:if>