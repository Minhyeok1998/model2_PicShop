<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script defer src="<%=request.getContextPath()%>/public/js/user_bar_nav.js"></script>
</head>
<body>
<nav id="top_second_nav">
		<ul class="nav justify-content-center  nav-pills nav-fill">
			<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/">LIST</a></li>
			<li class="nav-item"><a class="nav-link active" href="<%=request.getContextPath()%>/user/draw/draw.jsp">DROW</a></li>
			<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/user/pic_list/detail.do?num=1015">REVIEW</a></li>
			<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/user/board/board.jsp">BOARD</a></li>
		</ul>
	</nav>
</body>
</html>