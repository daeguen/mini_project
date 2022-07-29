<%@page import="shop.ShopDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
<script src="${project}/member/script.js"></script>

<h2> ${page_delete} </h2>

<%-- result는 request 객체로 넘어오지만 requestScope는 생략이 가능. --%>

<c:if test="${resultCheck eq 0}">
	<%-- 비밀번호가 다르다. --%>
	<script type="text/javascript">
	<!--
	erroralert(passwderror);
	//-->
	</script>
</c:if>
<c:if test="${resultCheck ne 0}">
	<%-- 비밀번호가 같다. --%>
	<c:if test="${result eq 0}">
		<%-- 탈퇴 실패 --%>
		<script type="text/javascript">
		<!--
		alert(deleteerror);
		//-->
		</script>
		<meta http-equiv="refresh" content="0;url=memberMain.do">
		<%-- meta 태그를 쓴 이유는 sendRedirect()메소드 때문에 jsp구문으로는 에러문 출력이 안 된다.
			그래서 자바스크립트로 에러문 출력 후 meta 태그를 통한 새로고침 기능으로 페이지 이동을 구현함 --%>
	</c:if>
	<c:if test="${result ne 0}">
		${sessionScope.loginId = null}
		<c:redirect url="memberMain.do"/>
	</c:if>
</c:if>