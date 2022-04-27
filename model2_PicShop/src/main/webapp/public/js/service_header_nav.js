

const join_form = document.forms.join_form;

/*
join_form.addEventListener("submit",(e)=>{
	e.preventDefault();
	alert("들어옴");
});
*/

function valueIn(input){
	/*alert(input.value);*/
	if(input.value != ""){
		input.classList.remove("is-invalid");
		input.classList.add("is-valid");
	}else{
		input.classList.remove("is-valid");
		input.classList.add("is-invalid");
	}
}

join_form.address.addEventListener("blur",(e)=>{
	valueIn(e.target);
});
join_form.address_detail.addEventListener("blur",(e)=>{
	valueIn(e.target);
});
join_form.birth.addEventListener("blur",(e)=>{

	valueIn(e.target);
});
join_form.name.addEventListener("blur",(e)=>{

	valueIn(e.target);
});
join_form.pw.addEventListener("blur",(e)=>{

	valueIn(e.target);
});

join_form.id.addEventListener("input",async(e)=>{		
		if(e.target.value.length>4){
			const res=await fetch("./user/mem/id_check.do?id="+e.target.value);	//MemberIdCheck.java
			const json=await res.json();
			console.log(json.id_check);
			const id=(e.target.value);
			if(json.id_check){
				/*checkId.innerText="사용가능";
				checkId.style.color="green";*/
				join_form.id.classList.remove("is-invalid");
				join_form.id.classList.add("is-valid");
			}else{
				join_form.id.classList.remove("is-valid");
				join_form.id.classList.add("is-invalid");
			}
		}else{
			join_form.id.classList.remove("is-valid");
			join_form.id.classList.add("is-invalid");
			/*checkId.innerText="5글자 이상 입력하세요!"
			checkId.style.color="white";*/	
		}
	});
join_form.phone.addEventListener("input",async(e)=>{		
		if(e.target.value.length>9){
			const res=await fetch("./user/mem/phone_check.do?phone="+e.target.value);	//MemberIdCheck.java
			const json=await res.json();
			console.log(json.phone_check);
			if(json.phone_check){
				join_form.phone.classList.remove("is-invalid");
				join_form.phone.classList.add("is-valid");
			}else{
				join_form.phone.classList.remove("is-valid");
				join_form.phone.classList.add("is-invalid");
			}
		}else{
			join_form.phone.classList.remove("is-valid");
				join_form.phone.classList.add("is-invalid");
		}
	});
	join_form.email.addEventListener("input",async(e)=>{		
		if(e.target.value.length>9){
			const res=await fetch("./user/mem/email_check.do?email="+e.target.value);	//MemberIdCheck.java
			const json=await res.json();
			console.log(json.email_check);
			if(json.email_check){
				join_form.id.classList.remove("is-invalid");
				join_form.id.classList.add("is-valid");
			}else{
				join_form.phone.classList.remove("is-valid");
				join_form.phone.classList.add("is-invalid");
			}
		}else{
			join_form.phone.classList.remove("is-valid");
				join_form.phone.classList.add("is-invalid");
		}
	});
	