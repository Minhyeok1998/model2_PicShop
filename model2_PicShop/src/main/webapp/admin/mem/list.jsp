<%@page import="java.util.List"%>
<%@page import="pic_shop.com.vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<style>
.h1Cl{
	width:500px;
	text-align : center;
	margin: 0 auto;
}
#memDivHeader{
    display: flex;
    flex-wrap: nowrap;
    justify-content: space-between;
}
.btn-outline-dark:hover {
	/* 등록, 정렬 hover시 폰트색상 강제 지정 */
	color:white !important
}
.memHeaderEl{
	display:flex; 
}
.UDBtn{
	text-decoration: none;
	color:#ff5fff;
}
.UDBtn:hover{
	text-decoration: none;
	color:white;
	text-shadow: 2px 2px 2px white;
}
</style>
<%
	List<MemberVo> mem_list=(List<MemberVo>)request.getAttribute("mem_list");
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

<body>
<!-- member 테이블 확인용 주석입니다.
+----------------+--------------+------+-----+-------------------+-------------------+
| Field          | Type         | Null | Key | Default           | Extra             |
+----------------+--------------+------+-----+-------------------+-------------------+
| id             | varchar(255) | NO   | PRI | NULL              |                   |
| pw             | varchar(255) | NO   |     | NULL              |                   |
| phone          | varchar(255) | NO   | UNI | NULL              |                   |
| email          | varchar(255) | NO   | UNI | NULL              |                   |
| name           | varchar(255) | NO   |     | NULL              |                   |
| address        | varchar(255) | YES  |     | NULL              |                   |
| address_detail | varchar(255) | YES  |     | NULL              |                   |
| signup_time    | datetime     | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED |
| birth          | date         | NO   |     | NULL              |                   |
| grade          | tinyint      | NO   |     | 0                 |                   |
+----------------+--------------+------+-----+-------------------+-------------------+ -->
	 <%@ include file="/admin_header_nav.jsp" %>
	<h1 class="h1Cl">멤버 관리 페이지</h1>
	<div class="memDiv">
		<div class="memHeader">
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
			  	<div id="memDivHeader" class="container-fluid">
			  		<div class="memHeaderEl">
				  		<select id="sortCol" style="width:200px;" class="form-select form-select-sm navbar-brand" aria-label=".form-select-sm example">
						  	<option value="id">아이디</option>
						   	<option value="phone">핸드폰</option>
						   	<option value="email">이메일</option>
						   	<option value="name">이름</option>
						   	<option value="signup_time">등록일자</option>
						   	<option value="birth">생년월일</option>
						   	<option value="address">주소</option>
						   	<option value="address_detail">상세주소</option>
						   	<option value="grade">등급</option>
						</select>
						<select id="sortHow" style="width:200px;" class="form-select form-select-sm navbar-brand" aria-label=".form-select-sm example">
						  	<option value="1">오름차</option>
						   	<option value="2">내림차</option>
						</select>
						<button id="sortBtn" type="button" class="btn btn-outline-dark navbar-brand">정렬</button>
					</div>
					<div class="memHeaderEl">
						<button type="button" onclick="location.href='insert.jsp'" class="btn btn-outline-dark navbar-brand">멤버 등록</button>	
	  					<button id="deleteBtn" type="button" class="btn btn-outline-dark navbar-brand">일괄 삭제</button>	
					</div>
					<div class="memHeaderEl">
				    	<form class="d-flex">
				      		<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
				      		<button class="btn btn-outline-success" type="submit">Search</button>
				    	</form>		    
			    	</div>	
			  	</div>
			</nav>
		</div>
		<table class="table table-dark table-striped">	
			<thead>
				<tr>
					<th class="col">id</th>   
					<th class="col">pw</th>   
					<th class="col">phone</th>        
					<th class="col">email</th>       
					<th class="col">name</th>       
					<th class="col">address</th>       
					<th class="col">address_detail</th>
					<th class="col">signup_time</th>   
					<th class="col">birth</th>
					<th class="col">grade</th>
					<th class="col">수정</th>
					<th class="col">삭제</th>
					<th class="col">체크</th>          
				</tr>	
			</thead>
			<tbody>
				<%for(MemberVo mem : mem_list){%>
				<tr>
					<td><%=mem.getId() %></td>
					<td><%=mem.getPw() %></td>
					<td><%=mem.getPhone() %></td>
					<td><%=mem.getEmail() %></td>
					<td><%=mem.getName() %></td>
					<td><%=mem.getAddress() %></td>
					<td><%=mem.getAddress_detail() %></td>
					<td><%=mem.getSignup_time()%></td>
					<td><%=mem.getBirth() %></td>
					<td><%=(mem.getGrade()==1)?"관리자":"일반사용자"%></td>
					<td>
						<a class="UDBtn" href="./modify.do?id=<%=mem.getId()%>">
							수정
						</a>
					</td>	
					<td>
						<a class="UDBtn" href="javascript:postDel('<%=mem.getId()%>')"> <!-- a태그는 get방식으로 전달하므로 post방식으로 변경 -->
							삭제
						</a>
					</td>
					<td><input class="delete form-check-input " type="checkbox" value="<%=mem.getId() %>"></td>
				</tr>
				<%}; %>
			</tbody>
		</table>
	</div>
</body>
<script>
const deleteBtn = document.getElementById("deleteBtn");
deleteBtn.addEventListener("click",async ()=>{
	const select_list = document.querySelectorAll("input.delete");
	let delete_list = new Array();
	select_list.forEach((item)=>{
		if(item.checked){
			delete_list.push(item.value);
		}
	})
	const Obj = {"delete_list": delete_list};
	const res = await fetch("./ajax.do",{method:"DELETE",headers:{"Content-Type":"application/json; charset=UTF-8;"},body:JSON.stringify(Obj)});
	const result = await res.json();
	if(result.delete){
		alert("일괄 삭제 성공");
		window.location.reload();
	}else{
		alert("일괄 삭제 실패");
	}
});

sortBtn.addEventListener("click",()=>{
		console.log(sortCol.value);
		console.log(sortHow.value);
		location.href="./list.do?sortCol="+sortCol.value+"&sortHow="+sortHow.value;	
});
function postDel(id){
	//삭제를 누르면 폼과 인풋생성후 내부에 id를 담아서 post방식으로 전송
	let f = document.createElement('form');
    let obj;
    obj = document.createElement('input');
    obj.setAttribute('type', 'hidden');
    obj.setAttribute('name', 'id');
    obj.setAttribute('value', id);
    
    f.appendChild(obj);
    f.setAttribute('method', 'post');
    f.setAttribute('action', 'delete2.do');
    document.body.appendChild(f);
    f.submit();
}
</script>
</html>