<%@page import="shop.ShopDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="setting.jsp"%>
<script src="${project}/qnaBoard/script.js"></script>

<h2>${page_modify}</h2>

<c:if test="${result eq 0}">
	<script type="text/javascript">
	<!--
		alert(ordereeror);
	//-->
	</script>
	<meta http-equiv="refresh"
		content="0;url=qnaBoardList.do?pageNum=${pageNum}">
</c:if>
<c:if test="${result ne 0}">
	<c:redirect url="qnaBoardList.do?pageNum=${pageNum}" />
</c:if>