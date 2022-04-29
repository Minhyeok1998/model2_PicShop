<%@page import="pic_shop.com.vo.CategoryVo"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Picture 관리자 페이지 입니다.</title>
<script defer src="<%=request.getContextPath()%>/public/js/picture_admin.js"></script>
<style>


</style>
</head>
<body>
	<% List<CategoryVo> cate_list = (List<CategoryVo>)request.getAttribute("cate_list"); %>
	 <%@ include file="/admin_header_nav.jsp" %>

	<div class="container" style="margin-top:10px;">
		<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
		  <li class="nav-item">
		    <a class="nav-link active" id="pills-list-tab" data-toggle="pill" href="#pills-list" role="tab" aria-controls="pills-list" aria-selected="true">Picture List</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" id="pills-insert-tab" data-toggle="pill" href="#pills-insert" role="tab" aria-controls="pills-insert" aria-selected="false">Picture 추가</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" id="pills-modify-tab" data-toggle="pill" href="#pills-modify" role="tab" aria-controls="pills-modify" aria-selected="false" disabled>Picture 수정</a>
		  </li>
		</ul>
	  <div class="tab-content" id="pills-tabContent">
	  <div class="tab-pane fade show active" id="pills-list" role="tabpanel" aria-labelledby="pills-list-tab">
	  		<h3>리스트 출력</h3>
	  		<button id="deleteBtn">일괄 삭제</button>
	  		<table class="table table-bordered table-striped  table-primary">
  				<thead class="thead-success">
  					<tr>
  						<th class="col-md-1">num</th>
						<th class="col-md-2">name</th>
  						<th class="col-md-2">title</th>
						<th class="col-md-1">count</th>
						<th class="col-md-1">price</th>
						<th class="col-md-3">main_img</th>
						<th class="col-md-3">img_comment</th>
						<th class="col-md-2">pic_num</th>
						<th class="col-md-2">member_id</th>
						<th class="col-md-4">post_time</th>
						<th class="col-md-4">sale_time</th>
						<th class="col-md-1">state</th>
						<th class="col-md-1">cate_num</th>
						<th class="col-md-1">수정</th>
						<th class="col-md-1">삭제</th>
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
						<td><input class="delete form-check-input " type="checkbox" value=""></td>
  					</tr>
  				</tbody>
			</table>
	  </div>
	  <div class="tab-pane fade" id="pills-insert" role="tabpanel" aria-labelledby="pills-insert-tab">Picture 추가
	  
	  	
	  </div>
	  <div class="tab-pane fade" id="pills-modify" role="tabpanel" aria-labelledby="pills-modify-tab">
	  		<h3>Picture 수정</h3>
	  		<form name="pic_modify_form">
	  			<p class="form-group">
	  				<label for="num">Num</label>
	  				<input name="num" id="num" class="form-control" type="number" readonly value="">
	  			</p>
	  			<p class="form-group">
	  				<label for="title">title</label>
	  				<input name="title" id="title" class="form-control" type="text"  value="">
	  			</p>
	  			<p class="form-group">
	  				<label for="name">name</label>
	  				<input name="name" id="name" class="form-control" type="text"  value="">
	  			</p>
	  			<p class="form-group">
	  				<label for="count">count</label>
	  				<input name="count" id="count" class="form-control" type="number"  value="">
	  			</p>
	  			<p class="form-group">
	  				<label for="price">price</label>
	  				<input name="price" id="price" class="form-control" type="number"  value="">
	  			</p>
	  			<p class="form-group">
	  				<label for="frame">frame</label>
	  				<input name="frame" id="frame" class="form-control" type="text"  value="">
	  			</p>
	  			<p class="form-group">
	  				<label for="main_img">main_img</label>
	  				<input name="main_img" id="main_img" class="form-control" type="text"  value="">
	  			</p>
	  			<p class="form-group">
	  				<label for="img_comment">img_comment</label>
	  				<input name="img_comment" id="img_comment" class="form-control" type="text"  value="">
	  			</p>
	  			<p class="form-group">
	  				<label for="pic_num">pic_num</label>
	  				<input name="pic_num" id="pic_num" class="form-control" type="text"  value="">
	  			</p>
	  			<p class="form-group">
	  				<label for="member_id">member_id</label>
	  				<input name="member_id" id="member_id" class="form-control" type="text" readonly  value="">
	  			</p>
	  			<p class="form-group">
	  				<label for="post_time">post_time</label>
	  				<input name="post_time" id="post_time" class="form-control" type="date"  value="">
	  			</p>
	  			<p class="form-group">
	  				<label for="sale_time">sale_time</label>
	  				<input name="sale_time" id="sale_time" class="form-control" type="date"  value="">
	  			</p>
	  			<p class="form-group">
	  				<label for="sale_end_time">sale_end_time</label>
	  				<input name="sale_end_time" id="sale_end_time" class="form-control" type="date"  value="">
	  			</p>
	  			<p class="form-group">
	  				<label for="state">state</label>
	  				<select class="form-control" name="state" id="state">
	  					<option value="0">게시(0)</option>
	  					<option value="1">비공개(1)</option>
	  					<option value="2">신고(2)</option>
	  				</select>
	  			</p>
	  			<p class="form-group">
	  				<label for="cate_num">cate_num</label>
	  				<select  class="form-control" name="cate_num" id="cate_num">
	  						<% for(CategoryVo cate : cate_list){ %>
	  							<option value="<%=cate.getCate_num()%>"><%=cate.getName()%>(<%=cate.getCate_num()%>)</option>
	  						<%} %>
	  				</select>
	  			</p>
	  			<p class="form-group">
	  				<input  class="form-control"type="submit" value="수정하기">
	  			</p>
	  		</form>
	  	
	  </div>
  </div>
</div>
</body>
</html>