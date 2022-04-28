//tabs//
const list_tab = document.getElementById("pills-list-tab");
const insert_tab = document.getElementById("pills-insert-tab");
const modify_tab = document.getElementById("pills-modify-tab");

const listT = new bootstrap.Tab(list_tab);
const insertT = new bootstrap.Tab(insert_tab);
const modifyT = new bootstrap.Tab(modify_tab);

list_tab.addEventListener("click",()=>{listT.show()});
insert_tab.addEventListener("click",()=>{insertT.show()});


const cate_body = document.querySelector(".cate_body");
const clone_tr = document.querySelector(".clone_tr");
const delete_btn = document.getElementById('delete_btn');

async function showCategoryList(){
	const res =await fetch("./ajax.do");
	const cate_list = await res.json();
	console.log(cate_list);
	cate_body.innerHTML="";
	cate_list.forEach((category)=>{
		const clone = clone_tr.cloneNode(true);
		for(const key in category){
			clone.querySelector(`.${key}`).innerText =category[key];
			if(key == "cate_num"){
				clone.querySelector('input[type="button"]').addEventListener("click",()=>{cateDetail(category['cate_num'])});
				clone.querySelector('input[type="checkbox"]').value=category['cate_num'];
			}
		}
		cate_body.append(clone);
	})
}
showCategoryList();
function cateDetail(cate_num){ //수정페이지로 갈섯
	alert(cate_num);
}

delete_btn.addEventListener('click',async ()=>{
	const check_list = new Array();
	document.querySelectorAll('input[type="checkbox"]').forEach((item)=>{
		if(item.checked){
			check_list.push(item.value);
		}
	});
	console.log(check_list);
	const obj =new Object();
	obj["del_list"] = check_list;
	
	
	const res = await fetch("./ajax.do",{method:"DELETE",headers:{"Content-Type":"application/json; charset=UTF-8;"},body:JSON.stringify(obj)})
	const result = await res.json();

	if(result['delete']){
		alert("삭제 성공");
	}else{
		alert("삭제 실패");		
	}
	showCategoryList();

});
