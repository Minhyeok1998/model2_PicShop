<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="styles.css">
</head>
<style>
.mycontainer {
	display: grid;
	grid-template-columns: 6fr 6fr;
	grid-template-areas: "left right";
}

.leftside {
	grid-area: left;
	display: grid;
	grid-template-rows: 2fr 7fr 3fr;
	grid-template-columns: 1fr 7fr 4fr;
	grid-template-areas: "range range range" 
						"color canvas stroke"
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
				<div class='stroke'></div>
				<div class='save'>
					<div class="controls_btns">
						<button id="jsMode">Fill</button>
						<button id="jsSave">Save</button>
					</div> 
				</div>
			
		</div>
		<div class=rightside>
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
						id="post_time" class="form-control" type="date" value="2022-04-29">
				</p>
				<p class="form-group">
					<label for="sale_time">sale_time</label> <input name="sale_time"
						id="sale_time" class="form-control" type="date" value="2022-05-05">
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
					<label for="cate_num">cate_num</label> <select class="form-control"
						name="cate_num" id="cate_num" required>

					</select>
				</p>
				<p class="form-group">
					<input class="form-control btn btn-primary" type="submit"
						value="등록하기">
				</p>
			</form>
		</div>



	</div>
	<script src="app.js"></script>
</body>
</html>