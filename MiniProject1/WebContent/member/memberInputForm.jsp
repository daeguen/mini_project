<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="setting.jsp" %>
<script src="${project}/member/script.js"></script>
<link type="text/css" rel="stylesheet" href="${project}/member/style_member.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<h2> ${page_input} </h2>

<form name="inputform" method="post" action="memberInputPro.do" onsubmit="return inputcheck()">
	<input type="hidden" name="check" value="0"> <!-- 중복확인 미실시 시 가입 버튼 못누르게 하기 위함 -->
	<table border="1" style="width:500px">
		<tr>
			<th colspan="2"> ${msg_input} </th>
		</tr>
		<tr>
			<th> ${str_id} </th>
			<td>
				<input class="input" type="text" name="memId" maxlength="30" autofocus onkeyup="confirmuncheck()">
				<input class="inputbutton" type="button" value="${btn_confirm}"
					onclick="confirm()">
			</td>
		</tr>
		<tr>
			<th rowspan="2"> ${str_passwd} </th>
			<td> <input class="input" type="password" name="memPasswd" maxlength="30"> </td>
		</tr>
		<tr>
			<td> <input class="input" type="password" name="repasswd" maxlength="30"> </td>
		</tr>
		<tr>
			<th> ${str_name} </th>
			<td> <input class="input" type="text" name="memName" maxlength="6"> </td>
		</tr>
		<tr>
			<th rowspan="4"> ${str_address} </th>
			<td>
				
				<input class="input" type="text" name="memZonecode" placeholder="${str_zonecode}" readonly>
				<input class="inputbutton" type="button" value="${btn_find_zonecode}" style="width:100px"
					onclick="findzonecode()">
			</td>
		</tr>
		<tr>
			<td> <input class="input" type="text" name="memAddress" placeholder="${str_address}" readonly> </td>
		</tr>
		<tr>
			<td> <input class="input" type="text" name="memBuildingName" placeholder="${str_building}" readonly> </td>
		</tr>
		<tr>
			<td> <input class="input" type="text" name="memAddrDetail" maxlength="100" placeholder="${str_addrdetail}"> </td>
		</tr>
		
		<tr>
			<th> ${str_email} </th>
			<td>
				<input class="input" type="text" name="email1" maxlength="15" style="width:100px;">
				@
				<input class="input" type="text" name="email2" maxlength="15" style="width:100px;">
				<select name="selectemail" onchange="setemail2(this.value)">
					<option value="0"> 직접입력 </option>
					<option value="daum.net"> 다음 </option>
					<option value="naver.com"> 네이버 </option>
					<option value="gmail.com"> 구글 </option>
					<option value="nate.com"> 네이트 </option>
				</select>
			</td>
		</tr>
		<tr>
			<th> ${str_phone} </th>
			<td>
				<input class="input" type="text" name="phone1" maxlength="3" style="width:30px;"
					onkeyup="nextphone1()"> -
				<input class="input" type="text" name="phone2" maxlength="4" style="width:40px;"
					onkeyup="nextphone2()"> -
				<input class="input" type="text" name="phone3" maxlength="4" style="width:40px;"
					onkeyup="nextphone3()">
			</td>
		</tr>
		<tr>
			<th colspan='2'>
				<input class="inputbutton" type="submit" value="${btn_input}">
				<input class="inputbutton" type="reset" value="${btn_cancel}">
				<input class="inputbutton" type="button" value="${btn_input_cancel}" onclick="location='memberMain.do'">
			</th>
		</tr>
	</table>
</form>