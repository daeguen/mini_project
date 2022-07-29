<%@page import="shop.ShopDBBean"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="setting.jsp"%>
<script src="${project}/qnaBoard/script.js"></script>

<h2>${page_write}</h2>

<c:if test="${result eq 0}">
	<script type="text/javascript">
	<!--
		erroralert(inserterror);
	//-->
	</script>
</c:if>
<c:if test="${result ne 0}">
	<c:redirect url="qnaBoardList.do" />
</c:if>