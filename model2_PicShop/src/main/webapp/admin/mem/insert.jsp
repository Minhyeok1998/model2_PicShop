<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</head>
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
<body>
<script>
window.onload=function(){	//이메일체크
	const MemInsert=document.forms.MemInsert;
	MemInsert.id.addEventListener("input",async (e)=>{
		if(e.target.value.length>4){
			const res=await fetch("./id_check.do?id="+e.target.value); //MemberIdCheck.java
			const json=await res.json();
			if(json.id_check){
				checkId.innerText="사용 가능한 아이디";
				checkId.style.color="green";
			}else{
				checkId.innerText="사용 불가능한 아이디";
				checkId.style.color="red";
			}
		}else{
			checkId.innerText="5글자 이상 입력하세요!!";
			checkId.style.color="red";
		}
	});
	MemInsert.email.addEventListener("input",async (e)=>{
		if(e.target.value.length>3){
			const res=await fetch("./email_check.do?email="+e.target.value); //MemberIdCheck.java
			const json=await res.json();
			if(json.email_check){
				checkEmail.innerText="사용 가능한 이메일";
				checkEmail.style.color="green";
			}else{
				checkEmail.innerText="사용 불가능한 이메일";
				checkEmail.style.color="red";
			}
		}else{
			checkEmail.innerText="3글자 이상 입력하세요!!";
			checkEmail.style.color="red";
		}
	});
	MemInsert.phone.addEventListener("input",async (e)=>{
		if(e.target.value.length>8){
			const res=await fetch("./phone_check.do?phone="+e.target.value); //MemberIdCheck.java
			const json=await res.json();
			if(json.phone_check){
				checkPhone.innerText="사용 가능한 휴대폰 번호";
				checkPhone.style.color="green";
			}else{
				checkPhone.innerText="사용 불가능한 핸드폰 번호";
				checkPhone.style.color="red";
			}
		}else{
			checkPhone.innerText="8글자 이상 입력하세요!!";
			checkPhone.style.color="red";
		}
	});
}
</script>
	<h1>멤버 등록 페이지</h1>
	<form action="./insert.do" method="post" name="MemInsert">
		<div>
			<div>
	        	<div>
	            	<label for="laId">아이디: </label>
					<input type="text" id="laId" name="id" value="" placeholder="아이디 입력">
	            </div>
	            <span id="checkId">중복체크중입니다.</span>
			</div>
            <div>
            	<div>
	             	<label for="laPw">비밀번호: </label>
					<input type="text" id="laPw" name="pw" value="">
            	</div>
           		<span id="checkPw">길이가 4이상</span>
            </div>
            <div>
            	<div>
            		<label for="laPhone">핸드폰번호: </label>
            		<input type="text" id="laPhone" name="phone" value="" placeholder="휴대폰 번호 입력 (123-456-7890)">
            	</div>
				<span id="checkPhone">중복체크중입니다.</span>
            </div>
            <div>
            	<div>
            		<label for="laEmail">이메일: </label>
					<input type="email" id="laEmail" name="email" value="" placeholder="이메일 입력">
            	</div>
           		<span id="checkEmail">중복체크중입니다.</span>
            </div>
            <div>
            	<div>
            		<label for="laName">이름: </label>
					<input type="text" id="laName" name="name" value="">
				</div>
            </div>
            <div>
            	<div>
            		<label for="laAddress">주소: </label>
					<input type="text" id="laAddress" name="address" value="">
           		</div>
            </div>
            <div>
            	<div>
             		<label for="laAddress_detail">주소: </label>
					<input type="text" id="laAddress_detail" name="address_detail" value="">
            	</div>
            </div>
            <div>
            	<div>
             		<label for="laGrade">등급: </label>
					<select id="laGrade" size="1" name="grade">
						<option value="0">관리자(0)</option>
						<option value="1">일반사용자(1)</option>
					</select>
				</div>
            </div>
            <div>
            	<div>
             		<label for="laBrith">생일: </label>
					<input type="date" id="laBrith" name="birth" value="" pattern="yyyy-mm-dd">
				</div>
            </div>
		</div>
		<p>
			<button type="reset">리셋</button>
			<button type="submit">제출</button>
		</p>
	
	</form>
	
</body>
</html>