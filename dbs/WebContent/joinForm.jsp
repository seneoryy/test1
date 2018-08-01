<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>joinForm</title>

<style>

	#wrap{
		border:1px red;
		width:1024px;
		height:1000px;
		margin:0px auto;
		align:center;
		
	}
	
	table{
		text-align:center;
		margin-top:80px;
		width:600px;
		height:500px;
		
	}
</style>

<script src="formCheck.js"></script>
<script>
	function confirmId(){
		
		url="confirmId.jsp?id="+document.joinForm.id.value;
		open(url, "confirm", "toolbar=no, location=no , status=no, menubar=no, scrollbars=no, resizeable=no, width=300, height=200");
	
	}
</script>

</head>
<body>

	<div id="wrap">
		<h1 align="center">회     원     가     입</h1>
		<form name="joinForm" action="memberWritePro.bo" method="post" onsubmit="return joinCheck(this);">
			<table border="2" align="center">
				<tr>
					<td><label for="id">아이디</label></td>
					<td>
						<input type="text" name="id" id="id" style="width:80%; height:90%; font-size:150%;" />
						<input type="button" value="중복확인" name="confirm_id" onclick="confirmId(this.form);" />
					</td>
				</tr>
				<tr>
					<td><label for="passwd">비밀번호</label></td>
					<td><input type="password" name="passwd" id="passwd" style="width:90%; height:90%; font-size:150%;" /></td>
				</tr>
				<tr>
					<td><label for="addr">주소</label></td>
					<td><input type="text" name="addr" id="addr" style="width:90%; height:90%; font-size:150%;" /></td>
				</tr>
				<tr>
					<td><label for="name">이름</label></td>
					<td><input type="text" name="name" id="name" style="width:90%; height:90%; font-size:150%;" /></td>
				</tr>
				<tr>
					<td><label for="age">나이</label></td>
					<td><input type="text" name="age" id="age" style="width:90%; height:90%; font-size:150%;" /></td>
				</tr>
				<tr>
					<td><label for="gender">성별</label></td>
					<td>
						<input type="radio" name="gender" value="남" checked id="gender1" />남자
						<input type="radio" name="gender" value="여" id="gender2" />여자
					</td>
				</tr>
				<tr>
					<td><label for="email">이메일 주소</label></td>
					<td><input type="text" name="email"	id="email" style="width:90%; height:90%; font-size:150%;" /></td>
				</tr>
				<tr>
					<td><label for="nation">국적</label></td>
					<td><input type="text" name="nation" id="nation" style="width:90%; height:90%; font-size:150%;" /></td>
				</tr>	
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="가입하기"/>
						<input type="reset" value="다시작성" />
					</td>
				</tr>
			</table>
		</form>
	</div>
	
</body>
</html>