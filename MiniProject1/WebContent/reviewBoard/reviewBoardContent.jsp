<%@page import="java.text.SimpleDateFormat"%>
<%@page import="shop.BoardDataBean"%>
<%@page import="shop.ShopDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="setting.jsp"%>
<script src="${project}/reviewBoard/script.js"></script>
<link type="text/css" rel="stylesheet" href="${project}/reviewBoard/style_board.css">

<h2> ${page_content} </h2>

<table>
	<tr>
		<th> ${str_num} </th>
		<td style="text-align:center"> ${number} </td>
		<th> ${str_readcount} </th>
		<td style="text-align:center"> ${dto.readcount} </td>
	</tr>
	<tr>
		<th> ${str_writer} </th>
		<td style="text-align:center"> ${dto.writer} </td>
		<th> ${str_reg_date} </th>
		<td style="text-align:center">
			<fmt:formatDate value="${dto.reg_date}" pattern="yyyy-MM-dd HH:mm"/>
		</td>
	</tr>
	<tr>
		<th> ${str_subject} </th>
		<td colspan='3'> ${dto.subject} </td>
	</tr>
	<tr>
		<th> ${str_content} </th>
		<td colspan='3'> <pre>${dto.content}</pre> </td>
		<!-- pre태그: 입력한대로 그대로 출력. 이거 없으면 줄바꿈을 출력 안함 -->
	</tr>
	<tr>
		<th colspan='4'>
			<input class="inputbutton" type="button" value="${btn_mod}" onclick="location='reviewBoardModifyForm.do?num=${dto.num}&pageNum=${pageNum}'">
			<input class="inputbutton" type="button" value="${btn_del}" onclick="location='reviewBoardDeleteForm.do?num=${dto.num}&pageNum=${pageNum}'">
			<input class="inputbutton" type="button" value="${btn_reply}"
			onclick="location='reviewBoardInputForm.do?num=${dto.num}&ref=${dto.ref}&re_step=${dto.re_step}&re_level=${dto.re_level}'">
			<!-- num, ref, re_step, re_level은 get 방식으로 한 줄로 받아야함. -->
			<input class="inputbutton" type="button" value="${btn_list}" onclick="location='reviewBoardList.do?pageNum=${pageNum}'">
		</th>
	</tr>
</table>