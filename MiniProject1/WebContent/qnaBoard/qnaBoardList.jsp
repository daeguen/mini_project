<%@page import="java.text.SimpleDateFormat"%>
<%@page import="shop.QnABoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="shop.ShopDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="setting.jsp"%>

<!DOCTYPE html>
<html xmlns="http//www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<script src="${project}/qnaBoard/script.js"></script>
<head>
<style>
.quick ul li {
	list-style: none;
}

.quick ul:after {
	content: "";
	display: block;
	clear: both;
}

.quick li {
	float: left;
	width: 25%;
	border-bottom: 1px solid #eee;
	border-right: 1px solid #ddd;
	box-sizing: border-box;
}

.quick li a {
	display: block;
	padding-top: 10px;
	padding-bottom: 8px;
	text-align: center;
	color: #555;
	letter-spacing: -1px;
	font-size: 13px;
}
</style>
<meta charset="utf-8">
<!-- 반응형 뷰포트 메타태그 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>진짜 쌌다! 쇼핑몰</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>

	<nav class="navbar navbar-expand-sm bg-dark navbar-dark ">
		<div class="container-fluid">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link active" href="#"></a></li>
				<li class="nav-item"><a class="nav-link" href="#">HOME</a></li>
				<li class="nav-item"><a class="nav-link" href="#">로그아웃</a></li>
				<li class="nav-item"><a class="nav-link" href="#">질의게시판</a></li>
				<li class="nav-item"><a class="nav-link" href="#">상품보러가기</a></li>
				<li class="nav-item"><a class="nav-link" href="#">내정보</a></li>
				<li class="nav-item"><a class="nav-link" href="#">고객센터</a></li>

			</ul>
		</div>
	</nav>


	<div class="container mt-3">
		<h2>가격에 쌋다 QnA 게시판</h2>
		<p>QnA 게시판 입니다</p>

		<div id="container">
			<div class="quick">
				<ul>

					<li><a href="#">회원정보</a></li>
					<li><a href="#">주문</a></li>
					<li><a href="#">결제</a></li>
					<li><a href="#">배송</a></li>
					<li><a href="#">#</a></li>
					<li><a href="#">#</a></li>
					<li><a href="#">#</a></li>
					<li><a href="#">#</a></li>

				</ul>
			</div>

			<table class="table table-striped">
				<thead>
					<tr>
						<th style="text-align:center">${str_num}</th>
						<th style="text-align:center">${str_title}</th>
						<th style="text-align:center">${str_writer}</th>
						<th style="text-align:center">${str_regdate}</th>
						<th style="text-align:center">${str_hits}</th>
						<th style="text-align:center">${str_ip}</th>
					</tr>
				</thead>

				<tbody>
					<c:if test="${count eq 0}">
						<%-- 글이 없는 경우 --%>
						<tr>
							<td colspan='6' style="text-align:center"> ${msg_list} </td>
						</tr>
					</c:if>
					<c:if test="${count ne 0}">
						<%-- 글이 있는 경우 --%>
						<c:set var="number" value="${number}"/>
						<c:forEach var="dto" items="${dtos}">
							<tr>
								<td style="text-align:center">
									${number}
									<c:set var="number" value="${number - 1}"/>
								</td>
								<td>
									<c:if test="${dto.qnaHit eq -1}">
										${dto.qnaTitle}
									</c:if>
									<c:if test="${dto.qnaHit ne -1}">
										<a href="qnaBoardContent.do?qnaNum=${dto.qnaNum}&pageNum=${pageNum}&number=${number+1}">
											${dto.qnaTitle}
										</a>
									</c:if>
								</td>
								<td style="text-align:center">
									${dto.memId}
								</td>
								<td style="text-align:center">
									<fmt:formatDate value="${dto.qnaDate}" pattern="yyyy-MM-dd HH:mm"/>
								</td>
								<td style="text-align:center">
								<c:if test="${dto.qnaHit eq -1}">
									&nbsp;
								</c:if>
								<c:if test="${dto.qnaHit ne -1}">
									${dto.qnaHit}
								</c:if>
								</td>
								<td style="text-align:center">
									${dto.qnaIp}
								</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
		<nav aria-label="Page navigation example">
			<div style="float: right">
				<button type="button" class="btn btn-primary" onclick="location='qnaBoardInputForm.do'">${str_write}</button>
			</div>
			
		<c:if test="${count gt 0}">
			<ul class="pagination justify-content-center">
				<c:if test="${startPage gt pageBlock}">
					<li class="page-item"><a class="page-link" href="qnaBoardList.do?pageNum=${startPage - pageBlock}">이전</a></li>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${i eq currentPage}">
						<li class="page-item disabled"><a class="page-link"> ${i} </a></li>
					</c:if>
					<c:if test="${i ne currentPage}">
						<li class="page-item"><a class="page-link" href="qnaBoardList.do?pageNum=${i}">${i}</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${pageCount gt endPage}">
					<li class="page-item"><a class="page-link" href="qnaBoardList.do?pageNum=${startPage + pageBlock}">다음</a></li>
				</c:if>
			</ul>
		</c:if>

		</nav>
		<!-- 검색 -->
		<div class="pagination justify-content-center">
			<form name="fsearch" method="get">
				<input type="hidden" name="bo_table" value="qa">
				<input type="hidden" name="sca" value="">
				<select name="sfl">
					<option value="wr_subject">제목</option>
					<option value="wr_content">내용</option>
					<option value="wr_subject||wr_content">제목+내용</option>
					<option value="mb_id,1">회원아이디</option>
					<option value="wr_name,1">글쓴이</option>
				</select>
				<input name="stx" class="stx" maxlength="15" itemname="검색어" required value=''>
				<button type="button" class="stx" maxlength="10">검색</button>

			</form>
		</div>
	</div>
</body>
</html>