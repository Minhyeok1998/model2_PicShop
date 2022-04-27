<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
if(session.getAttribute("insert")!=null){
	boolean delete=(boolean)session.getAttribute("insert");
	String msg="";
	if(delete){ 
		msg="<script>alert(\"등록 성공\");</script>";
	}else{ 
		msg="<script>alert(\"등록 실패\");</script>";
	} 
	out.append(msg);
	session.removeAttribute("insert");
}
%>
<body>
<script>
window.onload=function(){
	const MemInsert =document.forms.MemInsert;
	MemInsert.id.addEventListener("input",async(e)=>{
		if(e.target.value.length>4){
			const res=await fetch("./id_check.do?id="+e.target.value); 
			const json=await res.json();
			console.log(json.id_check);
			if(json.id_check){
				checkId.innerText="사용 가능 아이디";
				checkId.style.color="green";
			}else{
				checkId.innerText="사용 불가능 아이디";
				checkId.style.color="red";
			}			
		}else{
			checkId.innerText="5글자 이상 입력하세요!";
			checkId.style.color="red";
		}
	});
}
</script>
	<h1>/mem/insert.jsp</h1>
	<h2>멤버 등록 폼</h2>
	<form action="./insert.do" method="post" name="MemInsert">
		<div>
	             	<label>
				아이디: <input type="text" name="id" value=">" placeholder="아이디 입력">
			</label>
			<span id="checkId">중복체크중입니다.</span>
	             </div>
	             <div>
	             	<label>
				pw:<input type="text" name="pw" value="">
			</label>
			<span id="checkPw">길이가 4이상</span>
	             </div>
	             <div>
	             	<label>
				폰:<input type="text" name="phone" value="" placeholder="휴대폰 번호 입력 (123-456-7890)">
			</label>
			<span id="checkPhone">중복체크중입니다.</span>
	             </div>
	             <div>
	             	<label>
				이메일:<input type="email" name="email" value="" placeholder="이메일 입력">
			</label>
			<span id="checkEmail">중복체크중입니다.</span>
	             </div>
	             <div>
	             	<label>
				이름:<input type="text" name="name" value="">
			</label>
	             </div>
	             <div>
	             	<label>
				주소:<input type="text" name="address" value="">
			</label>
	             </div>
	             <div>
	             	<label>
				주소상세:<input type="text" name="address_detail" value="">
			</label>
	             </div>
	             <div>
	             	<label>
				등급:<select size="1" name="grade">
						<option value="0">총관리자(0)</option>
						<option value="1">관리자(1)</option>
					</select>
			</label>
	             </div>
	             <div>
	             	<label>
				가입일:<input type="text" name="signup_time" value="" >
			</label>
	             </div>
	             <div>
	             	<label>
				생일:<input type="date" name="birth" value="" pattern="yyyy-mm-dd">
			</label>
	             </div>
		
		<p>
			<button type="reset">리셋</button>
			<button type="submit">제출</button>
		</p>
	
	</form>
	
</body>
</html>