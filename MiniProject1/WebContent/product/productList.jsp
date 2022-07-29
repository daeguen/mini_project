<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="setting.jsp"%>
<script src="${project}/product/script.js"></script>
<link type="text/css" rel="stylesheet" href="${project}/product/style_board.css">

<h2> ${page_list} </h2>

<table>
	<%-- 관리자만 상품 입력 가능하게 구현 --%>
	<c:set var="memId" value="${sessionScope.memId}"/>
	<c:if test="${fn:contains(memId, 'admin')}">
		<tr>
			<td colspan='6' style="text-align:right">
				<a href="productInputForm.do">${str_product_insert}</a>&nbsp;&nbsp;&nbsp;
			</td>
		</tr>
	</c:if>
	<tr>
	<%-- 상품 검색 구현하기. 미완성 --%>
		<td colspan='6' style="text-align:right">
			<input class="input" type="text" name="search" placeholder="검색어 입력">
		</td>
	</tr>
	<tr>
		<th style="width:60%"> ${str_photo} </th>
		<th style="width:20%"> ${str_name} </th>
		<th style="width:20%"> ${str_price} </th>
	</tr>
	<c:if test="${result eq 0}">
		<%-- 상품이 없는 경우 --%>
		<tr>
			<td colspan='3' style="text-align:center"> ${msg_no_product} </td>
		</tr>
	</c:if>
	<c:if test="${result ne 0}">
		<%-- 상품이 있는 경우 --%>
		<c:forEach var="dto" items="${dtos}">
			<tr>
				<td>
					<%-- 이미지 --%>
					<img src="${dto.photoDir}/${dto.photoOriName}">
				</td>
				<td>
					<%-- 상품 이름 --%>
					<a href="productContent.do?num=${dto.num}">
						${dto.name}
					</a>
				</td>
				<td>
					<%-- 상품 가격 --%>
					${dto.price}
				</td>
			</tr>
		</c:forEach>
	</c:if>
</table>
<br>
<center>
	<c:if test="${count gt 0}">
		<c:if test="${startPage gt pageBlock}">
			<a href="productList.do?pageNum=${startPage - pageBlock}">[◀]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<c:if test="${i eq currentPage}">
				<b> [${i}] </b>
			</c:if>
			<c:if test="${i ne currentPage}">
				<a href="productList.do?pageNum=${i}">[${i}]</a>
			</c:if>
		</c:forEach>
		<c:if test="${pageCount gt endPage}">
			<a href="productList.do?pageNum=${startPage + pageBlock}">[▶]</a>
		</c:if>
	</c:if>
</center>