//tabs//
const list_tab = document.getElementById("pills-list-tab");
const insert_tab = document.getElementById("pills-insert-tab");
const modify_tab = document.getElementById("pills-modify-tab");

const listT = new bootstrap.Tab(list_tab);
const insertT = new bootstrap.Tab(insert_tab);
const modifyT = new bootstrap.Tab(modify_tab);

const top_second_nav = document.getElementById("top_second_nav");
const top_nav_list = top_second_nav.querySelectorAll("a.nav-link");

const insert_form = document.forms.insert_form;
top_nav_list.forEach((nav)=>{
		if(nav.href== "http://localhost:8080/model2_PicShop/admin/category/list.do")
			nav.classList.add("active");
		else
			nav.classList.remove("active");
})



list_tab.addEventListener("click",()=>{listT.show()});
insert_tab.addEventListener("click",()=>{insertT.show()});


const cate_body = document.querySelector(".cate_body");
const clone_tr = document.querySelector(".clone_tr");
const delete_btn = document.getElementById('delete_btn');
let cate_list;
async function showCategoryList(){
	const res =await fetch("./ajax.do");
	 cate_list = await res.json();
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
	showInsertForm_cateList(cate_list);
}
showCategoryList();

const update_form = document.forms.update_form;

async function cateDetail(cate_num){ //수정페이지로 갈섯
	modifyT.show();
	const optTg = document.createElement("option");
	optTg.setAttribute("value",0);
	optTg.label=`최상위(0)`;
	update_form.sub.append(optTg);
	
	cate_list.forEach((item)=>{
		const optionTg = document.createElement("option");
		optionTg.setAttribute("value",item['cate_num']);
		optionTg.label=`${item['name']}(${item['cate_num']})`;
		update_form.sub.append(optionTg);
		
	})
	const res = await fetch("./ajax.do?cate_num="+cate_num);
	const detail = await res.json();
	const input_list = update_form.querySelectorAll("[name]");
	input_list.forEach((input)=>{
		if(input.name == 'sub'){
			
			input.querySelectorAll(`option[value]`).forEach((item)=>{
				if(item.value == detail['sub']){
					item.setAttribute('selected',true);
				}
			})
		}else{
			input.value = detail[input.getAttribute('name')];
			
		}
	})
	
}
function showInsertForm_cateList(cate_list){
	const optTg = document.createElement("option");
	optTg.setAttribute("value",0);
	optTg.label=`최상위(0)`;
	insert_form.sub.append(optTg);
	cate_list.forEach((item)=>{
		const optionTg = document.createElement("option");
		optionTg.setAttribute("value",item['cate_num']);
		optionTg.label=`${item['name']}(${item['cate_num']})`;
		insert_form.sub.append(optionTg);
		
	})
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


update_form.addEventListener("submit",async (e)=>{
	e.preventDefault();
	const input_list = update_form.querySelectorAll("[name]");
	const obj = new Object();
	input_list.forEach((item)=>{
		obj[item.name] = item.value;
	})
	const res = await fetch("./ajax.do",{method:"PUT",headers:{"Content-Type":"application/json; charset=UTF-8"},body:JSON.stringify(obj)});
	const result = await res.json();
	if(result['update']){
		alert("수정 성공!");
		listT.show();
		showCategoryList();
	}else{
		alert("수정 실패!");
	}
	
})
const th_list = document.querySelectorAll("thead.thead-success th.sort");
th_list.forEach((item)=>{
	item.addEventListener("click",()=>{
		sortFunc(item.innerText);
	})
})
const sort_flag ={"cate_num":0,"name":0,"sub":0};
async function sortFunc(txt){
	const res = await fetch("./ajax.do?sort="+txt+"&order="+sort_flag[txt]);
	if(sort_flag[txt]==0){
		sort_flag[txt]=1;
	}else{
		sort_flag[txt]=0;
	}
	
	const cate_list = await res.json();
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

