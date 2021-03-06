<%@page import="pic_shop.com.vo.CommentVo"%>
<%@page import="pic_shop.com.vo.CategoryVo"%>
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
		<% List<CategoryVo> cate_list = (List<CategoryVo>)request.getAttribute("cate_list"); %>
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
								<th class="md-1 sort">번호</th>
								<th class="md-2 sort">작품평</th>
								<th class="md-2 sort">작가평</th>
								<th class="md-1 sort">게시일</th>
								<th class="md-1 sort">작품등급</th>
								<th class="md-3 sort">작품번호</th>
								<th class="md-3 sort">작가명</th>
								<th class="md-2 sort">상태</th>
								<th class="md-1 sort">수정</th>
								<th class="md-1 sort">삭제</th>
							</tr>
						</thead>
						<tbody id="pic_comment_tbody">
							<%for (CommentVo comment: comment_list){ %>
							<tr id="clone_tr">
								<td><input class="delete form-check-input " type="checkbox"
									value=""></td>
								<td><%=comment.getComment_num() %></td>
								<td><%=comment.getTitle() %></td>
								<td><%=comment.getContents() %></td>
								<td><%=comment.getPost_time() %></td>
								<td><%=comment.getPic_grade() %></td>
								<td><%=comment.getPic_num() %></td>
								<td><%=comment.getMember_id() %></td>
								<td><%=comment.getState() %></td>
								<td><button class="update btn btn-primary">수정</button></td>
								<td><button id="delete_btn class="delete btn btn-danger">삭제</button></td>
								<tr>
								<%}; %>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
				<div class="container" style="margin-top: 10px;">
		<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
			<li class="nav-item"><a class="nav-link active"
				id="pills-list-tab" data-toggle="pill" href="#pills-list" role="tab"
				aria-controls="pills-list" aria-selected="true">Picture List</a></li>
			<li class="nav-item"><a class="nav-link" id="pills-insert-tab"
				data-toggle="pill" href="#pills-insert" role="tab"
				aria-controls="pills-insert" aria-selected="false">Picture 추가</a></li>
			<li class="nav-item"><a class="nav-link" id="pills-modify-tab"
				data-toggle="pill" href="#pills-modify" role="tab"
				aria-controls="pills-modify" aria-selected="false" disabled>Picture
					수정</a></li>
		</ul>
		<div class="tab-content" id="pills-tabContent">
			<div class="tab-pane fade show active" id="pills-list"
				role="tabpanel" aria-labelledby="pills-list-tab">
				<h3>리스트 출력</h3>
				<button id="deleteBtn">일괄 삭제</button>
				<table
					class="table table-bordered table-striped  table-primary align-middle">
					<thead class="thead-success">
						<tr>
							<th class="md-1 sort">num</th>
							<th class="md-2 sort">name</th>
							<th class="md-2 sort">title</th>
							<th class="md-1 sort">count</th>
							<th class="md-1 sort">price</th>
							<th class="md-3 sort">main_img</th>
							<th class="md-3 sort">img_comment</th>
							<th class="md-2 sort">pic_num</th>
							<th class="md-2 sort">member_id</th>
							<th class="md-4 sort">post_time</th>
							<th class="md-4 sort">sale_time</th>
							<th class="md-1 sort">state</th>
							<th class="md-1 sort">cate_num</th>
							<th class="md-1 sort">modify</th>
							<th class="mb-3 sort">delete</th>
						</tr>
					</thead>
					<tbody id="pic_tbody">
						<tr id="clone_tr">
							<td class="num"></td>
							<td class="name"></td>
							<td class="title"></td>
							<td class="count"></td>
							<td class="price"></td>
							<td class="main_img"></td>
							<td class="img_comment"></td>
							<td class="pic_num"></td>
							<td class="member_id"></td>
							<td class="post_time"></td>
							<td class="sale_time"></td>
							<td class="state"></td>
							<td class="cate_num"></td>
							<td><button class="update btn btn-primary">수정</button></td>
							<td><input class="delete form-check-input " type="checkbox"
								value=""></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="tab-pane fade" id="pills-insert" role="tabpanel"
				aria-labelledby="pills-insert-tab">
				<h3>Picture 추가</h3>
				<form name="pic_insert_form">
					<p class="form-group">
						<label for="title">title</label> <input name="title" id="title"
							class="form-control" type="text" value="test 사진" required>
					</p>
					<p class="form-group">
						<label for="name">name</label> <input name="name" id="name"
							class="form-control" type="text" value="testPic" required>
					</p>
					<p class="form-group">
						<label for="count">count</label> <input name="count" id="count"
							class="form-control" type="number" value="2000" required>
					</p>
					<p class="form-group">
						<label for="price">price</label> <input name="price" id="price"
							class="form-control" type="number" value="300000" required>
					</p>
					<p class="form-group">
						<label class="form-label" for="frame">frame</label> <input
							name="frame" id="frame" class="form-control" type="text"
							value="빈티지">
					</p>
					<p class="form-group">
						<label for="main_img">main_img</label> <input name="main_img"
							id="main_img" class="form-control" type="text" value="test.jpg">
					</p>
					<p class="form-group">
						<label for="img_comment">img_comment</label> <input
							name="img_comment" id="img_comment" class="form-control"
							type="text" value="test 사진입니다.">
					</p>
					<p class="form-group">
						<label for="pic_num">pic_num</label> <input name="pic_num"
							id="pic_num" class="form-control" type="text" value="test123123">
					</p>
					<p class="form-group">
						<label for="member_id">member_id</label> <input name="member_id"
							id="member_id" class="form-control" type="text" value="admin"
							required>
					</p>
					<p class="form-group">
						<label for="post_time">post_time</label> <input name="post_time"
							id="post_time" class="form-control" type="date"
							value="2022-04-29">
					</p>
					<p class="form-group">
						<label for="sale_time">sale_time</label> <input name="sale_time"
							id="sale_time" class="form-control" type="date"
							value="2022-05-05">
					</p>
					<p class="form-group">
						<label for="sale_end_time">sale_end_time</label> <input
							name="sale_end_time" id="sale_end_time" class="form-control"
							type="date" value="">
					</p>
					<p class="form-group">
						<label for="state">state</label> <select class="form-control"
							name="state" id="state">
							<option value="0">게시(0)</option>
							<option value="1">비공개(1)</option>
						</select>
					</p>
					<p class="form-group">
						<label for="cate_num">cate_num</label> <select
							class="form-control" name="cate_num" id="cate_num" required>
							<% for(CategoryVo cate : cate_list){ %>
							<option value="<%=cate.getCate_num()%>"><%=cate.getName()%>(<%=cate.getCate_num()%>)
							</option>
							<%} %>
						</select>
					</p>
					<p class="form-group">
						<input class="form-control btn btn-primary" type="submit"
							value="등록하기">
					</p>
				</form>

			</div>
			<div class="tab-pane fade" id="pills-modify" role="tabpanel"
				aria-labelledby="pills-modify-tab">
				<h3>Picture 수정</h3>
				<form name="pic_modify_form">
					<p class="form-group">
						<label for="num">Num</label> <input name="num" id="num"
							class="form-control" type="number" readonly value="">
					</p>
					<p class="form-group">
						<label for="title">title</label> <input name="title" id="title"
							class="form-control" type="text" value="">
					</p>
					<p class="form-group">
						<label for="name">name</label> <input name="name" id="name"
							class="form-control" type="text" value="">
					</p>
					<p class="form-group">
						<label for="count">count</label> <input name="count" id="count"
							class="form-control" type="number" value="">
					</p>
					<p class="form-group">
						<label for="price">price</label> <input name="price" id="price"
							class="form-control" type="number" value="">
					</p>
					<p class="form-group">
						<label for="frame">frame</label> <input name="frame" id="frame"
							class="form-control" type="text" value="">
					</p>
					<p class="form-group">
						<label for="main_img">main_img</label> <input name="main_img"
							id="main_img" class="form-control" type="text" value="">
					</p>
					<p class="form-group">
						<label for="img_comment">img_comment</label> <input
							name="img_comment" id="img_comment" class="form-control"
							type="text" value="">
					</p>
					<p class="form-group">
						<label for="pic_num">pic_num</label> <input name="pic_num"
							id="pic_num" class="form-control" type="text" value="">
					</p>
					<p class="form-group">
						<label for="member_id">member_id</label> <input name="member_id"
							id="member_id" class="form-control" type="text" readonly value="">
					</p>
					<p class="form-group">
						<label for="post_time">post_time</label> <input name="post_time"
							id="post_time" class="form-control" type="date" value="">
					</p>
					<p class="form-group">
						<label for="sale_time">sale_time</label> <input name="sale_time"
							id="sale_time" class="form-control" type="date" value="">
					</p>
					<p class="form-group">
						<label for="sale_end_time">sale_end_time</label> <input
							name="sale_end_time" id="sale_end_time" class="form-control"
							type="date" value="">
					</p>
					<p class="form-group">
						<label for="state">state</label> <select class="form-control"
							name="state" id="state">
							<option value="0">게시(0)</option>
							<option value="1">비공개(1)</option>
							<option value="2">신고(2)</option>
						</select>
					</p>
					<p class="form-group">
						<label for="cate_num">cate_num</label> <select
							class="form-control" name="cate_num" id="cate_num">
							<% for(CategoryVo cate : cate_list){ %>
							<option value="<%=cate.getCate_num()%>"><%=cate.getName()%>(<%=cate.getCate_num()%>)
							</option>
							<%} %>
						</select>
					</p>
					<p class="form-group">
						<input class="form-control btn btn-warning" type="submit"
							value="수정하기">
					</p>
				</form>

			</div>
		</div>
	</div>
		</div>
	</div>
</body>
</html>