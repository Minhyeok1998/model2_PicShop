<%@page import="pic_shop.com.vo.PicVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

	}
	.detail_main>div{
		border:1px solid black;
	}
	.btn_div{
		display:flex;
		justify-content: flex-end;
	}
	
</style>
</head>
<%

PicVo pic=(PicVo)request.getAttribute("pic");

%>
<body>
	<%@ include file="/user_header_nav.jsp" %>
	<script>document.getElementById('pic_rating').classList.add('active');</script>

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
			<div class="detail_main">
				<div>
					<img class="card-img-top  main_img" src="<%=request.getContextPath()%>/public/image/<%=pic.getMain_img()%>" alt="Card image cap">
				</div>
				<div class="pic_detail">
					<h3>타이틀 : <%=pic.getTitle()%></h3>
					<h3>그림 : <%=pic.getName()%></h3>
					<p>그림설명 : <%=pic.getImg_comment()%></p>
					<p>작가 : <%=pic.getMember_id()%></p>
					<p>카테고리 : <%=pic.getCate_num()%></p>
					<p>가격 : <%=pic.getPrice()%></p>
					<p>게시날짜 : <%=pic.getPost_time()%></p>
				</div>
				<div>코멘트</div>
				<div class="btn_div">
					<button>담기</button>
					<button>수정하기</button>
					<button>뒤로가기</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>