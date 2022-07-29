<%@page import="java.text.SimpleDateFormat"%>
<%@page import="shop.QnABoardDTO"%>
<%@page import="shop.ShopDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="setting.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="${project}/qnaBoard/script.js"></script>
<head>
<link rel="stylesheet" type="text/css" href="${project}/qnaBoard/QnABoard.css"/>
<style>
/* button_align */
.btn_left {
	clear: both;
	text-align: left
}

.btn_right {
	clear: both;
	text-align: right
}

.btn_center {
	clear: both;
	text-align: center
}

/* layout */
html, body {
	padding: 0;
	margin: 0;
	width: 100%;
	height: 100%;
	overflow: hidden;
}

#wrap {
	position: relative;
	width: 100%;
	height: 100%
}

#container {
	position: absolute;
	top: 10px;
	right: 0;
	bottom: 38px;
	left: 0;
	overflow-x: hidden;
	overflow-y: auto
}

#container .inner {
	width: 680px;
	margin: 0 auto;
	padding: 10px;
}

/* table */
table.table01 {
	border-collapse: separate;
	border-spacing: 0;
	text-align: center;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	border-left: 1px solid #ccc;
	margin: auto;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 상세</title>

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
	<div id="wrap">
		<div id="container">
			<div class="inner">
				<h2>게시글 상세</h2>

				<form method="post" id="boardForm" name="boardForm" style="text-align: center">
					<input type="hidden" name="memId" value="${dto.memId}">
					<table width="100%" class="table01">
						<colgroup>
							<col width="20%">
							<col width="*">
						</colgroup>
						<tbody id="tbody">
							<tr>
								<th> ${str_num} </th>
								<td style="text-align:center"> ${number} </td>
								<th> ${str_hits} </th>
								<td style="text-align:center"> ${dto.qnaHit} </td>
							</tr>
							<tr>
								<th> ${str_writer} </th>
								<td style="text-align:center"> ${dto.memId} </td>
								<th> ${str_regdate} </th>
								<td style="text-align:center">
									<fmt:formatDate value="${dto.qnaDate}" pattern="yyyy-MM-dd HH:mm"/>
								</td>
							</tr>
							<tr>
								<th> ${str_title} </th>
								<td colspan='3'> ${dto.qnaTitle} </td>
							</tr>
							<tr>
								<th> ${str_content} </th>
								<td colspan='3'> <pre>${dto.qnaContent}</pre> </td>
								<!-- pre태그: 입력한대로 그대로 출력. 이거 없으면 줄바꿈을 출력 안함 -->
							</tr>
							<tr>
								<th class="btn_right mt15" colspan='4'>
									<input class="btn btn-dark" type="button" value="${btn_mod}"
										onclick="location='qnaBoardModifyForm.do?qnaNum=${dto.qnaNum}&memId=${dto.memId}&pageNum=${pageNum}'">
									<input class="btn btn-dark" type="button" value="${btn_del}"
										onclick="location='qnaBoardDeleteForm.do?qnaNum=${dto.qnaNum}&memId=${dto.memId}&pageNum=${pageNum}'">
									<input class="btn btn-dark" type="button" value="${btn_reply}"
										onclick="location='qnaBoardInputForm.do?qnaNum=${dto.qnaNum}'">
									<!-- num, ref, re_step, re_level은 get 방식으로 한 줄로 받아야함. -->
									<input class="btn btn-dark" type="button" value="${btn_list}" onclick="location='qnaBoardList.do?pageNum=${pageNum}'">
								</th>
							</tr>
						</tbody>
					</table>
					<input type="hidden" id="board_seq" name="board_seq" value="${boardSeq}" />
					<!-- 게시글 번호 -->
					<input type="hidden" id="search_type" name="search_type" value="S" />
					<!-- 조회 타입 - 상세(S)/수정(U) -->
				</form>
			</div>
		</div>
	</div>
</body>
</html>