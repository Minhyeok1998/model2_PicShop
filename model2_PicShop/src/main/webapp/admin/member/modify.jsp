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
</style>
<body>
	<h1 class="h1Cl">멤버 수정 페이지</h1>
	<main>
    	<div class="divMain">
    		<div class="divLeft">
                <div>
                	<label>
						아이디: <input type="text" value="<%=mem.getId()%>" placeholder="아이디 입력" disabled>
					</label>
                </div>
                <div>
                	<label>
						pw:<input type="text"value="<%=mem.getPw()%>" disabled>
					</label>
                </div>
                <div>
                	<label>
						폰:<input type="text" value="<%=mem.getPhone()%>" placeholder="휴대폰 번호 입력 (123-456-7890)" disabled>
					</label>
                </div>
                <div>
                	<label>
						이메일:<input type="email" value="<%=mem.getEmail()%>" placeholder="이메일 입력" disabled>
					</label>
                </div>
                <div>
                	<label>
						이름:<input type="text" value="<%=mem.getName()%>" disabled>
					</label>
                </div>
                <div>
                	<label>
						주소:<input type="text" value="<%=mem.getAddress()%>" disabled>
					</label>
                </div>
                <div>
                	<label>
						주소상세:<input type="text" value="<%=mem.getAddress_detail()%>" disabled>
					</label>
                </div>
                <div>
                	<label>
						등급:<select size="1" name="gradeCopy" disabled>
								<option value="0" <%if(mem.getGrade()==0){out.print("selected");} %>>총관리자(0)</option>
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
	                	<label>
							아이디: <input type="text" name="id" value="<%=mem.getId()%>" placeholder="아이디 입력">
						</label>
						<span id="checkId">중복체크중입니다.</span>
	                </div>
	                <div>
	                	<label>
							pw:<input type="text" name="pw" value="<%=mem.getPw()%>">
						</label>
						<span id="checkPw">길이가 4이상</span>
	                </div>
	                <div>
	                	<label>
							폰:<input type="text" name="phone" value="<%=mem.getPhone()%>" placeholder="휴대폰 번호 입력 (123-456-7890)">
						</label>
						<span id="checkPhone">중복체크중입니다.</span>
	                </div>
	                <div>
	                	<label>
							이메일:<input type="email" name="email" value="<%=mem.getEmail()%>" placeholder="이메일 입력">
						</label>
						<span id="checkEmail">중복체크중입니다.</span>
	                </div>
	                <div>
	                	<label>
							이름:<input type="text" name="name" value="<%=mem.getName()%>">
						</label>
	                </div>
	                <div>
	                	<label>
							주소:<input type="text" name="address" value="<%=mem.getAddress()%>">
						</label>
	                </div>
	                <div>
	                	<label>
							주소상세:<input type="text" name="address_detail" value="<%=mem.getAddress_detail()%>">
						</label>
	                </div>
	                <div>
	                	<label>
							등급:<select size="1" name="grade">
									<option value="0" <%if(mem.getGrade()==0){out.print("selected");} %>>총관리자(0)</option>
									<option value="1" <%if(mem.getGrade()==1){out.print("selected");} %>>관리자(1)</option>
								</select>
						</label>
	                </div>
	                <div>
	                	<label>
							가입일:<input type="text" name="signup_time" value="<%=mem.getSignup_time()%>" readonly>
						</label>
	                </div>
	                <div>
	                	<label>
							생일:<input type="date" name="birth" value="<%=mem.getBirth()%>" pattern="yyyy-mm-dd">
						</label>
	                </div>
	       		</div>
	       		<div>
                    <button type="submit">수정하기</button>
                    <button type="button">뒤로가기</button>
                    <button type="reset">리셋하기</button>
					<a href="./delete.do?id=<%out.append(mem.getId());%>">삭제</a>
               	</div>
            </form>
        </div>
    </main>
</body>
</html>