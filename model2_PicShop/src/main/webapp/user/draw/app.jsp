<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="styles.css">
</head>
<body>
	<canvas id="jsCanvas" class="canvas"></canvas>
	<div class="controls">
		<div class="controls_range">
			<input type="range" id="jsRange" min="0.1" max="5.0" value="2.5"
				step="0.1" />
		</div>
		<div class="controls_btns">
			<button id="jsMode">Fill</button>
			<button id="jsSave">Save</button>
		</div>
		<div class="controls_colors" id="jsColors">
			<div class="controls_color jsColor"
				style="background-color: #2c2c2c;"></div>
			<div class="controls_color jsColor" style="background-color: white;"></div>
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
	<script src="app.js"></script>
</body>
</html>