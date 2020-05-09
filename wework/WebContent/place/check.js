function check(){
	if(document.fr.place_name.value == ""){
		alert("공간 이름을 등록해 주세요.");
		document.fr.place_type.focus();
		return false;
	}
	
	if(document.fr.perhour.value == ""){
		alert("시간 당 가격을 입력하세요.");
		document.fr.perhour.focus();
		return false;
	}
	if(document.fr.maxsize.value==""){
		alert("최대 인원을 선택하세요.");
		document.fr.maxsize.focus();
		return false;
	}
	var arr = document.fr.place_type;
	var cnt = 0;
	for(var i = 0; i<arr.length; i++){
		if(arr[i].checked == true){
			cnt++;
		}
	}
	if(cnt<1){
		alert("유형을 선택해 주세요.");
		return false;
	}else if(cnt > 3){
		alert("유형은 3개까지 선택 가능합니다.");
		return false;
	}
	
	document.fr.submit();
}