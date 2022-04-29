<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<script type="text/javascript">
window.onload = function() {
//로그인 버튼 클릭시 form submit
document.getElementById('btnLogin').onclick = function() {
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

	<h3>로그인</h3>
<hr>
<form action="./login.do" method="post" id="form">
<label for="userid">아이디</label>
<input type="text" id="userid" name="userid"><br>
<label for="userpw">비밀번호</label>
<input type="text" id="userpw" name="userpw"><br><br>
<button type="button" id="btnLogin">로그인</button>
<button type="button" id="btnCancel">취소</button>
</form>


</body>
</html>