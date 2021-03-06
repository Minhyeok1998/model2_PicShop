<%@page import="pic_shop.com.vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
MemberVo mem=(MemberVo)request.getAttribute("mem");
%>
<%
if(session.getAttribute("delete")!=null){
	boolean delete=(boolean)session.getAttribute("delete");
	String msg="";
	if(delete){ 
		msg="<script>alert(\"삭제 성공\");</script>";
	}else{ 
		msg="<script>alert(\"삭제 실패\");</script>";
	} 
	out.append(msg);
	session.removeAttribute("delete"); 
}
%>
<%
if(session.getAttribute("update")!=null){
	boolean update=(boolean)session.getAttribute("update");
	String msg="";
	if(update){ 
		msg="<script>alert(\"수정 성공\");</script>";
	}else{ 
		msg="<script>alert(\"수정 실패\");</script>";
	} 
	out.append(msg);
	session.removeAttribute("update"); 
}
%>
<style>
body{
    margin:0px;
    background-color: rgba(235, 235, 235,0.5);   
}
.h1Cl{
	width:500px;
	text-align : center;
	margin: 0 auto;
}
.divMain{
	display:flex;
	justify-content: center;
}
.divLeft, .divRight{ 
	display:flex;
	flex-direction: column;
    justify-content: flex-start;
    margin:20px;
}
.divLeft>div{
	display:flex;
	width:300px;
	justify-content: space-between;
}
.divRight>div{
	display:flex;
	width:500px;
	justify-content: space-between;
}

.divRight>div>div{
	display:flex;
	justify-content: space-between;
}
</style>
<script>
window.onload=function(){	//이메일체크
	const MemModify=document.forms.MemModify;
	MemModify.id.addEventListener("input",async (e)=>{
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
	MemModify.email.addEventListener("input",async (e)=>{
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
	MemModify.phone.addEventListener("input",async (e)=>{
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
<body>
<%@ include file="/admin_header_nav.jsp" %>
	<h1 class="h1Cl">멤버 수정 페이지</h1>
	<main>
    	<div class="divMain">
    		<div class="divLeft">
                <div>
                	<label>기존 아이디: </label>
					<input type="text" value="<%=mem.getId()%>" placeholder="아이디 입력" disabled>
					
                </div>
                <div>
                	<label>기존 비밀번호: </label>
					<input type="text" value="<%=mem.getPw()%>" disabled>
                </div>
                <div>
                	<label>기존 핸드폰: </label>
					<input type="text" value="<%=mem.getPhone()%>" placeholder="휴대폰 번호 입력 (123-456-7890)" disabled>
                </div>
                <div>
                	<label>기존 이메일: </label>
					<input type="email" value="<%=mem.getEmail()%>" placeholder="이메일 입력" disabled>
                </div>
                <div>
                	<label>기존 이름: </label>
                	<input type="text" value="<%=mem.getName()%>" disabled>
					
                </div>
                <div>
                	<label>기존 주소: </label>
					<input type="text" value="<%=mem.getAddress()%>" disabled>
					
                </div>
                <div>
                	<label>기존 상세주소: </label>
					<input type="text" value="<%=mem.getAddress_detail()%>" disabled>
					
                </div>
                <div>
                	<label>기존 등급: </label>
					<select size="1" name="gradeCopy" disabled>
						<option value="0" <%if(mem.getGrade()==0){out.print("selected");} %>>일반사용자(0)</option>
						<option value="1" <%if(mem.getGrade()==1){out.print("selected");} %>>관리자(1)</option>
					</select>
					
                </div>
                <div>
                	<label>기존	 이메일: </label>
					<input type="text" value="<%=mem.getSignup_time()%>" disabled>
                </div>
                <div>
                	<label>기존	 생일: </label>
					<input type="date" value="<%=mem.getBirth()%>" pattern="yyyy-mm-dd" disabled>
                </div>	
       		</div>
        	<form action="./update.do" method="post" name="MemModify">
        		<div class="divRight">
	                <div>
	                	<div>
		                	<label for="laId">아이디: </label>
							<input type="text" id="laId" name="id" value="<%=mem.getId()%>" placeholder="아이디 입력">
	                	</div>
	                	<span id="checkId">중복체크중입니다.</span>
	                </div>
	                <div>
	                	<div>
		                	<label for="laPw">비밀번호: </label>
							<input type="text" id="laPw" name="pw" value="<%=mem.getPw()%>">
	                	</div>
                		<span id="checkPw">길이가 4이상</span>
	                </div>
	                <div>
	                	<div>
	                		<label for="laPhone">핸드폰번호: </label>
	                		<input type="text" id="laPhone" name="phone" value="<%=mem.getPhone()%>" placeholder="휴대폰 번호 입력 (123-456-7890)">
	                	</div>
						<span id="checkPhone">중복체크중입니다.</span>
	                </div>
	                <div>
	                	<div>
	                		<label for="laEmail">이메일: </label>
							<input type="email" id="laEmail" name="email" value="<%=mem.getEmail()%>" placeholder="이메일 입력">
	                	</div>
                		<span id="checkEmail">중복체크중입니다.</span>
	                </div>
	                <div>
	                	<div>
	                		<label for="laName">이름: </label>
							<input type="text" id="laName" name="name" value="<%=mem.getName()%>">
						</div>
	                </div>
	                <div>
	                	<div>
	                		<label for="laAddress">주소: </label>
							<input type="text" id="laAddress" name="address" value="<%=mem.getAddress()%>">
	               		</div>
	                </div>
	                <div>
	                	<div>
		                	<label for="laAddress_detail">주소: </label>
							<input type="text" id="laAddress_detail" name="address_detail" value="<%=mem.getAddress_detail()%>">
	                	</div>
	                </div>
	                <div>
	                	<div>
		                	<label for="laGrade">등급: </label>
							<select id="laGrade" size="1" name="grade">
								<option value="0" <%if(mem.getGrade()==0){out.print("selected");} %>>관리자(0)</option>
								<option value="1" <%if(mem.getGrade()==1){out.print("selected");} %>>일반사용자(1)</option>
							</select>
						</div>
	                </div>
	                <div>
	                	<div>
		                	<label for="laSignup_time">등록일자: </label>
							<input type="text" id="laSignup_time" name="signup_time" value="<%=mem.getSignup_time()%>" readonly>
	                	</div>
	                </div>
	                <div>
	                	<div>
		                	<label for="laBrith">생일: </label>
							<input type="date" id="laBrith" name="birth" value="<%=mem.getBirth()%>" pattern="yyyy-mm-dd">
						</div>
	                </div>
	       		</div>
	       		<div>
                    <button type="submit">수정하기</button>
                    <button type="reset">리셋하기</button>
                    <button type="button" onclick="location.href='./list.do'">뒤로가기</button>
					<a href="./delete.do?id=<%=mem.getId()%>">삭제</a>
               	</div>
            </form>
        </div>
    </main>
</body>
</html>