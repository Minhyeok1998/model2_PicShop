/*
	index.jsp 의 js 파일입니다.
	Pic table의 정보를 list로 불러와서 화면에 bootstrap에서 카드형태로  구현 하겠습니다.
	Category table의 정보를 가지고와서 왼쪽 사이드에 리스트로 구현하겠습니다.
 */
 
 const pic_list;
 const cate_list;
 
 async function showPicList(){
	const res = await fetch("./service/pic/list.do");
	pic_list = await res.json();
	
}

showPicList();