
const pic_tbody =document.getElementById("pic_tbody");
const clone_tr = document.getElementById("clone_tr");
const top_second_nav = document.getElementById("top_second_nav");
const top_nav_list = top_second_nav.querySelectorAll("a.nav-link");

top_nav_list.forEach((nav)=>{
		if(nav.href== "http://localhost:8080/model2_PicShop/admin/picture/list.do")
			nav.classList.add("active");
		else
			nav.classList.remove("active");
})
//tabs//
const list_tab = document.getElementById("pills-list-tab");
const insert_tab = document.getElementById("pills-insert-tab");
const modify_tab = document.getElementById("pills-modify-tab");

const listT = new bootstrap.Tab(list_tab);
const insertT = new bootstrap.Tab(insert_tab);
const modifyT = new bootstrap.Tab(modify_tab);

const deleteBtn = document.getElementById("deleteBtn");
const pic_insert_form = document.forms.pic_insert_form;

async function showPicList(){
	const res = await fetch("./ajax.do");
	const pic_list = await res.json();
	console.log(pic_list);
	
	pic_tbody.innerHTML ="";
	pic_list.forEach((pic)=>{
		const clone = clone_tr.cloneNode(true);
		const table_list = clone.querySelectorAll("[class]");
		table_list.forEach((td)=>{
			td.innerText = pic[td.classList[0]];
			if(td.classList[0] == "num"){
				clone.querySelector(".delete").value= pic[td.classList[0]];
				clone.querySelector(".update").addEventListener('click',()=>{
					modifyPic(pic[td.classList[0]]);
				})
				clone.querySelector(".update").innerText="modify";
			}
			
		})
		
		pic_tbody.append(clone);
		listT.show();
	});
}
list_tab.addEventListener('click',()=>{
	listT.show();
})
insert_tab.addEventListener('click',()=>{
	insertT.show();
})

showPicList();

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
		showPicList();	
	}
});

const pic_modify_form =document.forms.pic_modify_form;
async function modifyPic(num){
	
	
	const res = await fetch("./ajax.do?num="+num)
	const result = await res.json();

	modifyT.show();
	const form_input_list = pic_modify_form.querySelectorAll("[name]");
	
	for(const key in result){
		switch(key){
			case "state":
				pic_modify_form.querySelector(`select[name='state'] option[value='${result[key]}']`).setAttribute("selected",true);
				break;
			case "cate_num":
				pic_modify_form.querySelector(`select[name='cate_num'] option[value='${result[key]}']`).setAttribute("selected",true);
				break;
			default:
				if(pic_modify_form.querySelector(`[name=${key}]`)!=null){
					
					pic_modify_form.querySelector(`[name=${key}]`).value= result[key];
				}
				break;
				
		}
	}
	console.log(result);
}

pic_modify_form.addEventListener("submit",async (e)=>{
	e.preventDefault();
	const form_obj = new Object();
	const list = pic_modify_form.querySelectorAll("[name]");
	list.forEach((item)=>{
		form_obj[item.name]=item.value;
	})
	console.log(form_obj);
	const res = await fetch("./ajax.do",{method:"PUT",headers:{"Content-Type":"application/json; charset=UTF-8;"},body:JSON.stringify(form_obj)})
	const result =await res.json();
	console.log(result);
	if(result['update']){
		alert("업데이트 성공");
		listT.show();
		showPicList();
	}else{
		alert("업데이트 실패!");
	}
	
})

pic_insert_form.addEventListener("submit",async (e)=>{
	e.preventDefault();
	const form_obj = new Object();
	const list = pic_insert_form.querySelectorAll("[name]");
	list.forEach((item)=>{
		form_obj[item.name]= item.value;
	})
	const res = await fetch("./ajax.do",{method:"POST",headers:{"Content-Type":"application/json; charset=UTF-8"}, body:JSON.stringify(form_obj)});
	const result = await res.json();
	
	if(result["insert"]){
		alert("등록 성공");
		listT.show();
		showPicList();
	}else{
		alert("등록 실패!");
	}
})
