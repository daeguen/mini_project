<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="setting.jsp"%>
<script src="${project}/product/script.js"></script>
<link type="text/css" rel="stylesheet" href="${project}/product/style_board.css">

<h2> ${page_write} </h2>

<form name="inputform" method="post" action="qnaBoardInputPro.do" onsubmit="return inputcheck()">
	<table>
		<tr>
			<th colspan='2' style="text-align:right">
				<a href="qnaBoardList.do">${str_list}</a>&nbsp;&nbsp;&nbsp;
			</th>
		</tr>
		<tr>
			<th> ${str_name} </th>
			<td>
				<input class="input" type="text" name="name" maxlength="30" autofocus>
			</td>
		</tr>
		<tr>
			<th> ${str_photo} </th>
			<%-- 사진 입력하기 구현 --%>
			<td>
				<input class="input" type="text" name="email" maxlength="40">
			</td>
		</tr>
		<tr>
			<th> ${str_prodInfo} </th>
			<td>
				<input class="input" type="text" name="prodInfo">
			</td>
		</tr>
		<tr>
			<th> ${str_price} </th>
			<td>
				<input class="input" type="text" name="price" maxlength="10">
			</td>
		</tr>
		<tr>
			<th> ${str_stock} </th>
			<td>
				<input class="input" type="text" name="stock" maxlength="10">
			</td>
		</tr>
		<tr>
			<th colspan='2'>
				<input class="inputbutton" type="submit" value="${btn_write}">
				<input class="inputbutton" type="reset" value="${btn_cancel}">
				<input class="inputbutton" type="button" value="${btn_list}" onclick="location='qnaBoardList.do'">
			</th>
		</tr>
	</table>
</form>