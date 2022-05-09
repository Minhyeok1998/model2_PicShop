<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="pic_shop.com.vo.CategoryVo"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Draw</title>
<link rel="stylesheet" href="styles.css">
</head>

<%
if (session.getAttribute("insert") != null) {
	boolean insert = (boolean) session.getAttribute("insert");
	String msg = "";
	if (insert) {
		msg = "<script>alert(\"등록 성공\");</script>";
	} else {
		msg = "<script>alert(\"등록 실패\");</script>";
	}
	out.append(msg);
	session.removeAttribute("insert");
}
%>

<style>
.mycontainer {
	display: grid;
	grid-template-columns: 6fr 6fr;
	grid-template-areas: "left right";
}

.leftside {
	grid-area: left;
	display: grid;
	grid-template-rows: 2fr 5fr 5fr;
	grid-template-columns: 1fr 7fr 4fr;
	grid-template-areas: "range range range" "color canvas stroke"
		"color canvas save";
}

.rightside {
	grid-area: right;
}

.range {
	grid-area: range;
}

.color {
	grid-area: color;
}

.canvas {
	grid-area: canvas;
}

.stroke {
	grid-area: stroke;
}

.save {
	grid-area: save;
}
</style>
<body>
	<%
	List<CategoryVo> cate_list = (List<CategoryVo>) request.getAttribute("cate_list");
	%>
	<%@ include file="/user_header_nav.jsp"%>

	<div class='mycontainer'>
		<div class='leftside'>
			<div class='range'>
				<div class="controls">
					<div class="controls_range">
						<input type="range" id="jsRange" min="0.1" max="5.0" value="2.5"
							step="0.1" />
					</div>
				</div>
			</div>
			<div class='color'>
				<div class="controls_colors" id="jsColors">
					<div class="controls_color jsColor"
						style="background-color: #2c2c2c;"></div>
					<div class="controls_color jsColor"
						style="background-color: white;"></div>
					<div class="controls_color jsColor"
						style="background-color: #FF3B30;"></div>
					<div class="controls_color jsColor"
						style="background-color: #ff9500;"></div>
					<div class="controls_color jsColor"
						style="background-color: #4cd963;"></div>
					<div class="controls_color jsColor"
						style="background-color: #5ac8fa;"></div>
					<div class="controls_color jsColor"
						style="background-color: #0579ff;"></div>
					<div class="controls_color jsColor"
						style="background-color: #5856d6;"></div>
				</div>
			</div>
			<div class='canvas'>
				<canvas id="jsCanvas" class="canvas"></canvas>
			</div>
			<div class='stroke'>
				<div class="controls_btns">
					<button id="jsMode">Color</button>
					<button id="jsLine">Line</button>
					<button id="jsFill">Fill</button>
					<button id="jsSave">Save</button>
				</div>
			</div>
			<div class='save'></div>

		</div>
		<div class=rightside>

			<form name="pic_insert_form" action="./draw.do" method="post" enctype="multipart/form-data">
				<p class="input-group">
					<label for="title" class="input-group-text">게시타이틀</label> <input
						name="title" type="text" class="form-control" id="title"
						value="test 사진" required>
				</p>
				<p class="input-group">
					<label for="cate_num" class="input-group-text">카테고리</label> <select
						name="cate_num" class="form-control" id="cate_num">
						<%
						for (CategoryVo cate : cate_list) {
						%>
						<option value="<%=cate.getCate_num()%>"><%=cate.getName()%>(<%=cate.getCate_num()%>)
						</option>
						<%
						}
						%>
					</select>
				</p>
				<p class="input-group">
					<label for="name" class="input-group-text">작품이름</label> <input
						name="name" type="text" class="form-control" id="name"
						value="testPic" required>
				</p>
				<p class="input-group">
					<label for="pic_num" class="input-group-text">일련번호</label> <input
						name="pic_num" type="text" class="form-control" id="pic_num"
						value="MX1322F3">
				</p>

				<p class="input-group">
					<label for="price" class="input-group-text">판매가격</label> <input
						name="price" type="number" class="form-control" id="price"
						value="300000000" required>
				</p>

				<p class="input-group">
					<label for="main_img" class="input-group-text">작품이미지</label> <input
						name="main_img" type="file" class="form-control" id="main_img"
						value="test.jpg">
				</p>
				<p class="input-group">
					<label for="img_comment" class="input-group-text">작가의한마디</label> <input
						name="img_comment" type="text" class="form-control"
						id="img_comment" value="작품설명:...">
				</p>

				<p class="input-group">
					<label for="member_id" class="input-group-text">작가명</label> <input
						name="member_id" type="text" class="form-control" id="member_id"
						value="admin" required readonly>
				</p>
				<p class="input-group">
					<label for="post_time" class="input-group-text">작품게시일</label> <input
						name="post_time" type="date" class="form-control" id="post_time"
						value="" readonly>
				</p>
				<p class="input-group">
					<label for="sale_time" class="input-group-text">판매시작일</label> <input
						name="sale_time" type="date" class="form-control" id="sale_time"
						value="2022-05-06">
				</p>
				<p class="input-group">
					<label for="sale_end_time" class="input-group-text">판매종료일</label> <input
						name="sale_end_time" type="date" class="form-control"
						id="sale_end_time" value="">
				</p>
				<p class="input-group">
					<label for="frame" class="input-group-text">액자색상</label> <input
						name="frame" type="color" class="form-control form-control-color"
						id="frame" value="#ffd700" title="Choose your color"> <label
						for="state" class="input-group-text">상태</label> <select
						name="state" id="state" class="form-control">
						<option value="0" selected>공개</option>
						<option value="1">비공개</option>
					</select> <label for="count" class="input-group-text">작품판매수량</label> <input
						name="count" id="count" type="number" class="form-control"
						value="100" required>
				</p>

				<p class="form-group">
					<input class="form-control btn btn-primary" type="submit"
						value="등록하기"> <input
						class="form-control btn btn-secondary" type="reset" value="리셋하기">
				</p>
			</form>
		</div>
	</div>
	<script src="draw.js"></script>
	<script>
	const todayUTC = new Date().toISOString().substr(0,10);
	const todayLocal = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60 * 1000).toISOString().substr(0,10);
	const tomorrowLocal = new Date(new Date().getTime() + 24 * 60 * 60 * 1000 - new Date().getTimezoneOffset() * 60 * 1000).toISOString().substr(0,10);
	document.getElementById('post_time').value = todayUTC;
	document.getElementById('sale_time').value = todayLocal;
	document.getElementById('sale_end_time').value = tomorrowLocal;

	document.getElementById('pic_draw').classList.add('active');

	</script>
</body>
</html>