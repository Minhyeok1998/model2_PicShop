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
		display:grid;
		gap:10px;
		padding:20px;
		grid-template-columns: 4fr 4fr 4fr;
		grid-template-rows: 5fr 5fr 5fr;
		grid-template-areas :
			"pic1 pic2 pic3"
			"pic4 pic5 pic6"
			"pic7 pic8 pic9";
		/* background-color:bisque;  */
	}
	
	.pic1 {grid-area:pic1;}
	.pic2 {grid-area:pic2;}
	.pic3 {grid-area:pic3;}
	.pic4 {grid-area:pic4;}
	.pic5 {grid-area:pic5;}
	.pic6 {grid-area:pic6;}
	.pic7 {grid-area:pic7;}
	.pic8 {grid-area:pic8;}
	.pic9 {grid-area:pic9;} 
	
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
		
			<div class="card clone_card display_None" style="width: 18rem;">
				  <img class="card-img-top  main_img" src="<%=request.getContextPath()%>/public/image/1484629.png" alt="Card image cap">
				  <div class="card-body">
				    <h5 class="card-title title">그림 제목</h5>
				    <p class="card-text img_comment">comments 를 작성하는 곳</p>
				    <p class="card-subtitle mb-2 text-muted">
				    	<span><b class="price">10000</b> 원</span>
				    	<br>
				    	<span>작성자 :<b class="member_id">민혁</b></span>
				    	<br>
				    	<span>카테고리 : <b class="cate_name">etc</b></span>
				    </p>
				    <a href="<%=request.getContextPath()%>/user/pic/detail.do?num=" class="btn btn-primary detail">더 자세히 보기</a>
				  </div>
			</div>		
			
		</div>
	</div>

</body>
</html>