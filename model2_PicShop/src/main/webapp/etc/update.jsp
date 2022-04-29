<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="pic_shop.com.vo.MemberVo"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="insert.css">
</head>
<%MemberVo mem= (MemberVo)request.getAttribute("mem");%>
<%
if(session.getAttribute("update")!=null){
	boolean insert=(boolean)session.getAttribute("update");
	String msg="";
	if(insert){ 
		msg="<script>alert(\"업데이트 성공\");</script>";
	}else{ 
		msg="<script>alert(\"업데이트 실패\");</script>";
	} 
	out.append(msg);
	session.removeAttribute("update");
}
%>
<body>
<%-- <%@ include file="/nav_header.jsp" %> --%>
<script>
window.onload=function(){	
	const MemInsert=document.forms.MemInsert;
	MemInsert.id.addEventListener("input",async(e)=>{		
		if(e.target.value.length>4){
			const res=await fetch("./id_check.do?id="+e.target.value);	//MemberIdCheck.java
			const json=await res.json();
			console.log(json.id_check);
			const id=(e.target.value);
			if(json.id_check){
				checkId.innerText="사용가능";
				checkId.style.color="green";
			}else{
				checkId.innerText="사용불가";
				checkId.style.color="red";
			}
		}else{
			checkId.innerText="5글자 이상 입력하세요!"
			checkId.style.color="white";	
		}
	});
	MemInsert.phone.addEventListener("input",async(e)=>{		
		if(e.target.value.length>9){
			const res=await fetch("./phone_check.do?phone="+e.target.value);	//MemberIdCheck.java
			const json=await res.json();
			console.log(json.phone_check);
			if(json.phone_check){
				checkPhone.innerText="사용가능";
				checkPhone.style.color="green";
			}else{
				checkPhone.innerText="사용불가";
				checkPhone.style.color="red";
			}
		}else{
			checkPhone.innerText="9자리 이상 입력하세요!"
				checkPhone.style.color="white";	
		}
	});
	MemInsert.email.addEventListener("input",async(e)=>{		
		if(e.target.value.length>9){
			const res=await fetch("./email_check.do?email="+e.target.value);	//MemberIdCheck.java
			const json=await res.json();
			console.log(json.email_check);
			if(json.email_check){
				checkEmail.innerText="사용가능";
				checkEmail.style.color="green";
			}else{
				checkEmail.innerText="사용불가";
				checkEmail.style.color="red";
			}
		}else{
			checkEmail.innerText="9자리 이상 입력하세요!"
				checkEmail.style.color="white";	
		}
	});
}
</script>
<h1>회원가입
	<a href="../index.jsp"><input type="submit" value="메인"></a>
	<a href="./list.do"><input type="submit" value="목록"></a>
	<a href="./insert.do"><input type="submit" value="등록"></a>
	<a href="./update.do"><input type="submit" value="수정"></a></h1>
	<h2>멤버 등록</h2>
	 <div class="register">
        <h3>회원가입</h3>
 <form action="./insert.do" method="post" name="MemInsert">
            <div class="flex">
                <ul class="container">
                    <li class="item center">
                        이름
                    </li>
                    <li class="item">
                        <input type="text" name="name" autofocus required>
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                <ul class="container">
                    <li class="item center">
                        아이디
                    </li>
                    <li class="item">
                        <input type="text" name="id" value="" placeholder="아이디를 입력하세요." required>
                    </li>
                    <li class="item">
                        <button id="checkId" class="idcheck">사용불가</button>
                    </li>
                </ul>
                <ul class="container">
                    <li class="item center">
                        이메일
                    </li>
                    <li class="item">
                        <input type="text" name="email" value="hong@gmail.com" placeholder="이메일를 입력하세요." required>
                    </li>
                    <li class="item">
                        <button id="checkEmail" class="idcheck">사용불가</button>
                    </li>
                </ul>
                <ul class="container">
                    <li class="item center">
                        전화번호
                    </li>
                    <li class="item">
                        <input type="text" name="phone" value="010-1234-5678" placeholder="전화번호를 입력하세요." required>
                    </li>
                    <li class="item">
                        <button id="checkPhone" class="idcheck">사용불가</button>
                    </li>
                </ul>
                <ul class="container">
                    <li class="item center">
                        비밀번호
                    </li>
                    <li class="item">
                        <input type="text" name="pw" value="1234" placeholder="비밀번호를 입력하세요." required>
                    </li>
                    <li class="item">
      
                    </li>
                </ul>
                <ul class="container">
                    <li class="item center">
                        비밀번호 확인
                    </li>
                    <li class="item">
                        <input type="text" name="pw_check" value="" placeholder="비밀번호를 입력하세요." required>
                    </li>
                    <li class="item">

                    </li>
                </ul>
                <ul class="container">
                    <li class="item center">
                        생년월일
                    </li>
                    <li class="item">
                        <input type="date" name="birth" value="1900-01-01" pattern="yyyy-mm-dd" required>
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                <ul class="container">
                    <li class="item center">
                        등급
                    </li>
                    <li class="item">
                      	<select size="1" name="grade">
							<option value="0">총관리자(0)</option>
							<option value="1">관리자(1)</option>
							<option value="2">판매자(2)</option>
							<option value="3" selected>소비자(3)</option>
							<option value="4">탈퇴(4)</option>
						</select>
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                <ul class="container">
                    <li class="item center">
                        주소
                    </li>
                    <li class="item">
                        <input type="text" name="address" value="서울" placeholder="주소">
                    </li>
                </ul>
                    <ul class="container">
                    <li class="item center">
                        주소상세
                    </li>
                    <li class="item">
             			 <input type="text" name="address_detail" value="종로" placeholder="주소상세">
                    </li>
                    
                </ul>
                <ul class="container">
                    <li class="item center">
                        
                    </li>
                    <li class="item">
                        <button type="reset" class="submit">RESET</button>

                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                <ul class="container">
                    <li class="item center">
                        
                    </li>
                    <li class="item">
                        <button type="submit"class="submit">가입</button>

                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
            </div>
	
	</form>
</body>
</html>