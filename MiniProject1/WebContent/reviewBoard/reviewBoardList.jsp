<%@page import="java.text.SimpleDateFormat"%>
<%@page import="shop.BoardDataBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="shop.ShopDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="setting.jsp"%>
<script src="${project}/reviewBoard/script.js"></script>
<link type="text/css" rel="stylesheet" href="${project}/reviewBoard/style_board.css">

<h2> ${page_list} (${str_count} : ${count}) </h2>

<table>
	<tr>
		<td colspan='6' style="text-align:right">
			<a href="reviewBoardInputForm.do">${str_write}</a>&nbsp;&nbsp;&nbsp;
		</td>
	</tr>
	<tr>
		<th style="width:7%"> ${str_num} </th>
		<th style="width:35%"> ${str_subject} </th>
		<th style="width:10%"> ${str_writer} </th>
		<th style="width:10%"> ${str_reg_date} </th>
		<th style="width:7%"> ${str_readcount} </th>
		<th style="width:10%"> ${str_ip} </th>
	</tr>
	<c:if test="${result eq 0}">
		<%-- 글이 없는 경우 --%>
		<tr>
			<td colspan='6' style="text-align:center"> ${msg_list} </td>
		</tr>
	</c:if>
	<c:if test="${result ne 0}">
		<%-- 글이 있는 경우 --%>
		<c:set var="number" value="${number}"/>
		<c:forEach var="dto" items="${dtos}">
			<tr>
				<td style="text-align:center">
					${number}
					<c:set var="number" value="${number - 1}"/>
				</td>
				<td>
					<c:set var="wid" value="${(dto.re_level-1) * 10}"/> <%-- 들여쓰기를 할 길이 --%>
					<c:if test="${dto.re_level gt 1}"> <%-- 재답글부터 --%>
						<img src="${project}/images/level.gif" width="${wid}" height="15">
					</c:if>
					<c:if test="${dto.re_level gt 0}"> <%-- 답글일 경우 --%>
						<img src="${project}/images/re.gif" width="20" height="15">
					</c:if>
					<c:if test="${dto.readcount eq -1}">
						${dto.subject}
					</c:if>
					<c:if test="${dto.readcount ne -1}">
						<a href="reviewBoardContent.do?num=${dto.num}&pageNum=${pageNum}&number=${number+1}">
							${dto.subject}
						</a>
					</c:if>
				</td>
				<td style="text-align:center">
					${dto.writer}
				</td>
				<td style="text-align:center">
					<fmt:formatDate value="${dto.reg_date}" pattern="yyyy-MM-dd HH:mm"/>
				</td>
				<td style="text-align:center">
				<c:if test="${dto.readcount eq -1}">
					&nbsp;
				</c:if>
				<c:if test="${dto.readcount ne -1}">
					${dto.readcount}
				</c:if>
				</td>
				<td style="text-align:center">
					${dto.ip}
				</td>
			</tr>
		</c:forEach>
	</c:if>
</table>
<br>
<center>
	<c:if test="${count gt 0}">
		<c:if test="${startPage gt pageBlock}">
			<a href="reviewBoardList.do?pageNum=${startPage - pageBlock}">[◀]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<c:if test="${i eq currentPage}">
				<b> [${i}] </b>
			</c:if>
			<c:if test="${i ne currentPage}">
				<a href="reviewBoardList.do?pageNum=${i}">[${i}]</a>
			</c:if>
		</c:forEach>
		<c:if test="${pageCount gt endPage}">
			<a href="reviewBoardList.do?pageNum=${startPage + pageBlock}">[▶]</a>
		</c:if>
	</c:if>
</center>