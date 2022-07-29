<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="setting.jsp"%>
<script src="${project}/reviewBoard/script.js"></script>
<link type="text/css" rel="stylesheet" href="${project}/reviewBoard/style_board.css">

<h2> ${page_delete} </h2>

<form name="passwdform" method="post" action="reviewBoardDeletePro.do" onsubmit="return passwdcheck()">
	<input type="hidden" name="num" value="${num}">
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
				<input class="inputbutton" type="button" value="${btn_del_cancel}" onclick="location='reviewBoardList.do?pageNum=${pageNum}'">
			</th>
		</tr>
	</table>
</form>