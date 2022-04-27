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
<%
if(session.getAttribute("insert")!=null){
	boolean insert=(boolean)session.getAttribute("insert");
	String msg="";
	if(insert){ 
		msg="<script>alert(\"등록 성공\");</script>";
	}else{ 
		msg="<script>alert(\"등록 실패\");</script>";
	} 
	out.append(msg);
	session.removeAttribute("insert");
}
%>
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
			<li class="nav-item"> <a href="<%=request.getContextPath()%>/" class="big_logo nav-link"><img src="./public/image/draw.png" width=100px></a></li>
			<li class="nav-item"> <!-- searc_form_li -->
				<form class="form-group" action="" name="nav_search">
					<input class="form-control" type="text" name="nav_search_input" placeholder="검색어 입력~" style="width:500px; padding:10px;">
				</form>
			</li>
			<li class="nav-item">
				<ul class="nav justify-content-space-evenly align-items-center">
<!-- 					<li class="nav-item"><span class="span" id="logoin_id">로그인 해주세요!</span></li> -->
					<li class="nav-item"><span class="span" id="logoin_id"><%=(login_id.equals("null"))?"로그인해주세요":login_id%></span></li>
					<li class="nav-item"><a class="  btn btn-primary" href="javacript:void(0)" id="login_btn" data-bs-toggle="modal" data-bs-target="#LoginModal">login</a></li> <!-- 로그인이 되어있다면 logout  OR 로그인이 되어 있지않다면 Login -->
					<li class="nav-item"><a class="  btn btn-primary" href="javascript:void(0)" id="join_btn" data-bs-toggle="modal" data-bs-target="#JoinModal" >회원가입</a></li> <!-- login 되어 있지 않을때만 보이게 한다. 로그인 되어있을 경우 class="display_None" 을 추가해준다. -->
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
	



		<div class="modal" id="LoginModal" tabindex="-1" aria-labelledby="LoginModalLabel" aria-hidden="true">
  		<div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="LoginModalLabel">로그인 해주세요</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		      <!-- loging form 시작 -->
		      <form action="">
					  <div class="form-group">
					    <label for="InputID1">ID</label>
					    <input type="id" class="form-control" id="InputID1" aria-describedby="idHelp" placeholder="Enter ID">
					    <small id="idHelp" class="form-text text-muted">아이디를 입력해주세요</small>
					  </div>
					  <div class="form-group">
					    <label for="InputPassword1">Password</label>
					    <input type="password" class="form-control" id="InputPassword1" placeholder="Password">
					  </div>
					  <div class="form-check">
					    <input type="checkbox" class="form-check-input" id="LoginCheck1">
					    <label class="form-check-label" for="LoginCheck1">Check me out</label>
					  </div>
					</form>
					
		      </div>
		      <div class="modal-footer">

		        <button type="button" class="btn btn-secondary" id="join_btn2" data-bs-toggle="modal" data-bs-target="#JoinModal">회원가입</button>

		        <button type="button" class="btn btn-primary">login</button>
		      </div>
		    </div>
  		</div>
	</div>


<div class="modal" id="JoinModal" tabindex="-1" aria-labelledby="JoinModalLabel" aria-hidden="true">
  		<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="JoinModalLabel">회원가입</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		      <!-- joinFORM 시작 -->
		      	<form action="./user/mem/insert.do" method="post" name="join_form" id="join_form">
    					<div class="col-md-5 mb-3">
      						<label for="id">ID</label>
      						
      						<input name="id" type="text" class="form-control is-invalid" id="id" placeholder="ID" value="min123" required>
      						<div class="invalid-feedback">
      							사용 불가!
      						</div>
      						<div id="idCheck" class="valid-feedback">
       						 	멋진 아이디인걸요~
      						</div>
    					</div>
   					
    				<div class="col-md-6 mb-3">
      					<label for="pw">PassWord</label>
      					<input name="pw" type="password" class="form-control is-invalid" id="pw" placeholder="Password" value="1234" required>
	      				<div id="pwCheck" class="invalid-feedback">
	       					사용할 수 없는 비밀번호
	      				</div>
	      				<div id="pwCheck" class="valid-feedback">
	       					멋진 패스워드 인걸요~
	      				</div>
    				</div>
    				
    				<div class="col-md-6 mb-3">
      					<label for="name">Name</label>
        					<input name="name" type="text" class="form-control is-invalid" id="name" placeholder="Name" required>
    						<div class="valid-feedback">
				       			오~ 이름이 멋있네요
				      		</div>
				      		<div class="invalid-feedback">
				       			이름 입력
				      		</div>
    				</div>
    				<div class="col-md-6 mb-3">
      					<label for="phone">PHONE</label>
        					<input name="phone" type="text" class="form-control is-invalid" id="phone" placeholder="PHONE" required>
    						<div class="valid-feedback">
				       			사용 가능
				      		</div>
				      		<div class="invalid-feedback">
				       			사용 불가능
				      		</div>
    				</div>

				    <div class="col-md-6 mb-3">
				      <label for="email">email</label>
				      <input name="email" type="email" class="form-control is-invalid" id="email" placeholder="email" required>
				      <div class="valid-feedback">
				       	사용 가능!
				      </div>
				      <div class="invalid-feedback">
				       	사용 불가능!
				      </div>
				    </div>
				    <div class="col-md-6 mb-3">
				      <label for="address">Address</label>
				      <input name="address" type="text" class="form-control is-invalid" id="address" placeholder="address(생략 가능)" required>
				    </div>
				    
				    <div class="col-md-6 mb-3">
				      <label for="address_detail">Address Detail</label>
				      <input name="address_detail" type="text" class="form-control is-invalid" id="address_detail" placeholder="address_detail" required>
				    </div>
				    
				     <div class="col-md-6 mb-3">
				      <label for="birth">Birth</label>
				      <input name="birth" type="date" class="form-control is-invalid" id="birth" required>
				    </div>
	  		
				  <div class="form-group">
				    <div class="form-check">
				      <input class="form-check-input is-invalid" type="checkbox" value="" id="invalidCheck3" required>
				      <label class="form-check-label" for="invalidCheck3">
				        Agree to terms and conditions
				      </label>
				      <div class="invalid-feedback">
				        You must agree before submitting.
				      </div>
				    </div>
				  </div>
				   <ul class="container">
                    <li class="item center">
                        등급
                    </li>
                    <li class="item">
                      	<select size="1" name="grade">
							<option value="0" selected>사용자(0)</option>
						</select>
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>

			</form>					

		      </div>
		      <div class="modal-footer">
		        <button type="submit" class="btn btn-secondary" form="join_form">Sign up</button>
		        <button type="button" class="btn btn-primary">login</button>
		      </div>
		    </div>
  		</div>
	</div>

	
	
</body>
</html>