<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="pic_shop.com.vo.BoardVo"%>
<% List<BoardVo> boa_List = (List<BoardVo>) request.getAttribute("boardList"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>게시판 목록 전체 조회</h1>
<hr>
<table>
<tr>
<th>번호</th>
<th>제목</th>
<th>아이디</th>
<th>조회수</th>
<th>작성일</th>
</tr>

</table>

</body>
</html>