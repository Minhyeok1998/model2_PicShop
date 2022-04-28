/*
	index.jsp 의 js 파일입니다.
	Pic table의 정보를 list로 불러와서 화면에 bootstrap에서 카드형태로  구현 하겠습니다.
	Category table의 정보를 가지고와서 왼쪽 사이드에 리스트로 구현하겠습니다.
 */
 
 let pic_list;
 let cate_list;
 const picture_side = document.querySelector("div.picture_side");
 const clone_card  = document.querySelector("div.clone_card");
 
 async function showPicList(){
	const res = await fetch("./service/pic/list.do?page=1");
	pic_list = await res.json();
	//console.log(pic_list);
	picture_side.innerHTML="";
	let i = 1;
	console.log(pic_list);
	pic_list.forEach((picture)=>{
		
		const clone = clone_card.cloneNode(true);
		clone.classList.remove("display_None");
		let grid_area = `pic${i++}`;
		for(const key in picture){
			clone.classList.add(grid_area);
			switch(key){
				case "main_img":
					clone.querySelector(`.${key}`).src = "./public/image/"+picture[key];
					break;
				case "title":
					clone.querySelector(`.${key}`).innerText = picture[key];
					break;
				case "img_comment":
					clone.querySelector(`.${key}`).innerText = picture[key];
					break;
				case "price":
					clone.querySelector(`.${key}`).innerText = picture[key];
					break;
				case "member_id":
					clone.querySelector(`.${key}`).innerText = picture[key];
					break;
				case "cate_name":
					clone.querySelector(`.${key}`).innerText = picture[key];
					break;
				case "num":
					clone.querySelector(".detail").href += picture[key];
			}
		}	
		picture_side.append(clone);
	});
	
}
async function showCateList(){
	const res = await fetch("./service/category/list.do");
	cate_list = await res.json();
	console.log(cate_list);
}

showCateList();
showPicList();