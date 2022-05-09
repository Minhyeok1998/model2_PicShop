<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면!</title>
<style>
	   #login-form > div {
        margin: 15px 0;
    }
</style>
</head>
<body>
<%
	Object loginExcept =request.getSession().getAttribute("LoginExp");
	Object canTLogin =request.getSession().getAttribute("canTLogin");
	
	if(loginExcept != null){
		String msg = "<script>alert('로그인 하세요!')</script>";
		out.append(msg);
		request.getSession().removeAttribute("LoginExp");
	}
	if(canTLogin != null){
		String msg = "<script>alert('ID 또는 PASSWORD를 확인해주세요!')</script>";
		out.append(msg);
		request.getSession().removeAttribute("canTLogin");
	}
	
%>
<%@ include file="user_header_nav.jsp" %>

	
	<div class="container">
    <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
     
    </div>
    <div class="container h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-2"></div>
        <div class="col-4 text-center">
         	   <div class="panel panel-success">
		            <div class="panel-heading">
		                <div class="panel-title">환영합니다!</div>
		            </div>
		            <div class="panel-body">
		                <form id="login-form" action="<%=request.getContextPath()%>/user/login.do" method="POST">
		                    <div>
		                        <input type="text" class="form-control" name="id" placeholder="ID" autofocus required>
		                    </div>
		                    <div>
		                        <input type="password" class="form-control" name="pwd" placeholder="PASSWORD" required>
		                    </div>
		                    <div>
		                        <button type="submit" class="form-control btn btn-primary">로그인</button>
		                    </div>
		                </form>
		            </div>
		        </div>
          </div>

        <div class="col-2"></div>
    </div> <!-- END OF ROW -->
</div>
</div>
</body>
</html>