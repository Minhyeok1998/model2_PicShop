<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script defer src="<%=request.getContextPath()%>/public/js/category_admin.js"></script>
<title>Category 관리자 페이지 입니다.</title>
</head>
<body>
	 <%@ include file="/admin_header_nav.jsp" %>
	<h1>Category 관리자 페이지 입니다.</h1>
	<div class="container" style="margin-top:10px;">
		<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
		  <li class="nav-item">
		    <a class="nav-link active" id="pills-list-tab" data-toggle="pill" href="#pills-list" role="tab" aria-controls="pills-list" aria-selected="true">카테고리 리스트</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" id="pills-insert-tab" data-toggle="pill" href="#pills-insert" role="tab" aria-controls="pills-insert" aria-selected="false">카테고리 추가</a>
		  </li>
		  <li class="nav-item">
		     <a class="nav-link" id="pills-modify-tab" data-toggle="pill" href="#pills-modify" role="tab" aria-controls="pills-modify" aria-selected="false" disabled>카테고리 수정</a>
		  </li>
		</ul>
	  <div class="tab-content" id="pills-tabContent">
	  <div class="tab-pane fade show active" id="pills-list" role="tabpanel" aria-labelledby="pills-list-tab">
	  		<h3>리스트 출력</h3>
	  		<div class="nav justify-content-end">
	  			<button id="delete_btn" class="btn btn-danger">선택 삭제</button>
	  		</div>
	  		<table class="table table-bordered table-striped  table-primary text-center">
	  			<thead>
	  				<tr>
	  					<th>cate_num</th>
	  					<th>name</th>
	  					<th>sub</th>
	  					<th>수정</th>
	  					<th>삭제</th>
	  				</tr>
	  			</thead>
	  			<tbody class="cate_body">
	  				<tr class="clone_tr">
	  					<td class="cate_num"></td>
	  					<td class="name"></td>
	  					<td class="sub"></td>
	  					<td><input class="btn btn-primary" type="button" value="수정" class="update"></td>
	  					<td><input class="form-check-input" type="checkbox" class="delete"></td>
	  				</tr>
	  			</tbody>
	  		</table>
	  		
	  </div>
	  <div class="tab-pane fade" id="pills-insert" role="tabpanel" aria-labelledby="pills-insert-tab">
	  		<h3>카테고리 추가</h3>
	  </div>
	  <div class="tab-pane fade" id="pills-modify" role="tabpanel" aria-labelledby="pills-modify-tab">
	  		<h3>카테고리 수정</h3>
	  </div>
  </div>
</div>
</body>
</html>