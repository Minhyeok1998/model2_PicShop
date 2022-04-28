<%@page import="pic_shop.com.vo.MemberVo"%>
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
.divLeft>div, .divRight>div{
	display:flex;
	justify-content: space-between;
}
.divRight>div>div{
	display:flex;
	justify-content: space-between;
}
</style>
<body>
	<h1 class="h1Cl">멤버 수정 페이지</h1>
	<main>
    	<div class="divMain">
    		<div class="divLeft">
                <div>
                	<label for="">아이디: </label>
					<input type="text" name="cpName" value="<%=mem.getId()%>" placeholder="아이디 입력" disabled>
					
                </div>
                <div>
                	<label>
						pw: <input type="text"value="<%=mem.getPw()%>" disabled>
					</label>
                </div>
                <div>
                	<label>
						폰: <input type="text" value="<%=mem.getPhone()%>" placeholder="휴대폰 번호 입력 (123-456-7890)" disabled>
					</label>
                </div>
                <div>
                	<label>
						이메일: <input type="email" value="<%=mem.getEmail()%>" placeholder="이메일 입력" disabled>
					</label>
                </div>
                <div>
                	<label>
						이름: <input type="text" value="<%=mem.getName()%>" disabled>
					</label>
                </div>
                <div>
                	<label>
						주소: <input type="text" value="<%=mem.getAddress()%>" disabled>
					</label>
                </div>
                <div>
                	<label>
						주소상세: <input type="text" value="<%=mem.getAddress_detail()%>" disabled>
					</label>
                </div>
                <div>
                	<label>
						등급: <select size="1" name="gradeCopy" disabled>
								<option value="0" <%if(mem.getGrade()==0){out.print("selected");} %>>일반사용자(0)</option>
								<option value="1" <%if(mem.getGrade()==1){out.print("selected");} %>>관리자(1)</option>
							</select>
					</label>
                </div>
                <div>
                	<label>
						가입일:<input type="text" value="<%=mem.getSignup_time()%>" disabled>
					</label>
                </div>
                <div>
                	<label>
						생일:<input type="date" value="<%=mem.getBirth()%>" pattern="yyyy-mm-dd" disabled>
					</label>
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