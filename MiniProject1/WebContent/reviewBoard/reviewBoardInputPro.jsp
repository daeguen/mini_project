<%@page import="shop.ShopDBBean"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="setting.jsp"%>
<script src="${project}/reviewBoard/script.js"></script>

<h2>${page_write}</h2>

<c:if test="${result eq 0}">
	<script type="text/javascript">
	<!--
		alert(inserterror);
	//-->
	</script>
	<meta http-equiv="refresh" content="0; url=reviewBoardList.do">
</c:if>
<c:if test="${result ne 0}">
	<c:redirect url="reviewBoardList.do" />
</c:if>