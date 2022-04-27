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
	const res = await fetch("./service/pic/list.do");
	pic_list = await res.json();
	//console.log(pic_list);
	picture_side.innerHTML="";
	pic_list.forEach((picture)=>{
		let i = 1;
		const clone = clone_card.cloneNode(true);
		console.log(clone);
		let grid_area = `pic${i++}`;
		for(const key in picture){
			console.log(grid_area);
			
		}	
	});
	
}
async function showCateList(){
	const res = await fetch("./service/category/list.do");
	cate_list = await res.json();
	console.log(cate_list);
}

showCateList();
showPicList();