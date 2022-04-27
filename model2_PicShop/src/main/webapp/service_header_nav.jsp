<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script defer src="<%=request.getContextPath()%>/public/js/service_header_nav.js"></script>
<style>

	*{
		margin:0;
	}
	@font-face {
	    font-family: 'YUniverse-B';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_yuniverse@1.0/YUniverse-B.woff2') format('woff2');
	    font-weight: normal;
	    font-style: normal;
	}
	
	.display_None{
		display:none;
	}
	.big_logo{
		padding-left:40px;
		font-weight:bolder;
		font-size:50px;
		text-decoration:none;
	}
	
	/* .header_nav{
		padding:20px 14px;
		text-decoration: none;
		font-family:'YUniverse-B';
		display:flex;
		list-style: none;
		justify-content:space-between;
		align-items: center;
		background-color:yellow;
	}

	
	.search_form_li{
		position:relative;
		left:200px;
	}
	.header_nav input{
		height :50px;
	}
	.header_nav input[type="text"]{
		width:300px;
		font-size:20px;
		padding:8px 10px;
	}
	.login_nav{
		position:relative;
		left:300px;
		display:flex;
		list-style:none;
		justify-content:center;
		align-items:center;
	}
	.login_nav li{
		padding:8px 10px;
	}
	.a_btn{
		text-decoration:none;
		color:black;
		font-family:'YUniverse-B';
		padding:4px;
		background-color:rgb(208,208,208);
		border-radius:5px;
		border:1px solid black;
	}
	.a_btn:hover{
		background-color:whitesmoke;
	}
	 */
	#top_first_nav{
		font-family:'YUniverse-B';
	}
	#top_first_nav li{
		padding-right : 20px;
		font-size:20px;
	}
	#top_second_nav{
		font-family:'YUniverse-B';
		font-size:20px;
	}
	

</style>
</head>
<body>
	<%
		 String login_id = String.valueOf(request.getSession().getAttribute("login_id")); // session 에 저장된 id =>세션에 저장된 login_id가 없으면  null 이나온다.
		/* String login_id = "admin"; */
		/* String alert = "<script>alert("+login_id+")</script>";
		out.append(alert); */
		/* request.getSession().invalidate(); */
	%>

	<nav  >
		<ul id="top_first_nav" class="nav justify-content-space-evenly align-items-center" style="padding:10px;">
			<li class="nav-item"> <a href="<%=request.getContextPath()%>/" class="big_logo nav-link">Draw</a></li>
			<li class="nav-item"> <!-- searc_form_li -->
				<form class="form-group" action="" name="nav_search">
					<input class="form-control" type="text" name="nav_search_input" placeholder="검색어 입력~" style="width:500px; padding:10px;">
				</form>
			</li>
			<li class="nav-item">
				<ul class="nav justify-content-space-evenly align-items-center">
<!-- 					<li class="nav-item"><span class="span" id="logoin_id">로그인 해주세요!</span></li> -->
					<li class="nav-item"><span class="span" id="logoin_id"><%=(login_id.equals("null"))?"로그인해주세요":login_id%></span></li>
					<li class="nav-item"><a class="  btn btn-primary" href="#" id="login_value">login</a></li> <!-- 로그인이 되어있다면 logout  OR 로그인이 되어 있지않다면 Login -->
					<li class="nav-item"><a class="  btn btn-primary" href="#">회원가입</a></li> <!-- login 되어 있지 않을때만 보이게 한다. 로그인 되어있을 경우 class="display_None" 을 추가해준다. -->
					<li id="user_info" class='nav-item display_None'> <!--로그인 되어있을때 display_None을 지워준다.-->
						<ul class="nav">
							<li class="nav-item"><a class="nav-link" href="#" id="user_write_Atg">내가 작성한 글</a></li>
							<li class="nav-item"><a class="nav-link"  href="#">장바구니</a></li>
						</ul>
					</li>
				</ul>
			<li>
		</ul>
	</nav>
	<nav id="top_second_nav">
		<ul class="nav justify-content-center  nav-pills nav-fill">
			<li class="nav-item"><a class="nav-link active" href="#">그림 list</a></li>
			<li class="nav-item"><a class="nav-link" href="#">그림 그리기</a></li>
			<li class="nav-item"><a class="nav-link" href="#">그림 평가하기</a></li>
			<li class="nav-item"><a class="nav-link" href="#">자유 게시판</a></li>
		</ul>
	</nav>

</body>
</html>