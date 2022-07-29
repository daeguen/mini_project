<%@page import="shop.ShopDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="setting.jsp"%>
<script src="${project}/reviewBoard/script.js"></script>

<h2>${page_delete}</h2>

<c:if test="${resultCheck eq 0}">
	<%-- 비밀번호가 다르다. --%>
	<script type="text/javascript">
	<!--
		erroralert(passwderror);
	//-->
	</script>
</c:if>
<c:if test="${resultCheck ne 0}">
	<c:if test="${result eq 0}">
		<%-- 비밀번호가 같다. --%>
		<script type="text/javascript">
		<!--
			alert(deleteerror);
		//-->
		</script>
		<meta http-equiv="refresh" content="0;url=reviewBoardList.do?pageNum=${pageNum}">
	</c:if>
	<c:if test="${result ne 0}">
		<c:redirect url="reviewBoardList.do?pageNum=${pageNum}" />
	</c:if>
</c:if>