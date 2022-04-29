const join_form = document.forms.join_form;

function is_checked() {
  // 1. checkbox element를 찾습니다.
  const checkbox = document.getElementById('invalidCheck3');
  // 2. checked 속성을 체크합니다.
  const is_checked = checkbox.checked;
  // 3. 결과를 출력합니다.  
 	if(is_checked){
		checkbox.classList.remove("is-invalid");
		checkbox.classList.add("is-valid");
	}else{
		checkbox.classList.remove("is-valid");
		checkbox.classList.add("is-invalid");
  	}	
}
function valueIn(input){
	/*alert(input.value);*/
	if(input.value.length>4){
		input.classList.remove("is-invalid");
		input.classList.add("is-valid");
	}else{
		input.classList.remove("is-valid");
		input.classList.add("is-invalid");
	}
}

join_form.address.addEventListener("input",(e)=>{
	valueIn(e.target);
});
join_form.address_detail.addEventListener("input",(e)=>{
	valueIn(e.target);
});
join_form.birth.addEventListener("input",(e)=>{

	valueIn(e.target);
});
join_form.name.addEventListener("input",(e)=>{

	valueIn(e.target);
});
join_form.pw.addEventListener("input",(e)=>{

	valueIn(e.target);
});

join_form.id.addEventListener("input",async(e)=>{		
		if(e.target.value.length>4){
			const res=await fetch("./user/mem/id_check.do?id="+e.target.value);	//MemberIdCheck.java
			const json=await res.json();
			console.log(json.id_check);
			const id=(e.target.value);
			if(json.id_check){
				
				join_form.id.classList.remove("is-invalid");
				join_form.id.classList.add("is-valid");
			}else{
				join_form.id.classList.remove("is-valid");
				join_form.id.classList.add("is-invalid");
			}
		}else{
			join_form.id.classList.remove("is-valid");
			join_form.id.classList.add("is-invalid");
	
		}
	});
	
join_form.phone.addEventListener("input",async(e)=>{		
		if(e.target.value.length>9){
			const res=await fetch("./user/mem/phone_check.do?phone="+e.target.value);	//MemberPhoneCheck.java
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
			djoin_form.phone.classList.add("is-invalid");
		}
	});
	
join_form.email.addEventListener("input",async(e)=>{		
		if(e.target.value.length>9){
			const res=await fetch("./user/mem/email_check.do?email="+e.target.value);	//MemberEmailCheck.java
			const json=await res.json();
			console.log(json.email_check);
			if(json.email_check){
				join_form.email.classList.remove("is-invalid");
				join_form.email.classList.add("is-valid");
			}else{
				join_form.email.classList.remove("is-valid");
				join_form.email.classList.add("is-invalid");
			}
		}else{
			join_form.email.classList.remove("is-valid");
			join_form.email.classList.add("is-invalid");
		}
	});
	

	
	
	
	
	
	
	
	
	