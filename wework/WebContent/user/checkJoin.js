function check(){
	if(document.fr.id.value == ""){
		alert("아이디를 입력해주세요!");
		document.fr.id.focus();
		return false;
	}
	if(document.fr.pw.value == ""){
		alert("비밀번호를 입력해 주세요!");
		document.fr.pw.focus();
		return false;
	}
	if(document.fr.pw.value != document.fr.pw_chk.value){
		alert("비밀번호가 일치하지 않습니다!");
		document.fr.pw_chk.focus();
		return false;
	}
	if(document.fr.name.value == ""){
		alert("이름을 입력해 주세요!");
		document.fr.name.focus();
		return false;
	}
	if(document.fr.birth.value==""){
		alert("생년월일을 입력해 주세요!");
		document.fr.birth.focus();
		return false;
	}
	if(document.fr.phone.value == ""){
		alert("전화번호를 입력해 주세요!");
		document.fr.phone.focus();
		return false;
	}
	if(document.fr.email.value == ""){
		alert("이메일을 입력해 주세요!");
		document.fr.email.focus();
		return false;
	}
	
	document.fr.submit();
}





