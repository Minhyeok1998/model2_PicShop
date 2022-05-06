<%@page import="pic_shop.com.vo.CommentVo"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Picture 관리자 페이지 입니다.</title>
<script defer
	src="<%=request.getContextPath()%>/public/js/comment_admin.js"></script>
<style>
</style>
</head>
<body>
	<%
	List<CommentVo> comment_list = (List<CommentVo>) request.getAttribute("comment_list");
	%>
	<%@ include file="/admin_header_nav.jsp"%>

	<div class="container" style="margin-top: 10px;">
		<h1 class="h1Cl">작품평 관리 페이지</h1>
		<div class="memDiv">
			<div class="memHeader">
				<nav class="navbar navbar-expand-lg navbar-light bg-light">
					<div id="memDivHeader" class="container-fluid">
						<select id="sortCol" style="width: 200px;"
							class="form-select form-select-sm navbar-brand"
							aria-label=".form-select-sm example">
							<option value="comment_num">작품평 번호</option>
							<option value="title">작품평</option>
							<option value="contents">작가평</option>
							<option value="post_time">게시일</option>
							<option value="pic_grade">작품등급</option>
							<option value="pic_num">작품번호</option>
							<option value="member_id">작가명</option>
							<option value="state">상태</option>
						</select> <select id="sortHow" style="width: 200px;"
							class="form-select form-select-sm navbar-brand"
							aria-label=".form-select-sm example">
							<option value="1">오름차</option>
							<option value="2">내림차</option>
						</select>
						<button id="sortBtn" type="button"
							class="btn btn-outline-dark navbar-brand">정렬</button>
						<form class="d-flex">
							<input class="form-control me-2" type="search"
								placeholder="Search" aria-label="Search">
							<button class="btn btn-outline-success" type="submit">Search</button>
						</form>
						<button id="deleteBtn" class="btn btn-outline-dark navbar-brand">전체삭제</button>
					</div>
				</nav>
			</div>
			<div class="tab-content" id="pills-tabContent">
				<div class="tab-pane fade show active" id="pills-list"
					role="tabpanel" aria-labelledby="pills-list-tab">
					<table
						class="table table-bordered table-striped  table-primary align-middle">
						<thead class="thead-success">
							<tr>
								<th class="mb-3 sort">선택</th>
								<th class="md-1 sort">작품평 번호</th>
								<th class="md-2 sort">작품평</th>
								<th class="md-2 sort">작가평</th>
								<th class="md-1 sort">게시일</th>
								<th class="md-1 sort">작품등급</th>
								<th class="md-3 sort">작품번호</th>
								<th class="md-3 sort">작가명</th>
								<th class="md-2 sort">상태</th>

								<th class="md-1 sort">수정</th>
							</tr>
						</thead>
						<tbody id="pic_comment_tbody">
							<tr id="clone_tr">
								<td><input class="delete form-check-input " type="checkbox"
									value=""></td>
								<td class="comment_num"></td>
								<td class="title"></td>
								<td class="contents"></td>
								<td class="post_time"></td>
								<td class="pic_grade"></td>
								<td class="pic_num"></td>
								<td class="member_id"></td>
								<td class="state"></td>
								<td><button class="update btn btn-primary">수정</button></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>