<%@page import="shop.ShopDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<script src="${project}/member/script.js"></script>

<h2>${page_modify}</h2>
<c:if test="${result eq 0}">
	<%-- 수정 실패 --%>
	<script type="text/javascript">
	<!--
		alert(modifyerror);
	//-->
	</script>
	<meta http-equiv="refresh" content="0; url=memberMain.do">
</c:if>
<c:if test="${result ne 0}">
	<%-- 수정 성공 --%>
	<c:redirect url="memberMain.do" />
</c:if>