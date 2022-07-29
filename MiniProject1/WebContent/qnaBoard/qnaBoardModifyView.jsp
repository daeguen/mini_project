<%@page import="shop.QnABoardDTO"%>
<%@page import="shop.ShopDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="setting.jsp"%>

<!DOCTYPE html>
<html xmlns="http//www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>

<meta charset="utf-8">
<!-- 반응형 뷰포트 메타태그 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>진짜 쌌다! 쇼핑몰</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="${project}/qnaBoard/script.js"></script>
<link rel="stylesheet" type="text/css" href="${project}/qnaBoard/QnABoard.css"/>
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
				<form method="post" id="boardForm" name="modifyform" action="qnaBoardModifyPro.do" onsubmit="return modifycheck()">
					<input type="hidden" name="qnaNum" value="${qnaNum}">
					<input type="hidden" name="pageNum" value="${pageNum}">
					<table width="100%" class="table02">
						<caption>
							<strong><span class="t_red">*</span> 표시는 필수입력 항목입니다.</strong>
						</caption>
						<colgroup>
							<col width="20%">
							<col width="*">
						</colgroup>
						<tbody id="tbody">
							<tr>
								<th>${str_title}<span class="t_red">*</span></th>
								<td><input id="board_subject" name="qnaTitle" class="tbox01" value="${dto.qnaTitle}"/></td>
							</tr>
							<tr>
								<th>${str_writer}<span class="t_red">*</span></th>
								<td>${dto.memId}</td>
							</tr>
							<tr>
								<th>${str_content}<span class="t_red">*</span></th>
								<td><textarea id="board_content" name="qnaContent" cols="40" rows="10" class="textarea01">${dto.qnaContent}</textarea></td>
							</tr>
						</tbody>
					</table>
					<input type="hidden" id="board_seq" name="board_seq"
						value="${boardSeq}" />
					<!-- 게시글 번호 -->
					<input type="hidden" id="search_type" name="search_type" value="U" />
					<!-- 조회 타입 - 상세(S)/수정(U) -->
				</form>
				<div class="btn_right mt15">
					<button type="button" class="btn black mr5" onclick="location='qnaBoardList.do'">${btn_list}</button>
					<button type="submit" class="btn black" form="boardForm">${btn_mod}</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
