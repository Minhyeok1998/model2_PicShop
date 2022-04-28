<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload = function() {
//로그인 버튼 클릭 시 form submit
document.getElementById('btnJoin').onclick = function() {
document.getElementById('form').submit();
}
//취소 버튼 누르면 뒤로가기
document.getElementById('btnCancel').onclick = function() {
history.go(-1);
}
}
</script>
</head>
<body>
<h3>회원가입</h3>
<hr>
<form action="/member/join" method="post" id="form">
<label for="userid">아이디</label>
<input type="text" id="userid" name="userid" /> <br>
<label for="userpw">패스워드</label>
<input type="text" id="userpw" name="userpw" /> <br>
<label for="usernick">닉네임</label>
<input type="text" id="usernick" name="usernick" /> <br>
<button type="button" id="btnJoin">가입</button>
<button type="button" id="btnCancel">취소</button>
</form>
</body>
</html>