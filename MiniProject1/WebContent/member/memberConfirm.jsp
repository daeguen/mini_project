<%@page import="shop.ShopDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
<script src="${project}/member/script.js"></script>
<link type="text/css" rel="stylesheet" href="${project}/member/style_member.css">

<h2> ${page_confirm} </h2>


<c:if test="${result eq 0}">
	<%-- 아이디가 없다 --%>
	<table border="1">
		<tr>
			<th style="width:300px"> <span>${memId}</span>${msg_confirm_o}
		</tr>
		<tr>
			<th> <input class="inputbutton" type="button" value="${btn_ok}" onclick="setid('${memId}')"> </th>
		</tr>
	</table>
</c:if>
<c:if test="${result ne 0}">
	<%-- 아이디가 있다. --%>
	<form method='post' name="confirmform" action="memberConfirm.do" onsubmit="return confirmcheck()">
		<table border='1'>
			<tr>
				<th colspan='2'> <span>${memId}</span>${msg_confirm_x} </th>
			</tr>
			<tr>
				<th> ${str_id} </th>
				<td> <input class="input" type="text" name="memId" autofocus> </td>
			</tr>
			<tr>
				<th colspan='2'>
					<input class="inputbutton" type="submit" value="${btn_ok}">
					<input class="inputbutton" type="button" value="${btn_cancel}" onclick="window.close()">
				</th>
			</tr>
		</table>
	</form>
</c:if>