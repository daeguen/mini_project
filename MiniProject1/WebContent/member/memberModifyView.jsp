<%@page import="java.text.SimpleDateFormat"%>
<%@page import="shop.MemberDTO"%>
<%@page import="shop.ShopDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="setting.jsp" %>
<script src="${project}/member/script.js"></script>
<link type="text/css" rel="stylesheet" href="${project}/member/style_member.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<h2> ${page_modify} </h2>
<c:if test="${result eq 0}">
	<%-- 비밀번호가 다르다. --%>
	<script type="text/javascript">
	<!--
	erroralert(passwderror);
	//-->
	</script>
</c:if>
<c:if test="${result ne 0}">
	<%-- 비밀번호가 같다. --%>
	<form name="modifyform" method='post' action="memberModifyPro.do" onsubmit="return modifycheck()">
		<table style="width:500px">
			<tr>
				<th colspan='2'> ${msg_modify} </th>
			</tr>
			<tr>
				<th> ${str_id} </th>
				<td> &nbsp;${dto.memId} </td> <%-- dto.getId() -> dto.id --%>
			</tr>
			<tr>
				<th rowspan='2'> ${str_passwd} </th>
				<td> <input class="input" type="password" name="memPasswd" maxlength="30" value="${dto.memPasswd}"> </td>
			</tr>
			<tr>
				<td> <input class="input" type="password" name="repasswd" maxlength="30" value="${dto.memPasswd}"> </td>
			</tr>
			<tr>
				<th> ${str_name} </th>
				<td> &nbsp;${dto.memName} </td>
			</tr>
			<tr>
				<th rowspan="4"> ${str_address} </th>
				<td>
					<input class="input" type="text" name="memZonecode" value="${dto.memZonecode}" placeholder="${str_zonecode}" readonly>
					<input class="inputbutton" type="button" value="${btn_find_zonecode}" style="width:100px"
						onclick="findzonecode()">
				</td>
			</tr>
			<tr>
				<td> <input class="input" type="text" name="memAddress" value="${dto.memAddress}" placeholder="${str_address}" readonly> </td>
			</tr>
			<tr>
				<td> <input class="input" type="text" name="memBuildingName" value="${dto.memBuildingName}" placeholder="${str_building}" readonly> </td>
			</tr>
			<tr>
				<td> <input class="input" type="text" name="memAddrDetail" value="${dto.memAddrDetail}" maxlength="100" placeholder="${str_addrdetail}"> </td>
			</tr>
			<tr>
				<th> ${str_email} </th>
				<td>
				<c:if test="${dto.memEmail == null or dto.memEmail == ''}">
					<input class="input" type="text" name="email1" maxlength="15" style="width:100px">
					@
					<input class="input" type="text" name="email2" maxlength="15" style="width:100px">
				</c:if>
				<c:if test="${dto.memEmail != null and dto.memEmail != ''}">
					<c:set var="e" value="${fn:split(dto.memEmail, '@')}"/>
					<input class="input" type="text" name="email1" maxlength="15" style="width:100px" value="${e[0]}">
					@
					<input class="input" type="text" name="email2" maxlength="15" style="width:100px" value="${e[1]}">
					<select name="selectemail" onchange="setemail2(this.value)">
						<option value="0"> 직접입력 </option>
						<option value="daum.net"> 다음 </option>
						<option value="naver.com"> 네이버 </option>
						<option value="gmail.com"> 구글 </option>
						<option value="nate.com"> 네이트 </option>
					</select>
				</c:if>
			</tr>
			<tr>
				<th> ${str_phone} </th>
				<td>
					<c:if test="${dto.memPhone == null or dto.memPhone == ''}">
						<input class="input" type="text" name="phone1" maxlength='3' style="width:30px"> -
						<input class="input" type="text" name="phone2" maxlength='4' style="width:40px"> -
						<input class="input" type="text" name="phone3" maxlength='4' style="width:40px">
					</c:if>
					<c:if test="${dto.memPhone != null and dto.memPhone != '' }">
						<c:set var="p" value="${fn:split(dto.memPhone, '-') }"/>
						<%-- String tel = dto.getTel(); --%>
						<input class="input" type="text" name="phone1" maxlength='3' style="width:30px" value="${p[0]}"> -
						<input class="input" type="text" name="phone2" maxlength='4' style="width:40px" value="${p[1]}"> -
						<input class="input" type="text" name="phone3" maxlength='4' style="width:40px" value="${p[2]}">
					</c:if>
				</td>
			</tr>
			<tr>
				<th> ${str_regdate} </th>
				<td>
					&nbsp;<fmt:formatDate value="${dto.memRegDate}" pattern="yyyy-MM-dd HH:mm"/>
				</td>
			</tr>
			<tr>
				<th colspan='2'>
					<input class="inputbutton" type="submit" value="${btn_mod}">
					<input class="inputbutton" type="reset" value="${btn_cancel}">
					<input class="inputbutton" type="button" value="${btn_mod_cancel}" onclick="location='memberMain.do'">
				</th>
			</tr>
		</table>
	</form>
</c:if>