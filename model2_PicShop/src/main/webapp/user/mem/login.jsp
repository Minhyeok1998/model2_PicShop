<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
<!-- 비로그인상태 -->
<% if(session.getAttribute("login") == null || !(boolean)session.getAttribute("login")) { %>
<strong>로그인이 필요합니다</strong><br>
<button onclick='location.href="/user/mem/login";'>로그인</button>
<button onclick='location.href="/user/mem/join";'>회원가입</button>
<!-- 로그인상태 -->
<% } else if( (boolean)session.getAttribute("login") ) { %>
<strong>${usernick } 님, 환영합니다</strong><br>
<button onclick='location.href="/index.jsp";'>게시판 가기</button>
<button onclick='location.href="/user/mem/logout";'>로그아웃</button>
<% } %>
</div>

</body>
</html>