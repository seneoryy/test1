/**
 * 회원가입폼 확인
 */
function joinCheck(obj){
	if(!obj.id.value||obj.id.value.trim().length==0){
		alert("아이디가 입력되지 않았습니다.");
		obj.id.value="";
		obj.id.focus();
		return false;
	}
	if(!obj.passwd.value||obj.passwd.value.trim().length==0){
		alert("비밀번호가 입력되지 않았습니다.");
		obj.passwd.value="";
		obj.passwd.focus();
		return false;
	}
	if(!obj.name.value||obj.name.value.trim().length==0){
		alert("이름이 입력되지 않았습니다.");
		obj.name.value="";
		obj.name.focus();
		return false;
	}
	if(!obj.addr.value||obj.addr.value.trim().length==0){
		alert("주소가 입력되지 않았습니다.");
		obj.addr.value="";
		obj.addr.focus();
		return false;
	}
	if(!obj.age.value||obj.age.value.trim().length==0){
		alert("나이가 입력되지 않았습니다.");
		obj.age.value="";
		obj.age.focus();
		return false;
	}
	if(!obj.gender.value||obj.gender.value.trim().length==0){
		alert("성별이 입력되지 않았습니다.");
		obj.gender.value="";
		obj.gender.focus();
		return false;
	}
	if(!obj.email.value||obj.email.value.trim().length==0){
		alert("이메일이 입력되지 않았습니다.");
		obj.email.value="";
		obj.email.focus();
		return false;
	}
	if(!obj.nation.value||obj.nation.value.trim().length==0){
		alert("국적이 입력되지 않았습니다.");
		obj.nation.value="";
		obj.nation.focus();
		return false;
	}
}