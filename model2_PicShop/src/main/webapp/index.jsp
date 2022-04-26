<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script defer src="<%=request.getContextPath()%>/public/js/index.js"></script>
<style>
	.my_container{
		display:grid;
		grid-template-columns:2fr 10fr;
		grid-template-areas :"cate picture";
		grid-template-rows:100% 100%
	}
	.category_side{
		grid-area:cate;
		background-color:green;
	}
	.picture_side{
		grid-area:picture;
		background-color:blue;
	}
</style>
</head>
<body>
	<%@ include file="service_header_nav.jsp" %>

	<h1>서비스화면 시작 페이지</h1>
	<h2>Picture 리스트가 보이게 구현 하겠습니다!</h2>
	
	<div class="my_container">
		<div class="category_side">
			<ul class="nav flex-column">
				<li class="nav-item"><a class="nav-link" href="#">인물</a></li>
				<li class="nav-item"><a class="nav-link" href="#">인물</a></li>
				<li class="nav-item"><a class="nav-link" href="#">인물</a></li>
				<li class="nav-item"><a class="nav-link" href="#">인물</a></li>
				<li class="nav-item">
					<a class="nav-link" href="#">인물</a>
						<ul class="nav flex-column">
							<li><a class="nav-link" href="#">인물</a></li>
							<li><a class="nav-link" href="#">인물</a></li>
						</ul>
				</li>
				<li class="nav-item"><a class="nav-link" href="#">인물</a></li>
			</ul>		
		</div>
		<div class="picture_side">
			<h2>right-side</h2>
		</div>
	</div>

</body>
</html>