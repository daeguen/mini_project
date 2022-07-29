<%@page import="shop.ShopDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="setting.jsp"%>
<script src="${project}/reviewBoard/script.js"></script>

<h2>${page_modify}</h2>

<c:if test="${result eq 0}">
	<script type="text/javascript">
	<!--
		alert(modifyerror);
	//-->
	</script>
	<meta http-equiv="refresh" content="0;url=reviewBoardList.do?pageNum=${pageNum}">
</c:if>
<c:if test="${result ne 0}">
	<c:redirect url="reviewBoardList.do?pageNum=${pageNum}" />
</c:if>