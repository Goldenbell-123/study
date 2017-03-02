document.write("hello javascript!<hr>")

//선택한 객체의 배경색을 변경하는 함수
/* function changeBG(obj, str){
	if (str == 'focus'){
	obj.style.backgroundColor = "#F5E857";
	}else {
		obj.style.backgroundColor ="white";
	}
} */

function changeBG(obj,inout){
	
	switch(inout){
	case 'in' :
		// focus - in
		obj.style.backgroundColor = "#F5E857";
		break;
	case 'out' :
		// focus - out
		obj.style.backgroundColor ="white";
		break;
	}
}