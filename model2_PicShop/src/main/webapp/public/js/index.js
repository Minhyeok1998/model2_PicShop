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
	let i = 1;
//	console.log(pic_list);
	pic_list.forEach((picture)=>{
		
		const clone = clone_card.cloneNode(true);
		clone.classList.remove("display_None");
		let grid_area = `pic${i++}`;
		for(const key in picture){
//			console.log(grid_area);
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
showPicList();

/*display_None*/
const login_li = document.getElementById("login_li");
const logout_li = document.getElementById("logout_li");
const join_li = document.getElementById("join_li");
const adminPg_li = document.getElementById("adminPg_li");
const user_info = document.getElementById("user_info");

logout_li.classList.add("display_None");
adminPg_li.classList.add("display_None");
user_info.classList.add("display_None");

console.log(login_user_grade);
function showGradeComponent(){
	
	if(login_user_grade !=null){
		console.log("login_user_grade : "+ login_user_grade);
		if(login_user_grade ==1){
			console.log("여기 들어와짐")
			//admin
			/*1. 관리자 가는 페이지 */
			adminPg_li.classList.remove("display_None");
		}else if(login_user_grade == 0){
			//일반 회원 등급
			/*1.내가 작성한 글
			2.장바구니 */
			console.log("0 들어옴");
			user_info.classList.remove("display_None");
		}
		/*공통적으로
		 1. 회원가입,login 버튼은 안보이게 한다!
		 2. logOut 버튼을 보이게 한다.*/
		 logout_li.classList.remove("display_None");
		 login_li.classList.add("display_None");
		 join_li.classList.add("display_None");
	 }
}

showGradeComponent();
	
	