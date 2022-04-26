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
<style>
.h1Cl{
	width:500px;
	margin: 0 auto;
}
#memDivHeader{
	display: flex;
	flex-wrap: nowrap;
	justify-content: center;
}

.btn-outline-dark:hover {
	/* 등록, 정렬 hover시 폰트색상 강제 지정 */
	color:white !important
}
</style>
<body>
	<h1 class="h1Cl">멤버 관리 페이지</h1>
	<div class="memDiv">
		<div class="memHeader">
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
			  	<div id="memDivHeader" class="container-fluid">
			  		<button type="button" class="btn btn-outline-dark navbar-brand">정렬</button>
			  		<select style="width:200px;" class="form-select form-select-sm navbar-brand" aria-label=".form-select-sm example">
					  	<option value="1">num</option>
					   	<option value="2">name</option>
					   	<option value="3">title</option>
					   	<option value="4">count</option>
					   	<option value="5">price</option>
					</select>
					<select style="width:200px;" class="form-select form-select-sm navbar-brand" aria-label=".form-select-sm example">
					  	<option value="1">오름차</option>
					   	<option value="2">내림차</option>
					</select>
					<button type="button" class="btn btn-outline-dark navbar-brand">멤버 등록</button>
			    	<form class="d-flex">
			      		<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
			      		<button class="btn btn-outline-success" type="submit">Search</button>
			    	</form>		    	
			  	</div>
			</nav>
		</div>
		<table class="table table-dark table-striped">	
			<thead>
				<tr>
					<th class="col-1">id</th>     
					<th class="col-2">phone</th>        
					<th class="col-2">email</th>       
					<th class="col-1">name</th>       
					<th class="col-2">address</th>       
					<th class="col-2">address_detail</th>
					<th class="col-2">signup_time</th>   
					<th class="col-2">birth</th>
					<th class="col-1">grade</th>      
				</tr>
			</thead>
			<tbody id="itemList">
				<tr id="itemClone">
					<td class="item_num"></td>  
					<td class="name"></td>       
					<td class="count"></td>    
					<td class="price"></td>    
					<td class="color"></td>
					<td class="model_num"></td>
					<td class="member_id"></td>
					<td class="state"></td>     
					<td class="cate_num"></td> 
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>