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
	 <%@ include file="/admin_header_nav.jsp" %>

	<div class="container" style="margin-top:10px;">
		<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
		  <li class="nav-item">
		    <a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#pills-list" role="tab" aria-controls="pills-list" aria-selected="true">Picture List</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#pills-insert" role="tab" aria-controls="pills-insert" aria-selected="false">Picture 추가</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" id="pills-contact-tab" data-toggle="pill" href="#pills-modify" role="tab" aria-controls="pills-modify" aria-selected="false">Picture 수정</a>
		  </li>
		</ul>
	  <div class="tab-content" id="pills-tabContent">
	  <div class="tab-pane fade show active" id="pills-list" role="tabpanel" aria-labelledby="pills-list-tab">
	  		<h3>리스트 출력</h3>
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
  					</tr>
  				</tbody>
			</table>
	  </div>
	  <div class="tab-pane fade" id="pills-insert" role="tabpanel" aria-labelledby="pills-insert-tab">Picture 추가</div>
	  <div class="tab-pane fade" id="pills-modify" role="tabpanel" aria-labelledby="pills-modify-tab">Picture 수정</div>
  </div>
</div>
</body>
</html>