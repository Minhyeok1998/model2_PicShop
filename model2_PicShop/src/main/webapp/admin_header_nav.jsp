<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="pic_shop.com.vo.MemberVo"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script defer
	src="<%=request.getContextPath()%>/public/js/admin_header_nav.js?v=<%=System.currentTimeMillis()%>"></script>
<style>
* {
	margin: 0;
}

@font-face {
	font-family: 'YUniverse-B';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_yuniverse@1.0/YUniverse-B.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

.display_None {
	display: none;
}

.big_logo {
	padding-left: 40px;
	font-weight: bolder;
	font-size: 50px;
	text-decoration: none;
}

#top_first_nav {
	font-family: 'YUniverse-B';
}

#top_first_nav li {
	padding-right: 20px;
	font-size: 20px;
}

#top_second_nav {
	font-family: 'YUniverse-B';
	font-size: 20px;
}
</style>
</head>
<body>
	<%
		Object login_result = request.getSession().getAttribute("login_result")!= null?request.getSession().getAttribute("login_result"):null;//boolean
		MemberVo member = null;
		if(login_result != null && (boolean)login_result){
			member =(MemberVo)request.getSession().getAttribute("member");
		}
		
	%>
	<!-- <div class="fixed-top"> -->
	<nav>
		<ul id="top_first_nav"
			class="nav justify-content-space-evenly align-items-center"
			style="padding: 10px;">
			<li class="nav-item"><a
				href="<%=request.getContextPath()%>/admin/mem/list.do"
				class="big_logo nav-link">Draw</a></li>
			<li class="nav-item">
				<ul class="nav justify-content-space-evenly align-items-center">
					<li class="nav-item"><span class="span" id="logoin_id"><%=member.getId()%></span></li>
					<li class="nav-item"><a class="  btn btn-danger"
						href="<%=request.getContextPath()%>/user/logOut.do"
						id="logout_btn">logout</a></li>
					<!-- ???????????? ??????????????? logout  OR ???????????? ?????? ??????????????? Login -->
					<li class="nav-item"><a class=" nav-link"
						href="<%=request.getContextPath()%>/">??????????????? ??????</a></li>
					<li id="user_info" class='nav-item display_None'>
						<!--????????? ??????????????? display_None??? ????????????.-->
						<ul class="nav">
							<li class="nav-item"><a class="nav-link" href="#"
								id="user_write_Atg">?????? ????????? ???</a></li>
							<li class="nav-item"><a class="nav-link" href="#">????????????</a></li>
						</ul>
					</li>
				</ul>
			<li>
		</ul>
	</nav>
	<nav id="top_second_nav">
		<ul class="nav justify-content-center  nav-pills nav-fill">
			<li class="nav-item"><a class="nav-link active"
				href="<%=request.getContextPath()%>/admin/mem/list.do">Member ??????</a></li>
			<li class="nav-item"><a class="nav-link"
				href="<%=request.getContextPath()%>/admin/picture/list.do">Picture
					??????</a></li>
			<li class="nav-item"><a class="nav-link"
				href="<%=request.getContextPath()%>/admin/comment/list.do">Pic_comment
					??????</a></li>
			<li class="nav-item"><a class="nav-link"
				href="<%=request.getContextPath()%>/admin/category/list.do">Category
					??????</a></li>
			<li class="nav-item"><a class="nav-link" href="#">Board ??????</a></li>
		</ul>
	</nav>
	<!-- 	</div> -->
</body>
</html>