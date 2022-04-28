
const pic_tbody =document.getElementById("pic_tbody");
const clone_tr = document.getElementById("clone_tr");

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
		})
		
		pic_tbody.append(clone);
		
	});
}

showPicList();